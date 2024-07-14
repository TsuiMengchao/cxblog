package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogTagsMapper;
import me.mcx.blog.domain.BlogTags;
import me.mcx.blog.service.admin.IBlogTagsService;

/**
 * 博客标签Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogTagsServiceImpl implements IBlogTagsService 
{
    @Autowired
    private BlogTagsMapper blogTagsMapper;

    /**
     * 查询博客标签
     * 
     * @param id 博客标签主键
     * @return 博客标签
     */
    @Override
    public BlogTags selectBlogTagsById(Long id)
    {
        return blogTagsMapper.selectBlogTagsById(id);
    }

    /**
     * 查询博客标签列表
     * 
     * @param blogTags 博客标签
     * @return 博客标签
     */
    @Override
    public List<BlogTags> selectBlogTagsList(BlogTags blogTags)
    {
        return blogTagsMapper.selectBlogTagsList(blogTags);
    }

    /**
     * 新增博客标签
     * 
     * @param blogTags 博客标签
     * @return 结果
     */
    @Override
    public int insertBlogTags(BlogTags blogTags)
    {
        blogTags.setCreateTime(DateUtils.getNowDate());
        return blogTagsMapper.insertBlogTags(blogTags);
    }

    /**
     * 修改博客标签
     * 
     * @param blogTags 博客标签
     * @return 结果
     */
    @Override
    public int updateBlogTags(BlogTags blogTags)
    {
        blogTags.setUpdateTime(DateUtils.getNowDate());
        return blogTagsMapper.updateBlogTags(blogTags);
    }

    /**
     * 批量删除博客标签
     * 
     * @param ids 需要删除的博客标签主键
     * @return 结果
     */
    @Override
    public int deleteBlogTagsByIds(Long[] ids)
    {
        return blogTagsMapper.deleteBlogTagsByIds(ids);
    }

    /**
     * 删除博客标签信息
     * 
     * @param id 博客标签主键
     * @return 结果
     */
    @Override
    public int deleteBlogTagsById(Long id)
    {
        return blogTagsMapper.deleteBlogTagsById(id);
    }
}
