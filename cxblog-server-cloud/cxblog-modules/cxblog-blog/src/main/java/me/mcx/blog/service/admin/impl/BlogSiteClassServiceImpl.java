package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogSiteClassMapper;
import me.mcx.blog.domain.BlogSiteClass;
import me.mcx.blog.service.admin.IBlogSiteClassService;

/**
 * 网址分类Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogSiteClassServiceImpl implements IBlogSiteClassService 
{
    @Autowired
    private BlogSiteClassMapper blogSiteClassMapper;

    /**
     * 查询网址分类
     * 
     * @param id 网址分类主键
     * @return 网址分类
     */
    @Override
    public BlogSiteClass selectBlogSiteClassById(Long id)
    {
        return blogSiteClassMapper.selectBlogSiteClassById(id);
    }

    /**
     * 查询网址分类列表
     * 
     * @param blogSiteClass 网址分类
     * @return 网址分类
     */
    @Override
    public List<BlogSiteClass> selectBlogSiteClassList(BlogSiteClass blogSiteClass)
    {
        return blogSiteClassMapper.selectBlogSiteClassList(blogSiteClass);
    }

    /**
     * 新增网址分类
     * 
     * @param blogSiteClass 网址分类
     * @return 结果
     */
    @Override
    public int insertBlogSiteClass(BlogSiteClass blogSiteClass)
    {
        blogSiteClass.setCreateTime(DateUtils.getNowDate());
        return blogSiteClassMapper.insertBlogSiteClass(blogSiteClass);
    }

    /**
     * 修改网址分类
     * 
     * @param blogSiteClass 网址分类
     * @return 结果
     */
    @Override
    public int updateBlogSiteClass(BlogSiteClass blogSiteClass)
    {
        blogSiteClass.setUpdateTime(DateUtils.getNowDate());
        return blogSiteClassMapper.updateBlogSiteClass(blogSiteClass);
    }

    /**
     * 批量删除网址分类
     * 
     * @param ids 需要删除的网址分类主键
     * @return 结果
     */
    @Override
    public int deleteBlogSiteClassByIds(Long[] ids)
    {
        return blogSiteClassMapper.deleteBlogSiteClassByIds(ids);
    }

    /**
     * 删除网址分类信息
     * 
     * @param id 网址分类主键
     * @return 结果
     */
    @Override
    public int deleteBlogSiteClassById(Long id)
    {
        return blogSiteClassMapper.deleteBlogSiteClassById(id);
    }
}
