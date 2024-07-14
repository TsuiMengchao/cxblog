package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 博客分类对象 blog_category
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogCategory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String name;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long clickVolume;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    /** 图标 */
    @Excel(name = "图标")
    private String icon;

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
    public void setClickVolume(Long clickVolume) 
    {
        this.clickVolume = clickVolume;
    }

    public Long getClickVolume() 
    {
        return clickVolume;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }
    public void setIcon(String icon) 
    {
        this.icon = icon;
    }

    public String getIcon() 
    {
        return icon;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("clickVolume", getClickVolume())
            .append("sort", getSort())
            .append("icon", getIcon())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
