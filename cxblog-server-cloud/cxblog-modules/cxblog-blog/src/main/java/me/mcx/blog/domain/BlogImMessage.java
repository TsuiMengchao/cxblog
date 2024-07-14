package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 即时消息对象 blog_im_message
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogImMessage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private String id;

    /** 发送用户id */
    @Excel(name = "发送用户id")
    private String toUserId;

    /** 接收用户id */
    @Excel(name = "接收用户id")
    private String fromUserId;

    /** 发送用户头像 */
    @Excel(name = "发送用户头像")
    private String toUserAvatar;

    /** 发送内容 */
    @Excel(name = "发送内容")
    private String content;

    /** ip地址 */
    @Excel(name = "ip地址")
    private String ipSource;

    /** 发送用户ip */
    @Excel(name = "发送用户ip")
    private String ip;

    /** 消息是否撤回 0：未撤回  1：撤回 */
    @Excel(name = "消息是否撤回 0：未撤回  1：撤回")
    private Integer isWithdraw;

    /** 是否已读 */
    @Excel(name = "是否已读")
    private Integer isRead;

    /** 消息类型 1普通消息 2图片 */
    @Excel(name = "消息类型 1普通消息 2图片")
    private Integer type;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer code;

    /** 文章id */
    @Excel(name = "文章id")
    private Long articleId;

    /** 通知类型 0系统通知 1：评论 2：关注 3点赞 4收藏 5私信 */
    @Excel(name = "通知类型 0系统通知 1：评论 2：关注 3点赞 4收藏 5私信")
    private Long noticeType;

    /** 评论标记 1回复评论 2发表评论 */
    @Excel(name = "评论标记 1回复评论 2发表评论")
    private Long commentMark;

    /** @用户id */
    @Excel(name = "@用户id")
    private String atUserId;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setToUserId(String toUserId) 
    {
        this.toUserId = toUserId;
    }

    public String getToUserId() 
    {
        return toUserId;
    }
    public void setFromUserId(String fromUserId) 
    {
        this.fromUserId = fromUserId;
    }

    public String getFromUserId() 
    {
        return fromUserId;
    }
    public void setToUserAvatar(String toUserAvatar) 
    {
        this.toUserAvatar = toUserAvatar;
    }

    public String getToUserAvatar() 
    {
        return toUserAvatar;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setIpSource(String ipSource) 
    {
        this.ipSource = ipSource;
    }

    public String getIpSource() 
    {
        return ipSource;
    }
    public void setIp(String ip) 
    {
        this.ip = ip;
    }

    public String getIp() 
    {
        return ip;
    }
    public void setIsWithdraw(Integer isWithdraw) 
    {
        this.isWithdraw = isWithdraw;
    }

    public Integer getIsWithdraw() 
    {
        return isWithdraw;
    }
    public void setIsRead(Integer isRead) 
    {
        this.isRead = isRead;
    }

    public Integer getIsRead() 
    {
        return isRead;
    }
    public void setType(Integer type) 
    {
        this.type = type;
    }

    public Integer getType() 
    {
        return type;
    }
    public void setCode(Integer code) 
    {
        this.code = code;
    }

    public Integer getCode() 
    {
        return code;
    }
    public void setArticleId(Long articleId) 
    {
        this.articleId = articleId;
    }

    public Long getArticleId() 
    {
        return articleId;
    }
    public void setNoticeType(Long noticeType) 
    {
        this.noticeType = noticeType;
    }

    public Long getNoticeType() 
    {
        return noticeType;
    }
    public void setCommentMark(Long commentMark) 
    {
        this.commentMark = commentMark;
    }

    public Long getCommentMark() 
    {
        return commentMark;
    }
    public void setAtUserId(String atUserId) 
    {
        this.atUserId = atUserId;
    }

    public String getAtUserId() 
    {
        return atUserId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("toUserId", getToUserId())
            .append("fromUserId", getFromUserId())
            .append("toUserAvatar", getToUserAvatar())
            .append("content", getContent())
            .append("ipSource", getIpSource())
            .append("ip", getIp())
            .append("isWithdraw", getIsWithdraw())
            .append("isRead", getIsRead())
            .append("type", getType())
            .append("code", getCode())
            .append("articleId", getArticleId())
            .append("noticeType", getNoticeType())
            .append("commentMark", getCommentMark())
            .append("atUserId", getAtUserId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
