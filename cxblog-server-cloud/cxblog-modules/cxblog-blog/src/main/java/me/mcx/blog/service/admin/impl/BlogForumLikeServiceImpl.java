package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogForumLikeMapper;
import me.mcx.blog.domain.BlogForumLike;
import me.mcx.blog.service.admin.IBlogForumLikeService;

/**
 * 圈子内容点赞Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogForumLikeServiceImpl implements IBlogForumLikeService 
{
    @Autowired
    private BlogForumLikeMapper blogForumLikeMapper;

    /**
     * 查询圈子内容点赞
     * 
     * @param id 圈子内容点赞主键
     * @return 圈子内容点赞
     */
    @Override
    public BlogForumLike selectBlogForumLikeById(Long id)
    {
        return blogForumLikeMapper.selectBlogForumLikeById(id);
    }

    /**
     * 查询圈子内容点赞列表
     * 
     * @param blogForumLike 圈子内容点赞
     * @return 圈子内容点赞
     */
    @Override
    public List<BlogForumLike> selectBlogForumLikeList(BlogForumLike blogForumLike)
    {
        return blogForumLikeMapper.selectBlogForumLikeList(blogForumLike);
    }

    /**
     * 新增圈子内容点赞
     * 
     * @param blogForumLike 圈子内容点赞
     * @return 结果
     */
    @Override
    public int insertBlogForumLike(BlogForumLike blogForumLike)
    {
        blogForumLike.setCreateTime(DateUtils.getNowDate());
        return blogForumLikeMapper.insertBlogForumLike(blogForumLike);
    }

    /**
     * 修改圈子内容点赞
     * 
     * @param blogForumLike 圈子内容点赞
     * @return 结果
     */
    @Override
    public int updateBlogForumLike(BlogForumLike blogForumLike)
    {
        blogForumLike.setUpdateTime(DateUtils.getNowDate());
        return blogForumLikeMapper.updateBlogForumLike(blogForumLike);
    }

    /**
     * 批量删除圈子内容点赞
     * 
     * @param ids 需要删除的圈子内容点赞主键
     * @return 结果
     */
    @Override
    public int deleteBlogForumLikeByIds(Long[] ids)
    {
        return blogForumLikeMapper.deleteBlogForumLikeByIds(ids);
    }

    /**
     * 删除圈子内容点赞信息
     * 
     * @param id 圈子内容点赞主键
     * @return 结果
     */
    @Override
    public int deleteBlogForumLikeById(Long id)
    {
        return blogForumLikeMapper.deleteBlogForumLikeById(id);
    }
}
