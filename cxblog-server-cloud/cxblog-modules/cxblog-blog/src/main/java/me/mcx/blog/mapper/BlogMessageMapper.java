package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogMessage;

/**
 * 留言Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogMessageMapper 
{
    /**
     * 查询留言
     * 
     * @param id 留言主键
     * @return 留言
     */
    public BlogMessage selectBlogMessageById(Long id);

    /**
     * 查询留言列表
     * 
     * @param blogMessage 留言
     * @return 留言集合
     */
    public List<BlogMessage> selectBlogMessageList(BlogMessage blogMessage);

    /**
     * 新增留言
     * 
     * @param blogMessage 留言
     * @return 结果
     */
    public int insertBlogMessage(BlogMessage blogMessage);

    /**
     * 修改留言
     * 
     * @param blogMessage 留言
     * @return 结果
     */
    public int updateBlogMessage(BlogMessage blogMessage);

    /**
     * 删除留言
     * 
     * @param id 留言主键
     * @return 结果
     */
    public int deleteBlogMessageById(Long id);

    /**
     * 批量删除留言
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogMessageByIds(Long[] ids);
}
