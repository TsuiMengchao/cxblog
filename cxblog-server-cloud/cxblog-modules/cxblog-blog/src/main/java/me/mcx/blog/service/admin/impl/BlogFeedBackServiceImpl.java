package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogFeedBackMapper;
import me.mcx.blog.domain.BlogFeedBack;
import me.mcx.blog.service.admin.IBlogFeedBackService;

/**
 * 问题反馈Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogFeedBackServiceImpl implements IBlogFeedBackService 
{
    @Autowired
    private BlogFeedBackMapper blogFeedBackMapper;

    /**
     * 查询问题反馈
     * 
     * @param id 问题反馈主键
     * @return 问题反馈
     */
    @Override
    public BlogFeedBack selectBlogFeedBackById(Long id)
    {
        return blogFeedBackMapper.selectBlogFeedBackById(id);
    }

    /**
     * 查询问题反馈列表
     * 
     * @param blogFeedBack 问题反馈
     * @return 问题反馈
     */
    @Override
    public List<BlogFeedBack> selectBlogFeedBackList(BlogFeedBack blogFeedBack)
    {
        return blogFeedBackMapper.selectBlogFeedBackList(blogFeedBack);
    }

    /**
     * 新增问题反馈
     * 
     * @param blogFeedBack 问题反馈
     * @return 结果
     */
    @Override
    public int insertBlogFeedBack(BlogFeedBack blogFeedBack)
    {
        blogFeedBack.setCreateTime(DateUtils.getNowDate());
        return blogFeedBackMapper.insertBlogFeedBack(blogFeedBack);
    }

    /**
     * 修改问题反馈
     * 
     * @param blogFeedBack 问题反馈
     * @return 结果
     */
    @Override
    public int updateBlogFeedBack(BlogFeedBack blogFeedBack)
    {
        blogFeedBack.setUpdateTime(DateUtils.getNowDate());
        return blogFeedBackMapper.updateBlogFeedBack(blogFeedBack);
    }

    /**
     * 批量删除问题反馈
     * 
     * @param ids 需要删除的问题反馈主键
     * @return 结果
     */
    @Override
    public int deleteBlogFeedBackByIds(Long[] ids)
    {
        return blogFeedBackMapper.deleteBlogFeedBackByIds(ids);
    }

    /**
     * 删除问题反馈信息
     * 
     * @param id 问题反馈主键
     * @return 结果
     */
    @Override
    public int deleteBlogFeedBackById(Long id)
    {
        return blogFeedBackMapper.deleteBlogFeedBackById(id);
    }
}
