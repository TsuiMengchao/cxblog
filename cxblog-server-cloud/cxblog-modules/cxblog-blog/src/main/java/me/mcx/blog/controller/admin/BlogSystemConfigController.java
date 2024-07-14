package me.mcx.blog.controller.admin;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import me.mcx.common.log.annotation.Log;
import me.mcx.common.log.enums.BusinessType;
import me.mcx.common.security.annotation.RequiresPermissions;
import me.mcx.blog.domain.BlogSystemConfig;
import me.mcx.blog.service.admin.IBlogSystemConfigService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 系统配置Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/systemConfig")
public class BlogSystemConfigController extends BaseController
{
    @Autowired
    private IBlogSystemConfigService blogSystemConfigService;

    @Autowired
    private IBlogSystemConfigService systemConfigService;

    /**
     * 查询系统配置列表
     */
    @RequiresPermissions("blog:systemConfig:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogSystemConfig blogSystemConfig)
    {
        startPage();
        List<BlogSystemConfig> list = blogSystemConfigService.selectBlogSystemConfigList(blogSystemConfig);
        return getDataTable(list);
    }

    /**
     * 导出系统配置列表
     */
    @RequiresPermissions("blog:systemConfig:export")
    @Log(title = "系统配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogSystemConfig blogSystemConfig)
    {
        List<BlogSystemConfig> list = blogSystemConfigService.selectBlogSystemConfigList(blogSystemConfig);
        ExcelUtil<BlogSystemConfig> util = new ExcelUtil<BlogSystemConfig>(BlogSystemConfig.class);
        util.exportExcel(response, list, "系统配置数据");
    }

    /**
     * 获取系统配置详细信息
     */
    @RequiresPermissions("blog:systemConfig:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogSystemConfigService.selectBlogSystemConfigById(id));
    }

    /**
     * 新增系统配置
     */
    @RequiresPermissions("blog:systemConfig:add")
    @Log(title = "系统配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogSystemConfig blogSystemConfig)
    {
        return toAjax(blogSystemConfigService.insertBlogSystemConfig(blogSystemConfig));
    }

    /**
     * 修改系统配置
     */
    @RequiresPermissions("blog:systemConfig:edit")
    @Log(title = "系统配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogSystemConfig blogSystemConfig)
    {
        return toAjax(blogSystemConfigService.updateBlogSystemConfig(blogSystemConfig));
    }

    /**
     * 删除系统配置
     */
    @RequiresPermissions("blog:systemConfig:remove")
    @Log(title = "系统配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogSystemConfigService.deleteBlogSystemConfigByIds(ids));
    }

    /**
     * 查询系统配置
     * @return
     */
    @RequestMapping(value = "/getConfig",method = RequestMethod.GET)
    public AjaxResult getSystemConfig(){
        return systemConfigService.getSystemConfig();
    }

    /**
     * 修改系统配置
     * @param systemConfig
     * @return
     */
    @RequestMapping(value = "/update",method = RequestMethod.PUT)
    @RequiresPermissions("blog:sysConfig:edit")
    public AjaxResult updateSystemConfig(@RequestBody BlogSystemConfig systemConfig){
        return systemConfigService.updateSystemConfig(systemConfig);
    }
}
