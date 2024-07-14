package me.mcx.system.mapper;

import me.mcx.system.api.domain.SysUserInfo;
import me.mcx.system.api.model.user.UserInfoVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户信息Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface SysUserInfoMapper 
{
    /**
     * 查询用户信息
     * 
     * @param id 用户信息主键
     * @return 用户信息
     */
    public SysUserInfo selectSysUserInfoById(Long id);

    /**
     * 查询用户信息列表
     * 
     * @param sysUserInfo 用户信息
     * @return 用户信息集合
     */
    public List<SysUserInfo> selectSysUserInfoList(SysUserInfo sysUserInfo);

    /**
     * 新增用户信息
     * 
     * @param sysUserInfo 用户信息
     * @return 结果
     */
    public int insertSysUserInfo(SysUserInfo sysUserInfo);

    /**
     * 修改用户信息
     * 
     * @param sysUserInfo 用户信息
     * @return 结果
     */
    public int updateSysUserInfo(SysUserInfo sysUserInfo);

    /**
     * 删除用户信息
     * 
     * @param id 用户信息主键
     * @return 结果
     */
    public int deleteSysUserInfoById(Long id);

    /**
     * 批量删除用户信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserInfoByIds(Long[] ids);

    // ==============

    void deleteByUserIds(@Param("ids") List<String> ids);

    /**
     * 根据用户id获取用户信息
     * @param loginId 用户id
     * @return
     */
    UserInfoVO getByUserId(String loginId);

    UserInfoVO selectUserInfoByUserId(String userId);

    //    =======================

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
