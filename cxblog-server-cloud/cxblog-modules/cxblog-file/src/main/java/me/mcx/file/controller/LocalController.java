package me.mcx.file.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import io.swagger.annotations.ApiOperation;
import me.mcx.file.domain.FileLocalConfig;
import me.mcx.file.service.IFileLocalConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import me.mcx.common.log.annotation.Log;
import me.mcx.common.log.enums.BusinessType;
import me.mcx.common.security.annotation.RequiresPermissions;
import me.mcx.file.domain.FileLocalContent;
import me.mcx.file.service.IFileLocalContentService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 本地存储Controller
 * 
 * @author mcx
 * @date 2024-05-08
 */
@RestController
@RequestMapping("/local")
public class LocalController extends BaseController
{
    @Autowired
    private IFileLocalContentService fileLocalContentService;
    @Autowired
    private IFileLocalConfigService fileLocalConfigService;

    @GetMapping(value = "/config")
    public AjaxResult getInfo()
    {
        return success(fileLocalConfigService.selectFileLocalConfigByConfigId(1L));
    }

    @PutMapping(value = "/config")
    public AjaxResult edit(@RequestBody FileLocalConfig fileLocalConfig)
    {
        return toAjax(fileLocalConfigService.updateFileLocalConfig(fileLocalConfig));
    }

    /**
     * 查询本地存储列表
     */
    @RequiresPermissions("file:local:list")
    @GetMapping("/list")
    public TableDataInfo list(FileLocalContent fileLocalContent)
    {
        startPage();
        List<FileLocalContent> list = fileLocalContentService.selectFileLocalContentList(fileLocalContent);
        return getDataTable(list);
    }

    /**
     * 导出本地存储列表
     */
    @RequiresPermissions("file:local:export")
    @Log(title = "本地存储", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileLocalContent fileLocalContent)
    {
        List<FileLocalContent> list = fileLocalContentService.selectFileLocalContentList(fileLocalContent);
        ExcelUtil<FileLocalContent> util = new ExcelUtil<FileLocalContent>(FileLocalContent.class);
        util.exportExcel(response, list, "本地存储数据");
    }

    /**
     * 获取本地存储详细信息
     */
    @RequiresPermissions("file:local:query")
    @GetMapping(value = "/{storageId}")
    public AjaxResult getInfo(@PathVariable("storageId") Long storageId)
    {
        return success(fileLocalContentService.selectFileLocalContentByStorageId(storageId));
    }

    /**
     * 上传文件
     */
    @RequiresPermissions("file:local:add")
    @Log(title = "本地存储", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestParam String name, @RequestParam("file") MultipartFile file)
    {
        return success(fileLocalContentService.create(name, file));
    }

    /**
     * 修改本地存储
     */
    @RequiresPermissions("file:local:edit")
    @Log(title = "本地存储", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileLocalContent fileLocalContent)
    {
        return toAjax(fileLocalContentService.updateFileLocalContent(fileLocalContent));
    }

    /**
     * 删除本地存储
     */
    @RequiresPermissions("file:local:remove")
    @Log(title = "本地存储", businessType = BusinessType.DELETE)
	@DeleteMapping("/{storageIds}")
    public AjaxResult remove(@PathVariable Long[] storageIds)
    {
        return toAjax(fileLocalContentService.deleteFileLocalContentByStorageIds(storageIds));
    }
}
