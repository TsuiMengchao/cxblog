package me.mcx.msg.service;

import java.util.List;
import me.mcx.msg.domain.MsgEmailConfig;
import me.mcx.msg.domain.vo.MsgEmailVo;

/**
 * 邮箱配置Service接口
 * 
 * @author mcx
 * @date 2024-05-07
 */
public interface IMsgEmailConfigService 
{
    /**
     * 查询邮箱配置
     * 
     * @param configId 邮箱配置主键
     * @return 邮箱配置
     */
    public MsgEmailConfig selectMsgEmailConfigByConfigId();

    /**
     * 发送邮件
     * @param emailVo 邮件发送的内容
     * @param emailConfig 邮件配置
     */
    public void sendMsgEmail(MsgEmailVo emailVo, MsgEmailConfig emailConfig);

    /**
     * 修改邮箱配置
     * 
     * @param msgEmailConfig 邮箱配置
     * @return 结果
     */
    public int updateMsgEmailConfig(MsgEmailConfig msgEmailConfig);
}
