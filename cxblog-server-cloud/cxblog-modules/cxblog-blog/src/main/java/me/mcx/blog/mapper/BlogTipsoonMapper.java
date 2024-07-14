package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogTipsoon;

/**
 * 简讯Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogTipsoonMapper 
{
    /**
     * 查询简讯
     * 
     * @param id 简讯主键
     * @return 简讯
     */
    public BlogTipsoon selectBlogTipsoonById(String id);

    /**
     * 查询简讯列表
     * 
     * @param blogTipsoon 简讯
     * @return 简讯集合
     */
    public List<BlogTipsoon> selectBlogTipsoonList(BlogTipsoon blogTipsoon);

    /**
     * 新增简讯
     * 
     * @param blogTipsoon 简讯
     * @return 结果
     */
    public int insertBlogTipsoon(BlogTipsoon blogTipsoon);

    /**
     * 修改简讯
     * 
     * @param blogTipsoon 简讯
     * @return 结果
     */
    public int updateBlogTipsoon(BlogTipsoon blogTipsoon);

    /**
     * 删除简讯
     * 
     * @param id 简讯主键
     * @return 结果
     */
    public int deleteBlogTipsoonById(String id);

    /**
     * 批量删除简讯
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogTipsoonByIds(String[] ids);
}
