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
import me.mcx.blog.domain.BlogFollowed;
import me.mcx.blog.service.admin.IBlogFollowedService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 用户关注Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/followed")
public class BlogFollowedController extends BaseController
{
    @Autowired
    private IBlogFollowedService blogFollowedService;

    /**
     * 查询用户关注列表
     */
    @RequiresPermissions("blog:followed:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogFollowed blogFollowed)
    {
        startPage();
        List<BlogFollowed> list = blogFollowedService.selectBlogFollowedList(blogFollowed);
        return getDataTable(list);
    }

    /**
     * 导出用户关注列表
     */
    @RequiresPermissions("blog:followed:export")
    @Log(title = "用户关注", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogFollowed blogFollowed)
    {
        List<BlogFollowed> list = blogFollowedService.selectBlogFollowedList(blogFollowed);
        ExcelUtil<BlogFollowed> util = new ExcelUtil<BlogFollowed>(BlogFollowed.class);
        util.exportExcel(response, list, "用户关注数据");
    }

    /**
     * 获取用户关注详细信息
     */
    @RequiresPermissions("blog:followed:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogFollowedService.selectBlogFollowedById(id));
    }

    /**
     * 新增用户关注
     */
    @RequiresPermissions("blog:followed:add")
    @Log(title = "用户关注", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogFollowed blogFollowed)
    {
        return toAjax(blogFollowedService.insertBlogFollowed(blogFollowed));
    }

    /**
     * 修改用户关注
     */
    @RequiresPermissions("blog:followed:edit")
    @Log(title = "用户关注", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogFollowed blogFollowed)
    {
        return toAjax(blogFollowedService.updateBlogFollowed(blogFollowed));
    }

    /**
     * 删除用户关注
     */
    @RequiresPermissions("blog:followed:remove")
    @Log(title = "用户关注", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogFollowedService.deleteBlogFollowedByIds(ids));
    }
}
