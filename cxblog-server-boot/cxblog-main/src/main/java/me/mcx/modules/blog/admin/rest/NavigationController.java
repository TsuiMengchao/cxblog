package me.mcx.modules.blog.admin.rest;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.NavigationService;
import me.mcx.modules.blog.domain.Navigation;
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
@RequestMapping("/api/navigation")
@Api(tags = "后台网址导航管理")
@RequiredArgsConstructor
public class NavigationController {

    private final NavigationService navigationService;

    @PreAuthorize("@cx.check('navigation:list')")
    @GetMapping(value = "/list")
    @ApiOperation(value = "网址导航列表", httpMethod = "GET", response = ResponseResult.class, notes = "网址导航列表")
    public ResponseResult selectNavigationList(Integer siteClassId) {
        return navigationService.selectNavigationList(siteClassId);
    }

    @PostMapping(value = "/insert")
    @PreAuthorize("@cx.check('navigation:add')")
    @ApiOperation(value = "添加网址导航", httpMethod = "POST", response = ResponseResult.class, notes = "添加网址导航")
    @Log(value = "添加网址导航")
    public ResponseResult insert(@RequestBody Navigation Navigation) {
        return navigationService.insertNavigation(Navigation);
    }
    
    @PutMapping(value = "/update")
    @PreAuthorize("@cx.check('navigation:edit')")
    @ApiOperation(value = "修改网址导航", httpMethod = "PUT", response = ResponseResult.class, notes = "修改网址导航")
    @Log(value = "修改网址导航")
    public ResponseResult update(@RequestBody Navigation Navigation) {
        return navigationService.updateNavigation(Navigation);
    }

    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('Navigation/deleteBatch')")
    @ApiOperation(value = "删除网址导航", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除网址导航")
    @Log(value = "删除网址导航")
    public ResponseResult deleteBatch(@RequestBody List<Integer> ids) {
        return navigationService.deleteBatch(ids);
    }
}

