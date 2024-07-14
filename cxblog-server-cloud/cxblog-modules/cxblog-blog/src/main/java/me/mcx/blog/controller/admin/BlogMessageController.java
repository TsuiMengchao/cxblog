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
import me.mcx.blog.domain.BlogMessage;
import me.mcx.blog.service.admin.IBlogMessageService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 留言Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/message")
public class BlogMessageController extends BaseController
{
    @Autowired
    private IBlogMessageService blogMessageService;

    /**
     * 查询留言列表
     */
    @RequiresPermissions("blog:message:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogMessage blogMessage)
    {
        startPage();
        List<BlogMessage> list = blogMessageService.selectBlogMessageList(blogMessage);
        return getDataTable(list);
    }

    /**
     * 导出留言列表
     */
    @RequiresPermissions("blog:message:export")
    @Log(title = "留言", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogMessage blogMessage)
    {
        List<BlogMessage> list = blogMessageService.selectBlogMessageList(blogMessage);
        ExcelUtil<BlogMessage> util = new ExcelUtil<BlogMessage>(BlogMessage.class);
        util.exportExcel(response, list, "留言数据");
    }

    /**
     * 获取留言详细信息
     */
    @RequiresPermissions("blog:message:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogMessageService.selectBlogMessageById(id));
    }

    /**
     * 新增留言
     */
    @RequiresPermissions("blog:message:add")
    @Log(title = "留言", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogMessage blogMessage)
    {
        return toAjax(blogMessageService.insertBlogMessage(blogMessage));
    }

    /**
     * 修改留言
     */
    @RequiresPermissions("blog:message:edit")
    @Log(title = "留言", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogMessage blogMessage)
    {
        return toAjax(blogMessageService.updateBlogMessage(blogMessage));
    }

    /**
     * 删除留言
     */
    @RequiresPermissions("blog:message:remove")
    @Log(title = "留言", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogMessageService.deleteBlogMessageByIds(ids));
    }
}
