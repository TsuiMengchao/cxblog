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
import me.mcx.blog.domain.BlogSponsor;
import me.mcx.blog.service.admin.IBlogSponsorService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 打赏记录Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/sponsor")
public class BlogSponsorController extends BaseController
{
    @Autowired
    private IBlogSponsorService blogSponsorService;

    /**
     * 查询打赏记录列表
     */
    @RequiresPermissions("blog:sponsor:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogSponsor blogSponsor)
    {
        startPage();
        List<BlogSponsor> list = blogSponsorService.selectBlogSponsorList(blogSponsor);
        return getDataTable(list);
    }

    /**
     * 导出打赏记录列表
     */
    @RequiresPermissions("blog:sponsor:export")
    @Log(title = "打赏记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogSponsor blogSponsor)
    {
        List<BlogSponsor> list = blogSponsorService.selectBlogSponsorList(blogSponsor);
        ExcelUtil<BlogSponsor> util = new ExcelUtil<BlogSponsor>(BlogSponsor.class);
        util.exportExcel(response, list, "打赏记录数据");
    }

    /**
     * 获取打赏记录详细信息
     */
    @RequiresPermissions("blog:sponsor:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogSponsorService.selectBlogSponsorById(id));
    }

    /**
     * 新增打赏记录
     */
    @RequiresPermissions("blog:sponsor:add")
    @Log(title = "打赏记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogSponsor blogSponsor)
    {
        return toAjax(blogSponsorService.insertBlogSponsor(blogSponsor));
    }

    /**
     * 修改打赏记录
     */
    @RequiresPermissions("blog:sponsor:edit")
    @Log(title = "打赏记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogSponsor blogSponsor)
    {
        return toAjax(blogSponsorService.updateBlogSponsor(blogSponsor));
    }

    /**
     * 删除打赏记录
     */
    @RequiresPermissions("blog:sponsor:remove")
    @Log(title = "打赏记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogSponsorService.deleteBlogSponsorByIds(ids));
    }
}
