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
import me.mcx.blog.domain.BlogSay;
import me.mcx.blog.service.admin.IBlogSayService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 说说Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/say")
public class BlogSayController extends BaseController
{
    @Autowired
    private IBlogSayService blogSayService;

    /**
     * 查询说说列表
     */
    @RequiresPermissions("blog:say:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogSay blogSay)
    {
        startPage();
        List<BlogSay> list = blogSayService.selectBlogSayList(blogSay);
        return getDataTable(list);
    }

    /**
     * 导出说说列表
     */
    @RequiresPermissions("blog:say:export")
    @Log(title = "说说", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogSay blogSay)
    {
        List<BlogSay> list = blogSayService.selectBlogSayList(blogSay);
        ExcelUtil<BlogSay> util = new ExcelUtil<BlogSay>(BlogSay.class);
        util.exportExcel(response, list, "说说数据");
    }

    /**
     * 获取说说详细信息
     */
    @RequiresPermissions("blog:say:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(blogSayService.selectBlogSayById(id));
    }

    /**
     * 新增说说
     */
    @RequiresPermissions("blog:say:add")
    @Log(title = "说说", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogSay blogSay)
    {
        return toAjax(blogSayService.insertBlogSay(blogSay));
    }

    /**
     * 修改说说
     */
    @RequiresPermissions("blog:say:edit")
    @Log(title = "说说", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogSay blogSay)
    {
        return toAjax(blogSayService.updateBlogSay(blogSay));
    }

    /**
     * 删除说说
     */
    @RequiresPermissions("blog:say:remove")
    @Log(title = "说说", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(blogSayService.deleteBlogSayByIds(ids));
    }
}
