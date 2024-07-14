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
import me.mcx.blog.domain.BlogTipsoonCollect;
import me.mcx.blog.service.admin.IBlogTipsoonCollectService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 简讯收藏Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/tipsoonCollect")
public class BlogTipsoonCollectController extends BaseController
{
    @Autowired
    private IBlogTipsoonCollectService blogTipsoonCollectService;

    /**
     * 查询简讯收藏列表
     */
    @RequiresPermissions("blog:tipsoonCollect:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogTipsoonCollect blogTipsoonCollect)
    {
        startPage();
        List<BlogTipsoonCollect> list = blogTipsoonCollectService.selectBlogTipsoonCollectList(blogTipsoonCollect);
        return getDataTable(list);
    }

    /**
     * 导出简讯收藏列表
     */
    @RequiresPermissions("blog:tipsoonCollect:export")
    @Log(title = "简讯收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogTipsoonCollect blogTipsoonCollect)
    {
        List<BlogTipsoonCollect> list = blogTipsoonCollectService.selectBlogTipsoonCollectList(blogTipsoonCollect);
        ExcelUtil<BlogTipsoonCollect> util = new ExcelUtil<BlogTipsoonCollect>(BlogTipsoonCollect.class);
        util.exportExcel(response, list, "简讯收藏数据");
    }

    /**
     * 获取简讯收藏详细信息
     */
    @RequiresPermissions("blog:tipsoonCollect:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogTipsoonCollectService.selectBlogTipsoonCollectById(id));
    }

    /**
     * 新增简讯收藏
     */
    @RequiresPermissions("blog:tipsoonCollect:add")
    @Log(title = "简讯收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogTipsoonCollect blogTipsoonCollect)
    {
        return toAjax(blogTipsoonCollectService.insertBlogTipsoonCollect(blogTipsoonCollect));
    }

    /**
     * 修改简讯收藏
     */
    @RequiresPermissions("blog:tipsoonCollect:edit")
    @Log(title = "简讯收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogTipsoonCollect blogTipsoonCollect)
    {
        return toAjax(blogTipsoonCollectService.updateBlogTipsoonCollect(blogTipsoonCollect));
    }

    /**
     * 删除简讯收藏
     */
    @RequiresPermissions("blog:tipsoonCollect:remove")
    @Log(title = "简讯收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogTipsoonCollectService.deleteBlogTipsoonCollectByIds(ids));
    }
}
