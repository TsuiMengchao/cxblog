package me.mcx.blog.service.web;

import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import me.mcx.blog.domain.vo.message.ApiCommentListVO;
import me.mcx.common.core.web.domain.AjaxResult;

import java.util.List;

public interface ApiCommentService {

    /**
     * 发表评论
     * @param comment
     * @return
     */
    public AjaxResult addComment(BlogArticleComment comment);

    /**
     * 分页获取文章评论
     * @param articleId
     * @return
     */
    public List<ApiCommentListVO> selectCommentByArticleId(Long articleId);

    /**
     * 获取我的评论
     * @return
     */
    public List<ApiArticleListVO> selectMyComment();


}
