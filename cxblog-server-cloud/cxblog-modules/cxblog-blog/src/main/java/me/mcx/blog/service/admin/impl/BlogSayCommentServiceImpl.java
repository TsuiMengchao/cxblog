package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogSayCommentMapper;
import me.mcx.blog.domain.BlogSayComment;
import me.mcx.blog.service.admin.IBlogSayCommentService;

/**
 * 说说评论Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogSayCommentServiceImpl implements IBlogSayCommentService 
{
    @Autowired
    private BlogSayCommentMapper blogSayCommentMapper;

    /**
     * 查询说说评论
     * 
     * @param id 说说评论主键
     * @return 说说评论
     */
    @Override
    public BlogSayComment selectBlogSayCommentById(Long id)
    {
        return blogSayCommentMapper.selectBlogSayCommentById(id);
    }

    /**
     * 查询说说评论列表
     * 
     * @param blogSayComment 说说评论
     * @return 说说评论
     */
    @Override
    public List<BlogSayComment> selectBlogSayCommentList(BlogSayComment blogSayComment)
    {
        return blogSayCommentMapper.selectBlogSayCommentList(blogSayComment);
    }

    /**
     * 新增说说评论
     * 
     * @param blogSayComment 说说评论
     * @return 结果
     */
    @Override
    public int insertBlogSayComment(BlogSayComment blogSayComment)
    {
        blogSayComment.setCreateTime(DateUtils.getNowDate());
        return blogSayCommentMapper.insertBlogSayComment(blogSayComment);
    }

    /**
     * 修改说说评论
     * 
     * @param blogSayComment 说说评论
     * @return 结果
     */
    @Override
    public int updateBlogSayComment(BlogSayComment blogSayComment)
    {
        blogSayComment.setUpdateTime(DateUtils.getNowDate());
        return blogSayCommentMapper.updateBlogSayComment(blogSayComment);
    }

    /**
     * 批量删除说说评论
     * 
     * @param ids 需要删除的说说评论主键
     * @return 结果
     */
    @Override
    public int deleteBlogSayCommentByIds(Long[] ids)
    {
        return blogSayCommentMapper.deleteBlogSayCommentByIds(ids);
    }

    /**
     * 删除说说评论信息
     * 
     * @param id 说说评论主键
     * @return 结果
     */
    @Override
    public int deleteBlogSayCommentById(Long id)
    {
        return blogSayCommentMapper.deleteBlogSayCommentById(id);
    }
}
