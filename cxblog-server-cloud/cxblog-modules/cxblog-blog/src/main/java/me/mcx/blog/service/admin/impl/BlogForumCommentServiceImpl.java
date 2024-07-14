package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogForumCommentMapper;
import me.mcx.blog.domain.BlogForumComment;
import me.mcx.blog.service.admin.IBlogForumCommentService;

/**
 * 圈子评论Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogForumCommentServiceImpl implements IBlogForumCommentService 
{
    @Autowired
    private BlogForumCommentMapper blogForumCommentMapper;

    /**
     * 查询圈子评论
     * 
     * @param id 圈子评论主键
     * @return 圈子评论
     */
    @Override
    public BlogForumComment selectBlogForumCommentById(Long id)
    {
        return blogForumCommentMapper.selectBlogForumCommentById(id);
    }

    /**
     * 查询圈子评论列表
     * 
     * @param blogForumComment 圈子评论
     * @return 圈子评论
     */
    @Override
    public List<BlogForumComment> selectBlogForumCommentList(BlogForumComment blogForumComment)
    {
        return blogForumCommentMapper.selectBlogForumCommentList(blogForumComment);
    }

    /**
     * 新增圈子评论
     * 
     * @param blogForumComment 圈子评论
     * @return 结果
     */
    @Override
    public int insertBlogForumComment(BlogForumComment blogForumComment)
    {
        blogForumComment.setCreateTime(DateUtils.getNowDate());
        return blogForumCommentMapper.insertBlogForumComment(blogForumComment);
    }

    /**
     * 修改圈子评论
     * 
     * @param blogForumComment 圈子评论
     * @return 结果
     */
    @Override
    public int updateBlogForumComment(BlogForumComment blogForumComment)
    {
        blogForumComment.setUpdateTime(DateUtils.getNowDate());
        return blogForumCommentMapper.updateBlogForumComment(blogForumComment);
    }

    /**
     * 批量删除圈子评论
     * 
     * @param ids 需要删除的圈子评论主键
     * @return 结果
     */
    @Override
    public int deleteBlogForumCommentByIds(Long[] ids)
    {
        return blogForumCommentMapper.deleteBlogForumCommentByIds(ids);
    }

    /**
     * 删除圈子评论信息
     * 
     * @param id 圈子评论主键
     * @return 结果
     */
    @Override
    public int deleteBlogForumCommentById(Long id)
    {
        return blogForumCommentMapper.deleteBlogForumCommentById(id);
    }
}
