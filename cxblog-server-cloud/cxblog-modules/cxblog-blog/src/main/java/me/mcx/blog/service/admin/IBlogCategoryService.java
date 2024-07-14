package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogCategory;

/**
 * 博客分类Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogCategoryService 
{
    /**
     * 查询博客分类
     * 
     * @param id 博客分类主键
     * @return 博客分类
     */
    public BlogCategory selectBlogCategoryById(Long id);

    /**
     * 查询博客分类列表
     * 
     * @param blogCategory 博客分类
     * @return 博客分类集合
     */
    public List<BlogCategory> selectBlogCategoryList(BlogCategory blogCategory);

    /**
     * 新增博客分类
     * 
     * @param blogCategory 博客分类
     * @return 结果
     */
    public int insertBlogCategory(BlogCategory blogCategory);

    /**
     * 修改博客分类
     * 
     * @param blogCategory 博客分类
     * @return 结果
     */
    public int updateBlogCategory(BlogCategory blogCategory);

    /**
     * 批量删除博客分类
     * 
     * @param ids 需要删除的博客分类主键集合
     * @return 结果
     */
    public int deleteBlogCategoryByIds(Long[] ids);

    /**
     * 删除博客分类信息
     * 
     * @param id 博客分类主键
     * @return 结果
     */
    public int deleteBlogCategoryById(Long id);
}
