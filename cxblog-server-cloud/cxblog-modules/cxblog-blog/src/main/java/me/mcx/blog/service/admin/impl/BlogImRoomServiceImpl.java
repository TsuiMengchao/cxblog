package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogImRoomMapper;
import me.mcx.blog.domain.BlogImRoom;
import me.mcx.blog.service.admin.IBlogImRoomService;

/**
 * 用户消息房间Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogImRoomServiceImpl implements IBlogImRoomService 
{
    @Autowired
    private BlogImRoomMapper blogImRoomMapper;

    /**
     * 查询用户消息房间
     * 
     * @param id 用户消息房间主键
     * @return 用户消息房间
     */
    @Override
    public BlogImRoom selectBlogImRoomById(String id)
    {
        return blogImRoomMapper.selectBlogImRoomById(id);
    }

    /**
     * 查询用户消息房间列表
     * 
     * @param blogImRoom 用户消息房间
     * @return 用户消息房间
     */
    @Override
    public List<BlogImRoom> selectBlogImRoomList(BlogImRoom blogImRoom)
    {
        return blogImRoomMapper.selectBlogImRoomList(blogImRoom);
    }

    /**
     * 新增用户消息房间
     * 
     * @param blogImRoom 用户消息房间
     * @return 结果
     */
    @Override
    public int insertBlogImRoom(BlogImRoom blogImRoom)
    {
        blogImRoom.setCreateTime(DateUtils.getNowDate());
        return blogImRoomMapper.insertBlogImRoom(blogImRoom);
    }

    /**
     * 修改用户消息房间
     * 
     * @param blogImRoom 用户消息房间
     * @return 结果
     */
    @Override
    public int updateBlogImRoom(BlogImRoom blogImRoom)
    {
        blogImRoom.setUpdateTime(DateUtils.getNowDate());
        return blogImRoomMapper.updateBlogImRoom(blogImRoom);
    }

    /**
     * 批量删除用户消息房间
     * 
     * @param ids 需要删除的用户消息房间主键
     * @return 结果
     */
    @Override
    public int deleteBlogImRoomByIds(String[] ids)
    {
        return blogImRoomMapper.deleteBlogImRoomByIds(ids);
    }

    /**
     * 删除用户消息房间信息
     * 
     * @param id 用户消息房间主键
     * @return 结果
     */
    @Override
    public int deleteBlogImRoomById(String id)
    {
        return blogImRoomMapper.deleteBlogImRoomById(id);
    }
}
