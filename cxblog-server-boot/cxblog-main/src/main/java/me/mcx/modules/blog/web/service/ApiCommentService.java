package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.ArticleComment;

public interface ApiCommentService {

    /**
     * 发表评论
     * @param articleComment
     * @return
     */
    public ResponseResult insertComment(ArticleComment articleComment);

    /**
     * 分页获取文章评论
     * @param pageNo
     * @param pageSize
     * @param articleId
     * @return
     */
    public ResponseResult selectCommentByArticleId(int pageNo, int pageSize, Long articleId);

    /**
     * 获取我的评论
     * @return
     */
    public ResponseResult selectMyComment();


}
