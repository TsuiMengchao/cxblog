package me.mcx.blog.service.web;

import me.mcx.blog.domain.dto.user.UserInfoDTO;
import me.mcx.common.core.web.domain.AjaxResult;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface ApiUserService {
    /**
     * 获取用户信息
     * @return
     */
    public AjaxResult selectUserInfo(String userId);

    /**
     * 修改用户信息
     * @param vo
     * @return
     */
    public AjaxResult updateUser(UserInfoDTO vo);

    /**
     * 根据token获取用户信息
     * @param token
     * @return
     */
    public AjaxResult selectUserInfoByToken(String token);

    /**
     * 根据用户id统计用户文章、关注、粉丝等信息
     * @param id
     * @return
     */
    public AjaxResult getUserCount(String id);
}
