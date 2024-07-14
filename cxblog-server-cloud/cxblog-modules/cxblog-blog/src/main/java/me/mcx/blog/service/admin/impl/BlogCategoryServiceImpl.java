package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogCategoryMapper;
import me.mcx.blog.domain.BlogCategory;
import me.mcx.blog.service.admin.IBlogCategoryService;

/**
 * 博客分类Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogCategoryServiceImpl implements IBlogCategoryService 
{
    @Autowired
    private BlogCategoryMapper blogCategoryMapper;

    /**
     * 查询博客分类
     * 
     * @param id 博客分类主键
     * @return 博客分类
     */
    @Override
    public BlogCategory selectBlogCategoryById(Long id)
    {
        return blogCategoryMapper.selectBlogCategoryById(id);
    }

    /**
     * 查询博客分类列表
     * 
     * @param blogCategory 博客分类
     * @return 博客分类
     */
    @Override
    public List<BlogCategory> selectBlogCategoryList(BlogCategory blogCategory)
    {
        return blogCategoryMapper.selectBlogCategoryList(blogCategory);
    }

    /**
     * 新增博客分类
     * 
     * @param blogCategory 博客分类
     * @return 结果
     */
    @Override
    public int insertBlogCategory(BlogCategory blogCategory)
    {
        blogCategory.setCreateTime(DateUtils.getNowDate());
        return blogCategoryMapper.insertBlogCategory(blogCategory);
    }

    /**
     * 修改博客分类
     * 
     * @param blogCategory 博客分类
     * @return 结果
     */
    @Override
    public int updateBlogCategory(BlogCategory blogCategory)
    {
        blogCategory.setUpdateTime(DateUtils.getNowDate());
        return blogCategoryMapper.updateBlogCategory(blogCategory);
    }

    /**
     * 批量删除博客分类
     * 
     * @param ids 需要删除的博客分类主键
     * @return 结果
     */
    @Override
    public int deleteBlogCategoryByIds(Long[] ids)
    {
        return blogCategoryMapper.deleteBlogCategoryByIds(ids);
    }

    /**
     * 删除博客分类信息
     * 
     * @param id 博客分类主键
     * @return 结果
     */
    @Override
    public int deleteBlogCategoryById(Long id)
    {
        return blogCategoryMapper.deleteBlogCategoryById(id);
    }
}
