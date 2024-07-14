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
import me.mcx.blog.domain.BlogTags;
import me.mcx.blog.service.admin.IBlogTagsService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 博客标签Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/tags")
public class BlogTagsController extends BaseController
{
    @Autowired
    private IBlogTagsService blogTagsService;

    /**
     * 查询博客标签列表
     */
    @RequiresPermissions("blog:tags:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogTags blogTags)
    {
        startPage();
        List<BlogTags> list = blogTagsService.selectBlogTagsList(blogTags);
        return getDataTable(list);
    }

    /**
     * 导出博客标签列表
     */
    @RequiresPermissions("blog:tags:export")
    @Log(title = "博客标签", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogTags blogTags)
    {
        List<BlogTags> list = blogTagsService.selectBlogTagsList(blogTags);
        ExcelUtil<BlogTags> util = new ExcelUtil<BlogTags>(BlogTags.class);
        util.exportExcel(response, list, "博客标签数据");
    }

    /**
     * 获取博客标签详细信息
     */
    @RequiresPermissions("blog:tags:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogTagsService.selectBlogTagsById(id));
    }

    /**
     * 新增博客标签
     */
    @RequiresPermissions("blog:tags:add")
    @Log(title = "博客标签", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogTags blogTags)
    {
        return toAjax(blogTagsService.insertBlogTags(blogTags));
    }

    /**
     * 修改博客标签
     */
    @RequiresPermissions("blog:tags:edit")
    @Log(title = "博客标签", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogTags blogTags)
    {
        return toAjax(blogTagsService.updateBlogTags(blogTags));
    }

    /**
     * 删除博客标签
     */
    @RequiresPermissions("blog:tags:remove")
    @Log(title = "博客标签", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogTagsService.deleteBlogTagsByIds(ids));
    }
}
