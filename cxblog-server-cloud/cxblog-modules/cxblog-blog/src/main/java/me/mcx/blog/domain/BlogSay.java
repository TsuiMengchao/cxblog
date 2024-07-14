package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 说说对象 blog_say
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogSay extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private String id;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 图片地址 逗号分隔  最多九张 */
    @Excel(name = "图片地址 逗号分隔  最多九张")
    private String imgUrl;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 发表地址。可输入或者地图插件选择 */
    @Excel(name = "发表地址。可输入或者地图插件选择")
    private String address;

    /** 是否开放查看  0未开放 1开放 */
    @Excel(name = "是否开放查看  0未开放 1开放")
    private Long isPublic;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
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
    public void setImgUrl(String imgUrl) 
    {
        this.imgUrl = imgUrl;
    }

    public String getImgUrl() 
    {
        return imgUrl;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setIsPublic(Long isPublic) 
    {
        this.isPublic = isPublic;
    }

    public Long getIsPublic() 
    {
        return isPublic;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("imgUrl", getImgUrl())
            .append("content", getContent())
            .append("address", getAddress())
            .append("isPublic", getIsPublic())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
