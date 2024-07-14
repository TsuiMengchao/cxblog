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
import me.mcx.blog.domain.BlogSign;
import me.mcx.blog.service.admin.IBlogSignService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 签到Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/sign")
public class BlogSignController extends BaseController
{
    @Autowired
    private IBlogSignService blogSignService;

    /**
     * 查询签到列表
     */
    @RequiresPermissions("blog:sign:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogSign blogSign)
    {
        startPage();
        List<BlogSign> list = blogSignService.selectBlogSignList(blogSign);
        return getDataTable(list);
    }

    /**
     * 导出签到列表
     */
    @RequiresPermissions("blog:sign:export")
    @Log(title = "签到", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogSign blogSign)
    {
        List<BlogSign> list = blogSignService.selectBlogSignList(blogSign);
        ExcelUtil<BlogSign> util = new ExcelUtil<BlogSign>(BlogSign.class);
        util.exportExcel(response, list, "签到数据");
    }

    /**
     * 获取签到详细信息
     */
    @RequiresPermissions("blog:sign:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(blogSignService.selectBlogSignById(id));
    }

    /**
     * 新增签到
     */
    @RequiresPermissions("blog:sign:add")
    @Log(title = "签到", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogSign blogSign)
    {
        return toAjax(blogSignService.insertBlogSign(blogSign));
    }

    /**
     * 修改签到
     */
    @RequiresPermissions("blog:sign:edit")
    @Log(title = "签到", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogSign blogSign)
    {
        return toAjax(blogSignService.updateBlogSign(blogSign));
    }

    /**
     * 删除签到
     */
    @RequiresPermissions("blog:sign:remove")
    @Log(title = "签到", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(blogSignService.deleteBlogSignByIds(ids));
    }
}
