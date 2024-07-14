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
import me.mcx.blog.domain.BlogCategory;
import me.mcx.blog.service.admin.IBlogCategoryService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 博客分类Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/category")
public class BlogCategoryController extends BaseController
{
    @Autowired
    private IBlogCategoryService blogCategoryService;

    /**
     * 查询博客分类列表
     */
    @RequiresPermissions("blog:category:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogCategory blogCategory)
    {
        startPage();
        List<BlogCategory> list = blogCategoryService.selectBlogCategoryList(blogCategory);
        return getDataTable(list);
    }

    /**
     * 导出博客分类列表
     */
    @RequiresPermissions("blog:category:export")
    @Log(title = "博客分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogCategory blogCategory)
    {
        List<BlogCategory> list = blogCategoryService.selectBlogCategoryList(blogCategory);
        ExcelUtil<BlogCategory> util = new ExcelUtil<BlogCategory>(BlogCategory.class);
        util.exportExcel(response, list, "博客分类数据");
    }

    /**
     * 获取博客分类详细信息
     */
    @RequiresPermissions("blog:category:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogCategoryService.selectBlogCategoryById(id));
    }

    /**
     * 新增博客分类
     */
    @RequiresPermissions("blog:category:add")
    @Log(title = "博客分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogCategory blogCategory)
    {
        return toAjax(blogCategoryService.insertBlogCategory(blogCategory));
    }

    /**
     * 修改博客分类
     */
    @RequiresPermissions("blog:category:edit")
    @Log(title = "博客分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogCategory blogCategory)
    {
        return toAjax(blogCategoryService.updateBlogCategory(blogCategory));
    }

    /**
     * 删除博客分类
     */
    @RequiresPermissions("blog:category:remove")
    @Log(title = "博客分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogCategoryService.deleteBlogCategoryByIds(ids));
    }
}
