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
import me.mcx.blog.domain.BlogTipsoonComment;
import me.mcx.blog.service.admin.IBlogTipsoonCommentService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 简讯评论Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/tipsoonComment")
public class BlogTipsoonCommentController extends BaseController
{
    @Autowired
    private IBlogTipsoonCommentService blogTipsoonCommentService;

    /**
     * 查询简讯评论列表
     */
    @RequiresPermissions("blog:tipsoonComment:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogTipsoonComment blogTipsoonComment)
    {
        startPage();
        List<BlogTipsoonComment> list = blogTipsoonCommentService.selectBlogTipsoonCommentList(blogTipsoonComment);
        return getDataTable(list);
    }

    /**
     * 导出简讯评论列表
     */
    @RequiresPermissions("blog:tipsoonComment:export")
    @Log(title = "简讯评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogTipsoonComment blogTipsoonComment)
    {
        List<BlogTipsoonComment> list = blogTipsoonCommentService.selectBlogTipsoonCommentList(blogTipsoonComment);
        ExcelUtil<BlogTipsoonComment> util = new ExcelUtil<BlogTipsoonComment>(BlogTipsoonComment.class);
        util.exportExcel(response, list, "简讯评论数据");
    }

    /**
     * 获取简讯评论详细信息
     */
    @RequiresPermissions("blog:tipsoonComment:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogTipsoonCommentService.selectBlogTipsoonCommentById(id));
    }

    /**
     * 新增简讯评论
     */
    @RequiresPermissions("blog:tipsoonComment:add")
    @Log(title = "简讯评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogTipsoonComment blogTipsoonComment)
    {
        return toAjax(blogTipsoonCommentService.insertBlogTipsoonComment(blogTipsoonComment));
    }

    /**
     * 修改简讯评论
     */
    @RequiresPermissions("blog:tipsoonComment:edit")
    @Log(title = "简讯评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogTipsoonComment blogTipsoonComment)
    {
        return toAjax(blogTipsoonCommentService.updateBlogTipsoonComment(blogTipsoonComment));
    }

    /**
     * 删除简讯评论
     */
    @RequiresPermissions("blog:tipsoonComment:remove")
    @Log(title = "简讯评论", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogTipsoonCommentService.deleteBlogTipsoonCommentByIds(ids));
    }
}
