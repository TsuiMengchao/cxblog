package me.mcx.system.api;

import me.mcx.common.core.constant.SecurityConstants;
import me.mcx.common.core.constant.ServiceNameConstants;
import me.mcx.common.core.domain.R;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.system.api.domain.SysUser;
import me.mcx.system.api.domain.SysUserInfo;
import me.mcx.system.api.factory.RemoteUserInfoFallbackFactory;
import me.mcx.system.api.model.user.UserInfoVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 * 用户信息服务
 * 
 * @author cxblog
 */
@FeignClient(contextId = "remoteUserInfoService", value = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteUserInfoFallbackFactory.class)
public interface RemoteUserInfoService
{
    /**
     * 通过用户Id查询用户信息
     *
     * @param userId 用户名
     * @param source 请求来源
     * @return 结果
     */
    @GetMapping("/userInfo/selectUserInfoByUserId")
    public R<UserInfoVO> selectUserInfoByUserId(@RequestParam("userId") String userId, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);
    /**
     * 通过用户Id查询用户信息
     *
     * @param userId 用户名
     * @param source 请求来源
     * @return 结果
     */
    @GetMapping("/userInfo/selectInfoByUserId")
    public R<UserInfoVO> selectInfoByUserId(@RequestParam("userId") String userId, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);
    @GetMapping("/userInfo/selectInfoByUserIdNew")
    public R<UserInfoVO> selectInfoByUserIdNew(@RequestParam("userId") String userId, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    @GetMapping("/userInfo/selectInfoByUserIdTwo")
    public R<UserInfoVO> selectInfoByUserIdTwo(@RequestParam("userId") Object userId, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    @GetMapping("/userInfo/getByUserId")
    public R<UserInfoVO> getByUserId(@RequestParam("userId") String userId, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);
    /**
     * 更新用户信息
     *
     * @param sysUserInfo 用户信息
     * @param source 请求来源
     * @return 结果
     */
    @PutMapping("/userInfo")
    public AjaxResult updateUserInfo(@RequestBody SysUserInfo sysUserInfo, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);
}
