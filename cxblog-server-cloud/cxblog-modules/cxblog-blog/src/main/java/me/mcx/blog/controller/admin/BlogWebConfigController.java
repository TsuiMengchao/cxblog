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
import me.mcx.blog.domain.BlogWebConfig;
import me.mcx.blog.service.admin.IBlogWebConfigService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 网站配置Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/webConfig")
public class BlogWebConfigController extends BaseController
{
    @Autowired
    private IBlogWebConfigService blogWebConfigService;

    @Autowired
    private IBlogWebConfigService webConfigService;

    /**
     * 查询网站配置列表
     */
    @RequiresPermissions("blog:webConfig:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogWebConfig blogWebConfig)
    {
        startPage();
        List<BlogWebConfig> list = blogWebConfigService.selectBlogWebConfigList(blogWebConfig);
        return getDataTable(list);
    }

    /**
     * 导出网站配置列表
     */
    @RequiresPermissions("blog:webConfig:export")
    @Log(title = "网站配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogWebConfig blogWebConfig)
    {
        List<BlogWebConfig> list = blogWebConfigService.selectBlogWebConfigList(blogWebConfig);
        ExcelUtil<BlogWebConfig> util = new ExcelUtil<BlogWebConfig>(BlogWebConfig.class);
        util.exportExcel(response, list, "网站配置数据");
    }

    /**
     * 获取网站配置详细信息
     */
    @RequiresPermissions("blog:webConfig:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogWebConfigService.selectBlogWebConfigById(id));
    }

    /**
     * 新增网站配置
     */
    @RequiresPermissions("blog:webConfig:add")
    @Log(title = "网站配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogWebConfig blogWebConfig)
    {
        return toAjax(blogWebConfigService.insertBlogWebConfig(blogWebConfig));
    }

    /**
     * 修改网站配置
     */
    @RequiresPermissions("blog:webConfig:edit")
    @Log(title = "网站配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogWebConfig blogWebConfig)
    {
        return toAjax(blogWebConfigService.updateBlogWebConfig(blogWebConfig));
    }

    /**
     * 删除网站配置
     */
    @RequiresPermissions("blog:webConfig:remove")
    @Log(title = "网站配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogWebConfigService.deleteBlogWebConfigByIds(ids));
    }

    // new

    /**
     * 网站配置列表
     * @return
     */
    @GetMapping
    public AjaxResult getWebConfig() {
        return webConfigService.getWebConfig();
    }

    /**
     * 修改网站配置
     * @param webConfig
     * @return
     */
    @PutMapping(value = "/update")
    @RequiresPermissions("blog:webConfig:update")
    public AjaxResult updateWebConfig(@RequestBody BlogWebConfig webConfig) {
        return webConfigService.updateWebConfig(webConfig);
    }
}
