package me.mcx.blog.service.web.impl;

import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.ObjectUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.*;
import me.mcx.blog.domain.dto.article.ArticlePostDTO;
import me.mcx.blog.domain.vo.article.ApiArchiveVO;
import me.mcx.blog.domain.vo.article.ApiArticleInfoVO;
import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import me.mcx.blog.domain.vo.article.ApiArticleSearchVO;
import me.mcx.blog.enums.ReadTypeEnum;
import me.mcx.blog.enums.SearchModelEnum;
import me.mcx.blog.handle.RelativeDateFormat;
import me.mcx.blog.handle.SystemNoticeHandle;
import me.mcx.blog.im.MessageConstant;
import me.mcx.blog.mapper.*;
import me.mcx.blog.service.admin.IBlogSystemConfigService;
import me.mcx.blog.service.web.ApiArticleService;
import me.mcx.blog.service.common.RedisService;
import me.mcx.blog.strategy.context.SearchStrategyContext;
import me.mcx.blog.util.BeanCopyUtil;
import me.mcx.common.core.constant.RedisConstants;
import me.mcx.common.core.constant.SecurityConstants;
import me.mcx.common.core.domain.R;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.ip.IpUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.system.api.RemoteUserService;
import me.mcx.system.api.model.user.UserVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;

import static me.mcx.common.core.constant.RedisConstants.*;
import static me.mcx.blog.common.ResultCode.PARAMS_ILLEGAL;


@Slf4j
@Service
@RequiredArgsConstructor
public class ApiArticleServiceImpl implements ApiArticleService {
    private final RemoteUserService remoteUserService;
    private final BlogArticleMapper articleMapper;

    private final BlogArticleMapper blogArticleMapper;

    private final RedisService redisService;

    private final BlogTagsMapper tagsMapper;

    private final BlogArticleCommentMapper commentMapper;

    private final BlogSystemConfigMapper blogSystemConfigMapper;

    private final BlogArticleCollectMapper collectMapper;
    private final BlogFollowedMapper followedMapper;

    private final SearchStrategyContext searchStrategyContext;

    /**
     *  获取文章列表
     * @return
     */
    @Override
    public List<ApiArticleListVO> selectArticleList(Integer categoryId, Integer tagId, String orderByDescColumn) {
        List<ApiArticleListVO> articlePage = articleMapper.selectPublicArticleList(categoryId,tagId,orderByDescColumn);
        articlePage.forEach(item ->{
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(item.getUserId()), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            item.setUserAvatar(user.getAvatar());
            item.setNickname(user.getNickName());

            setCommentAndLike(item);
//            //获取文章
//            int collectCount = collectMapper.selectCount(new LambdaQueryWrapper<Collect>().eq(Collect::getArticleId, item.getId()));
//            item.setCollectCount(collectCount);
//            //判断当前登录用户是否收藏该文章 标记为收藏
//            if (StpUtil.getLoginIdDefaultNull() != null) {
//                collectCount = collectMapper.selectCount(new LambdaQueryWrapper<Collect>().eq(Collect::getArticleId, item.getId())
//                        .eq(Collect::getUserId,StpUtil.getLoginIdAsString()));
//                item.setIsCollect(collectCount > 0);
//            }
            //格式化时间为几秒前 几分钟前等
            item.setFormatCreateTime(RelativeDateFormat.format(item.getCreateTime()));
        });
        return articlePage;
    }

    /**
     *  获取文章详情
     * @return
     */
    @Override
    public AjaxResult selectArticleInfo(Integer id) {
        ApiArticleInfoVO apiArticleInfoVO = articleMapper.selectArticleByIdToVO(id);
        if (apiArticleInfoVO == null) {
            throw new ServiceException("抱歉，文章不存在");
        }
        //获取用户信息
        R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(apiArticleInfoVO.getUserId()), SecurityConstants.INNER);
        UserVO user = userVOR.getData();
        apiArticleInfoVO.setAvatar(user.getAvatar());
        apiArticleInfoVO.setNickname(user.getNickName());
        //获取收藏量
        int collectCount = collectMapper.selectCount(new BlogArticleCollect(){{setArticleId(Long.valueOf(id));}});
        apiArticleInfoVO.setCollectCount(collectCount);
        //获取标签
        List<BlogTags> list = tagsMapper.selectTagByArticleId(apiArticleInfoVO.getId());
        apiArticleInfoVO.setTagList(list);
        //获取评论数量
        List<BlogArticleComment> comments = commentMapper.selectBlogArticleCommentList(new BlogArticleComment() {{setArticleId(Long.valueOf(id));}});
        apiArticleInfoVO.setCommentCount(comments.size());
        //获取点赞数量
        Map<String, Object> map = redisService.getCacheMap(ARTICLE_LIKE_COUNT);
        if (map!= null && map.size() > 0){
            apiArticleInfoVO.setLikeCount(map.get(id.toString()));
        }
        //获取当前登录用户是否点赞该文章
        Object userId = SecurityUtils.getLoginIdDefaultNull();
        if (userId != null){
            String articleLikeKey = ARTICLE_USER_LIKE + userId;
            if (redisService.sIsMember(articleLikeKey, id)) {
                apiArticleInfoVO.setIsLike(true);
                //校验文章用户是否已经点赞过
                if(apiArticleInfoVO.getReadType() == ReadTypeEnum.LIKE.index){
                    apiArticleInfoVO.setActiveReadType(true);
                }
            }
            //校验文章用户是否已经评论过
            if(apiArticleInfoVO.getReadType() == ReadTypeEnum.COMMENT.index){
                Integer count = commentMapper.selectCount(new BlogArticleComment(){{setUserId(String.valueOf(userId));}});
                if(count != null && count > 0) {
                    apiArticleInfoVO.setActiveReadType(true);
                }
            }

            //校验用户是否收藏文章
            int collect = collectMapper.selectCount(new BlogArticleCollect(){{setUserId(String.valueOf(userId));setArticleId(Long.valueOf(id));}});
            apiArticleInfoVO.setIsCollect(collect);

            //校验用户是否关注该文章作者
            int followed = followedMapper.selectCount(new BlogFollowed(){{setUserId(String.valueOf(userId));setFollowedUserId(apiArticleInfoVO.getUserId());}});
            apiArticleInfoVO.setIsFollowed(followed);
        }

        //校验文章是否已经进行过扫码验证
        if(apiArticleInfoVO.getReadType() == ReadTypeEnum.CODE.index){
            List<Object> cacheList = redisService.getCacheList(RedisConstants.CHECK_CODE_IP);
            String ip = IpUtils.getIpAddr();
            if (cacheList.contains(ip)) {
                apiArticleInfoVO.setActiveReadType(true);
            }
        }

        //增加文章阅读量
        ThreadUtil.execAsync(() -> redisService.incrArticle(id.longValue(),ARTICLE_READING,IpUtils.getIpAddr()));
        return AjaxResult.success(apiArticleInfoVO);
    }

    /**
     *  搜索文章
     * @return
     */
    @Override
    public AjaxResult searchArticle(String keywords) {
        if (StringUtils.isBlank(keywords)) {
            throw new ServiceException(PARAMS_ILLEGAL.getDesc());
        }
        //获取搜索模式（es搜索或mysql搜索）
        BlogSystemConfig systemConfig = blogSystemConfigMapper.selectBlogSystemConfigById(1L);
        String strategy = SearchModelEnum.getStrategy(systemConfig.getSearchModel());
        //搜索逻辑
        List<ApiArticleSearchVO> page = searchStrategyContext.executeSearchStrategy(strategy, keywords);

        return AjaxResult.success(page);
    }

    /**
     *  获取归档
     * @return
     */
    @Override
    public AjaxResult archive() {
        List<ApiArchiveVO> articleList = articleMapper.selectListArchive();
        //按日期分组
        Map<String, List<ApiArchiveVO>> resultList = articleList.stream().collect(Collectors.groupingBy(ApiArchiveVO::getTime));
        Object[] keyArr = resultList.keySet().toArray();  //获取resultList的所有key值数组
        Arrays.sort(keyArr);
        List<Map<String,Object>> result = new ArrayList<>();
        for (int i = keyArr.length - 1; i >= 0; i--) {
            Map<String,Object> map = new HashMap<>();
            map.put("time",keyArr[i]);
            List<ApiArchiveVO> list = resultList.get(keyArr[i]);
            Collections.sort(list, (o1, o2) -> o2.getFormatTime().compareTo(o1.getFormatTime()));
            map.put("list",list);
            result.add(map);
        }
        return AjaxResult.success(result).put("total",articleList.size());
    }

    /**
     * 文章点赞
     * @param articleId
     * @return
     */
    @Override
    public AjaxResult articleLike(Integer articleId) {
        String userId = SecurityUtils.getLoginIdAsString();
        // 判断是否点赞
        String articleLikeKey = ARTICLE_USER_LIKE + userId;
        if (redisService.sIsMember(articleLikeKey, articleId)) {
            // 点过赞则删除文章id
            redisService.sRemove(articleLikeKey, articleId);
            // 文章点赞量-1
            redisService.hDecr(ARTICLE_LIKE_COUNT, articleId.toString(), 1L);
        } else {
            // 未点赞则增加文章id
            redisService.sAdd(articleLikeKey, articleId);
            // 文章点赞量+1
            redisService.hIncr(ARTICLE_LIKE_COUNT, articleId.toString(), 1L);

            //构建通知消息
            BlogArticle article = blogArticleMapper.selectBlogArticleById(Long.valueOf(articleId));
            ThreadUtil.execAsync(() ->{
                SystemNoticeHandle.sendNotice(article.getUserId(),MessageConstant.MESSAGE_LIKE_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE,articleId,null,null);
            });
        }

        return AjaxResult.success();
    }

    /**
     * 用户添加文章
     * @param dto
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult insertArticle(ArticlePostDTO dto) {
        BlogArticle article = BeanCopyUtil.copyObject(dto, BlogArticle.class);
        article.setUserId(SecurityUtils.getLoginIdAsString());
        int insert = blogArticleMapper.insertBlogArticle(article);
        //添加标签
        if (insert > 0){
            tagsMapper.saveArticleTags(article.getId(),dto.getTagList());
        }
        ThreadUtil.execAsync(() ->{
            // 发送系统通知
            SystemNoticeHandle.sendNotice(SecurityUtils.getLoginIdAsString(),MessageConstant.MESSAGE_SYSTEM_NOTICE, MessageConstant.SYSTEM_MESSAGE_CODE,
                    null,null,"恭喜您发布了一篇文章");
        });
        return AjaxResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult updateMyArticle(ArticlePostDTO dto) {
        BlogArticle article = BeanCopyUtil.copyObject(dto, BlogArticle.class);
        if (!article.getUserId().equals(SecurityUtils.getLoginIdAsString())) {
            throw new ServiceException("只能修改自己的文章！");
        }
        blogArticleMapper.updateBlogArticle(article);

        //先删出所有标签
        tagsMapper.deleteByArticleIds(Collections.singletonList(article.getId()));
        //然后新增标签
        tagsMapper.saveArticleTags(article.getId(),dto.getTagList());
        return AjaxResult.success();
    }

    @Override
    public AjaxResult readMarkdownFile(MultipartFile file) {
        String fileName = file.getOriginalFilename().split(".md")[0];
        StringBuilder sb = new StringBuilder();
        try {
            InputStream inputStream = file.getInputStream();
            byte[] buffer = new byte[1024];

            int length;
            while ((length = inputStream.read(buffer)) != -1) {
                sb.append(new String(buffer, 0, length));
            }

            inputStream.close();

        } catch (IOException e) {
            log.error("文件读取失败,错误原因:{}", e);
           throw new ServiceException("文件读取失败");
        }
        Map<String, Object> map = new HashMap<>();
        map.put("content", sb.toString());
        map.put("fileName", fileName);
        return AjaxResult.success(map);
    }

    @Override
    public List<ApiArticleListVO> selectArticleByUserId(String userId, Integer type) {
        userId = StringUtils.isNotBlank(userId) ? userId : SecurityUtils.getLoginIdAsString();
        List<ApiArticleListVO> list = articleMapper.selectMyArticle(userId,type);
        list.forEach(item ->{
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(item.getUserId()), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            item.setUserAvatar(user.getAvatar());
            item.setNickname(user.getNickName());

            List<BlogTags> tags = tagsMapper.selectTagByArticleId(item.getId());
            item.setTagList(tags);

            item.setFormatCreateTime(RelativeDateFormat.format(item.getCreateTime()));
        });
        return list;

    }

    /**
     * 删除我的文章
     * @param id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult deleteMyArticle(Long id) {
        BlogArticle article = blogArticleMapper.selectBlogArticleById(id);
        if (!article.getUserId().equals(SecurityUtils.getLoginIdAsString())) {
            throw new ServiceException("只能删除自己的文章！");
        }
        blogArticleMapper.deleteBlogArticleById(id);
        tagsMapper.deleteByArticleIds(Collections.singletonList(id));
        return AjaxResult.success();
    }

    /**
     * 获取我的文章详情
     * @param id
     * @return
     */
    @Override
    public AjaxResult selectMyArticleInfo(Long id) {
        ArticlePostDTO articlePostDTO =  articleMapper.selectMyArticleInfo(id);
        if (!articlePostDTO.getUserId().equals(SecurityUtils.getLoginIdAsString())) {
            throw new ServiceException("只能查看自己的文章！");
        }
        List<BlogTags> tags = tagsMapper.selectTagByArticleId(id);
        List<Long> tagList = tags.stream().map(BlogTags::getId).collect(Collectors.toList());
        articlePostDTO.setTagList(tagList);
        return AjaxResult.success(articlePostDTO);
    }

    /**
     *  校验文章验证码(验证码通过关注公众号获取)
     * @return
     */
    @Override
    public AjaxResult checkCode(String code) {
        //校验验证码
        String key = RedisConstants.WECHAT_CODE + code;
        Object redisCode = redisService.getCacheObject(key);
        if (ObjectUtil.isNull(redisCode)) {
            throw new ServiceException("验证码不正确或已过期，请重新输入");
        }

        //将ip存在redis 有效期一天，当天无需再进行验证码校验
        List<Object> cacheList = redisService.getCacheList(CHECK_CODE_IP);
        if (cacheList.isEmpty()) {
            cacheList = new ArrayList<>();
        }
        cacheList.add(IpUtils.getIpAddr());
        redisService.setCacheList(CHECK_CODE_IP,cacheList);
        //通过删除验证码
        redisService.deleteObject(key);
        return AjaxResult.success("验证成功");
    }



    /**
     * 设置评论量和点赞量
     * @param item
     */
    private void setCommentAndLike(ApiArticleListVO item) {
        List<BlogTags> list = tagsMapper.selectTagByArticleId(item.getId());
        Integer commentCount = commentMapper.selectCount(new BlogArticleComment() {{setArticleId(item.getId());}});
        //获取点赞数量
        Map<String, Object> map = redisService.getCacheMap(ARTICLE_LIKE_COUNT);
        if (map!= null && map.size() > 0){
            Object obj = map.get(item.getId().toString());
            item.setLikeCount(obj == null ? 0 : obj);
        }
        item.setTagList(list);
        item.setCommentCount(commentCount);
    }
}
