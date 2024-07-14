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
import me.mcx.blog.domain.BlogNavigation;
import me.mcx.blog.service.admin.IBlogNavigationService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 网站导航Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/navigation")
public class BlogNavigationController extends BaseController
{
    @Autowired
    private IBlogNavigationService blogNavigationService;

    /**
     * 查询网站导航列表
     */
    @RequiresPermissions("blog:navigation:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogNavigation blogNavigation)
    {
        startPage();
        List<BlogNavigation> list = blogNavigationService.selectBlogNavigationList(blogNavigation);
        return getDataTable(list);
    }

    /**
     * 导出网站导航列表
     */
    @RequiresPermissions("blog:navigation:export")
    @Log(title = "网站导航", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogNavigation blogNavigation)
    {
        List<BlogNavigation> list = blogNavigationService.selectBlogNavigationList(blogNavigation);
        ExcelUtil<BlogNavigation> util = new ExcelUtil<BlogNavigation>(BlogNavigation.class);
        util.exportExcel(response, list, "网站导航数据");
    }

    /**
     * 获取网站导航详细信息
     */
    @RequiresPermissions("blog:navigation:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogNavigationService.selectBlogNavigationById(id));
    }

    /**
     * 新增网站导航
     */
    @RequiresPermissions("blog:navigation:add")
    @Log(title = "网站导航", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogNavigation blogNavigation)
    {
        return toAjax(blogNavigationService.insertBlogNavigation(blogNavigation));
    }

    /**
     * 修改网站导航
     */
    @RequiresPermissions("blog:navigation:edit")
    @Log(title = "网站导航", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogNavigation blogNavigation)
    {
        return toAjax(blogNavigationService.updateBlogNavigation(blogNavigation));
    }

    /**
     * 删除网站导航
     */
    @RequiresPermissions("blog:navigation:remove")
    @Log(title = "网站导航", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogNavigationService.deleteBlogNavigationByIds(ids));
    }
}
