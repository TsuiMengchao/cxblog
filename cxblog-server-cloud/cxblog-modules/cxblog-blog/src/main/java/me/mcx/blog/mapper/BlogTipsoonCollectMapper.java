package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogTipsoonCollect;

/**
 * 简讯收藏Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogTipsoonCollectMapper 
{
    /**
     * 查询简讯收藏
     * 
     * @param id 简讯收藏主键
     * @return 简讯收藏
     */
    public BlogTipsoonCollect selectBlogTipsoonCollectById(Long id);

    /**
     * 查询简讯收藏列表
     * 
     * @param blogTipsoonCollect 简讯收藏
     * @return 简讯收藏集合
     */
    public List<BlogTipsoonCollect> selectBlogTipsoonCollectList(BlogTipsoonCollect blogTipsoonCollect);

    /**
     * 新增简讯收藏
     * 
     * @param blogTipsoonCollect 简讯收藏
     * @return 结果
     */
    public int insertBlogTipsoonCollect(BlogTipsoonCollect blogTipsoonCollect);

    /**
     * 修改简讯收藏
     * 
     * @param blogTipsoonCollect 简讯收藏
     * @return 结果
     */
    public int updateBlogTipsoonCollect(BlogTipsoonCollect blogTipsoonCollect);

    /**
     * 删除简讯收藏
     * 
     * @param id 简讯收藏主键
     * @return 结果
     */
    public int deleteBlogTipsoonCollectById(Long id);

    /**
     * 批量删除简讯收藏
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogTipsoonCollectByIds(Long[] ids);
}
