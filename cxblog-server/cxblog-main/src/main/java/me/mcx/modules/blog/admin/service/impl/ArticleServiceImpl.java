package me.mcx.modules.blog.admin.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.mcx.common.FieldConstants;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.mapper.ArticleMapper;
import me.mcx.modules.blog.domain.dto.ArticleDTO;
import me.mcx.modules.blog.domain.*;
import me.mcx.modules.system.mapper.UserMapper;
import me.mcx.utils.SecurityUtils;
import me.mcx.utils.enums.YesOrNoEnum;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.mapper.CategoryMapper;
import me.mcx.modules.blog.mapper.TagsMapper;
import me.mcx.modules.blog.admin.service.ArticleService;
import me.mcx.modules.blog.admin.service.SystemConfigService;
import me.mcx.modules.blog.strategy.context.SearchStrategyContext;
import me.mcx.utils.BeanCopyUtils;
import me.mcx.modules.blog.utils.ElasticsearchUtil;
import me.mcx.modules.blog.domain.vo.*;
import com.vladsch.flexmark.html2md.converter.FlexmarkHtmlConverter;
import com.vladsch.flexmark.util.data.MutableDataSet;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static me.mcx.common.Constants.IMG_URL_API;
import static me.mcx.common.Constants.OTHER_CATEGORY_ID;
import static me.mcx.common.ResultCode.*;

/**
 * <p>
 * 博客文章表 服务实现类
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Slf4j
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    private final CategoryMapper categoryMapper;
    private final UserMapper userMapper;

    private final SystemConfigService systemConfigService;

    private final TagsMapper tagsMapper;

    private final SearchStrategyContext searchStrategyContext;

    private final RestTemplate restTemplate;

    private final ElasticsearchUtil elasticsearchUtil;

    @Value("${baidu.url}")
    private String baiduUrl;


    /**
     *  后台获取所有文章
     * @return
     */
    @Override
    public ResponseResult selectArticleList(Map<String,Object> map) {
        Page<SystemArticleListVO> data = baseMapper.selectArticle(new Page<>((Integer)map.get("pageNo"), (Integer)map.get("pageSize")),map);
        data.getRecords().forEach(item ->{
            SystemUserVO userInfo = userMapper.getById(item.getUserId());
            item.setNickname(userInfo.getNickname());
        });
        return ResponseResult.success(data);
    }

    /**
     *  后台获取文章详情
     * @return
     */
    @Override
    public ResponseResult selectArticleById(Long id) {
        ArticleDTO articleDTO = baseMapper.selectArticlePrimaryKey(id);
        articleDTO.setTags(tagsMapper.selectByArticleId(id));
        return ResponseResult.success(articleDTO);
    }

    /**
     *  添加文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult  insertArticle(ArticleDTO article) {
        Article blogArticle = BeanCopyUtils.copyObject(article, Article.class);
        blogArticle.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        //添加分类
        Long categoryId = savaCategory(article.getCategoryName());
        //添加标签
        List<Long> tagList = getTagsList(article);

        blogArticle.setCategoryId(categoryId);

        int insert = baseMapper.insert(blogArticle);
        if (insert > 0) {
            tagsMapper.saveArticleTags(blogArticle.getId(),tagList);
        }
        return ResponseResult.success();
    }

    /**
     *  修改文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateArticle(ArticleDTO article) {
        Article blogArticle = baseMapper.selectById(article.getId());
        if (ObjectUtil.isNull(blogArticle)) {
            throw new BusinessException(ARTICLE_NOT_EXIST);
        }
        //只能修改属于当前登录用户的文章
        String loginId = String.valueOf(SecurityUtils.getCurrentUserId());
        if (!blogArticle.getUserId().equals(loginId) && !SecurityUtils.hasRole("admin")){
            throw new BusinessException(ERROR);
        }

        //添加分类
        Long categoryId = savaCategory(article.getCategoryName());
        //添加标签
        List<Long> tagList = getTagsList(article);

        blogArticle = BeanCopyUtils.copyObject(article, Article.class);
        blogArticle.setCategoryId(categoryId);
        baseMapper.updateById(blogArticle);

        //先删出所有标签
        tagsMapper.deleteByArticleIds(Collections.singletonList(blogArticle.getId()));
        //然后新增标签
        tagsMapper.saveArticleTags(blogArticle.getId(),tagList);

        return ResponseResult.success();
    }


    /**
     * 批量删除文章
     * @param ids
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteBatchArticle(List<Long> ids) {
        int rows = baseMapper.deleteBatchIds(ids);
        tagsMapper.deleteByArticleIds(ids);
        return ResponseResult.success();
    }

    /**
     *  置顶文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult topArticle(ArticleDTO article) {
        baseMapper.putTopArticle(article);
        return ResponseResult.success();
    }


    /**
     *  文章百度推送
     * @return
     */
    @Override
    public ResponseResult seoBatch(List<Long> ids) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", "data.zz.baidu.com");
        headers.add("User-Agent", "curl/7.12.1");
        headers.add("Content-Length", "83");
        headers.add("Content-Type", "text/plain");

        ids.forEach(item -> {
            String url = "https://cxblog.zhaohaoyue.love/article/" + item;
            HttpEntity<String> entity = new HttpEntity<>(url, headers);
            restTemplate.postForObject(baiduUrl, entity, String.class);
        });
        return ResponseResult.success();
    }

    /**
     *  抓取文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult reptile(String url) {
        try {
            Document document = Jsoup.connect(url).get();
            Elements title  = document.getElementsByClass("title-article");
            Elements tags  = document.getElementsByClass("tag-link");
            Elements content  = document.getElementsByClass("article_content");
            if (StringUtils.isBlank(content.toString())) {
                throw new BusinessException(CRAWLING_ARTICLE_FAILED.getDesc());
            }

            //爬取的是HTML内容，需要转成MD格式的内容
            String newContent = content.get(0).toString().replaceAll("<code>", "<code class=\"lang-java\">");
            MutableDataSet options = new MutableDataSet();
            String markdown = FlexmarkHtmlConverter.builder(options).build().convert(newContent)
                    .replace("lang-java","java");

            //文章封面图片 由https://api.btstu.cn/该网站随机获取
            String strResult = restTemplate.getForObject(IMG_URL_API, String.class);
            JSONObject jsonObject = JSON.parseObject(strResult);
            Object imgUrl = jsonObject.get("imgurl");

            Article entity = Article.builder().userId(String.valueOf(SecurityUtils.getCurrentUserId())).contentMd(markdown)
                    .categoryId(OTHER_CATEGORY_ID).isOriginal(YesOrNoEnum.NO.getCode()).originalUrl(url)
                    .title(title.get(0).text()).avatar(imgUrl.toString()).content(newContent).build();

            baseMapper.insert(entity);
            //为该文章添加标签
            List<Long> tagsId = new ArrayList<>();
            tags.forEach(item ->{
                String tag = item.text();
                Tags result = tagsMapper.selectOne(new QueryWrapper<Tags>().eq(FieldConstants.NAME,tag ));
                if (result == null){
                    result = Tags.builder().name(tag).build();
                    tagsMapper.insert(result);
                }
                tagsId.add(result.getId());
            });
            tagsMapper.saveArticleTags(entity.getId(),tagsId);

            log.info("文章抓取成功，内容为:{}", JSON.toJSONString(entity));
        } catch (IOException e) {
            throw new BusinessException(e);
        }
        return ResponseResult.success();
    }

    /**
     *  发布或下架文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult psArticle(ArticleDTO article) {
        baseMapper.publishAndShelf(article);
        return ResponseResult.success();
    }

    @Override
    public ResponseResult randomImg() {
        //文章封面图片 由https://api.btstu.cn/该网站随机获取
        String result = restTemplate.getForObject(IMG_URL_API, String.class);
        Object imgUrl = JSON.parseObject(result).get("imgurl");
        return ResponseResult.success(imgUrl);
    }


    /**
     * 将数据库不存在的标签新增
     * @param article
     * @return
     */
    private List<Long> getTagsList(ArticleDTO article) {
        List<Long> tagList = new ArrayList<>();
        article.getTags().forEach(item ->{
            Tags tags = tagsMapper.selectOne(new QueryWrapper<Tags>().eq(FieldConstants.NAME, item));
            if (tags == null){
                tags = Tags.builder().name(item).sort(0).build();
                tagsMapper.insert(tags);
            }
            tagList.add(tags.getId());
        });
        return tagList;
    }

    /**
     * 如果分类不存在则新增
     * @param categoryName
     * @return
     */
    private Long savaCategory(String categoryName) {
        Category category = categoryMapper.selectOne(new QueryWrapper<Category>().eq(FieldConstants.NAME, categoryName));
        if (category == null){
            category = Category.builder().name(categoryName).sort(0).build();
            categoryMapper.insert(category);
        }
        return category.getId();
    }
}
