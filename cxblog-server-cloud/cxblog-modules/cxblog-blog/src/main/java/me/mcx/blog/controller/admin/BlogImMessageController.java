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
import me.mcx.blog.domain.BlogImMessage;
import me.mcx.blog.service.admin.IBlogImMessageService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 即时消息Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/imMessage")
public class BlogImMessageController extends BaseController
{
    @Autowired
    private IBlogImMessageService blogImMessageService;

    /**
     * 查询即时消息列表
     */
    @RequiresPermissions("blog:imMessage:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogImMessage blogImMessage)
    {
        startPage();
        List<BlogImMessage> list = blogImMessageService.selectBlogImMessageList(blogImMessage);
        return getDataTable(list);
    }

    /**
     * 导出即时消息列表
     */
    @RequiresPermissions("blog:imMessage:export")
    @Log(title = "即时消息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogImMessage blogImMessage)
    {
        List<BlogImMessage> list = blogImMessageService.selectBlogImMessageList(blogImMessage);
        ExcelUtil<BlogImMessage> util = new ExcelUtil<BlogImMessage>(BlogImMessage.class);
        util.exportExcel(response, list, "即时消息数据");
    }

    /**
     * 获取即时消息详细信息
     */
    @RequiresPermissions("blog:imMessage:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(blogImMessageService.selectBlogImMessageById(id));
    }

    /**
     * 新增即时消息
     */
    @RequiresPermissions("blog:imMessage:add")
    @Log(title = "即时消息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogImMessage blogImMessage)
    {
        return toAjax(blogImMessageService.insertBlogImMessage(blogImMessage));
    }

    /**
     * 修改即时消息
     */
    @RequiresPermissions("blog:imMessage:edit")
    @Log(title = "即时消息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogImMessage blogImMessage)
    {
        return toAjax(blogImMessageService.updateBlogImMessage(blogImMessage));
    }

    /**
     * 删除即时消息
     */
    @RequiresPermissions("blog:imMessage:remove")
    @Log(title = "即时消息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(blogImMessageService.deleteBlogImMessageByIds(ids));
    }
}
