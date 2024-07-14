package me.mcx.system.service;

import me.mcx.system.api.domain.SysUserInfo;
import me.mcx.system.api.model.user.UserInfoVO;

import java.util.List;

/**
 * 用户信息Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface ISysUserInfoService 
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
     * 批量删除用户信息
     * 
     * @param ids 需要删除的用户信息主键集合
     * @return 结果
     */
    public int deleteSysUserInfoByIds(Long[] ids);

    /**
     * 删除用户信息信息
     * 
     * @param id 用户信息主键
     * @return 结果
     */
    public int deleteSysUserInfoById(Long id);

    public UserInfoVO selectUserInfoByUserId(String userId);

    public UserInfoVO selectInfoByUserId(String userId);
    public UserInfoVO selectInfoByUserIdNew(String userId);

    public UserInfoVO selectInfoByUserIdTwo(String userId);

    public UserInfoVO getByUserId(String userId);
}
