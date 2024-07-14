package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 留言对象 blog_message
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogMessage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String nickname;

    /** 用户头像地址 */
    @Excel(name = "用户头像地址")
    private String avatar;

    /** IP地址 */
    @Excel(name = "IP地址")
    private String ipAddress;

    /** IP来源 */
    @Excel(name = "IP来源")
    private String ipSource;

    /** 时间 */
    @Excel(name = "时间")
    private Integer time;

    /** 状态 0:审核  1：正常 */
    @Excel(name = "状态 0:审核  1：正常")
    private Integer status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setNickname(String nickname) 
    {
        this.nickname = nickname;
    }

    public String getNickname() 
    {
        return nickname;
    }
    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }
    public void setIpAddress(String ipAddress) 
    {
        this.ipAddress = ipAddress;
    }

    public String getIpAddress() 
    {
        return ipAddress;
    }
    public void setIpSource(String ipSource) 
    {
        this.ipSource = ipSource;
    }

    public String getIpSource() 
    {
        return ipSource;
    }
    public void setTime(Integer time) 
    {
        this.time = time;
    }

    public Integer getTime() 
    {
        return time;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("content", getContent())
            .append("nickname", getNickname())
            .append("avatar", getAvatar())
            .append("ipAddress", getIpAddress())
            .append("ipSource", getIpSource())
            .append("time", getTime())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
