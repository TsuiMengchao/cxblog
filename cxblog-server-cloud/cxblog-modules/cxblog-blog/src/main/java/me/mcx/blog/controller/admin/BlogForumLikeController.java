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
import me.mcx.blog.domain.BlogForumLike;
import me.mcx.blog.service.admin.IBlogForumLikeService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 圈子内容点赞Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/forumLike")
public class BlogForumLikeController extends BaseController
{
    @Autowired
    private IBlogForumLikeService blogForumLikeService;

    /**
     * 查询圈子内容点赞列表
     */
    @RequiresPermissions("blog:forumLike:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogForumLike blogForumLike)
    {
        startPage();
        List<BlogForumLike> list = blogForumLikeService.selectBlogForumLikeList(blogForumLike);
        return getDataTable(list);
    }

    /**
     * 导出圈子内容点赞列表
     */
    @RequiresPermissions("blog:forumLike:export")
    @Log(title = "圈子内容点赞", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogForumLike blogForumLike)
    {
        List<BlogForumLike> list = blogForumLikeService.selectBlogForumLikeList(blogForumLike);
        ExcelUtil<BlogForumLike> util = new ExcelUtil<BlogForumLike>(BlogForumLike.class);
        util.exportExcel(response, list, "圈子内容点赞数据");
    }

    /**
     * 获取圈子内容点赞详细信息
     */
    @RequiresPermissions("blog:forumLike:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogForumLikeService.selectBlogForumLikeById(id));
    }

    /**
     * 新增圈子内容点赞
     */
    @RequiresPermissions("blog:forumLike:add")
    @Log(title = "圈子内容点赞", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogForumLike blogForumLike)
    {
        return toAjax(blogForumLikeService.insertBlogForumLike(blogForumLike));
    }

    /**
     * 修改圈子内容点赞
     */
    @RequiresPermissions("blog:forumLike:edit")
    @Log(title = "圈子内容点赞", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogForumLike blogForumLike)
    {
        return toAjax(blogForumLikeService.updateBlogForumLike(blogForumLike));
    }

    /**
     * 删除圈子内容点赞
     */
    @RequiresPermissions("blog:forumLike:remove")
    @Log(title = "圈子内容点赞", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogForumLikeService.deleteBlogForumLikeByIds(ids));
    }
}
