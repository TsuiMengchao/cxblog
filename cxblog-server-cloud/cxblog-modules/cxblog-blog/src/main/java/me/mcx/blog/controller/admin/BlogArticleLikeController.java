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
import me.mcx.blog.domain.BlogArticleLike;
import me.mcx.blog.service.admin.IBlogArticleLikeService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 文章收藏Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/articleLike")
public class BlogArticleLikeController extends BaseController
{
    @Autowired
    private IBlogArticleLikeService blogArticleLikeService;

    /**
     * 查询文章收藏列表
     */
    @RequiresPermissions("blog:articleLike:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogArticleLike blogArticleLike)
    {
        startPage();
        List<BlogArticleLike> list = blogArticleLikeService.selectBlogArticleLikeList(blogArticleLike);
        return getDataTable(list);
    }

    /**
     * 导出文章收藏列表
     */
    @RequiresPermissions("blog:articleLike:export")
    @Log(title = "文章收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogArticleLike blogArticleLike)
    {
        List<BlogArticleLike> list = blogArticleLikeService.selectBlogArticleLikeList(blogArticleLike);
        ExcelUtil<BlogArticleLike> util = new ExcelUtil<BlogArticleLike>(BlogArticleLike.class);
        util.exportExcel(response, list, "文章收藏数据");
    }

    /**
     * 获取文章收藏详细信息
     */
    @RequiresPermissions("blog:articleLike:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogArticleLikeService.selectBlogArticleLikeById(id));
    }

    /**
     * 新增文章收藏
     */
    @RequiresPermissions("blog:articleLike:add")
    @Log(title = "文章收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogArticleLike blogArticleLike)
    {
        return toAjax(blogArticleLikeService.insertBlogArticleLike(blogArticleLike));
    }

    /**
     * 修改文章收藏
     */
    @RequiresPermissions("blog:articleLike:edit")
    @Log(title = "文章收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogArticleLike blogArticleLike)
    {
        return toAjax(blogArticleLikeService.updateBlogArticleLike(blogArticleLike));
    }

    /**
     * 删除文章收藏
     */
    @RequiresPermissions("blog:articleLike:remove")
    @Log(title = "文章收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogArticleLikeService.deleteBlogArticleLikeByIds(ids));
    }
}
