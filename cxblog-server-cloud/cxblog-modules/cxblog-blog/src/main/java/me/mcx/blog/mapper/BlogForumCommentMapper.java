package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogForumComment;

/**
 * 圈子评论Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogForumCommentMapper 
{
    /**
     * 查询圈子评论
     * 
     * @param id 圈子评论主键
     * @return 圈子评论
     */
    public BlogForumComment selectBlogForumCommentById(Long id);

    /**
     * 查询圈子评论列表
     * 
     * @param blogForumComment 圈子评论
     * @return 圈子评论集合
     */
    public List<BlogForumComment> selectBlogForumCommentList(BlogForumComment blogForumComment);

    /**
     * 新增圈子评论
     * 
     * @param blogForumComment 圈子评论
     * @return 结果
     */
    public int insertBlogForumComment(BlogForumComment blogForumComment);

    /**
     * 修改圈子评论
     * 
     * @param blogForumComment 圈子评论
     * @return 结果
     */
    public int updateBlogForumComment(BlogForumComment blogForumComment);

    /**
     * 删除圈子评论
     * 
     * @param id 圈子评论主键
     * @return 结果
     */
    public int deleteBlogForumCommentById(Long id);

    /**
     * 批量删除圈子评论
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogForumCommentByIds(Long[] ids);
}
