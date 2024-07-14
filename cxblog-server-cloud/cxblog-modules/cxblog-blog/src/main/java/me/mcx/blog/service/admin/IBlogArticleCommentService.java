package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogArticleComment;

/**
 * 评论Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogArticleCommentService 
{
    /**
     * 查询评论
     * 
     * @param id 评论主键
     * @return 评论
     */
    public BlogArticleComment selectBlogArticleCommentById(Long id);

    /**
     * 查询评论列表
     * 
     * @param blogArticleComment 评论
     * @return 评论集合
     */
    public List<BlogArticleComment> selectBlogArticleCommentList(BlogArticleComment blogArticleComment);

    /**
     * 新增评论
     * 
     * @param blogArticleComment 评论
     * @return 结果
     */
    public int insertBlogArticleComment(BlogArticleComment blogArticleComment);

    /**
     * 修改评论
     * 
     * @param blogArticleComment 评论
     * @return 结果
     */
    public int updateBlogArticleComment(BlogArticleComment blogArticleComment);

    /**
     * 批量删除评论
     * 
     * @param ids 需要删除的评论主键集合
     * @return 结果
     */
    public int deleteBlogArticleCommentByIds(Long[] ids);

    /**
     * 删除评论信息
     * 
     * @param id 评论主键
     * @return 结果
     */
    public int deleteBlogArticleCommentById(Long id);
}
