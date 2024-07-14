package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogTipsoonMapper;
import me.mcx.blog.domain.BlogTipsoon;
import me.mcx.blog.service.admin.IBlogTipsoonService;

/**
 * 简讯Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogTipsoonServiceImpl implements IBlogTipsoonService 
{
    @Autowired
    private BlogTipsoonMapper blogTipsoonMapper;

    /**
     * 查询简讯
     * 
     * @param id 简讯主键
     * @return 简讯
     */
    @Override
    public BlogTipsoon selectBlogTipsoonById(String id)
    {
        return blogTipsoonMapper.selectBlogTipsoonById(id);
    }

    /**
     * 查询简讯列表
     * 
     * @param blogTipsoon 简讯
     * @return 简讯
     */
    @Override
    public List<BlogTipsoon> selectBlogTipsoonList(BlogTipsoon blogTipsoon)
    {
        return blogTipsoonMapper.selectBlogTipsoonList(blogTipsoon);
    }

    /**
     * 新增简讯
     * 
     * @param blogTipsoon 简讯
     * @return 结果
     */
    @Override
    public int insertBlogTipsoon(BlogTipsoon blogTipsoon)
    {
        blogTipsoon.setCreateTime(DateUtils.getNowDate());
        return blogTipsoonMapper.insertBlogTipsoon(blogTipsoon);
    }

    /**
     * 修改简讯
     * 
     * @param blogTipsoon 简讯
     * @return 结果
     */
    @Override
    public int updateBlogTipsoon(BlogTipsoon blogTipsoon)
    {
        blogTipsoon.setUpdateTime(DateUtils.getNowDate());
        return blogTipsoonMapper.updateBlogTipsoon(blogTipsoon);
    }

    /**
     * 批量删除简讯
     * 
     * @param ids 需要删除的简讯主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonByIds(String[] ids)
    {
        return blogTipsoonMapper.deleteBlogTipsoonByIds(ids);
    }

    /**
     * 删除简讯信息
     * 
     * @param id 简讯主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonById(String id)
    {
        return blogTipsoonMapper.deleteBlogTipsoonById(id);
    }
}
