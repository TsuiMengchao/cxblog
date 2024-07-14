package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogArticleTag;

/**
 * 文章标签Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogArticleTagService 
{
    /**
     * 查询文章标签
     * 
     * @param id 文章标签主键
     * @return 文章标签
     */
    public BlogArticleTag selectBlogArticleTagById(Long id);

    /**
     * 查询文章标签列表
     * 
     * @param blogArticleTag 文章标签
     * @return 文章标签集合
     */
    public List<BlogArticleTag> selectBlogArticleTagList(BlogArticleTag blogArticleTag);

    /**
     * 新增文章标签
     * 
     * @param blogArticleTag 文章标签
     * @return 结果
     */
    public int insertBlogArticleTag(BlogArticleTag blogArticleTag);

    /**
     * 修改文章标签
     * 
     * @param blogArticleTag 文章标签
     * @return 结果
     */
    public int updateBlogArticleTag(BlogArticleTag blogArticleTag);

    /**
     * 批量删除文章标签
     * 
     * @param ids 需要删除的文章标签主键集合
     * @return 结果
     */
    public int deleteBlogArticleTagByIds(Long[] ids);

    /**
     * 删除文章标签信息
     * 
     * @param id 文章标签主键
     * @return 结果
     */
    public int deleteBlogArticleTagById(Long id);
}
