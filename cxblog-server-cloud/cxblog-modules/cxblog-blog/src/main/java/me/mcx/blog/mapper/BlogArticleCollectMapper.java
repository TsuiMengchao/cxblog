package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogArticleCollect;
import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import org.apache.ibatis.annotations.Param;

/**
 * 文章收藏Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogArticleCollectMapper 
{
    /**
     * 查询文章收藏
     * 
     * @param id 文章收藏主键
     * @return 文章收藏
     */
    public BlogArticleCollect selectBlogArticleCollectById(Long id);

    /**
     * 查询文章收藏列表
     * 
     * @param blogArticleCollect 文章收藏
     * @return 文章收藏集合
     */
    public List<BlogArticleCollect> selectBlogArticleCollectList(BlogArticleCollect blogArticleCollect);

    /**
     * 新增文章收藏
     * 
     * @param blogArticleCollect 文章收藏
     * @return 结果
     */
    public int insertBlogArticleCollect(BlogArticleCollect blogArticleCollect);

    /**
     * 修改文章收藏
     * 
     * @param blogArticleCollect 文章收藏
     * @return 结果
     */
    public int updateBlogArticleCollect(BlogArticleCollect blogArticleCollect);

    /**
     * 删除文章收藏
     * 
     * @param id 文章收藏主键
     * @return 结果
     */
    public int deleteBlogArticleCollectById(Long id);

    /**
     * 批量删除文章收藏
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogArticleCollectByIds(Long[] ids);

    Integer selectCount(BlogArticleCollect blogArticleCollect);

//    ==================================
    /**
     * 我的收藏列表
     * @return
     */
    List<ApiArticleListVO> selectCollectList(@Param("userId") String userId);
}
