package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogTipsoonLikeMapper;
import me.mcx.blog.domain.BlogTipsoonLike;
import me.mcx.blog.service.admin.IBlogTipsoonLikeService;

/**
 * 简讯点赞Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogTipsoonLikeServiceImpl implements IBlogTipsoonLikeService 
{
    @Autowired
    private BlogTipsoonLikeMapper blogTipsoonLikeMapper;

    /**
     * 查询简讯点赞
     * 
     * @param id 简讯点赞主键
     * @return 简讯点赞
     */
    @Override
    public BlogTipsoonLike selectBlogTipsoonLikeById(Long id)
    {
        return blogTipsoonLikeMapper.selectBlogTipsoonLikeById(id);
    }

    /**
     * 查询简讯点赞列表
     * 
     * @param blogTipsoonLike 简讯点赞
     * @return 简讯点赞
     */
    @Override
    public List<BlogTipsoonLike> selectBlogTipsoonLikeList(BlogTipsoonLike blogTipsoonLike)
    {
        return blogTipsoonLikeMapper.selectBlogTipsoonLikeList(blogTipsoonLike);
    }

    /**
     * 新增简讯点赞
     * 
     * @param blogTipsoonLike 简讯点赞
     * @return 结果
     */
    @Override
    public int insertBlogTipsoonLike(BlogTipsoonLike blogTipsoonLike)
    {
        blogTipsoonLike.setCreateTime(DateUtils.getNowDate());
        return blogTipsoonLikeMapper.insertBlogTipsoonLike(blogTipsoonLike);
    }

    /**
     * 修改简讯点赞
     * 
     * @param blogTipsoonLike 简讯点赞
     * @return 结果
     */
    @Override
    public int updateBlogTipsoonLike(BlogTipsoonLike blogTipsoonLike)
    {
        blogTipsoonLike.setUpdateTime(DateUtils.getNowDate());
        return blogTipsoonLikeMapper.updateBlogTipsoonLike(blogTipsoonLike);
    }

    /**
     * 批量删除简讯点赞
     * 
     * @param ids 需要删除的简讯点赞主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonLikeByIds(Long[] ids)
    {
        return blogTipsoonLikeMapper.deleteBlogTipsoonLikeByIds(ids);
    }

    /**
     * 删除简讯点赞信息
     * 
     * @param id 简讯点赞主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonLikeById(Long id)
    {
        return blogTipsoonLikeMapper.deleteBlogTipsoonLikeById(id);
    }
}
