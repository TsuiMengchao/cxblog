package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 友情链接对象 blog_friend_link
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogFriendLink extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 网站名称 */
    @Excel(name = "网站名称")
    private String name;

    /** 网站地址 */
    @Excel(name = "网站地址")
    private String url;

    /** 网站头像地址 */
    @Excel(name = "网站头像地址")
    private String avatar;

    /** 网站描述 */
    @Excel(name = "网站描述")
    private String info;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    /** 下架原因 */
    @Excel(name = "下架原因")
    private String reason;

    /** ENUM-状态:"0,下架;1,申请;2:上架" */
    @Excel(name = "'ENUM-状态:'0,下架;1,申请;2:上架''")
    private Long status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }
    public void setInfo(String info) 
    {
        this.info = info;
    }

    public String getInfo() 
    {
        return info;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }
    public void setReason(String reason) 
    {
        this.reason = reason;
    }

    public String getReason() 
    {
        return reason;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("url", getUrl())
            .append("avatar", getAvatar())
            .append("info", getInfo())
            .append("email", getEmail())
            .append("sort", getSort())
            .append("reason", getReason())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
