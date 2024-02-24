package me.mcx.modules.blog.admin.rest;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.SiteClass;
import me.mcx.modules.blog.admin.service.SiteClassService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author MCX
 * @since 2022-01-13
 */
@RestController
@RequestMapping("/api/siteClass")
@Api(tags = "后台网址分类管理")
@RequiredArgsConstructor
public class SiteClassController {

    private final SiteClassService siteClassService;

    @PreAuthorize("@cx.check('siteClass:list')")
    @GetMapping(value = "/list")
    @ApiOperation(value = "网址分类列表", httpMethod = "GET", response = ResponseResult.class, notes = "网址分类列表")
    public ResponseResult selectSiteClassList() {
        return siteClassService.selectSiteClassList();
    }

    @PostMapping(value = "/insert")
    @PreAuthorize("@cx.check('siteClass:add')")
    @ApiOperation(value = "添加网址分类", httpMethod = "POST", response = ResponseResult.class, notes = "添加网址分类")
    @Log(value = "添加网址分类")
    public ResponseResult insert(@RequestBody SiteClass siteClass) {
        return siteClassService.insertSiteClass(siteClass);
    }

    @PutMapping(value = "/update")
    @PreAuthorize("@cx.check('siteClass:edit')")
    @ApiOperation(value = "修改网址分类", httpMethod = "PUT", response = ResponseResult.class, notes = "修改网址分类")
    @Log(value = "修改网址分类")
    public ResponseResult update(@RequestBody SiteClass siteClass) {
        return siteClassService.updateSiteClass(siteClass);
    }

    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('siteClass:deleteBatch')")
    @ApiOperation(value = "删除网址分类", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除网址分类")
    @Log(value = "删除网址分类")
    public ResponseResult deleteBatch(@RequestBody List<Integer> ids) {
        return siteClassService.deleteBatch(ids);
    }
}

