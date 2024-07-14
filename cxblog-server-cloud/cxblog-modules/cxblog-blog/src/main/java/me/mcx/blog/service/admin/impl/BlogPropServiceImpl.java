package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogPropMapper;
import me.mcx.blog.domain.BlogProp;
import me.mcx.blog.service.admin.IBlogPropService;

/**
 * 道具Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogPropServiceImpl implements IBlogPropService 
{
    @Autowired
    private BlogPropMapper blogPropMapper;

    /**
     * 查询道具
     * 
     * @param id 道具主键
     * @return 道具
     */
    @Override
    public BlogProp selectBlogPropById(Long id)
    {
        return blogPropMapper.selectBlogPropById(id);
    }

    /**
     * 查询道具列表
     * 
     * @param blogProp 道具
     * @return 道具
     */
    @Override
    public List<BlogProp> selectBlogPropList(BlogProp blogProp)
    {
        return blogPropMapper.selectBlogPropList(blogProp);
    }

    /**
     * 新增道具
     * 
     * @param blogProp 道具
     * @return 结果
     */
    @Override
    public int insertBlogProp(BlogProp blogProp)
    {
        blogProp.setCreateTime(DateUtils.getNowDate());
        return blogPropMapper.insertBlogProp(blogProp);
    }

    /**
     * 修改道具
     * 
     * @param blogProp 道具
     * @return 结果
     */
    @Override
    public int updateBlogProp(BlogProp blogProp)
    {
        blogProp.setUpdateTime(DateUtils.getNowDate());
        return blogPropMapper.updateBlogProp(blogProp);
    }

    /**
     * 批量删除道具
     * 
     * @param ids 需要删除的道具主键
     * @return 结果
     */
    @Override
    public int deleteBlogPropByIds(Long[] ids)
    {
        return blogPropMapper.deleteBlogPropByIds(ids);
    }

    /**
     * 删除道具信息
     * 
     * @param id 道具主键
     * @return 结果
     */
    @Override
    public int deleteBlogPropById(Long id)
    {
        return blogPropMapper.deleteBlogPropById(id);
    }
}
