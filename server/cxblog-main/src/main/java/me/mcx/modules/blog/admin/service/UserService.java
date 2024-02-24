package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.dto.SystemUserDTO;
import me.mcx.modules.system.domain.User;

import java.util.List;
import java.util.Map;

/**
 *
 * @author MCX
 * @date: 2021/7/30 17:17
 */
public interface UserService extends IService<User> {

    /**
     * 用户列表
     * @param username
     * @param loginType
     * @return
     */
    ResponseResult listUser(String username, Integer loginType);

    /**
     * 用户详情
     * @param id
     * @return
     */
    ResponseResult getUserById(String id);

    /**
     * 添加用户
     * @param user
     * @return
     */
    ResponseResult insertUser(SystemUserDTO user);

    /**
     * 修改用户
     * @param user
     * @return
     */
    ResponseResult updateUser(User user);

    /**
     * 批量删除用户
     * @param ids
     * @return
     */
    ResponseResult deleteBatch(List<String> ids);

    /**
     * 获取当前用户
     * @return
     */
    ResponseResult getCurrentUserInfo();

    /**
     * 获取当前用户拥有的菜单
     * @return
     */
    ResponseResult getCurrentUserMenu();


    /**
     * 修改密码
     * @return
     */
    ResponseResult updatePassword(Map<String, String> map);

    /**
     * 在线用户
     * @return
     */
    ResponseResult listOnlineUsers(String keywords);

    /**
     * 强制下线
     * @return
     */
    ResponseResult kick(String token);


}
