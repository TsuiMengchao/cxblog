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
import me.mcx.blog.domain.BlogTipsoonLike;
import me.mcx.blog.service.admin.IBlogTipsoonLikeService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 简讯点赞Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/tipsoonLike")
public class BlogTipsoonLikeController extends BaseController
{
    @Autowired
    private IBlogTipsoonLikeService blogTipsoonLikeService;

    /**
     * 查询简讯点赞列表
     */
    @RequiresPermissions("blog:tipsoonLike:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogTipsoonLike blogTipsoonLike)
    {
        startPage();
        List<BlogTipsoonLike> list = blogTipsoonLikeService.selectBlogTipsoonLikeList(blogTipsoonLike);
        return getDataTable(list);
    }

    /**
     * 导出简讯点赞列表
     */
    @RequiresPermissions("blog:tipsoonLike:export")
    @Log(title = "简讯点赞", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogTipsoonLike blogTipsoonLike)
    {
        List<BlogTipsoonLike> list = blogTipsoonLikeService.selectBlogTipsoonLikeList(blogTipsoonLike);
        ExcelUtil<BlogTipsoonLike> util = new ExcelUtil<BlogTipsoonLike>(BlogTipsoonLike.class);
        util.exportExcel(response, list, "简讯点赞数据");
    }

    /**
     * 获取简讯点赞详细信息
     */
    @RequiresPermissions("blog:tipsoonLike:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogTipsoonLikeService.selectBlogTipsoonLikeById(id));
    }

    /**
     * 新增简讯点赞
     */
    @RequiresPermissions("blog:tipsoonLike:add")
    @Log(title = "简讯点赞", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogTipsoonLike blogTipsoonLike)
    {
        return toAjax(blogTipsoonLikeService.insertBlogTipsoonLike(blogTipsoonLike));
    }

    /**
     * 修改简讯点赞
     */
    @RequiresPermissions("blog:tipsoonLike:edit")
    @Log(title = "简讯点赞", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogTipsoonLike blogTipsoonLike)
    {
        return toAjax(blogTipsoonLikeService.updateBlogTipsoonLike(blogTipsoonLike));
    }

    /**
     * 删除简讯点赞
     */
    @RequiresPermissions("blog:tipsoonLike:remove")
    @Log(title = "简讯点赞", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogTipsoonLikeService.deleteBlogTipsoonLikeByIds(ids));
    }
}
