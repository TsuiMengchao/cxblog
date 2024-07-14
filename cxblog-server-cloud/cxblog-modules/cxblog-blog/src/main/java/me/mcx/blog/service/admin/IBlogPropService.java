package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogProp;

/**
 * 道具Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogPropService 
{
    /**
     * 查询道具
     * 
     * @param id 道具主键
     * @return 道具
     */
    public BlogProp selectBlogPropById(Long id);

    /**
     * 查询道具列表
     * 
     * @param blogProp 道具
     * @return 道具集合
     */
    public List<BlogProp> selectBlogPropList(BlogProp blogProp);

    /**
     * 新增道具
     * 
     * @param blogProp 道具
     * @return 结果
     */
    public int insertBlogProp(BlogProp blogProp);

    /**
     * 修改道具
     * 
     * @param blogProp 道具
     * @return 结果
     */
    public int updateBlogProp(BlogProp blogProp);

    /**
     * 批量删除道具
     * 
     * @param ids 需要删除的道具主键集合
     * @return 结果
     */
    public int deleteBlogPropByIds(Long[] ids);

    /**
     * 删除道具信息
     * 
     * @param id 道具主键
     * @return 结果
     */
    public int deleteBlogPropById(Long id);
}
