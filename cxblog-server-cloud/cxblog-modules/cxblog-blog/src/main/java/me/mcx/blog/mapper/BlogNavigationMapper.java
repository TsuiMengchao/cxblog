package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogNavigation;

/**
 * 网站导航Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogNavigationMapper 
{
    /**
     * 查询网站导航
     * 
     * @param id 网站导航主键
     * @return 网站导航
     */
    public BlogNavigation selectBlogNavigationById(Long id);

    /**
     * 查询网站导航列表
     * 
     * @param blogNavigation 网站导航
     * @return 网站导航集合
     */
    public List<BlogNavigation> selectBlogNavigationList(BlogNavigation blogNavigation);

    /**
     * 新增网站导航
     * 
     * @param blogNavigation 网站导航
     * @return 结果
     */
    public int insertBlogNavigation(BlogNavigation blogNavigation);

    /**
     * 修改网站导航
     * 
     * @param blogNavigation 网站导航
     * @return 结果
     */
    public int updateBlogNavigation(BlogNavigation blogNavigation);

    /**
     * 删除网站导航
     * 
     * @param id 网站导航主键
     * @return 结果
     */
    public int deleteBlogNavigationById(Long id);

    /**
     * 批量删除网站导航
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogNavigationByIds(Long[] ids);
}
