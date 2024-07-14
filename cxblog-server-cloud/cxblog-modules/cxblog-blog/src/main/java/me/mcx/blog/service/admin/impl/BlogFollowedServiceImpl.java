package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogFollowedMapper;
import me.mcx.blog.domain.BlogFollowed;
import me.mcx.blog.service.admin.IBlogFollowedService;

/**
 * 用户关注Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogFollowedServiceImpl implements IBlogFollowedService 
{
    @Autowired
    private BlogFollowedMapper blogFollowedMapper;

    /**
     * 查询用户关注
     * 
     * @param id 用户关注主键
     * @return 用户关注
     */
    @Override
    public BlogFollowed selectBlogFollowedById(Long id)
    {
        return blogFollowedMapper.selectBlogFollowedById(id);
    }

    /**
     * 查询用户关注列表
     * 
     * @param blogFollowed 用户关注
     * @return 用户关注
     */
    @Override
    public List<BlogFollowed> selectBlogFollowedList(BlogFollowed blogFollowed)
    {
        return blogFollowedMapper.selectBlogFollowedList(blogFollowed);
    }

    /**
     * 新增用户关注
     * 
     * @param blogFollowed 用户关注
     * @return 结果
     */
    @Override
    public int insertBlogFollowed(BlogFollowed blogFollowed)
    {
        blogFollowed.setCreateTime(DateUtils.getNowDate());
        return blogFollowedMapper.insertBlogFollowed(blogFollowed);
    }

    /**
     * 修改用户关注
     * 
     * @param blogFollowed 用户关注
     * @return 结果
     */
    @Override
    public int updateBlogFollowed(BlogFollowed blogFollowed)
    {
        blogFollowed.setUpdateTime(DateUtils.getNowDate());
        return blogFollowedMapper.updateBlogFollowed(blogFollowed);
    }

    /**
     * 批量删除用户关注
     * 
     * @param ids 需要删除的用户关注主键
     * @return 结果
     */
    @Override
    public int deleteBlogFollowedByIds(Long[] ids)
    {
        return blogFollowedMapper.deleteBlogFollowedByIds(ids);
    }

    /**
     * 删除用户关注信息
     * 
     * @param id 用户关注主键
     * @return 结果
     */
    @Override
    public int deleteBlogFollowedById(Long id)
    {
        return blogFollowedMapper.deleteBlogFollowedById(id);
    }
}
