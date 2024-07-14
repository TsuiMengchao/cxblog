package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogArticleLike;

/**
 * 文章收藏Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogArticleLikeService 
{
    /**
     * 查询文章收藏
     * 
     * @param id 文章收藏主键
     * @return 文章收藏
     */
    public BlogArticleLike selectBlogArticleLikeById(Long id);

    /**
     * 查询文章收藏列表
     * 
     * @param blogArticleLike 文章收藏
     * @return 文章收藏集合
     */
    public List<BlogArticleLike> selectBlogArticleLikeList(BlogArticleLike blogArticleLike);

    /**
     * 新增文章收藏
     * 
     * @param blogArticleLike 文章收藏
     * @return 结果
     */
    public int insertBlogArticleLike(BlogArticleLike blogArticleLike);

    /**
     * 修改文章收藏
     * 
     * @param blogArticleLike 文章收藏
     * @return 结果
     */
    public int updateBlogArticleLike(BlogArticleLike blogArticleLike);

    /**
     * 批量删除文章收藏
     * 
     * @param ids 需要删除的文章收藏主键集合
     * @return 结果
     */
    public int deleteBlogArticleLikeByIds(Long[] ids);

    /**
     * 删除文章收藏信息
     * 
     * @param id 文章收藏主键
     * @return 结果
     */
    public int deleteBlogArticleLikeById(Long id);
}
