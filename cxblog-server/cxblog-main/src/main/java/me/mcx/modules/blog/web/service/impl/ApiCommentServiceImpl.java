package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Article;
import me.mcx.modules.blog.domain.ArticleComment;
import me.mcx.modules.blog.domain.UserInfo;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.web.handle.RelativeDateFormat;
import me.mcx.modules.blog.web.handle.SystemNoticeHandle;
import me.mcx.modules.blog.web.im.MessageConstant;
import me.mcx.modules.blog.web.service.ApiCommentService;
import me.mcx.modules.blog.mapper.ArticleMapper;
import me.mcx.modules.blog.mapper.CommentMapper;
import me.mcx.modules.blog.mapper.UserInfoMapper;
import me.mcx.utils.*;
import me.mcx.modules.blog.domain.vo.ApiArticleListVO;
import me.mcx.modules.blog.domain.vo.ApiCommentListVO;
import eu.bitwalker.useragentutils.UserAgent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Slf4j
@Service
@RequiredArgsConstructor
public class ApiCommentServiceImpl implements ApiCommentService {

    private final CommentMapper commentMapper;

    private final UserInfoMapper userInfoMapper;

    private final ArticleMapper articleMapper;

    /**
     * 发表评论
     * @param articleComment
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertComment(ArticleComment articleComment) {
        UserAgent userAgent = UserAgent.parseUserAgentString(RequestHolder.getHttpServletRequest().getHeader("user-agent"));
        //获取ip地址
        HttpServletRequest request = RequestHolder.getHttpServletRequest();
        String ip = StringUtils.getIp(request);
        String ipAddress = StringUtils.getCityInfo(ip);
        String os = userAgent.getOperatingSystem().getName();
        if (os.contains("mac") || os.contains("Mac")) {
            articleComment.setSystem("mac");
        } else if (os.contains("Windows")) {
            articleComment.setSystem("windowns");
        }else {
            articleComment.setSystem("android");
        }
        //过滤内容 如删除html标签和敏感词替换
        String content = HTMLUtils.deleteTag(articleComment.getContent());
        articleComment.setContent(content);
        articleComment.setSystemVersion(os);
        articleComment.setIpAddress(ipAddress);
        articleComment.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        int insert = commentMapper.insert(articleComment);
        if (insert == 0){
            throw new BusinessException("评论失败");
        }
        String toUserId =  articleComment.getReplyUserId();
        int mark = toUserId == null ? 2 : 1;
        if (toUserId == null) {
            Article article = articleMapper.selectById(articleComment.getArticleId());
            toUserId =  article.getUserId();
        }
        SystemNoticeHandle.sendNotice(toUserId, MessageConstant.MESSAGE_COMMENT_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE, articleComment.getArticleId().toString(),mark, articleComment.getContent());
        return ResponseResult.success(articleComment);
    }

    @Override
    public ResponseResult selectCommentByArticleId(int pageNo, int pageSize, Long articleId) {
        //获取评论父级评论
        Page<ApiCommentListVO> pageList = commentMapper.selectCommentPage(new Page<ApiCommentListVO>(pageNo,pageSize),articleId);
        //获取子级
        for (ApiCommentListVO vo : pageList.getRecords()) {
            List<ArticleComment> articleCommentList = commentMapper.selectList(
                    new LambdaQueryWrapper<ArticleComment>().eq(ArticleComment::getParentId, vo.getId()).orderByDesc(ArticleComment::getCreateTime));
            for (ArticleComment e : articleCommentList) {
                UserInfo replyUserInfo = userInfoMapper.getByUserId(e.getReplyUserId());
                UserInfo userInfo1 = userInfoMapper.getByUserId(e.getUserId());
                ApiCommentListVO apiCommentListVO = ApiCommentListVO.builder()
                        .id(e.getId())
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
        return ResponseResult.success(pageList);
    }

    /**
     * 获取我的评论
     * @return
     */
    @Override
    public ResponseResult selectMyComment() {
        Page<ApiArticleListVO> result  = commentMapper.selectMyComment(new Page<ApiArticleListVO>(PageUtils.getPageNo(),PageUtils.getPageSize()), String.valueOf(SecurityUtils.getCurrentUserId()));
        return ResponseResult.success(result);
    }
}
