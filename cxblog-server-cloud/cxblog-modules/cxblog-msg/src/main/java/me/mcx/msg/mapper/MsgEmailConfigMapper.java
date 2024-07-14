package me.mcx.msg.mapper;

import java.util.List;
import me.mcx.msg.domain.MsgEmailConfig;

/**
 * 邮箱配置Mapper接口
 * 
 * @author mcx
 * @date 2024-05-07
 */
public interface MsgEmailConfigMapper 
{
    /**
     * 查询邮箱配置
     * 
     * @param configId 邮箱配置主键
     * @return 邮箱配置
     */
    public MsgEmailConfig selectMsgEmailConfigByConfigId(Long configId);

    /**
     * 查询邮箱配置列表
     * 
     * @param msgEmailConfig 邮箱配置
     * @return 邮箱配置集合
     */
    public List<MsgEmailConfig> selectMsgEmailConfigList(MsgEmailConfig msgEmailConfig);

    /**
     * 新增邮箱配置
     * 
     * @param msgEmailConfig 邮箱配置
     * @return 结果
     */
    public int insertMsgEmailConfig(MsgEmailConfig msgEmailConfig);

    /**
     * 修改邮箱配置
     * 
     * @param msgEmailConfig 邮箱配置
     * @return 结果
     */
    public int updateMsgEmailConfig(MsgEmailConfig msgEmailConfig);

    /**
     * 删除邮箱配置
     * 
     * @param configId 邮箱配置主键
     * @return 结果
     */
    public int deleteMsgEmailConfigByConfigId(Long configId);

    /**
     * 批量删除邮箱配置
     * 
     * @param configIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMsgEmailConfigByConfigIds(Long[] configIds);
}
