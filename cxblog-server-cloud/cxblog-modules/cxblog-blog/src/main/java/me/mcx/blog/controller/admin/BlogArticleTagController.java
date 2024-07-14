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
import me.mcx.blog.domain.BlogArticleTag;
import me.mcx.blog.service.admin.IBlogArticleTagService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 文章标签Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/articleTag")
public class BlogArticleTagController extends BaseController
{
    @Autowired
    private IBlogArticleTagService blogArticleTagService;

    /**
     * 查询文章标签列表
     */
    @RequiresPermissions("blog:articleTag:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogArticleTag blogArticleTag)
    {
        startPage();
        List<BlogArticleTag> list = blogArticleTagService.selectBlogArticleTagList(blogArticleTag);
        return getDataTable(list);
    }

    /**
     * 导出文章标签列表
     */
    @RequiresPermissions("blog:articleTag:export")
    @Log(title = "文章标签", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogArticleTag blogArticleTag)
    {
        List<BlogArticleTag> list = blogArticleTagService.selectBlogArticleTagList(blogArticleTag);
        ExcelUtil<BlogArticleTag> util = new ExcelUtil<BlogArticleTag>(BlogArticleTag.class);
        util.exportExcel(response, list, "文章标签数据");
    }

    /**
     * 获取文章标签详细信息
     */
    @RequiresPermissions("blog:articleTag:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogArticleTagService.selectBlogArticleTagById(id));
    }

    /**
     * 新增文章标签
     */
    @RequiresPermissions("blog:articleTag:add")
    @Log(title = "文章标签", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogArticleTag blogArticleTag)
    {
        return toAjax(blogArticleTagService.insertBlogArticleTag(blogArticleTag));
    }

    /**
     * 修改文章标签
     */
    @RequiresPermissions("blog:articleTag:edit")
    @Log(title = "文章标签", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogArticleTag blogArticleTag)
    {
        return toAjax(blogArticleTagService.updateBlogArticleTag(blogArticleTag));
    }

    /**
     * 删除文章标签
     */
    @RequiresPermissions("blog:articleTag:remove")
    @Log(title = "文章标签", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogArticleTagService.deleteBlogArticleTagByIds(ids));
    }
}
