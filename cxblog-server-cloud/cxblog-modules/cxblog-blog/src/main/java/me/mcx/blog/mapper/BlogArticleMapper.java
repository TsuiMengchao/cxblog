package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.domain.dto.article.ArticleDTO;
import me.mcx.blog.domain.dto.article.ArticlePostDTO;
import me.mcx.blog.domain.vo.article.*;
import org.apache.ibatis.annotations.Param;

/**
 * 博客文章Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogArticleMapper 
{
    /**
     * 查询博客文章
     * 
     * @param id 博客文章主键
     * @return 博客文章
     */
    public BlogArticle selectBlogArticleById(Long id);

    /**
     * 查询博客文章列表
     * 
     * @param blogArticle 博客文章
     * @return 博客文章集合
     */
    public List<BlogArticle> selectBlogArticleList(BlogArticle blogArticle);

    /**
     * 新增博客文章
     * 
     * @param blogArticle 博客文章
     * @return 结果
     */
    public int insertBlogArticle(BlogArticle blogArticle);

    /**
     * 修改博客文章
     * 
     * @param blogArticle 博客文章
     * @return 结果
     */
    public int updateBlogArticle(BlogArticle blogArticle);

    /**
     * 删除博客文章
     * 
     * @param id 博客文章主键
     * @return 结果
     */
    public int deleteBlogArticleById(Long id);

    /**
     * 批量删除博客文章
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogArticleByIds(Long[] ids);

    Integer selectCount(BlogArticle blogArticle);

//    ===================================
    /**
     * 后台分页获取文章
     * @return
     */
    List<SystemArticleListVO> selectArticle(@Param("title")String title, @Param("tagId")Integer tagId,
                                            @Param("categoryId")Integer categoryId, @Param("isPublish")Integer isPublish);

    /**
     * 后台根据主键获取文章详情
     * @param id 主键id
     * @return
     */
    ArticleDTO selectArticlePrimaryKey(Long id);

    /**
     * 置顶文章
     * @param article 文章对象
     */
    void putTopArticle(@Param("article") ArticleDTO article);


    /**
     * 文章贡献度
     * @param lastTime 开始时间
     * @param nowTime 结束时间
     * @return
     */
    List<SystemArticleContributeVO> contribute(@Param("lastTime") String lastTime, @Param("nowTime")String nowTime);



    //-----------------------门户端方法分割线-------------------------------
    /**
     * 首页分页获取归档
     * @return
     */
    List<ApiArchiveVO> selectListArchive();

    /**
     * 首页分页获取文章
     * @param categoryId 分类id
     * @param tagId 标签id
     * @return
     */
    List<ApiArticleListVO> selectPublicArticleList(@Param("categoryId")Integer categoryId, @Param("tagId")Integer tagId,
                                                   @Param("orderByDescColumn")String orderByDescColumn);


    /**
     * 获取文章详情
     * @param id
     * @return
     */
    ApiArticleInfoVO selectArticleByIdToVO(Integer id);

    /**
     * 获取推荐的文章
     * @return
     */
    List<SystemArticleListVO> selectListByBanner();

    /**
     * 获取推荐文章
     * @return
     */
    List<ApiArticleListVO> selectRecommendArticle();

    /**
     * 获取所搜框热门文章
     * @return
     */
    List<ApiArticleListVO> selectHotArticleList();

    /**
     * 根据关键词分页搜索文章
     * @param keywords
     * @return
     */
    List<ApiArticleSearchVO> selectSearchArticle(@Param("keywords") String keywords);


    /**
     * 查询我的文章
     * @return
     */
    List<ApiArticleListVO> selectMyArticle(@Param("userId") String userId,@Param("type") Integer type);

    /**
     * 获取我的文章详情
     * @param id
     * @return
     */
    ArticlePostDTO selectMyArticleInfo(Long id);
}
