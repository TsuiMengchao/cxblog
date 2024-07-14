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
import me.mcx.blog.domain.BlogForumComment;
import me.mcx.blog.service.admin.IBlogForumCommentService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 圈子评论Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/forumComment")
public class BlogForumCommentController extends BaseController
{
    @Autowired
    private IBlogForumCommentService blogForumCommentService;

    /**
     * 查询圈子评论列表
     */
    @RequiresPermissions("blog:forumComment:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogForumComment blogForumComment)
    {
        startPage();
        List<BlogForumComment> list = blogForumCommentService.selectBlogForumCommentList(blogForumComment);
        return getDataTable(list);
    }

    /**
     * 导出圈子评论列表
     */
    @RequiresPermissions("blog:forumComment:export")
    @Log(title = "圈子评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogForumComment blogForumComment)
    {
        List<BlogForumComment> list = blogForumCommentService.selectBlogForumCommentList(blogForumComment);
        ExcelUtil<BlogForumComment> util = new ExcelUtil<BlogForumComment>(BlogForumComment.class);
        util.exportExcel(response, list, "圈子评论数据");
    }

    /**
     * 获取圈子评论详细信息
     */
    @RequiresPermissions("blog:forumComment:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogForumCommentService.selectBlogForumCommentById(id));
    }

    /**
     * 新增圈子评论
     */
    @RequiresPermissions("blog:forumComment:add")
    @Log(title = "圈子评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogForumComment blogForumComment)
    {
        return toAjax(blogForumCommentService.insertBlogForumComment(blogForumComment));
    }

    /**
     * 修改圈子评论
     */
    @RequiresPermissions("blog:forumComment:edit")
    @Log(title = "圈子评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogForumComment blogForumComment)
    {
        return toAjax(blogForumCommentService.updateBlogForumComment(blogForumComment));
    }

    /**
     * 删除圈子评论
     */
    @RequiresPermissions("blog:forumComment:remove")
    @Log(title = "圈子评论", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogForumCommentService.deleteBlogForumCommentByIds(ids));
    }
}
