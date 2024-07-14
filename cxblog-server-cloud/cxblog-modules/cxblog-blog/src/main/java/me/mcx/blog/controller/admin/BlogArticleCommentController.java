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
import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.service.admin.IBlogArticleCommentService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 评论Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/articleComment")
public class BlogArticleCommentController extends BaseController
{
    @Autowired
    private IBlogArticleCommentService blogArticleCommentService;

    /**
     * 查询评论列表
     */
    @RequiresPermissions("blog:articleComment:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogArticleComment blogArticleComment)
    {
        startPage();
        List<BlogArticleComment> list = blogArticleCommentService.selectBlogArticleCommentList(blogArticleComment);
        return getDataTable(list);
    }

    /**
     * 导出评论列表
     */
    @RequiresPermissions("blog:articleComment:export")
    @Log(title = "评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogArticleComment blogArticleComment)
    {
        List<BlogArticleComment> list = blogArticleCommentService.selectBlogArticleCommentList(blogArticleComment);
        ExcelUtil<BlogArticleComment> util = new ExcelUtil<BlogArticleComment>(BlogArticleComment.class);
        util.exportExcel(response, list, "评论数据");
    }

    /**
     * 获取评论详细信息
     */
    @RequiresPermissions("blog:articleComment:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogArticleCommentService.selectBlogArticleCommentById(id));
    }

    /**
     * 新增评论
     */
    @RequiresPermissions("blog:articleComment:add")
    @Log(title = "评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogArticleComment blogArticleComment)
    {
        return toAjax(blogArticleCommentService.insertBlogArticleComment(blogArticleComment));
    }

    /**
     * 修改评论
     */
    @RequiresPermissions("blog:articleComment:edit")
    @Log(title = "评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogArticleComment blogArticleComment)
    {
        return toAjax(blogArticleCommentService.updateBlogArticleComment(blogArticleComment));
    }

    /**
     * 删除评论
     */
    @RequiresPermissions("blog:articleComment:remove")
    @Log(title = "评论", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogArticleCommentService.deleteBlogArticleCommentByIds(ids));
    }
}
