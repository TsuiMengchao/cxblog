package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 说说评论对象 blog_say_comment
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogSayComment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id  */
    private Long id;

    /** 说说id */
    @Excel(name = "说说id")
    private String sayId;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 回复用户id */
    @Excel(name = "回复用户id")
    private String replyUserId;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** ip地址 */
    @Excel(name = "ip地址")
    private String ip;

    /** ip来源 */
    @Excel(name = "ip来源")
    private String ipAddress;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSayId(String sayId) 
    {
        this.sayId = sayId;
    }

    public String getSayId() 
    {
        return sayId;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setReplyUserId(String replyUserId) 
    {
        this.replyUserId = replyUserId;
    }

    public String getReplyUserId() 
    {
        return replyUserId;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setIp(String ip) 
    {
        this.ip = ip;
    }

    public String getIp() 
    {
        return ip;
    }
    public void setIpAddress(String ipAddress) 
    {
        this.ipAddress = ipAddress;
    }

    public String getIpAddress() 
    {
        return ipAddress;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("sayId", getSayId())
            .append("userId", getUserId())
            .append("replyUserId", getReplyUserId())
            .append("content", getContent())
            .append("ip", getIp())
            .append("ipAddress", getIpAddress())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
