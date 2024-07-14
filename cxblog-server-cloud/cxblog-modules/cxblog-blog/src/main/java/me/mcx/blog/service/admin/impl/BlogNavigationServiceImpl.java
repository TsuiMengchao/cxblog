package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogNavigationMapper;
import me.mcx.blog.domain.BlogNavigation;
import me.mcx.blog.service.admin.IBlogNavigationService;

/**
 * 网站导航Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogNavigationServiceImpl implements IBlogNavigationService 
{
    @Autowired
    private BlogNavigationMapper blogNavigationMapper;

    /**
     * 查询网站导航
     * 
     * @param id 网站导航主键
     * @return 网站导航
     */
    @Override
    public BlogNavigation selectBlogNavigationById(Long id)
    {
        return blogNavigationMapper.selectBlogNavigationById(id);
    }

    /**
     * 查询网站导航列表
     * 
     * @param blogNavigation 网站导航
     * @return 网站导航
     */
    @Override
    public List<BlogNavigation> selectBlogNavigationList(BlogNavigation blogNavigation)
    {
        return blogNavigationMapper.selectBlogNavigationList(blogNavigation);
    }

    /**
     * 新增网站导航
     * 
     * @param blogNavigation 网站导航
     * @return 结果
     */
    @Override
    public int insertBlogNavigation(BlogNavigation blogNavigation)
    {
        blogNavigation.setCreateTime(DateUtils.getNowDate());
        return blogNavigationMapper.insertBlogNavigation(blogNavigation);
    }

    /**
     * 修改网站导航
     * 
     * @param blogNavigation 网站导航
     * @return 结果
     */
    @Override
    public int updateBlogNavigation(BlogNavigation blogNavigation)
    {
        blogNavigation.setUpdateTime(DateUtils.getNowDate());
        return blogNavigationMapper.updateBlogNavigation(blogNavigation);
    }

    /**
     * 批量删除网站导航
     * 
     * @param ids 需要删除的网站导航主键
     * @return 结果
     */
    @Override
    public int deleteBlogNavigationByIds(Long[] ids)
    {
        return blogNavigationMapper.deleteBlogNavigationByIds(ids);
    }

    /**
     * 删除网站导航信息
     * 
     * @param id 网站导航主键
     * @return 结果
     */
    @Override
    public int deleteBlogNavigationById(Long id)
    {
        return blogNavigationMapper.deleteBlogNavigationById(id);
    }
}
