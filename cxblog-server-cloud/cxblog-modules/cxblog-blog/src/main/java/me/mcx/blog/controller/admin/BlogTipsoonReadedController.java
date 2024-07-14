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
import me.mcx.blog.domain.BlogTipsoonReaded;
import me.mcx.blog.service.admin.IBlogTipsoonReadedService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 简讯已读Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/tipsoonReaded")
public class BlogTipsoonReadedController extends BaseController
{
    @Autowired
    private IBlogTipsoonReadedService blogTipsoonReadedService;

    /**
     * 查询简讯已读列表
     */
    @RequiresPermissions("blog:tipsoonReaded:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogTipsoonReaded blogTipsoonReaded)
    {
        startPage();
        List<BlogTipsoonReaded> list = blogTipsoonReadedService.selectBlogTipsoonReadedList(blogTipsoonReaded);
        return getDataTable(list);
    }

    /**
     * 导出简讯已读列表
     */
    @RequiresPermissions("blog:tipsoonReaded:export")
    @Log(title = "简讯已读", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogTipsoonReaded blogTipsoonReaded)
    {
        List<BlogTipsoonReaded> list = blogTipsoonReadedService.selectBlogTipsoonReadedList(blogTipsoonReaded);
        ExcelUtil<BlogTipsoonReaded> util = new ExcelUtil<BlogTipsoonReaded>(BlogTipsoonReaded.class);
        util.exportExcel(response, list, "简讯已读数据");
    }

    /**
     * 获取简讯已读详细信息
     */
    @RequiresPermissions("blog:tipsoonReaded:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogTipsoonReadedService.selectBlogTipsoonReadedById(id));
    }

    /**
     * 新增简讯已读
     */
    @RequiresPermissions("blog:tipsoonReaded:add")
    @Log(title = "简讯已读", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogTipsoonReaded blogTipsoonReaded)
    {
        return toAjax(blogTipsoonReadedService.insertBlogTipsoonReaded(blogTipsoonReaded));
    }

    /**
     * 修改简讯已读
     */
    @RequiresPermissions("blog:tipsoonReaded:edit")
    @Log(title = "简讯已读", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogTipsoonReaded blogTipsoonReaded)
    {
        return toAjax(blogTipsoonReadedService.updateBlogTipsoonReaded(blogTipsoonReaded));
    }

    /**
     * 删除简讯已读
     */
    @RequiresPermissions("blog:tipsoonReaded:remove")
    @Log(title = "简讯已读", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogTipsoonReadedService.deleteBlogTipsoonReadedByIds(ids));
    }
}
