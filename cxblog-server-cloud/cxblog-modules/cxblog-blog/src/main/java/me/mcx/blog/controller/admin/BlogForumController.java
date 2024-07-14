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
import me.mcx.blog.domain.BlogForum;
import me.mcx.blog.service.admin.IBlogForumService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 圈子话题Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/forum")
public class BlogForumController extends BaseController
{
    @Autowired
    private IBlogForumService blogForumService;

    /**
     * 查询圈子话题列表
     */
    @RequiresPermissions("blog:forum:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogForum blogForum)
    {
        startPage();
        List<BlogForum> list = blogForumService.selectBlogForumList(blogForum);
        return getDataTable(list);
    }

    /**
     * 导出圈子话题列表
     */
    @RequiresPermissions("blog:forum:export")
    @Log(title = "圈子话题", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogForum blogForum)
    {
        List<BlogForum> list = blogForumService.selectBlogForumList(blogForum);
        ExcelUtil<BlogForum> util = new ExcelUtil<BlogForum>(BlogForum.class);
        util.exportExcel(response, list, "圈子话题数据");
    }

    /**
     * 获取圈子话题详细信息
     */
    @RequiresPermissions("blog:forum:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogForumService.selectBlogForumById(id));
    }

    /**
     * 新增圈子话题
     */
    @RequiresPermissions("blog:forum:add")
    @Log(title = "圈子话题", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogForum blogForum)
    {
        return toAjax(blogForumService.insertBlogForum(blogForum));
    }

    /**
     * 修改圈子话题
     */
    @RequiresPermissions("blog:forum:edit")
    @Log(title = "圈子话题", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogForum blogForum)
    {
        return toAjax(blogForumService.updateBlogForum(blogForum));
    }

    /**
     * 删除圈子话题
     */
    @RequiresPermissions("blog:forum:remove")
    @Log(title = "圈子话题", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogForumService.deleteBlogForumByIds(ids));
    }
}
