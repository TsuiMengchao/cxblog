package me.mcx.modules.blog.admin.rest;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.FriendLink;
import me.mcx.modules.blog.admin.service.FriendLinkService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * <p>
 * 友情链接表 前端控制器
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@RestController
@RequestMapping("/api/friend")
@Api(tags = "友情链接后端-接口")
@RequiredArgsConstructor
public class FriendLinkController {

    private final FriendLinkService friendLinkService;

    @AnonymousGetMapping(value = "/list")
    @PreAuthorize("@cx.check('friendLink:list')")
    @ApiOperation(value = "友链列表", httpMethod = "GET", response = ResponseResult.class, notes = "友链列表")
    public ResponseResult list(String name, Integer status){
        return friendLinkService.listFriendLink(name,status);
    }

    @PostMapping(value = "/create")
    @PreAuthorize("@cx.check('friendLink:add')")
    @ApiOperation(value = "添加友链", httpMethod = "POST", response = ResponseResult.class, notes = "添加友链")
    @Log(value = "添加友链")
    public ResponseResult insert(@RequestBody FriendLink friendLink){
        return friendLinkService.insertFriendLink(friendLink);
    }

    @PostMapping(value = "/update")
    @PreAuthorize("@cx.check('friendLink:edit')")
    @ApiOperation(value = "修改友链", httpMethod = "POST", response = ResponseResult.class, notes = "修改友链")
    @Log(value = "修改友链")
    public ResponseResult update(@RequestBody FriendLink friendLink){
        return friendLinkService.updateFriendLink(friendLink);
    }

    @DeleteMapping(value = "/remove")
    @PreAuthorize("@cx.check('friendLink:del')")
    @ApiOperation(value = "删除友链", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除友链")
    @Log(value = "删除友链")
    public ResponseResult deleteBatch(@RequestBody List<Integer> ids){
        return friendLinkService.deleteBatch(ids);
    }

    @AnonymousGetMapping(value = "/top")
    @PreAuthorize("@cx.check('friendLink:top')")
    @ApiOperation(value = "置顶友链", httpMethod = "GET", response = ResponseResult.class, notes = "置顶友链")
    @Log(value = "置顶友链")
    public ResponseResult top(Integer id){
        return friendLinkService.top(id);
    }
}

