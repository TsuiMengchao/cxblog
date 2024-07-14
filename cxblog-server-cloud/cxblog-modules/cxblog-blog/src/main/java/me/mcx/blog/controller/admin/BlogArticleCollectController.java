package me.mcx.blog.controller.admin;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import me.mcx.blog.domain.BlogArticleCollect;
import me.mcx.blog.service.admin.IBlogArticleCollectService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 文章收藏Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/articleCollect")
public class BlogArticleCollectController extends BaseController
{
    @Autowired
    private IBlogArticleCollectService blogArticleCollectService;

    /**
     * 查询文章收藏列表
     */
    @RequiresPermissions("blog:articleCollect:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogArticleCollect blogArticleCollect)
    {
        startPage();
        List<BlogArticleCollect> list = blogArticleCollectService.selectBlogArticleCollectList(blogArticleCollect);
        return getDataTable(list);
    }

    /**
     * 导出文章收藏列表
     */
    @RequiresPermissions("blog:articleCollect:export")
    @Log(title = "文章收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogArticleCollect blogArticleCollect)
    {
        List<BlogArticleCollect> list = blogArticleCollectService.selectBlogArticleCollectList(blogArticleCollect);
        ExcelUtil<BlogArticleCollect> util = new ExcelUtil<BlogArticleCollect>(BlogArticleCollect.class);
        util.exportExcel(response, list, "文章收藏数据");
    }

    /**
     * 获取文章收藏详细信息
     */
    @RequiresPermissions("blog:articleCollect:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogArticleCollectService.selectBlogArticleCollectById(id));
    }

    /**
     * 新增文章收藏
     */
    @RequiresPermissions("blog:articleCollect:add")
    @Log(title = "文章收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogArticleCollect blogArticleCollect)
    {
        return toAjax(blogArticleCollectService.insertBlogArticleCollect(blogArticleCollect));
    }

    /**
     * 修改文章收藏
     */
    @RequiresPermissions("blog:articleCollect:edit")
    @Log(title = "文章收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogArticleCollect blogArticleCollect)
    {
        return toAjax(blogArticleCollectService.updateBlogArticleCollect(blogArticleCollect));
    }

    /**
     * 删除文章收藏
     */
    @RequiresPermissions("blog:articleCollect:remove")
    @Log(title = "文章收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogArticleCollectService.deleteBlogArticleCollectByIds(ids));
    }
}
