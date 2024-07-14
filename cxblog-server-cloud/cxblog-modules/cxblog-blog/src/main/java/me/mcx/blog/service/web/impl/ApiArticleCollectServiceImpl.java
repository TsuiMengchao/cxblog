package me.mcx.blog.service.web.impl;

import cn.hutool.core.thread.ThreadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.domain.BlogArticleCollect;
import me.mcx.blog.domain.BlogTags;
import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import me.mcx.blog.handle.SystemNoticeHandle;
import me.mcx.blog.im.MessageConstant;
import me.mcx.blog.mapper.BlogArticleCollectMapper;
import me.mcx.blog.mapper.BlogArticleMapper;
import me.mcx.blog.mapper.BlogTagsMapper;
import me.mcx.blog.service.web.ApiArticleCollectService;
import me.mcx.common.core.constant.SecurityConstants;
import me.mcx.common.core.domain.R;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.system.api.RemoteUserService;
import me.mcx.system.api.model.user.UserVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ApiArticleCollectServiceImpl implements ApiArticleCollectService {
    private final RemoteUserService remoteUserService;
    private final BlogArticleCollectMapper blogArticleCollectMapper;

    private final BlogArticleCollectMapper collectMapper;

    private final BlogArticleMapper articleMapper;

    private final BlogTagsMapper tagsMapper;

    /**
     * 我的收藏列表
     * @return
     */
    @Override
    public List<ApiArticleListVO> selectCollectList() {
        List<ApiArticleListVO> list = collectMapper.selectCollectList(SecurityUtils.getLoginIdAsString());
        list.forEach(item ->{
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(item.getUserId()), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            item.setAvatar(user.getAvatar());
            item.setNickname(user.getNickName());

            List<BlogTags> tags = tagsMapper.selectTagByArticleId(item.getId());
            item.setTagList(tags);
        });
        return list;
    }

    /**
     * 收藏文章
     * @param articleId 文章id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult collect(Integer articleId) {
        BlogArticleCollect collect = new BlogArticleCollect(){{
            setUserId(SecurityUtils.getLoginIdAsString());
            setArticleId(Long.valueOf(articleId));
        }};
        blogArticleCollectMapper.insertBlogArticleCollect(collect);
        // 发送系统通知
        BlogArticle article = articleMapper.selectBlogArticleById(Long.valueOf(articleId));
        ThreadUtil.execAsync(() ->{
            SystemNoticeHandle.sendNotice(article.getUserId(), MessageConstant.MESSAGE_COLLECT_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE,articleId,null,null);
        });
        return AjaxResult.success();
    }

    /**
     * 取消收藏
     * @param articleId 文章id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult cancel(Integer articleId) {
        blogArticleCollectMapper.selectBlogArticleCollectList(new BlogArticleCollect() {{
            setUserId(SecurityUtils.getLoginIdAsString()); setArticleId(Long.valueOf(articleId));
        }}).forEach(item ->{
            blogArticleCollectMapper.deleteBlogArticleCollectById(item.getId());
        });
        return AjaxResult.success();
    }
}
