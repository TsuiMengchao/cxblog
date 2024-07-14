package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogMessageMapper;
import me.mcx.blog.domain.BlogMessage;
import me.mcx.blog.service.admin.IBlogMessageService;

/**
 * 留言Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogMessageServiceImpl implements IBlogMessageService 
{
    @Autowired
    private BlogMessageMapper blogMessageMapper;

    /**
     * 查询留言
     * 
     * @param id 留言主键
     * @return 留言
     */
    @Override
    public BlogMessage selectBlogMessageById(Long id)
    {
        return blogMessageMapper.selectBlogMessageById(id);
    }

    /**
     * 查询留言列表
     * 
     * @param blogMessage 留言
     * @return 留言
     */
    @Override
    public List<BlogMessage> selectBlogMessageList(BlogMessage blogMessage)
    {
        return blogMessageMapper.selectBlogMessageList(blogMessage);
    }

    /**
     * 新增留言
     * 
     * @param blogMessage 留言
     * @return 结果
     */
    @Override
    public int insertBlogMessage(BlogMessage blogMessage)
    {
        blogMessage.setCreateTime(DateUtils.getNowDate());
        return blogMessageMapper.insertBlogMessage(blogMessage);
    }

    /**
     * 修改留言
     * 
     * @param blogMessage 留言
     * @return 结果
     */
    @Override
    public int updateBlogMessage(BlogMessage blogMessage)
    {
        blogMessage.setUpdateTime(DateUtils.getNowDate());
        return blogMessageMapper.updateBlogMessage(blogMessage);
    }

    /**
     * 批量删除留言
     * 
     * @param ids 需要删除的留言主键
     * @return 结果
     */
    @Override
    public int deleteBlogMessageByIds(Long[] ids)
    {
        return blogMessageMapper.deleteBlogMessageByIds(ids);
    }

    /**
     * 删除留言信息
     * 
     * @param id 留言主键
     * @return 结果
     */
    @Override
    public int deleteBlogMessageById(Long id)
    {
        return blogMessageMapper.deleteBlogMessageById(id);
    }
}
