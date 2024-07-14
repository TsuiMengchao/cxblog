package me.mcx.msg.service.impl;

import java.util.List;
import cn.hutool.extra.mail.Mail;
import cn.hutool.extra.mail.MailAccount;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.DateUtils;
import me.mcx.common.core.utils.EncryptUtils;
import me.mcx.msg.domain.vo.MsgEmailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.msg.mapper.MsgEmailConfigMapper;
import me.mcx.msg.domain.MsgEmailConfig;
import me.mcx.msg.service.IMsgEmailConfigService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 邮箱配置Service业务层处理
 * 
 * @author mcx
 * @date 2024-05-07
 */
@Service
public class MsgEmailConfigServiceImpl implements IMsgEmailConfigService 
{
    @Autowired
    private MsgEmailConfigMapper msgEmailConfigMapper;

    /**
     * 查询邮箱配置
     *
     * @return 邮箱配置
     */
    @Override
    public MsgEmailConfig selectMsgEmailConfigByConfigId()
    {
        return msgEmailConfigMapper.selectMsgEmailConfigByConfigId(1L);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void sendMsgEmail(MsgEmailVo emailVo, MsgEmailConfig emailConfig){
        if(emailConfig.getConfigId() == null){
            throw new ServiceException("请先配置，再操作");
        }
        // 封装
        MailAccount account = new MailAccount();
        // 设置用户
        String user = emailConfig.getFromUser().split("@")[0];
        account.setUser(user);
        account.setHost(emailConfig.getHost());
        account.setPort(Integer.parseInt(emailConfig.getPort()));
        account.setAuth(true);
        try {
            // 对称解密
            account.setPass(EncryptUtils.desDecrypt(emailConfig.getPass()));
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
        account.setFrom(emailConfig.getUser()+"<"+emailConfig.getFromUser()+">");
        // ssl方式发送
        account.setSslEnable(true);
        // 使用STARTTLS安全连接
        account.setStarttlsEnable(true);
        // 解决jdk8之后默认禁用部分tls协议，导致邮件发送失败的问题
        account.setSslProtocols("TLSv1 TLSv1.1 TLSv1.2");
        String content = emailVo.getContent();
        // 发送
        try {
            int size = emailVo.getTos().size();
            Mail.create(account)
                    .setTos(emailVo.getTos().toArray(new String[size]))
                    .setTitle(emailVo.getSubject())
                    .setContent(content)
                    .setHtml(true)
                    //关闭session
                    .setUseGlobalSession(false)
                    .send();
        }catch (Exception e){
            throw new ServiceException(e.getMessage());
        }
    }


    /**
     * 修改邮箱配置
     * 
     * @param msgEmailConfig 邮箱配置
     * @return 结果
     */
    @Override
    public int updateMsgEmailConfig(MsgEmailConfig msgEmailConfig)
    {
        msgEmailConfig.setUpdateTime(DateUtils.getNowDate());
        return msgEmailConfigMapper.updateMsgEmailConfig(msgEmailConfig);
    }
}
