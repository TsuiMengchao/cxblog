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
import me.mcx.blog.domain.BlogFriendLink;
import me.mcx.blog.service.admin.IBlogFriendLinkService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 友情链接Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/friendLink")
public class BlogFriendLinkController extends BaseController
{
    @Autowired
    private IBlogFriendLinkService blogFriendLinkService;

    /**
     * 查询友情链接列表
     */
    @RequiresPermissions("blog:friendLink:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogFriendLink blogFriendLink)
    {
        startPage();
        List<BlogFriendLink> list = blogFriendLinkService.selectBlogFriendLinkList(blogFriendLink);
        return getDataTable(list);
    }

    /**
     * 导出友情链接列表
     */
    @RequiresPermissions("blog:friendLink:export")
    @Log(title = "友情链接", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogFriendLink blogFriendLink)
    {
        List<BlogFriendLink> list = blogFriendLinkService.selectBlogFriendLinkList(blogFriendLink);
        ExcelUtil<BlogFriendLink> util = new ExcelUtil<BlogFriendLink>(BlogFriendLink.class);
        util.exportExcel(response, list, "友情链接数据");
    }

    /**
     * 获取友情链接详细信息
     */
    @RequiresPermissions("blog:friendLink:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogFriendLinkService.selectBlogFriendLinkById(id));
    }

    /**
     * 新增友情链接
     */
    @RequiresPermissions("blog:friendLink:add")
    @Log(title = "友情链接", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogFriendLink blogFriendLink)
    {
        return toAjax(blogFriendLinkService.insertBlogFriendLink(blogFriendLink));
    }

    /**
     * 修改友情链接
     */
    @RequiresPermissions("blog:friendLink:edit")
    @Log(title = "友情链接", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogFriendLink blogFriendLink)
    {
        return toAjax(blogFriendLinkService.updateBlogFriendLink(blogFriendLink));
    }

    /**
     * 删除友情链接
     */
    @RequiresPermissions("blog:friendLink:remove")
    @Log(title = "友情链接", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogFriendLinkService.deleteBlogFriendLinkByIds(ids));
    }
}
