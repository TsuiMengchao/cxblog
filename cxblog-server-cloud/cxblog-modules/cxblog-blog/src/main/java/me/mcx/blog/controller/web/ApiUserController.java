package me.mcx.blog.controller.web;

import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.dto.user.UserInfoDTO;
import me.mcx.blog.service.web.ApiUserService;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/v1/user")
@RestController
@RequiredArgsConstructor
public class ApiUserController {

    private final ApiUserService userService;

    /**
     * 个人中心模块-获取用户信息
     * @param userId
     * @return
     */
    @GetMapping(value = "/info")
    public AjaxResult selectUserInfo(String userId){
        return userService.selectUserInfo(userId);
    }

    /**
     * 个人中心模块-修改用户信息
     * @param vo
     * @return
     */
    @PutMapping
    public AjaxResult updateUser(@RequestBody UserInfoDTO vo){
        return userService.updateUser(vo);
    }

    /**
     * 根据token获取用户信息
     * @param token
     * @return
     */
    @GetMapping(value = "/selectUserInfoByToken")
    public AjaxResult selectUserInfoByToken(String token){
        return userService.selectUserInfoByToken(token);
    }

    /**
     * 根据用户id统计用户文章、关注、粉丝等信息
     * @param id
     * @return
     */
    @GetMapping(value = "/getUserCount")
    public AjaxResult getUserCount(String id){
        return userService.getUserCount(id);
    }

}

