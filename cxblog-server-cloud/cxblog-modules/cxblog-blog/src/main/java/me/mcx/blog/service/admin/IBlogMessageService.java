package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogMessage;

/**
 * 留言Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogMessageService 
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
     * 批量删除留言
     * 
     * @param ids 需要删除的留言主键集合
     * @return 结果
     */
    public int deleteBlogMessageByIds(Long[] ids);

    /**
     * 删除留言信息
     * 
     * @param id 留言主键
     * @return 结果
     */
    public int deleteBlogMessageById(Long id);
}
