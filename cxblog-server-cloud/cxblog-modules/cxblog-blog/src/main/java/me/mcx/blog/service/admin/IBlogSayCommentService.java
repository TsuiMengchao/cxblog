package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogSayComment;

/**
 * 说说评论Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogSayCommentService 
{
    /**
     * 查询说说评论
     * 
     * @param id 说说评论主键
     * @return 说说评论
     */
    public BlogSayComment selectBlogSayCommentById(Long id);

    /**
     * 查询说说评论列表
     * 
     * @param blogSayComment 说说评论
     * @return 说说评论集合
     */
    public List<BlogSayComment> selectBlogSayCommentList(BlogSayComment blogSayComment);

    /**
     * 新增说说评论
     * 
     * @param blogSayComment 说说评论
     * @return 结果
     */
    public int insertBlogSayComment(BlogSayComment blogSayComment);

    /**
     * 修改说说评论
     * 
     * @param blogSayComment 说说评论
     * @return 结果
     */
    public int updateBlogSayComment(BlogSayComment blogSayComment);

    /**
     * 批量删除说说评论
     * 
     * @param ids 需要删除的说说评论主键集合
     * @return 结果
     */
    public int deleteBlogSayCommentByIds(Long[] ids);

    /**
     * 删除说说评论信息
     * 
     * @param id 说说评论主键
     * @return 结果
     */
    public int deleteBlogSayCommentById(Long id);
}
