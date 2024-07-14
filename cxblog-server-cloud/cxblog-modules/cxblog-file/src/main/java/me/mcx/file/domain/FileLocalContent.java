package me.mcx.file.domain;

import lombok.AllArgsConstructor;
import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;
import org.springframework.context.annotation.Configuration;

/**
 * 本地存储对象 file_local_content
 * 
 * @author mcx
 * @date 2024-05-08
 */
public class FileLocalContent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long storageId;

    /** 文件真实的名称 */
    @Excel(name = "文件真实的名称")
    private String realName;

    /** 文件名 */
    @Excel(name = "文件名")
    private String name;

    /** 后缀 */
    @Excel(name = "后缀")
    private String suffix;

    /** 路径 */
    @Excel(name = "路径")
    private String path;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 大小 */
    @Excel(name = "大小")
    private String size;

    public FileLocalContent(String realName,String name, String suffix, String path, String type, String size) {
        this.realName = realName;
        this.name = name;
        this.suffix = suffix;
        this.path = path;
        this.type = type;
        this.size = size;
    }

    public void setStorageId(Long storageId) 
    {
        this.storageId = storageId;
    }

    public Long getStorageId() 
    {
        return storageId;
    }
    public void setRealName(String realName) 
    {
        this.realName = realName;
    }

    public String getRealName() 
    {
        return realName;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setSuffix(String suffix) 
    {
        this.suffix = suffix;
    }

    public String getSuffix() 
    {
        return suffix;
    }
    public void setPath(String path) 
    {
        this.path = path;
    }

    public String getPath() 
    {
        return path;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setSize(String size) 
    {
        this.size = size;
    }

    public String getSize() 
    {
        return size;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("storageId", getStorageId())
            .append("realName", getRealName())
            .append("name", getName())
            .append("suffix", getSuffix())
            .append("path", getPath())
            .append("type", getType())
            .append("size", getSize())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
