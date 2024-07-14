package me.mcx.blog.service.admin.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSON;
import com.vladsch.flexmark.html2md.converter.FlexmarkHtmlConverter;
import com.vladsch.flexmark.util.data.MutableDataSet;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.common.Constants;
import me.mcx.blog.common.ResultCode;
import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.domain.BlogCategory;
import me.mcx.blog.domain.BlogTags;
import me.mcx.blog.domain.dto.article.ArticleDTO;
import me.mcx.blog.domain.vo.article.SystemArticleListVO;
import me.mcx.blog.enums.DataEventEnum;
import me.mcx.blog.enums.YesOrNoEnum;
import me.mcx.blog.event.DataEventPublisherService;
import me.mcx.blog.mapper.BlogCategoryMapper;
import me.mcx.blog.mapper.BlogTagsMapper;
import me.mcx.blog.util.BeanCopyUtil;
import me.mcx.common.core.constant.SecurityConstants;
import me.mcx.common.core.domain.R;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.DateUtils;
import me.mcx.common.core.utils.ip.IpUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.security.auth.AuthUtil;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.system.api.RemoteUserService;
import me.mcx.system.api.model.user.UserVO;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogArticleMapper;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.service.admin.IBlogArticleService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

/**
 * 博客文章Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
@Slf4j
public class BlogArticleServiceImpl implements IBlogArticleService 
{
    @Autowired
    private RemoteUserService remoteUserService;

    @Autowired
    private BlogArticleMapper blogArticleMapper;

    @Autowired
    private BlogTagsMapper blogTagsMapper;

    @Autowired
    private BlogCategoryMapper categoryMapper;

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private DataEventPublisherService dataEventPublisherService;

    @Value("${baidu.url}")
    private String baiduUrl;

    /**
     * 查询博客文章列表
     *
     * @param blogArticle 博客文章
     * @return 博客文章
     */
    @Override
    public List<BlogArticle> selectBlogArticleList(BlogArticle blogArticle)
    {
        return blogArticleMapper.selectBlogArticleList(blogArticle);
    }

    /**
     * 批量删除博客文章
     * 
     * @param ids 需要删除的博客文章主键
     * @return 结果
     */
    @Override
    public int deleteBlogArticleByIds(Long[] ids)
    {
        return blogArticleMapper.deleteBlogArticleByIds(ids);
    }

    /**
     * 删除博客文章信息
     * 
     * @param id 博客文章主键
     * @return 结果
     */
    @Override
    public int deleteBlogArticleById(Long id)
    {
        return blogArticleMapper.deleteBlogArticleById(id);
    }

//    ==========================================
    /**
     *  后台获取所有文章
     * @return
     */
    @Override
    public List<SystemArticleListVO> selectArticlePage(String title, Integer tagId, Integer categoryId, Integer isPublish) {
        List<SystemArticleListVO> data = blogArticleMapper.selectArticle(title,tagId,categoryId,isPublish);
        data.forEach(item -> {
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(item.getUserId()), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            item.setNickname(user.getNickName());
        });
        return data;
    }

    /**
     *  后台获取文章详情
     * @return
     */
    @Override
    public AjaxResult selectArticleById(Long id) {
        ArticleDTO articleDTO = blogArticleMapper.selectArticlePrimaryKey(id);
        articleDTO.setTags(blogTagsMapper.selectByArticleId(id));
        return AjaxResult.success(articleDTO);
    }

    /**
     *  添加文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int addArticle(ArticleDTO article) {
        BlogArticle blogArticle = BeanCopyUtil.copyObject(article, BlogArticle.class);
        blogArticle.setUserId(SecurityUtils.getLoginIdAsString());
        //添加分类
        Long categoryId = savaCategory(article.getCategoryName());
        //添加标签
        List<Long> tagList = getTagsList(article);

        blogArticle.setCategoryId(categoryId);

        String ipAddress = IpUtils.getIpAddr();
        if (StringUtils.isNotBlank(ipAddress)) {
            blogArticle.setAddress(ipAddress);
        }
        int insert = blogArticleMapper.insertBlogArticle(blogArticle);
        if (insert > 0) {
            blogTagsMapper.saveArticleTags(blogArticle.getId(),tagList);
        }

        //发布消息去同步es 不进行判断是否是发布状态了，因为后面修改成下架的话就还得去删除es里面的数据，多次一举了，在查询时添加条件发布状态为已发布
        dataEventPublisherService.publishData(DataEventEnum.ES_ADD,blogArticle);
        return insert;
    }

    /**
     *  修改文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateArticle(ArticleDTO article) {
        BlogArticle blogArticle = blogArticleMapper.selectBlogArticleById(article.getId());
        if (ObjectUtil.isNull(blogArticle)) {
            throw new ServiceException(ResultCode.ARTICLE_NOT_EXIST.desc);
        }
        //只能修改属于当前登录用户的文章
        String loginId = SecurityUtils.getLoginIdAsString();
        if (!blogArticle.getUserId().equals(loginId) && !AuthUtil.hasRole(Constants.ADMIN_CODE)){
            throw new ServiceException(ResultCode.NO_PERMISSION.desc);
        }

        //添加分类
        Long categoryId = savaCategory(article.getCategoryName());
        //添加标签
        List<Long> tagList = getTagsList(article);

        blogArticle = BeanCopyUtil.copyObject(article, BlogArticle.class);
        blogArticle.setCategoryId(categoryId);
        int statue = blogArticleMapper.updateBlogArticle(blogArticle);

        //先删出所有标签
        blogTagsMapper.deleteByArticleIds(Collections.singletonList(blogArticle.getId()));
        //然后新增标签
        blogTagsMapper.saveArticleTags(blogArticle.getId(),tagList);

        //发布消息去同步es
        dataEventPublisherService.publishData(DataEventEnum.ES_UPDATE,blogArticle);
        return statue;
    }


    /**
     * 批量删除文章
     * @param ids
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult deleteBatchArticle(List<Long> ids) {
        blogArticleMapper.deleteBlogArticleByIds(ids.toArray(new Long[0]));
        blogTagsMapper.deleteByArticleIds(ids);

        dataEventPublisherService.publishData(DataEventEnum.ES_DELETE,ids);
        return AjaxResult.success();
    }

    /**
     *  置顶文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult topArticle(ArticleDTO article) {
        blogArticleMapper.putTopArticle(article);
        return AjaxResult.success();
    }


    /**
     *  文章百度推送
     * @return
     */
    @Override
    public AjaxResult seoArticle(List<Long> ids) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", "data.zz.baidu.com");
        headers.add("User-Agent", "curl/7.12.1");
        headers.add("Content-Length", "83");
        headers.add("Content-Type", "text/plain");

        ids.forEach(item -> {
            String url = "http://www.shiyit.com/article/" + item;
            HttpEntity<String> entity = new HttpEntity<>(url, headers);
            restTemplate.postForObject(baiduUrl, entity, String.class);
        });
        return AjaxResult.success();
    }

    /**
     *  抓取文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult reptile(String url) {
        try {
            Document document = Jsoup.connect(url).get();
            Elements title  = document.getElementsByClass("title-article");
            Elements tags  = document.getElementsByClass("tag-link");
            Elements content  = document.getElementsByClass("article_content");
            if (StringUtils.isBlank(content.toString())) {
                throw new ServiceException("抓取文章失败!");
            }

            //爬取的是HTML内容，需要转成MD格式的内容
            String newContent = content.get(0).toString().replaceAll("<code>", "<code class=\"lang-java\">");
            MutableDataSet options = new MutableDataSet();
            String markdown = FlexmarkHtmlConverter.builder(options).build().convert(newContent)
                    .replace("lang-java","java");

            BlogArticle entity = new BlogArticle() {{
                setUserId(SecurityUtils.getLoginIdAsString());
                setContentMd(markdown);
                setCategoryId(16L);
                setIsOriginal(Long.valueOf(YesOrNoEnum.NO.getCode()));
                setTitle(title.get(0).text());
                setAddress("https://picsum.photos/500/300");
                setContent(newContent);
            }};

            blogArticleMapper.insertBlogArticle(entity);
            //为该文章添加标签
            List<Long> tagsId = new ArrayList<>();
            tags.forEach(item ->{
                String tag = item.text();
                BlogTags blogTags = new BlogTags() {{setName(tag);}};
                List<BlogTags> result = blogTagsMapper.selectBlogTagsList(blogTags);
                if (result.size() == 0){
                    blogTagsMapper.insertBlogTags(blogTags);
                }
                tagsId.add(result.get(0).getId());
            });
            blogTagsMapper.saveArticleTags(entity.getId(),tagsId);

            log.info("文章抓取成功，内容为:{}", JSON.toJSONString(entity));
        } catch (IOException e) {
            throw new ServiceException(e.getMessage());
        }
        return AjaxResult.success();
    }

    /**
     *  发布或下架文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult psArticle(BlogArticle article) {
        blogArticleMapper.updateBlogArticle(article);
        return AjaxResult.success();
    }

    @Override
    public AjaxResult randomImg() {
        return AjaxResult.success("https://picsum.photos/500/300?random=" + System.currentTimeMillis());
    }


    /**
     * 将数据库不存在的标签新增
     * @param article
     * @return
     */
    private List<Long> getTagsList(ArticleDTO article) {
        List<Long> tagList = new ArrayList<>();
        article.getTags().forEach(item ->{
            BlogTags blogTags = new BlogTags() {{setName(item);}};
            List<BlogTags> tags = blogTagsMapper.selectBlogTagsList(blogTags);
            if (tags.size() == 0){
                blogTags.setSort(0L);
                blogTagsMapper.insertBlogTags(blogTags);
            }
            tagList.add(tags.get(0).getId());
        });
        return tagList;
    }

    /**
     * 如果分类不存在则新增
     * @param categoryName
     * @return
     */
    private Long savaCategory(String categoryName) {
        log.info(categoryName);
        BlogCategory category = new BlogCategory() {{
            setName(categoryName);
        }};
        List<BlogCategory> categorys = categoryMapper.selectBlogCategoryList(category);
        if (categorys.isEmpty()){
            category.setSort(0L);
            categoryMapper.insertBlogCategory(category);
        }
        return categorys.get(0).getId();
    }
}
