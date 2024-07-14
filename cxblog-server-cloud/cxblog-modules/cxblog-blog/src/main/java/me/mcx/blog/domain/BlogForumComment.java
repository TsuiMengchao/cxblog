package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 圈子评论对象 blog_forum_comment
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogForumComment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 评论用户id */
    @Excel(name = "评论用户id")
    private String userId;

    /** 回复用户id */
    @Excel(name = "回复用户id")
    private String replyUserId;

    /** 话题id */
    @Excel(name = "话题id")
    private Long forumId;

    /** ip归属地 */
    @Excel(name = "ip归属地")
    private String address;

    /** ip */
    @Excel(name = "ip")
    private String ip;

    /** 父id */
    @Excel(name = "父id")
    private Long parentId;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
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
    public void setForumId(Long forumId) 
    {
        this.forumId = forumId;
    }

    public Long getForumId() 
    {
        return forumId;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setIp(String ip) 
    {
        this.ip = ip;
    }

    public String getIp() 
    {
        return ip;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("replyUserId", getReplyUserId())
            .append("forumId", getForumId())
            .append("address", getAddress())
            .append("ip", getIp())
            .append("parentId", getParentId())
            .append("content", getContent())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
