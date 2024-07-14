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
import me.mcx.blog.domain.BlogProp;
import me.mcx.blog.service.admin.IBlogPropService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 道具Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/prop")
public class BlogPropController extends BaseController
{
    @Autowired
    private IBlogPropService blogPropService;

    /**
     * 查询道具列表
     */
    @RequiresPermissions("blog:prop:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogProp blogProp)
    {
        startPage();
        List<BlogProp> list = blogPropService.selectBlogPropList(blogProp);
        return getDataTable(list);
    }

    /**
     * 导出道具列表
     */
    @RequiresPermissions("blog:prop:export")
    @Log(title = "道具", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogProp blogProp)
    {
        List<BlogProp> list = blogPropService.selectBlogPropList(blogProp);
        ExcelUtil<BlogProp> util = new ExcelUtil<BlogProp>(BlogProp.class);
        util.exportExcel(response, list, "道具数据");
    }

    /**
     * 获取道具详细信息
     */
    @RequiresPermissions("blog:prop:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogPropService.selectBlogPropById(id));
    }

    /**
     * 新增道具
     */
    @RequiresPermissions("blog:prop:add")
    @Log(title = "道具", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogProp blogProp)
    {
        return toAjax(blogPropService.insertBlogProp(blogProp));
    }

    /**
     * 修改道具
     */
    @RequiresPermissions("blog:prop:edit")
    @Log(title = "道具", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogProp blogProp)
    {
        return toAjax(blogPropService.updateBlogProp(blogProp));
    }

    /**
     * 删除道具
     */
    @RequiresPermissions("blog:prop:remove")
    @Log(title = "道具", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogPropService.deleteBlogPropByIds(ids));
    }
}
