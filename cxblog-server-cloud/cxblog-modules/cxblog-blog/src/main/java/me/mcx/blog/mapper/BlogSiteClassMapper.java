package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogSiteClass;

/**
 * 网址分类Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogSiteClassMapper 
{
    /**
     * 查询网址分类
     * 
     * @param id 网址分类主键
     * @return 网址分类
     */
    public BlogSiteClass selectBlogSiteClassById(Long id);

    /**
     * 查询网址分类列表
     * 
     * @param blogSiteClass 网址分类
     * @return 网址分类集合
     */
    public List<BlogSiteClass> selectBlogSiteClassList(BlogSiteClass blogSiteClass);

    /**
     * 新增网址分类
     * 
     * @param blogSiteClass 网址分类
     * @return 结果
     */
    public int insertBlogSiteClass(BlogSiteClass blogSiteClass);

    /**
     * 修改网址分类
     * 
     * @param blogSiteClass 网址分类
     * @return 结果
     */
    public int updateBlogSiteClass(BlogSiteClass blogSiteClass);

    /**
     * 删除网址分类
     * 
     * @param id 网址分类主键
     * @return 结果
     */
    public int deleteBlogSiteClassById(Long id);

    /**
     * 批量删除网址分类
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogSiteClassByIds(Long[] ids);
}
