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
import me.mcx.blog.domain.BlogFeedBack;
import me.mcx.blog.service.admin.IBlogFeedBackService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 问题反馈Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/feedBack")
public class BlogFeedBackController extends BaseController
{
    @Autowired
    private IBlogFeedBackService blogFeedBackService;

    /**
     * 查询问题反馈列表
     */
    @RequiresPermissions("blog:feedBack:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogFeedBack blogFeedBack)
    {
        startPage();
        List<BlogFeedBack> list = blogFeedBackService.selectBlogFeedBackList(blogFeedBack);
        return getDataTable(list);
    }

    /**
     * 导出问题反馈列表
     */
    @RequiresPermissions("blog:feedBack:export")
    @Log(title = "问题反馈", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogFeedBack blogFeedBack)
    {
        List<BlogFeedBack> list = blogFeedBackService.selectBlogFeedBackList(blogFeedBack);
        ExcelUtil<BlogFeedBack> util = new ExcelUtil<BlogFeedBack>(BlogFeedBack.class);
        util.exportExcel(response, list, "问题反馈数据");
    }

    /**
     * 获取问题反馈详细信息
     */
    @RequiresPermissions("blog:feedBack:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogFeedBackService.selectBlogFeedBackById(id));
    }

    /**
     * 新增问题反馈
     */
    @RequiresPermissions("blog:feedBack:add")
    @Log(title = "问题反馈", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogFeedBack blogFeedBack)
    {
        return toAjax(blogFeedBackService.insertBlogFeedBack(blogFeedBack));
    }

    /**
     * 修改问题反馈
     */
    @RequiresPermissions("blog:feedBack:edit")
    @Log(title = "问题反馈", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogFeedBack blogFeedBack)
    {
        return toAjax(blogFeedBackService.updateBlogFeedBack(blogFeedBack));
    }

    /**
     * 删除问题反馈
     */
    @RequiresPermissions("blog:feedBack:remove")
    @Log(title = "问题反馈", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogFeedBackService.deleteBlogFeedBackByIds(ids));
    }
}
