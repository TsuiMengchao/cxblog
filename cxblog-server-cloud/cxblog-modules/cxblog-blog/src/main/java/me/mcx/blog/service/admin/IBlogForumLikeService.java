package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogForumLike;

/**
 * 圈子内容点赞Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogForumLikeService 
{
    /**
     * 查询圈子内容点赞
     * 
     * @param id 圈子内容点赞主键
     * @return 圈子内容点赞
     */
    public BlogForumLike selectBlogForumLikeById(Long id);

    /**
     * 查询圈子内容点赞列表
     * 
     * @param blogForumLike 圈子内容点赞
     * @return 圈子内容点赞集合
     */
    public List<BlogForumLike> selectBlogForumLikeList(BlogForumLike blogForumLike);

    /**
     * 新增圈子内容点赞
     * 
     * @param blogForumLike 圈子内容点赞
     * @return 结果
     */
    public int insertBlogForumLike(BlogForumLike blogForumLike);

    /**
     * 修改圈子内容点赞
     * 
     * @param blogForumLike 圈子内容点赞
     * @return 结果
     */
    public int updateBlogForumLike(BlogForumLike blogForumLike);

    /**
     * 批量删除圈子内容点赞
     * 
     * @param ids 需要删除的圈子内容点赞主键集合
     * @return 结果
     */
    public int deleteBlogForumLikeByIds(Long[] ids);

    /**
     * 删除圈子内容点赞信息
     * 
     * @param id 圈子内容点赞主键
     * @return 结果
     */
    public int deleteBlogForumLikeById(Long id);
}
