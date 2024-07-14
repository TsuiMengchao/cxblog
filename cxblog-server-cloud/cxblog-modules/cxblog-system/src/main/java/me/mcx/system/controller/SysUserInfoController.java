package me.mcx.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import me.mcx.common.core.domain.R;
import me.mcx.system.api.domain.SysUserInfo;
import me.mcx.system.api.model.LoginUser;
import me.mcx.system.api.model.user.UserInfoVO;
import me.mcx.system.service.ISysUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import me.mcx.common.log.annotation.Log;
import me.mcx.common.log.enums.BusinessType;
import me.mcx.common.security.annotation.RequiresPermissions;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 用户信息Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/userInfo")
public class SysUserInfoController extends BaseController
{
    @Autowired
    private ISysUserInfoService sysUserInfoService;

    /**
     * 查询用户信息列表
     */
    @RequiresPermissions("sys:userInfo:list")
    @GetMapping("/list")
    public TableDataInfo list(SysUserInfo sysUserInfo)
    {
        startPage();
        List<SysUserInfo> list = sysUserInfoService.selectSysUserInfoList(sysUserInfo);
        return getDataTable(list);
    }

    /**
     * 导出用户信息列表
     */
    @RequiresPermissions("sys:userInfo:export")
    @Log(title = "用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUserInfo sysUserInfo)
    {
        List<SysUserInfo> list = sysUserInfoService.selectSysUserInfoList(sysUserInfo);
        ExcelUtil<SysUserInfo> util = new ExcelUtil<SysUserInfo>(SysUserInfo.class);
        util.exportExcel(response, list, "用户信息数据");
    }

    /**
     * 获取用户信息详细信息
     */
    @RequiresPermissions("sys:userInfo:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysUserInfoService.selectSysUserInfoById(id));
    }

    /**
     * 新增用户信息
     */
    @RequiresPermissions("sys:userInfo:add")
    @Log(title = "用户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserInfo sysUserInfo)
    {
        return toAjax(sysUserInfoService.insertSysUserInfo(sysUserInfo));
    }

    /**
     * 修改用户信息
     */
    @RequiresPermissions("sys:userInfo:edit")
    @Log(title = "用户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserInfo sysUserInfo)
    {
        return toAjax(sysUserInfoService.updateSysUserInfo(sysUserInfo));
    }

    /**
     * 删除用户信息
     */
    @RequiresPermissions("sys:userInfo:remove")
    @Log(title = "用户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysUserInfoService.deleteSysUserInfoByIds(ids));
    }

    @GetMapping("/selectUserInfoByUserId")
    public R<UserInfoVO> selectUserInfo(@RequestParam("userId") String userId) {
        return R.ok(sysUserInfoService.selectUserInfoByUserId(userId));
    }

    @GetMapping("/selectInfoByUserId")
    public R<UserInfoVO> selectInfoByUserId(@RequestParam("userId") String userId) {
        return R.ok(sysUserInfoService.selectInfoByUserId(userId));
    }

    @GetMapping("/selectInfoByUserIdNew")
    public R<UserInfoVO> selectInfoByUserIdNew(@RequestParam("userId") String userId) {
        return R.ok(sysUserInfoService.selectInfoByUserIdNew(userId));
    }

    @GetMapping("/selectInfoByUserIdTwo")
    public R<UserInfoVO> selectInfoByUserIdTwo(@RequestParam("userId") String userId) {
        return R.ok(sysUserInfoService.selectInfoByUserIdTwo(userId));
    }

    @GetMapping("/getByUserId")
    public R<UserInfoVO> getByUserId(@RequestParam("userId") String userId) {
        return R.ok(sysUserInfoService.getByUserId(userId));
    }
}
