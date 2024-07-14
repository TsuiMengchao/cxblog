package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 开源软件对象 blog_software
 * 
 * @author mcx
 * @date 2024-04-29
 */
public class BlogSoftware extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 软件名称 */
    @Excel(name = "软件名称")
    private String name;

    /** 描述 */
    @Excel(name = "描述")
    private String info;

    /** 源码地址 */
    @Excel(name = "源码地址")
    private String codeUrl;

    /** 轮播图片,逗号分隔 */
    @Excel(name = "轮播图片,逗号分隔")
    private String coverImg;

    /** 演示地址 */
    @Excel(name = "演示地址")
    private String demoUrl;

    /** 详细介绍地址 */
    @Excel(name = "详细介绍地址")
    private String detailUrl;

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
    public void setInfo(String info) 
    {
        this.info = info;
    }

    public String getInfo() 
    {
        return info;
    }
    public void setCodeUrl(String codeUrl) 
    {
        this.codeUrl = codeUrl;
    }

    public String getCodeUrl() 
    {
        return codeUrl;
    }
    public void setCoverImg(String coverImg) 
    {
        this.coverImg = coverImg;
    }

    public String getCoverImg() 
    {
        return coverImg;
    }
    public void setDemoUrl(String demoUrl) 
    {
        this.demoUrl = demoUrl;
    }

    public String getDemoUrl() 
    {
        return demoUrl;
    }
    public void setDetailUrl(String detailUrl) 
    {
        this.detailUrl = detailUrl;
    }

    public String getDetailUrl() 
    {
        return detailUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("info", getInfo())
            .append("codeUrl", getCodeUrl())
            .append("coverImg", getCoverImg())
            .append("demoUrl", getDemoUrl())
            .append("detailUrl", getDetailUrl())
            .append("createTime", getCreateTime())
            .toString();
    }
}
