package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogTipsoonComment;

/**
 * 简讯评论Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogTipsoonCommentMapper 
{
    /**
     * 查询简讯评论
     * 
     * @param id 简讯评论主键
     * @return 简讯评论
     */
    public BlogTipsoonComment selectBlogTipsoonCommentById(Long id);

    /**
     * 查询简讯评论列表
     * 
     * @param blogTipsoonComment 简讯评论
     * @return 简讯评论集合
     */
    public List<BlogTipsoonComment> selectBlogTipsoonCommentList(BlogTipsoonComment blogTipsoonComment);

    /**
     * 新增简讯评论
     * 
     * @param blogTipsoonComment 简讯评论
     * @return 结果
     */
    public int insertBlogTipsoonComment(BlogTipsoonComment blogTipsoonComment);

    /**
     * 修改简讯评论
     * 
     * @param blogTipsoonComment 简讯评论
     * @return 结果
     */
    public int updateBlogTipsoonComment(BlogTipsoonComment blogTipsoonComment);

    /**
     * 删除简讯评论
     * 
     * @param id 简讯评论主键
     * @return 结果
     */
    public int deleteBlogTipsoonCommentById(Long id);

    /**
     * 批量删除简讯评论
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogTipsoonCommentByIds(Long[] ids);
}
