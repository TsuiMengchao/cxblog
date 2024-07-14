package me.mcx.blog.mapper;

import java.util.List;

import me.mcx.blog.domain.BlogArticleCollect;
import me.mcx.blog.domain.BlogImRoom;

/**
 * 用户消息房间Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogImRoomMapper 
{
    /**
     * 查询用户消息房间
     * 
     * @param id 用户消息房间主键
     * @return 用户消息房间
     */
    public BlogImRoom selectBlogImRoomById(String id);

    /**
     * 查询用户消息房间列表
     * 
     * @param blogImRoom 用户消息房间
     * @return 用户消息房间集合
     */
    public List<BlogImRoom> selectBlogImRoomList(BlogImRoom blogImRoom);

    /**
     * 新增用户消息房间
     * 
     * @param blogImRoom 用户消息房间
     * @return 结果
     */
    public int insertBlogImRoom(BlogImRoom blogImRoom);

    /**
     * 修改用户消息房间
     * 
     * @param blogImRoom 用户消息房间
     * @return 结果
     */
    public int updateBlogImRoom(BlogImRoom blogImRoom);

    /**
     * 删除用户消息房间
     * 
     * @param id 用户消息房间主键
     * @return 结果
     */
    public int deleteBlogImRoomById(String id);

    /**
     * 批量删除用户消息房间
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogImRoomByIds(String[] ids);
}
