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
import me.mcx.blog.domain.BlogTipsoon;
import me.mcx.blog.service.admin.IBlogTipsoonService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 简讯Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/tipsoon")
public class BlogTipsoonController extends BaseController
{
    @Autowired
    private IBlogTipsoonService blogTipsoonService;

    /**
     * 查询简讯列表
     */
    @RequiresPermissions("blog:tipsoon:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogTipsoon blogTipsoon)
    {
        startPage();
        List<BlogTipsoon> list = blogTipsoonService.selectBlogTipsoonList(blogTipsoon);
        return getDataTable(list);
    }

    /**
     * 导出简讯列表
     */
    @RequiresPermissions("blog:tipsoon:export")
    @Log(title = "简讯", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogTipsoon blogTipsoon)
    {
        List<BlogTipsoon> list = blogTipsoonService.selectBlogTipsoonList(blogTipsoon);
        ExcelUtil<BlogTipsoon> util = new ExcelUtil<BlogTipsoon>(BlogTipsoon.class);
        util.exportExcel(response, list, "简讯数据");
    }

    /**
     * 获取简讯详细信息
     */
    @RequiresPermissions("blog:tipsoon:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(blogTipsoonService.selectBlogTipsoonById(id));
    }

    /**
     * 新增简讯
     */
    @RequiresPermissions("blog:tipsoon:add")
    @Log(title = "简讯", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogTipsoon blogTipsoon)
    {
        return toAjax(blogTipsoonService.insertBlogTipsoon(blogTipsoon));
    }

    /**
     * 修改简讯
     */
    @RequiresPermissions("blog:tipsoon:edit")
    @Log(title = "简讯", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogTipsoon blogTipsoon)
    {
        return toAjax(blogTipsoonService.updateBlogTipsoon(blogTipsoon));
    }

    /**
     * 删除简讯
     */
    @RequiresPermissions("blog:tipsoon:remove")
    @Log(title = "简讯", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(blogTipsoonService.deleteBlogTipsoonByIds(ids));
    }
}
