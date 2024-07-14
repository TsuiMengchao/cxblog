package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogArticleCommentMapper;
import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.service.admin.IBlogArticleCommentService;

/**
 * 评论Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogArticleCommentServiceImpl implements IBlogArticleCommentService 
{
    @Autowired
    private BlogArticleCommentMapper blogArticleCommentMapper;

    /**
     * 查询评论
     * 
     * @param id 评论主键
     * @return 评论
     */
    @Override
    public BlogArticleComment selectBlogArticleCommentById(Long id)
    {
        return blogArticleCommentMapper.selectBlogArticleCommentById(id);
    }

    /**
     * 查询评论列表
     * 
     * @param blogArticleComment 评论
     * @return 评论
     */
    @Override
    public List<BlogArticleComment> selectBlogArticleCommentList(BlogArticleComment blogArticleComment)
    {
        return blogArticleCommentMapper.selectBlogArticleCommentList(blogArticleComment);
    }

    /**
     * 新增评论
     * 
     * @param blogArticleComment 评论
     * @return 结果
     */
    @Override
    public int insertBlogArticleComment(BlogArticleComment blogArticleComment)
    {
        blogArticleComment.setCreateTime(DateUtils.getNowDate());
        return blogArticleCommentMapper.insertBlogArticleComment(blogArticleComment);
    }

    /**
     * 修改评论
     * 
     * @param blogArticleComment 评论
     * @return 结果
     */
    @Override
    public int updateBlogArticleComment(BlogArticleComment blogArticleComment)
    {
        blogArticleComment.setUpdateTime(DateUtils.getNowDate());
        return blogArticleCommentMapper.updateBlogArticleComment(blogArticleComment);
    }

    /**
     * 批量删除评论
     * 
     * @param ids 需要删除的评论主键
     * @return 结果
     */
    @Override
    public int deleteBlogArticleCommentByIds(Long[] ids)
    {
        return blogArticleCommentMapper.deleteBlogArticleCommentByIds(ids);
    }

    /**
     * 删除评论信息
     * 
     * @param id 评论主键
     * @return 结果
     */
    @Override
    public int deleteBlogArticleCommentById(Long id)
    {
        return blogArticleCommentMapper.deleteBlogArticleCommentById(id);
    }
}
