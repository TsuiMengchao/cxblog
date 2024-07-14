package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogTipsoonReadedMapper;
import me.mcx.blog.domain.BlogTipsoonReaded;
import me.mcx.blog.service.admin.IBlogTipsoonReadedService;

/**
 * 简讯已读Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogTipsoonReadedServiceImpl implements IBlogTipsoonReadedService 
{
    @Autowired
    private BlogTipsoonReadedMapper blogTipsoonReadedMapper;

    /**
     * 查询简讯已读
     * 
     * @param id 简讯已读主键
     * @return 简讯已读
     */
    @Override
    public BlogTipsoonReaded selectBlogTipsoonReadedById(Long id)
    {
        return blogTipsoonReadedMapper.selectBlogTipsoonReadedById(id);
    }

    /**
     * 查询简讯已读列表
     * 
     * @param blogTipsoonReaded 简讯已读
     * @return 简讯已读
     */
    @Override
    public List<BlogTipsoonReaded> selectBlogTipsoonReadedList(BlogTipsoonReaded blogTipsoonReaded)
    {
        return blogTipsoonReadedMapper.selectBlogTipsoonReadedList(blogTipsoonReaded);
    }

    /**
     * 新增简讯已读
     * 
     * @param blogTipsoonReaded 简讯已读
     * @return 结果
     */
    @Override
    public int insertBlogTipsoonReaded(BlogTipsoonReaded blogTipsoonReaded)
    {
        blogTipsoonReaded.setCreateTime(DateUtils.getNowDate());
        return blogTipsoonReadedMapper.insertBlogTipsoonReaded(blogTipsoonReaded);
    }

    /**
     * 修改简讯已读
     * 
     * @param blogTipsoonReaded 简讯已读
     * @return 结果
     */
    @Override
    public int updateBlogTipsoonReaded(BlogTipsoonReaded blogTipsoonReaded)
    {
        blogTipsoonReaded.setUpdateTime(DateUtils.getNowDate());
        return blogTipsoonReadedMapper.updateBlogTipsoonReaded(blogTipsoonReaded);
    }

    /**
     * 批量删除简讯已读
     * 
     * @param ids 需要删除的简讯已读主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonReadedByIds(Long[] ids)
    {
        return blogTipsoonReadedMapper.deleteBlogTipsoonReadedByIds(ids);
    }

    /**
     * 删除简讯已读信息
     * 
     * @param id 简讯已读主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonReadedById(Long id)
    {
        return blogTipsoonReadedMapper.deleteBlogTipsoonReadedById(id);
    }
}
