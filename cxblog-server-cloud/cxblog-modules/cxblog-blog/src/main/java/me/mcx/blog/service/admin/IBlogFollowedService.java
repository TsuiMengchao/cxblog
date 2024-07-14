package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogFollowed;

/**
 * 用户关注Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogFollowedService 
{
    /**
     * 查询用户关注
     * 
     * @param id 用户关注主键
     * @return 用户关注
     */
    public BlogFollowed selectBlogFollowedById(Long id);

    /**
     * 查询用户关注列表
     * 
     * @param blogFollowed 用户关注
     * @return 用户关注集合
     */
    public List<BlogFollowed> selectBlogFollowedList(BlogFollowed blogFollowed);

    /**
     * 新增用户关注
     * 
     * @param blogFollowed 用户关注
     * @return 结果
     */
    public int insertBlogFollowed(BlogFollowed blogFollowed);

    /**
     * 修改用户关注
     * 
     * @param blogFollowed 用户关注
     * @return 结果
     */
    public int updateBlogFollowed(BlogFollowed blogFollowed);

    /**
     * 批量删除用户关注
     * 
     * @param ids 需要删除的用户关注主键集合
     * @return 结果
     */
    public int deleteBlogFollowedByIds(Long[] ids);

    /**
     * 删除用户关注信息
     * 
     * @param id 用户关注主键
     * @return 结果
     */
    public int deleteBlogFollowedById(Long id);
}
