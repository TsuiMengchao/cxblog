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
import me.mcx.blog.domain.BlogTalk;
import me.mcx.blog.service.admin.IBlogTalkService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 话题圈子Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/talk")
public class BlogTalkController extends BaseController
{
    @Autowired
    private IBlogTalkService blogTalkService;

    /**
     * 查询话题圈子列表
     */
    @RequiresPermissions("blog:talk:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogTalk blogTalk)
    {
        startPage();
        List<BlogTalk> list = blogTalkService.selectBlogTalkList(blogTalk);
        return getDataTable(list);
    }

    /**
     * 导出话题圈子列表
     */
    @RequiresPermissions("blog:talk:export")
    @Log(title = "话题圈子", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogTalk blogTalk)
    {
        List<BlogTalk> list = blogTalkService.selectBlogTalkList(blogTalk);
        ExcelUtil<BlogTalk> util = new ExcelUtil<BlogTalk>(BlogTalk.class);
        util.exportExcel(response, list, "话题圈子数据");
    }

    /**
     * 获取话题圈子详细信息
     */
    @RequiresPermissions("blog:talk:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogTalkService.selectBlogTalkById(id));
    }

    /**
     * 新增话题圈子
     */
    @RequiresPermissions("blog:talk:add")
    @Log(title = "话题圈子", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogTalk blogTalk)
    {
        return toAjax(blogTalkService.insertBlogTalk(blogTalk));
    }

    /**
     * 修改话题圈子
     */
    @RequiresPermissions("blog:talk:edit")
    @Log(title = "话题圈子", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogTalk blogTalk)
    {
        return toAjax(blogTalkService.updateBlogTalk(blogTalk));
    }

    /**
     * 删除话题圈子
     */
    @RequiresPermissions("blog:talk:remove")
    @Log(title = "话题圈子", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogTalkService.deleteBlogTalkByIds(ids));
    }
}
