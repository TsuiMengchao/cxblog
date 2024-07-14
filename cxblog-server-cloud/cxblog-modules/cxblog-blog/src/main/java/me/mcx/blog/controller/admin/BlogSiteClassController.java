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
import me.mcx.blog.domain.BlogSiteClass;
import me.mcx.blog.service.admin.IBlogSiteClassService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 网址分类Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/siteClass")
public class BlogSiteClassController extends BaseController
{
    @Autowired
    private IBlogSiteClassService blogSiteClassService;

    /**
     * 查询网址分类列表
     */
    @RequiresPermissions("blog:siteClass:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogSiteClass blogSiteClass)
    {
        startPage();
        List<BlogSiteClass> list = blogSiteClassService.selectBlogSiteClassList(blogSiteClass);
        return getDataTable(list);
    }

    /**
     * 导出网址分类列表
     */
    @RequiresPermissions("blog:siteClass:export")
    @Log(title = "网址分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogSiteClass blogSiteClass)
    {
        List<BlogSiteClass> list = blogSiteClassService.selectBlogSiteClassList(blogSiteClass);
        ExcelUtil<BlogSiteClass> util = new ExcelUtil<BlogSiteClass>(BlogSiteClass.class);
        util.exportExcel(response, list, "网址分类数据");
    }

    /**
     * 获取网址分类详细信息
     */
    @RequiresPermissions("blog:siteClass:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogSiteClassService.selectBlogSiteClassById(id));
    }

    /**
     * 新增网址分类
     */
    @RequiresPermissions("blog:siteClass:add")
    @Log(title = "网址分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogSiteClass blogSiteClass)
    {
        return toAjax(blogSiteClassService.insertBlogSiteClass(blogSiteClass));
    }

    /**
     * 修改网址分类
     */
    @RequiresPermissions("blog:siteClass:edit")
    @Log(title = "网址分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogSiteClass blogSiteClass)
    {
        return toAjax(blogSiteClassService.updateBlogSiteClass(blogSiteClass));
    }

    /**
     * 删除网址分类
     */
    @RequiresPermissions("blog:siteClass:remove")
    @Log(title = "网址分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogSiteClassService.deleteBlogSiteClassByIds(ids));
    }
}
