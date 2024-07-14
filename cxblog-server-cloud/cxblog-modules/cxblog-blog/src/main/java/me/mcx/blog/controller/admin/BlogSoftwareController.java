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
import me.mcx.blog.domain.BlogSoftware;
import me.mcx.blog.service.admin.IBlogSoftwareService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 开源软件Controller
 * 
 * @author mcx
 * @date 2024-04-29
 */
@RestController
@RequestMapping("/software")
public class BlogSoftwareController extends BaseController
{
    @Autowired
    private IBlogSoftwareService blogSoftwareService;

    /**
     * 查询开源软件列表
     */
    @RequiresPermissions("blog:software:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogSoftware blogSoftware)
    {
        startPage();
        List<BlogSoftware> list = blogSoftwareService.selectBlogSoftwareList(blogSoftware);
        return getDataTable(list);
    }

    /**
     * 导出开源软件列表
     */
    @RequiresPermissions("blog:software:export")
    @Log(title = "开源软件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogSoftware blogSoftware)
    {
        List<BlogSoftware> list = blogSoftwareService.selectBlogSoftwareList(blogSoftware);
        ExcelUtil<BlogSoftware> util = new ExcelUtil<BlogSoftware>(BlogSoftware.class);
        util.exportExcel(response, list, "开源软件数据");
    }

    /**
     * 获取开源软件详细信息
     */
    @RequiresPermissions("blog:software:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogSoftwareService.selectBlogSoftwareById(id));
    }

    /**
     * 新增开源软件
     */
    @RequiresPermissions("blog:software:add")
    @Log(title = "开源软件", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogSoftware blogSoftware)
    {
        return toAjax(blogSoftwareService.insertBlogSoftware(blogSoftware));
    }

    /**
     * 修改开源软件
     */
    @RequiresPermissions("blog:software:edit")
    @Log(title = "开源软件", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogSoftware blogSoftware)
    {
        return toAjax(blogSoftwareService.updateBlogSoftware(blogSoftware));
    }

    /**
     * 删除开源软件
     */
    @RequiresPermissions("blog:software:remove")
    @Log(title = "开源软件", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogSoftwareService.deleteBlogSoftwareByIds(ids));
    }
}
