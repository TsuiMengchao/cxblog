/*
 *  Copyright 2019-2020 MCX
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package me.mcx.modules.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.vo.SystemUserInfoVO;
import me.mcx.modules.blog.domain.vo.SystemUserVO;
import me.mcx.modules.blog.domain.vo.UserInfoVO;
import me.mcx.modules.system.domain.User;
import me.mcx.modules.system.domain.vo.UserQueryCriteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * @author MCX
 * @date 2023-06-20
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
    List<User> findAll(@Param("criteria") UserQueryCriteria criteria);

    Long countAll(@Param("criteria") UserQueryCriteria criteria);

    User findByUsername(@Param("username") String username);

    User findByEmail(@Param("email") String email);

    User findByPhone(@Param("phone") String phone);

    @Select("update sys_user set password = #{password} , pwd_reset_time = #{lastPasswordResetTime} where username = #{username}")
    void updatePass(@Param("username") String username, @Param("password") String password, @Param("lastPasswordResetTime") Date lastPasswordResetTime);

    @Select("update sys_user set email = #{email} where username = #{username}")
    void updateEmail(@Param("username") String username, @Param("email") String email);

    List<User> findByRoleId(@Param("roleId") Long roleId);

    List<User> findByRoleDeptId(@Param("deptId") Long deptId);

    List<User> findByMenuId(@Param("menuId") Long menuId);

    int countByJobs(@Param("jobIds") Set<Long> jobIds);

    int countByDepts(@Param("deptIds") Set<Long> deptIds);

    int countByRoles(@Param("roleIds") Set<Long> roleIds);

    void resetPwd(@Param("userIds") Set<Long> userIds, @Param("pwd") String pwd);

    // 以下是合并自其他文件

    void insertBackId(User user);

    List<Integer> getMenuId(String userId);

    Page<SystemUserInfoVO> selectPageRecord(@Param("page") Page<SystemUserInfoVO> page, @Param("username")String username, @Param("loginType")Integer loginType);

    SystemUserVO getById(Object id);

    User selectName(@Param("username") String username);

    void updateLoginInfo(@Param("loginId")Object loginId,@Param("ip") String ip, @Param("cityInfo")String cityInfo,
                         @Param("os") String os,@Param("browser") String browser);

    /**
     * 根据用户名查询
     * @param username
     * @return
     */
    UserInfoVO selectByUserName(String username);

    /**
     * 根据用户id查询
     * @param userId
     * @return
     */
    UserInfoVO selectInfoByUserId(Object userId);


    /**
     * 根据用户id查询-2
     * @param userId
     * @return
     */
    UserInfoVO selectInfoByUserIdTwo(Object userId);

    UserInfoVO selectInfoByUserIdNew(Object userId);
}
