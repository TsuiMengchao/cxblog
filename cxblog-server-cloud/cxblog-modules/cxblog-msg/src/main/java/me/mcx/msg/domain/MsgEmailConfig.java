package me.mcx.msg.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 邮箱配置对象 msg_email_config
 * 
 * @author mcx
 * @date 2024-05-07
 */
public class MsgEmailConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long configId;

    /** 收件人 */
    @Excel(name = "收件人")
    private String fromUser;

    /** 邮件服务器SMTP地址 */
    @Excel(name = "邮件服务器SMTP地址")
    private String host;

    /** 密码 */
    @Excel(name = "密码")
    private String pass;

    /** 端口 */
    @Excel(name = "端口")
    private String port;

    /** 发件者用户名 */
    @Excel(name = "发件者用户名")
    private String user;

    public void setConfigId(Long configId) 
    {
        this.configId = configId;
    }

    public Long getConfigId() 
    {
        return configId;
    }
    public void setFromUser(String fromUser) 
    {
        this.fromUser = fromUser;
    }

    public String getFromUser() 
    {
        return fromUser;
    }
    public void setHost(String host) 
    {
        this.host = host;
    }

    public String getHost() 
    {
        return host;
    }
    public void setPass(String pass) 
    {
        this.pass = pass;
    }

    public String getPass() 
    {
        return pass;
    }
    public void setPort(String port) 
    {
        this.port = port;
    }

    public String getPort() 
    {
        return port;
    }
    public void setUser(String user) 
    {
        this.user = user;
    }

    public String getUser() 
    {
        return user;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("configId", getConfigId())
            .append("fromUser", getFromUser())
            .append("host", getHost())
            .append("pass", getPass())
            .append("port", getPort())
            .append("user", getUser())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
