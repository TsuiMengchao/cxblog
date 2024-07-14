package me.mcx.modules.blog.web.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import me.mcx.annotation.WebLog;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.dto.UserInfoDTO;
import me.mcx.modules.blog.web.service.ApiUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/v1/user")
@RestController
@Api(tags = "登录接口")
@RequiredArgsConstructor
public class ApiUserController {

    private final ApiUserService userService;

    @WebLog(value = "个人中心模块-获取用户信息",type = "修改",desc = "获取用户信息")
    @AnonymousGetMapping(value = "/info")
    public ResponseResult selectUserInfo(String userId){
        return userService.selectUserInfo(userId);
    }

    @WebLog(value = "个人中心模块-修改用户信息",type = "修改",desc = "修改用户信息")
    @PutMapping(value = "/")
    public ResponseResult updateUser(@RequestBody UserInfoDTO vo){
        return userService.updateUser(vo);
    }

    @AnonymousGetMapping(value = "selectUserInfoByToken")
    @ApiOperation(value = "根据token获取用户信息", httpMethod = "GET", response = ResponseResult.class, notes = "根据token获取用户信息")
    public ResponseResult selectUserInfoByToken(){
        return userService.selectUserInfoByToken();
    }

    @AnonymousGetMapping(value = "getUserCount")
    @ApiOperation(value = "根据用户id统计用户文章、关注、粉丝等信息", httpMethod = "GET", response = ResponseResult.class, notes = "根据用户id统计用户文章、关注、粉丝等信息")
    public ResponseResult getUserCount(String id){
        return userService.getUserCount(id);
    }

}

