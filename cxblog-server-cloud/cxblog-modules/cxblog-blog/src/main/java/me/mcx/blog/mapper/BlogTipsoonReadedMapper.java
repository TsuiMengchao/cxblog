package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogTipsoonReaded;

/**
 * 简讯已读Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogTipsoonReadedMapper 
{
    /**
     * 查询简讯已读
     * 
     * @param id 简讯已读主键
     * @return 简讯已读
     */
    public BlogTipsoonReaded selectBlogTipsoonReadedById(Long id);

    /**
     * 查询简讯已读列表
     * 
     * @param blogTipsoonReaded 简讯已读
     * @return 简讯已读集合
     */
    public List<BlogTipsoonReaded> selectBlogTipsoonReadedList(BlogTipsoonReaded blogTipsoonReaded);

    /**
     * 新增简讯已读
     * 
     * @param blogTipsoonReaded 简讯已读
     * @return 结果
     */
    public int insertBlogTipsoonReaded(BlogTipsoonReaded blogTipsoonReaded);

    /**
     * 修改简讯已读
     * 
     * @param blogTipsoonReaded 简讯已读
     * @return 结果
     */
    public int updateBlogTipsoonReaded(BlogTipsoonReaded blogTipsoonReaded);

    /**
     * 删除简讯已读
     * 
     * @param id 简讯已读主键
     * @return 结果
     */
    public int deleteBlogTipsoonReadedById(Long id);

    /**
     * 批量删除简讯已读
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogTipsoonReadedByIds(Long[] ids);
}
