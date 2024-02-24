package me.mcx.modules.blog.web.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.common.Constants;
import me.mcx.common.RedisConstants;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.mapper.*;
import me.mcx.modules.blog.domain.dto.ArticleInsertDTO;
import me.mcx.modules.blog.domain.*;
import me.mcx.modules.blog.admin.service.RedisService;
import me.mcx.modules.blog.web.handle.RelativeDateFormat;
import me.mcx.modules.blog.web.handle.SystemNoticeHandle;
import me.mcx.modules.blog.web.im.MessageConstant;
import me.mcx.modules.system.mapper.UserMapper;
import me.mcx.utils.SecurityUtils;
import me.mcx.utils.enums.ReadTypeEnum;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.web.service.ApiArticleService;
import me.mcx.utils.BeanCopyUtils;
import me.mcx.modules.blog.utils.ElasticsearchUtil;
import me.mcx.utils.IpUtil;
import me.mcx.utils.PageUtils;
import me.mcx.modules.blog.domain.vo.ApiArchiveVO;
import me.mcx.modules.blog.domain.vo.ApiArticleInfoVO;
import me.mcx.modules.blog.domain.vo.ApiArticleListVO;
import me.mcx.modules.blog.domain.vo.UserInfoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;

import static me.mcx.common.RedisConstants.*;
import static me.mcx.common.ResultCode.ERROR_EXCEPTION_MOBILE_CODE;

@Slf4j
@Service
@RequiredArgsConstructor
public class ApiArticleServiceImpl implements ApiArticleService {
    
    private final ArticleMapper articleMapper;

    private final UserMapper userMapper;

    private final RedisService redisService;

    private final TagsMapper tagsMapper;

    private final CommentMapper commentMapper;

    private final ElasticsearchUtil elasticsearchUtil;

    private final CollectMapper collectMapper;
    private final FollowedMapper followedMapper;

    /**
     *  获取文章列表
     * @return
     */
    @Override
    public ResponseResult selectArticleList(Integer categoryId,Integer tagId,String orderByDescColumn) {
        Page<ApiArticleListVO> articlePage = articleMapper.selectPublicArticleList(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()),
                categoryId,tagId,orderByDescColumn);
        articlePage.getRecords().forEach(item ->{
            setCommentAndLike(item);
            //获取文章
            int collectCount = Math.toIntExact(collectMapper.selectCount(new LambdaQueryWrapper<Collect>().eq(Collect::getArticleId, item.getId())));
            item.setCollectCount(collectCount);
            //判断当前登录用户是否收藏该文章 标记为收藏
            if (StpUtil.getLoginIdDefaultNull() != null) {
                collectCount = Math.toIntExact(collectMapper.selectCount(new LambdaQueryWrapper<Collect>().eq(Collect::getArticleId, item.getId())
                        .eq(Collect::getUserId, SecurityUtils.getCurrentUserId())));
                item.setIsCollect(collectCount > 0);
            }
            //格式化时间为几秒前 几分钟前等
            item.setFormatCreateTime(RelativeDateFormat.format(item.getCreateTime()));
        });
        return ResponseResult.success(articlePage);
    }

    /**
     *  获取文章详情
     * @return
     */
    @Override
    public ResponseResult selectArticleInfo(Integer id) {
        ApiArticleInfoVO apiArticleInfoVO = articleMapper.selectArticleByIdToVO(id);
        if (apiArticleInfoVO == null) {
            throw new BusinessException("抱歉，文章不存在");
        }
        //获取收藏量
        int collectCount = Math.toIntExact(collectMapper.selectCount(new LambdaQueryWrapper<Collect>().eq(Collect::getArticleId, id)));
        apiArticleInfoVO.setCollectCount(collectCount);
        //获取标签
        List<Tags> list = tagsMapper.selectTagByArticleId(apiArticleInfoVO.getId());
        apiArticleInfoVO.setTagList(list);
        //获取评论数量
        List<Comment> comments = commentMapper.selectList(
                new LambdaQueryWrapper<Comment>().eq(Comment::getArticleId, id));
        apiArticleInfoVO.setCommentCount(comments.size());
        //获取点赞数量
        Map<String, Object> map = redisService.getCacheMap(ARTICLE_LIKE_COUNT);
        if (map!= null && map.size() > 0){
            apiArticleInfoVO.setLikeCount(map.get(id.toString()));
        }
        //获取当前登录用户是否点赞该文章
        Object userId = StpUtil.getLoginIdDefaultNull();
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
                Integer count = Math.toIntExact(commentMapper.selectCount(new LambdaQueryWrapper<Comment>().eq(Comment::getUserId, userId)));
                if(count != null && count > 0) {
                    apiArticleInfoVO.setActiveReadType(true);
                }
            }

            //校验用户是否收藏文章
            int collect = Math.toIntExact(collectMapper.selectCount(new LambdaQueryWrapper<Collect>().eq(Collect::getUserId, userId).eq(Collect::getArticleId, id)));
            apiArticleInfoVO.setIsCollect(collect);

            //校验用户是否关注该文章作者
            int followed = Math.toIntExact(followedMapper.selectCount(new LambdaQueryWrapper<Followed>().eq(Followed::getUserId, userId)
                    .eq(Followed::getFollowedUserId, apiArticleInfoVO.getUserId())));
            apiArticleInfoVO.setIsFollowed(followed);
        }

        //校验文章是否已经进行过扫码验证
        if(apiArticleInfoVO.getReadType() == ReadTypeEnum.CODE.index){
            List<Object> cacheList = redisService.getCacheList(RedisConstants.CHECK_CODE_IP);
            String ip = IpUtil.getIp();
            if (cacheList.contains(ip)) {
                apiArticleInfoVO.setActiveReadType(true);
            }
        }

        //增加文章阅读量
        redisService.incrArticle(id.longValue(),ARTICLE_READING,IpUtil.getIp());
        return ResponseResult.success(apiArticleInfoVO);
    }

    /**
     *  搜索文章
     * @return
     */
    @Override
    public ResponseResult searchArticle(String keywords) {
//        if (StringUtils.isBlank(keywords)) {
//            throw new BusinessException(PARAMS_ILLEGAL.getDesc());
//        }
//        //获取搜索模式（es搜索或mysql搜索）
//        SystemConfig systemConfig = systemConfigService.getCustomizeOne();
//        String strategy = SearchModelEnum.getStrategy(systemConfig.getSearchModel());
//        //搜索逻辑
//        List<ArticleSearchVO> articleSearchVOS = searchStrategyContext.executeSearchStrategy(strategy, keywords);
        Page<ApiArticleListVO> articlePage = articleMapper.selectSearchArticle(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()),
                keywords);
        articlePage.getRecords().forEach(item -> {
            item.setTitle(item.getTitle().replaceAll("(?i)" + keywords, Constants.PRE_TAG + keywords + Constants.POST_TAG));
            //格式化时间为几秒前 几分钟前等
            item.setFormatCreateTime(RelativeDateFormat.format(item.getCreateTime()));
        });

        return ResponseResult.success(articlePage);
    }

    /**
     *  获取归档
     * @return
     */
    @Override
    public ResponseResult archive() {
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
        return ResponseResult.success(result).putExtra("total",articleList.size());
    }

    /**
     * 文章点赞
     * @param articleId
     * @return
     */
    @Override
    public ResponseResult articleLike(Integer articleId) {
        String userId = String.valueOf(SecurityUtils.getCurrentUserId());
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
            Article article = articleMapper.selectById(articleId);
            SystemNoticeHandle.sendNotice(article.getUserId(), MessageConstant.MESSAGE_LIKE_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE,articleId,null,null);
        }

        return ResponseResult.success();
    }

    /**
     * 用户添加文章
     * @param dto
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertArticle(ArticleInsertDTO dto) {
        Article article = BeanCopyUtils.copyObject(dto, Article.class);
        article.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        int insert = articleMapper.insert(article);
        //添加标签
        if (insert > 0){
            tagsMapper.saveArticleTags(article.getId(),dto.getTagList());
        }
        // 发送系统通知
        SystemNoticeHandle.sendNotice(String.valueOf(SecurityUtils.getCurrentUserId()),MessageConstant.MESSAGE_SYSTEM_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE,
                null,null,"恭喜您发布了一篇文章");

        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateMyArticle(ArticleInsertDTO dto) {
        Article article = BeanCopyUtils.copyObject(dto, Article.class);
        if (!article.getUserId().equals(SecurityUtils.getCurrentUserId().toString())) {
            throw new BusinessException("只能修改自己的文章！");
        }
        articleMapper.updateById(article);

        //先删出所有标签
        tagsMapper.deleteByArticleIds(Collections.singletonList(article.getId()));
        //然后新增标签
        tagsMapper.saveArticleTags(article.getId(),dto.getTagList());
        return ResponseResult.success();
    }

    @Override
    public ResponseResult readMarkdownFile(MultipartFile file) {
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
           throw new BusinessException("文件读取失败");
        }
        Map<String, Object> map = new HashMap<>();
        map.put("content", sb.toString());
        map.put("fileName", fileName);
        return ResponseResult.success(map);
    }

    @Override
    public ResponseResult selectArticleByUserId(String userId, Integer type) {
        userId = StringUtils.isNotBlank(userId) ? userId : String.valueOf(SecurityUtils.getCurrentUserId());
        Page<ApiArticleListVO> list = articleMapper.selectMyArticle(new Page<>(PageUtils.getPageNo(),PageUtils.getPageSize()),userId,type);
        list.getRecords().forEach(item ->{
            List<Tags> tags = tagsMapper.selectTagByArticleId(item.getId());
            item.setTagList(tags);
        });
        return ResponseResult.success(list);

    }

    /**
     * 删除我的文章
     * @param id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteMyArticle(Long id) {
        Article article = articleMapper.selectById(id);
        if (!article.getUserId().equals(SecurityUtils.getCurrentUserId().toString())) {
            throw new BusinessException("只能删除自己的文章！");
        }
        articleMapper.deleteById(id);
        tagsMapper.deleteByArticleIds(Collections.singletonList(id));
        return ResponseResult.success();
    }

    /**
     * 获取我的文章详情
     * @param id
     * @return
     */
    @Override
    public ResponseResult selectMyArticleInfo(Long id) {
        ArticleInsertDTO articleInsertDTO  =  articleMapper.selectMyArticleInfo(id);
        if (!articleInsertDTO.getUserId().equals(SecurityUtils.getCurrentUserId().toString())) {
            throw new BusinessException("只能查看自己的文章！");
        }
        List<Tags> tags = tagsMapper.selectTagByArticleId(id);
        List<Long> tagList = tags.stream().map(Tags::getId).collect(Collectors.toList());
        articleInsertDTO.setTagList(tagList);
        return ResponseResult.success(articleInsertDTO);
    }

    /**
     * 根据文章id获取作者信息
     * @param id 文章id
     * @return
     */
    @Override
    public ResponseResult selectUserInfoByArticleId(Integer id) {
        Article article = articleMapper.selectById(id);
        UserInfoVO userInfoVO = userMapper.selectInfoByUserId(article.getUserId());
        return ResponseResult.success(userInfoVO);
    }



    /**
     *  校验文章验证码(验证码通过关注公众号获取)
     * @return
     */
    @Override
    public ResponseResult checkCode(String code) {
        //校验验证码
        String key = RedisConstants.WECHAT_CODE + code;
        Object redisCode = redisService.getCacheObject(key);
        if (ObjectUtil.isNull(redisCode)) {
            throw new BusinessException(ERROR_EXCEPTION_MOBILE_CODE.getDesc());
        }

        //将ip存在redis 有效期一天，当天无需再进行验证码校验
        List<Object> cacheList = redisService.getCacheList(CHECK_CODE_IP);
        if (cacheList.isEmpty()) {
            cacheList = new ArrayList<>();
        }
        cacheList.add(IpUtil.getIp());
        redisService.setCacheList(CHECK_CODE_IP,cacheList);
        //通过删除验证码
        redisService.deleteObject(key);
        return ResponseResult.success("验证成功");
    }



    /**
     * 设置评论量和点赞量
     * @param item
     */
    private void setCommentAndLike(ApiArticleListVO item) {
        List<Tags> list = tagsMapper.selectTagByArticleId(item.getId());
        Integer commentCount = Math.toIntExact(commentMapper.selectCount(new LambdaQueryWrapper<Comment>()
                .eq(Comment::getArticleId, item.getId())));
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
