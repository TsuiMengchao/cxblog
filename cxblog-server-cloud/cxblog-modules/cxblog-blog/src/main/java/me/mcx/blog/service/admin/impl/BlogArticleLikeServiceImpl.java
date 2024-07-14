package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogArticleLikeMapper;
import me.mcx.blog.domain.BlogArticleLike;
import me.mcx.blog.service.admin.IBlogArticleLikeService;

/**
 * 文章收藏Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogArticleLikeServiceImpl implements IBlogArticleLikeService 
{
    @Autowired
    private BlogArticleLikeMapper blogArticleLikeMapper;

    /**
     * 查询文章收藏
     * 
     * @param id 文章收藏主键
     * @return 文章收藏
     */
    @Override
    public BlogArticleLike selectBlogArticleLikeById(Long id)
    {
        return blogArticleLikeMapper.selectBlogArticleLikeById(id);
    }

    /**
     * 查询文章收藏列表
     * 
     * @param blogArticleLike 文章收藏
     * @return 文章收藏
     */
    @Override
    public List<BlogArticleLike> selectBlogArticleLikeList(BlogArticleLike blogArticleLike)
    {
        return blogArticleLikeMapper.selectBlogArticleLikeList(blogArticleLike);
    }

    /**
     * 新增文章收藏
     * 
     * @param blogArticleLike 文章收藏
     * @return 结果
     */
    @Override
    public int insertBlogArticleLike(BlogArticleLike blogArticleLike)
    {
        blogArticleLike.setCreateTime(DateUtils.getNowDate());
        return blogArticleLikeMapper.insertBlogArticleLike(blogArticleLike);
    }

    /**
     * 修改文章收藏
     * 
     * @param blogArticleLike 文章收藏
     * @return 结果
     */
    @Override
    public int updateBlogArticleLike(BlogArticleLike blogArticleLike)
    {
        blogArticleLike.setUpdateTime(DateUtils.getNowDate());
        return blogArticleLikeMapper.updateBlogArticleLike(blogArticleLike);
    }

    /**
     * 批量删除文章收藏
     * 
     * @param ids 需要删除的文章收藏主键
     * @return 结果
     */
    @Override
    public int deleteBlogArticleLikeByIds(Long[] ids)
    {
        return blogArticleLikeMapper.deleteBlogArticleLikeByIds(ids);
    }

    /**
     * 删除文章收藏信息
     * 
     * @param id 文章收藏主键
     * @return 结果
     */
    @Override
    public int deleteBlogArticleLikeById(Long id)
    {
        return blogArticleLikeMapper.deleteBlogArticleLikeById(id);
    }
}
