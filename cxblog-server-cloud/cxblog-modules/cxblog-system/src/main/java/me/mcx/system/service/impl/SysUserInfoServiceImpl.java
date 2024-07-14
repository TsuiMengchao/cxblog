package me.mcx.system.service.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import me.mcx.system.api.domain.SysUserInfo;
import me.mcx.system.api.model.user.UserInfoVO;
import me.mcx.system.mapper.SysUserInfoMapper;
import me.mcx.system.service.ISysUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户信息Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class SysUserInfoServiceImpl implements ISysUserInfoService 
{
    @Autowired
    private SysUserInfoMapper sysUserInfoMapper;

    /**
     * 查询用户信息
     * 
     * @param id 用户信息主键
     * @return 用户信息
     */
    @Override
    public SysUserInfo selectSysUserInfoById(Long id)
    {
        return sysUserInfoMapper.selectSysUserInfoById(id);
    }

    /**
     * 查询用户信息列表
     * 
     * @param sysUserInfo 用户信息
     * @return 用户信息
     */
    @Override
    public List<SysUserInfo> selectSysUserInfoList(SysUserInfo sysUserInfo)
    {
        return sysUserInfoMapper.selectSysUserInfoList(sysUserInfo);
    }

    /**
     * 新增用户信息
     * 
     * @param sysUserInfo 用户信息
     * @return 结果
     */
    @Override
    public int insertSysUserInfo(SysUserInfo sysUserInfo)
    {
        sysUserInfo.setCreateTime(DateUtils.getNowDate());
        return sysUserInfoMapper.insertSysUserInfo(sysUserInfo);
    }

    /**
     * 修改用户信息
     * 
     * @param sysUserInfo 用户信息
     * @return 结果
     */
    @Override
    public int updateSysUserInfo(SysUserInfo sysUserInfo)
    {
        sysUserInfo.setUpdateTime(DateUtils.getNowDate());
        return sysUserInfoMapper.updateSysUserInfo(sysUserInfo);
    }

    /**
     * 批量删除用户信息
     * 
     * @param ids 需要删除的用户信息主键
     * @return 结果
     */
    @Override
    public int deleteSysUserInfoByIds(Long[] ids)
    {
        return sysUserInfoMapper.deleteSysUserInfoByIds(ids);
    }

    /**
     * 删除用户信息信息
     * 
     * @param id 用户信息主键
     * @return 结果
     */
    @Override
    public int deleteSysUserInfoById(Long id)
    {
        return sysUserInfoMapper.deleteSysUserInfoById(id);
    }

    @Override
    public UserInfoVO selectUserInfoByUserId(String userId) {
        return sysUserInfoMapper.selectUserInfoByUserId(userId);
    }

    @Override
    public UserInfoVO selectInfoByUserId(String userId) {
        return sysUserInfoMapper.selectInfoByUserId(userId);
    }
    @Override
    public UserInfoVO selectInfoByUserIdNew(String userId) {
        return sysUserInfoMapper.selectInfoByUserIdNew(userId);
    }

    @Override
    public UserInfoVO selectInfoByUserIdTwo(String userId) {
        return sysUserInfoMapper.selectInfoByUserIdTwo(userId);
    }

    @Override
    public UserInfoVO getByUserId(String userId) {
        return sysUserInfoMapper.getByUserId(userId);
    }
}
