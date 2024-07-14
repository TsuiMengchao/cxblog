package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogImMessageMapper;
import me.mcx.blog.domain.BlogImMessage;
import me.mcx.blog.service.admin.IBlogImMessageService;

/**
 * 即时消息Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogImMessageServiceImpl implements IBlogImMessageService 
{
    @Autowired
    private BlogImMessageMapper blogImMessageMapper;

    /**
     * 查询即时消息
     * 
     * @param id 即时消息主键
     * @return 即时消息
     */
    @Override
    public BlogImMessage selectBlogImMessageById(String id)
    {
        return blogImMessageMapper.selectBlogImMessageById(id);
    }

    /**
     * 查询即时消息列表
     * 
     * @param blogImMessage 即时消息
     * @return 即时消息
     */
    @Override
    public List<BlogImMessage> selectBlogImMessageList(BlogImMessage blogImMessage)
    {
        return blogImMessageMapper.selectBlogImMessageList(blogImMessage);
    }

    /**
     * 新增即时消息
     * 
     * @param blogImMessage 即时消息
     * @return 结果
     */
    @Override
    public int insertBlogImMessage(BlogImMessage blogImMessage)
    {
        blogImMessage.setCreateTime(DateUtils.getNowDate());
        return blogImMessageMapper.insertBlogImMessage(blogImMessage);
    }

    /**
     * 修改即时消息
     * 
     * @param blogImMessage 即时消息
     * @return 结果
     */
    @Override
    public int updateBlogImMessage(BlogImMessage blogImMessage)
    {
        blogImMessage.setUpdateTime(DateUtils.getNowDate());
        return blogImMessageMapper.updateBlogImMessage(blogImMessage);
    }

    /**
     * 批量删除即时消息
     * 
     * @param ids 需要删除的即时消息主键
     * @return 结果
     */
    @Override
    public int deleteBlogImMessageByIds(String[] ids)
    {
        return blogImMessageMapper.deleteBlogImMessageByIds(ids);
    }

    /**
     * 删除即时消息信息
     * 
     * @param id 即时消息主键
     * @return 结果
     */
    @Override
    public int deleteBlogImMessageById(String id)
    {
        return blogImMessageMapper.deleteBlogImMessageById(id);
    }
}
