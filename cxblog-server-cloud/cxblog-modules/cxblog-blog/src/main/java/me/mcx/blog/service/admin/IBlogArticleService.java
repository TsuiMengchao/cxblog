package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.domain.dto.article.ArticleDTO;
import me.mcx.blog.domain.vo.article.SystemArticleListVO;
import me.mcx.common.core.web.domain.AjaxResult;

/**
 * 博客文章Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogArticleService 
{
    /**
     * 查询博客文章列表
     *
     * @param blogArticle 博客文章
     * @return 博客文章集合
     */
    public List<BlogArticle> selectBlogArticleList(BlogArticle blogArticle);
    /**
     * 批量删除博客文章
     * 
     * @param ids 需要删除的博客文章主键集合
     * @return 结果
     */
    public int deleteBlogArticleByIds(Long[] ids);

    /**
     * 删除博客文章信息
     * 
     * @param id 博客文章主键
     * @return 结果
     */
    public int deleteBlogArticleById(Long id);

//    ==============================
    /**
     * 后台分页获取文章
     * @return
     */
    List<SystemArticleListVO> selectArticlePage(String title, Integer tagId, Integer categoryId, Integer isPublish);

    AjaxResult selectArticleById(Long id);

    public int addArticle(ArticleDTO article);

    public int updateArticle(ArticleDTO article);

    public AjaxResult deleteBatchArticle(List<Long> ids);
    /**
     * 置顶文章
     * @param article 文章对象
     * @return
     */
    AjaxResult topArticle(ArticleDTO article);

    /**
     * 发布或下架文章
     * @param article 文章对象
     * @return
     */
    AjaxResult psArticle(BlogArticle article);

    /**
     * 百度seo
     * @param ids 文章id集合
     * @return
     */
    AjaxResult seoArticle(List<Long> ids);

    /**
     * 爬取文章
     * @param url 文章地址
     * @return
     */
    AjaxResult reptile(String url);

    /**
     * 随机获取图片
     * @return
     */
    AjaxResult randomImg();
}
