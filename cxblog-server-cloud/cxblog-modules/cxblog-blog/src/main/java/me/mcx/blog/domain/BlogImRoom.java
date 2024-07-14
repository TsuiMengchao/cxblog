package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 用户消息房间对象 blog_im_room
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogImRoom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private String id;

    /** 房间类型 0：群聊 1私聊 */
    @Excel(name = "房间类型 0：群聊 1私聊")
    private Long type;

    /** 所属用户id */
    @Excel(name = "所属用户id")
    private String fromUserId;

    /** 接收用户id */
    @Excel(name = "接收用户id")
    private String toUserId;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setType(Long type) 
    {
        this.type = type;
    }

    public Long getType() 
    {
        return type;
    }
    public void setFromUserId(String fromUserId) 
    {
        this.fromUserId = fromUserId;
    }

    public String getFromUserId() 
    {
        return fromUserId;
    }
    public void setToUserId(String toUserId) 
    {
        this.toUserId = toUserId;
    }

    public String getToUserId() 
    {
        return toUserId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("type", getType())
            .append("fromUserId", getFromUserId())
            .append("toUserId", getToUserId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
