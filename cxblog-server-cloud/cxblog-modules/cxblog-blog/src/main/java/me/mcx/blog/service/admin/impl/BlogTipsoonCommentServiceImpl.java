package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogTipsoonCommentMapper;
import me.mcx.blog.domain.BlogTipsoonComment;
import me.mcx.blog.service.admin.IBlogTipsoonCommentService;

/**
 * 简讯评论Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogTipsoonCommentServiceImpl implements IBlogTipsoonCommentService 
{
    @Autowired
    private BlogTipsoonCommentMapper blogTipsoonCommentMapper;

    /**
     * 查询简讯评论
     * 
     * @param id 简讯评论主键
     * @return 简讯评论
     */
    @Override
    public BlogTipsoonComment selectBlogTipsoonCommentById(Long id)
    {
        return blogTipsoonCommentMapper.selectBlogTipsoonCommentById(id);
    }

    /**
     * 查询简讯评论列表
     * 
     * @param blogTipsoonComment 简讯评论
     * @return 简讯评论
     */
    @Override
    public List<BlogTipsoonComment> selectBlogTipsoonCommentList(BlogTipsoonComment blogTipsoonComment)
    {
        return blogTipsoonCommentMapper.selectBlogTipsoonCommentList(blogTipsoonComment);
    }

    /**
     * 新增简讯评论
     * 
     * @param blogTipsoonComment 简讯评论
     * @return 结果
     */
    @Override
    public int insertBlogTipsoonComment(BlogTipsoonComment blogTipsoonComment)
    {
        blogTipsoonComment.setCreateTime(DateUtils.getNowDate());
        return blogTipsoonCommentMapper.insertBlogTipsoonComment(blogTipsoonComment);
    }

    /**
     * 修改简讯评论
     * 
     * @param blogTipsoonComment 简讯评论
     * @return 结果
     */
    @Override
    public int updateBlogTipsoonComment(BlogTipsoonComment blogTipsoonComment)
    {
        blogTipsoonComment.setUpdateTime(DateUtils.getNowDate());
        return blogTipsoonCommentMapper.updateBlogTipsoonComment(blogTipsoonComment);
    }

    /**
     * 批量删除简讯评论
     * 
     * @param ids 需要删除的简讯评论主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonCommentByIds(Long[] ids)
    {
        return blogTipsoonCommentMapper.deleteBlogTipsoonCommentByIds(ids);
    }

    /**
     * 删除简讯评论信息
     * 
     * @param id 简讯评论主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonCommentById(Long id)
    {
        return blogTipsoonCommentMapper.deleteBlogTipsoonCommentById(id);
    }
}
