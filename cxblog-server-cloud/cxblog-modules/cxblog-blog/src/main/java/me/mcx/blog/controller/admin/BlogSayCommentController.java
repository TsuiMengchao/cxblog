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
import me.mcx.blog.domain.BlogSayComment;
import me.mcx.blog.service.admin.IBlogSayCommentService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 说说评论Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/sayComment")
public class BlogSayCommentController extends BaseController
{
    @Autowired
    private IBlogSayCommentService blogSayCommentService;

    /**
     * 查询说说评论列表
     */
    @RequiresPermissions("blog:sayComment:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogSayComment blogSayComment)
    {
        startPage();
        List<BlogSayComment> list = blogSayCommentService.selectBlogSayCommentList(blogSayComment);
        return getDataTable(list);
    }

    /**
     * 导出说说评论列表
     */
    @RequiresPermissions("blog:sayComment:export")
    @Log(title = "说说评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogSayComment blogSayComment)
    {
        List<BlogSayComment> list = blogSayCommentService.selectBlogSayCommentList(blogSayComment);
        ExcelUtil<BlogSayComment> util = new ExcelUtil<BlogSayComment>(BlogSayComment.class);
        util.exportExcel(response, list, "说说评论数据");
    }

    /**
     * 获取说说评论详细信息
     */
    @RequiresPermissions("blog:sayComment:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogSayCommentService.selectBlogSayCommentById(id));
    }

    /**
     * 新增说说评论
     */
    @RequiresPermissions("blog:sayComment:add")
    @Log(title = "说说评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogSayComment blogSayComment)
    {
        return toAjax(blogSayCommentService.insertBlogSayComment(blogSayComment));
    }

    /**
     * 修改说说评论
     */
    @RequiresPermissions("blog:sayComment:edit")
    @Log(title = "说说评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogSayComment blogSayComment)
    {
        return toAjax(blogSayCommentService.updateBlogSayComment(blogSayComment));
    }

    /**
     * 删除说说评论
     */
    @RequiresPermissions("blog:sayComment:remove")
    @Log(title = "说说评论", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogSayCommentService.deleteBlogSayCommentByIds(ids));
    }
}
