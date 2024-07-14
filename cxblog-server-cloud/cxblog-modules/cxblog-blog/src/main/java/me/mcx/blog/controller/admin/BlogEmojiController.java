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
import me.mcx.blog.domain.BlogEmoji;
import me.mcx.blog.service.admin.IBlogEmojiService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 情Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/emoji")
public class BlogEmojiController extends BaseController
{
    @Autowired
    private IBlogEmojiService blogEmojiService;

    /**
     * 查询情列表
     */
    @RequiresPermissions("blog:emoji:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogEmoji blogEmoji)
    {
        startPage();
        List<BlogEmoji> list = blogEmojiService.selectBlogEmojiList(blogEmoji);
        return getDataTable(list);
    }

    /**
     * 导出情列表
     */
    @RequiresPermissions("blog:emoji:export")
    @Log(title = "情", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogEmoji blogEmoji)
    {
        List<BlogEmoji> list = blogEmojiService.selectBlogEmojiList(blogEmoji);
        ExcelUtil<BlogEmoji> util = new ExcelUtil<BlogEmoji>(BlogEmoji.class);
        util.exportExcel(response, list, "情数据");
    }

    /**
     * 获取情详细信息
     */
    @RequiresPermissions("blog:emoji:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogEmojiService.selectBlogEmojiById(id));
    }

    /**
     * 新增情
     */
    @RequiresPermissions("blog:emoji:add")
    @Log(title = "情", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogEmoji blogEmoji)
    {
        return toAjax(blogEmojiService.insertBlogEmoji(blogEmoji));
    }

    /**
     * 修改情
     */
    @RequiresPermissions("blog:emoji:edit")
    @Log(title = "情", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogEmoji blogEmoji)
    {
        return toAjax(blogEmojiService.updateBlogEmoji(blogEmoji));
    }

    /**
     * 删除情
     */
    @RequiresPermissions("blog:emoji:remove")
    @Log(title = "情", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogEmojiService.deleteBlogEmojiByIds(ids));
    }
}
