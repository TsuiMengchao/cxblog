package me.mcx.blog.service.web.impl;

import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentParser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import me.mcx.blog.domain.vo.message.ApiCommentListVO;
import me.mcx.blog.handle.RelativeDateFormat;
import me.mcx.blog.handle.SystemNoticeHandle;
import me.mcx.blog.im.MessageConstant;
import me.mcx.blog.mapper.BlogArticleCommentMapper;
import me.mcx.blog.mapper.BlogArticleMapper;
import me.mcx.blog.service.web.ApiCommentService;
import me.mcx.blog.util.HTMLUtil;
import me.mcx.common.core.constant.SecurityConstants;
import me.mcx.common.core.domain.R;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.ServletUtils;
import me.mcx.common.core.utils.ip.IpUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.system.api.RemoteUserInfoService;
import me.mcx.system.api.RemoteUserService;
import me.mcx.system.api.model.user.UserInfoVO;
import me.mcx.system.api.model.user.UserVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;


@Slf4j
@Service
@RequiredArgsConstructor
public class ApiCommentServiceImpl implements ApiCommentService {
    private final RemoteUserService remoteUserService;
    private final RemoteUserInfoService remoteUserInfoService;

    private final BlogArticleCommentMapper blogArticleCommentMapper;

    private final BlogArticleCommentMapper commentMapper;

    private final BlogArticleMapper articleMapper;

    /**
     * 发表评论
     * @param comment
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addComment(BlogArticleComment comment) {
        UserAgent userAgent = UserAgentParser.parse(ServletUtils.getRequest().getHeader("user-agent"));
        //获取ip地址
        String ip = IpUtils.getIpAddr();
        String ipAddress = ip;
        String os = userAgent.getOs().getName();
        if (os.contains("mac") || os.contains("Mac")) {
            comment.setSystem("mac");
        } else if (os.contains("Windows")) {
            comment.setSystem("windowns");
        }else {
            comment.setSystem("android");
        }
        //过滤内容 如删除html标签和敏感词替换
        String content = HTMLUtil.deleteTag(comment.getContent());
        comment.setContent(content);
        comment.setSystemVersion(os);
        comment.setIpAddress(ipAddress);
        comment.setUserId(SecurityUtils.getLoginIdAsString());
        int insert = blogArticleCommentMapper.insertBlogArticleComment(comment);
        if (insert == 0){
            throw new ServiceException("评论失败");
        }
        String toUserId =  comment.getReplyUserId();
        int mark = toUserId == null ? 2 : 1;
        if (toUserId == null) {
            BlogArticle article = articleMapper.selectBlogArticleById(comment.getArticleId());
            toUserId =  article.getUserId();
        }
        String finalUserId = toUserId;
        ThreadUtil.execAsync(() -> {
            SystemNoticeHandle.sendNotice(finalUserId, MessageConstant.MESSAGE_COMMENT_NOTICE, MessageConstant.SYSTEM_MESSAGE_CODE, Math.toIntExact(comment.getArticleId()), mark, comment.getContent());
        });
        return AjaxResult.success(comment);
    }

    @Override
    public List<ApiCommentListVO> selectCommentByArticleId(Long articleId) {
        //获取评论父级评论
        List<ApiCommentListVO> pageList = commentMapper.selectCommentPage(articleId);
        //获取子级
        for (ApiCommentListVO vo : pageList) {
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(vo.getUserId()), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            vo.setAvatar(user.getAvatar());
            vo.setNickname(user.getNickName());

            List<BlogArticleComment> commentList = blogArticleCommentMapper.selectBlogArticleCommentList(
                    new BlogArticleComment(){{setParentId(Long.valueOf(vo.getId()));}});
            for (BlogArticleComment e : commentList) {
                UserInfoVO replyUserInfo = remoteUserInfoService.getByUserId(e.getReplyUserId(), SecurityConstants.INNER).getData();
                UserInfoVO userInfo1 = remoteUserInfoService.getByUserId(e.getUserId(), SecurityConstants.INNER).getData();
                ApiCommentListVO apiCommentListVO = ApiCommentListVO.builder()
                        .id(Math.toIntExact(e.getId()))
                        .userId(e.getUserId())
                        .replyUserId(e.getReplyUserId())
                        .nickname(userInfo1.getNickname())
                        .webSite(userInfo1.getWebSite())
                        .replyNickname(replyUserInfo.getNickname())
                        .replyWebSite(replyUserInfo.getWebSite())
                        .content(e.getContent())
                        .avatar(userInfo1.getAvatar())
                        .createTimeStr(RelativeDateFormat.format(e.getCreateTime()))
                        .browser(e.getBrowser())
                        .browserVersion(e.getBrowserVersion())
                        .system(e.getSystem())
                        .systemVersion(e.getSystemVersion())
                        .ipAddress(e.getIpAddress())
                        .build();
                vo.getChildren().add(apiCommentListVO);
            }
            vo.setCreateTimeStr(RelativeDateFormat.format(vo.getCreateTime()));
        }
        return pageList;
    }

    /**
     * 获取我的评论
     * @return
     */
    @Override
    public List<ApiArticleListVO> selectMyComment() {
        List<ApiArticleListVO> result  = commentMapper.selectMyComment(SecurityUtils.getLoginIdAsString());
        return result;
    }
}
