package me.mcx.blog.controller.admin;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import me.mcx.blog.domain.dto.article.ArticleDTO;
import me.mcx.blog.domain.vo.article.SystemArticleListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import me.mcx.common.log.annotation.Log;
import me.mcx.common.log.enums.BusinessType;
import me.mcx.common.security.annotation.RequiresPermissions;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.service.admin.IBlogArticleService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 博客文章Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/article")
public class BlogArticleController extends BaseController
{
    @Autowired
    private IBlogArticleService blogArticleService;

    @Autowired
    private IBlogArticleService articleService;

    /**
     * 查询博客文章列表
     */
    @RequiresPermissions("blog:article:list")
    @GetMapping("/list")
    public TableDataInfo list(String title,Integer tagId,Integer categoryId,Integer isPublish)
    {
        startPage();
        List<SystemArticleListVO> list = articleService.selectArticlePage(title,tagId,categoryId,isPublish);
        return getDataTable(list);
    }

    /**
     * 导出博客文章列表
     */
    @RequiresPermissions("blog:article:export")
    @Log(title = "博客文章", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogArticle blogArticle)
    {
        List<BlogArticle> list = blogArticleService.selectBlogArticleList(blogArticle);
        ExcelUtil<BlogArticle> util = new ExcelUtil<BlogArticle>(BlogArticle.class);
        util.exportExcel(response, list, "博客文章数据");
    }

    /**
     * 获取博客文章详细信息
     */
    @RequiresPermissions("blog:article:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return blogArticleService.selectArticleById(id);
    }

    /**
     * 新增博客文章
     */
    @RequiresPermissions("blog:article:add")
    @Log(title = "博客文章", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArticleDTO blogArticle)
    {
        return toAjax(blogArticleService.addArticle(blogArticle));
    }

    /**
     * 修改博客文章
     */
    @RequiresPermissions("blog:article:edit")
    @Log(title = "博客文章", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArticleDTO blogArticle)
    {
        return toAjax(blogArticleService.updateArticle(blogArticle));
    }

    /**
     * 删除博客文章
     */
    @RequiresPermissions("blog:article:remove")
    @Log(title = "博客文章", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogArticleService.deleteBlogArticleByIds(ids));
    }


    /**
     * 置顶文章
     * @param article
     * @return
     */
    @PutMapping(value = "/top")
    @RequiresPermissions("blog:article:top")
    public AjaxResult topArticle(@RequestBody ArticleDTO article) {
        return articleService.topArticle(article);
    }

    /**
     * 发布或下架文章
     * @param article
     * @return
     */
    @PutMapping(value = "/pubOrShelf")
    @RequiresPermissions("blog:article:pubOrShelf")
    public AjaxResult psArticle(@RequestBody BlogArticle article) {
        return articleService.psArticle(article);
    }

    /**
     * 批量文章SEO
     * @param ids
     * @return
     */
    @PostMapping(value = "/seo")
    @RequiresPermissions("blog:article:seo")
    public AjaxResult seoArticle(@RequestBody List<Long> ids) {
        return articleService.seoArticle(ids);
    }

    /**
     * 文章爬虫
     * @param url
     * @return
     */
    @GetMapping(value = "/reptile")
    @RequiresPermissions("blog:article:reptile")
    public AjaxResult reptile(String url) {
        return articleService.reptile(url);
    }

    /**
     * 随机获取一张图片
     * @return
     */
    @GetMapping(value = "/randomImg")
    public AjaxResult randomImg() {
        return articleService.randomImg();
    }

}
