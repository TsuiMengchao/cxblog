package me.mcx.modules.blog.admin.rest;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.SystemConfig;
import me.mcx.modules.blog.admin.service.SystemConfigService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 系统配置表 前端控制器
 * </p>
 *
 * @author MCX
 * @since 2021-11-25
 */
@RestController
@RequestMapping("/api/config")
@Api(tags = "系统配置管理")
@RequiredArgsConstructor
public class SystemConfigController {

    private final SystemConfigService systemConfigService;

    @AnonymousGetMapping(value = "/getConfig")
    @PreAuthorize("@cx.check('systemConfig:getConfig')")
    @ApiOperation(value = "查询系统配置", httpMethod = "GET", response = ResponseResult.class, notes = "查询系统配置")
    public ResponseResult getConfig(){
        return systemConfigService.getConfig();
    }

    @PostMapping(value = "/update")
    @PreAuthorize("@cx.check('systemConfig:edit')")
    @ApiOperation(value = "修改系统配置", httpMethod = "POST", response = ResponseResult.class, notes = "修改系统配置")
    @Log(value = "修改系统配置")
    public ResponseResult update(@RequestBody SystemConfig apiConfig){
        return systemConfigService.updateConfig(apiConfig);
    }
}

