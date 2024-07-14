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
import me.mcx.blog.domain.BlogImRoom;
import me.mcx.blog.service.admin.IBlogImRoomService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 用户消息房间Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/imRoom")
public class BlogImRoomController extends BaseController
{
    @Autowired
    private IBlogImRoomService blogImRoomService;

    /**
     * 查询用户消息房间列表
     */
    @RequiresPermissions("blog:imRoom:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogImRoom blogImRoom)
    {
        startPage();
        List<BlogImRoom> list = blogImRoomService.selectBlogImRoomList(blogImRoom);
        return getDataTable(list);
    }

    /**
     * 导出用户消息房间列表
     */
    @RequiresPermissions("blog:imRoom:export")
    @Log(title = "用户消息房间", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogImRoom blogImRoom)
    {
        List<BlogImRoom> list = blogImRoomService.selectBlogImRoomList(blogImRoom);
        ExcelUtil<BlogImRoom> util = new ExcelUtil<BlogImRoom>(BlogImRoom.class);
        util.exportExcel(response, list, "用户消息房间数据");
    }

    /**
     * 获取用户消息房间详细信息
     */
    @RequiresPermissions("blog:imRoom:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(blogImRoomService.selectBlogImRoomById(id));
    }

    /**
     * 新增用户消息房间
     */
    @RequiresPermissions("blog:imRoom:add")
    @Log(title = "用户消息房间", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogImRoom blogImRoom)
    {
        return toAjax(blogImRoomService.insertBlogImRoom(blogImRoom));
    }

    /**
     * 修改用户消息房间
     */
    @RequiresPermissions("blog:imRoom:edit")
    @Log(title = "用户消息房间", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogImRoom blogImRoom)
    {
        return toAjax(blogImRoomService.updateBlogImRoom(blogImRoom));
    }

    /**
     * 删除用户消息房间
     */
    @RequiresPermissions("blog:imRoom:remove")
    @Log(title = "用户消息房间", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(blogImRoomService.deleteBlogImRoomByIds(ids));
    }
}
