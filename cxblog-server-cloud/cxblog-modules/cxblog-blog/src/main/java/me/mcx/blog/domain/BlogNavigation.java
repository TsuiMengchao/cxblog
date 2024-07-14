package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 网站导航对象 blog_navigation
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogNavigation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 网站分类id */
    @Excel(name = "网站分类id")
    private Long siteClassId;

    /** 网站标题 */
    @Excel(name = "网站标题")
    private String name;

    /** 网址地址 */
    @Excel(name = "网址地址")
    private String url;

    /** 网站logo */
    @Excel(name = "网站logo")
    private String logo;

    /** 网站描述 */
    @Excel(name = "网站描述")
    private String info;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSiteClassId(Long siteClassId) 
    {
        this.siteClassId = siteClassId;
    }

    public Long getSiteClassId() 
    {
        return siteClassId;
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
    public void setLogo(String logo) 
    {
        this.logo = logo;
    }

    public String getLogo() 
    {
        return logo;
    }
    public void setInfo(String info) 
    {
        this.info = info;
    }

    public String getInfo() 
    {
        return info;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("siteClassId", getSiteClassId())
            .append("name", getName())
            .append("url", getUrl())
            .append("logo", getLogo())
            .append("info", getInfo())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
