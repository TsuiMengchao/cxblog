package me.mcx.file.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 七牛云文件存储对象 file_qiniu_content
 * 
 * @author mcx
 * @date 2024-05-03
 */
public class FileQiniuContent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long contentId;

    /** Bucket 识别符 */
    @Excel(name = "Bucket 识别符")
    private String bucket;

    /** 文件名称 */
    @Excel(name = "文件名称")
    private String name;

    /** 文件大小 */
    @Excel(name = "文件大小")
    private String size;

    /** 文件类型：私有或公开 */
    @Excel(name = "文件类型：私有或公开")
    private String type;

    /** 文件url */
    @Excel(name = "文件url")
    private String url;

    /** 文件后缀 */
    private String suffix;

    public void setContentId(Long contentId)
    {
        this.contentId = contentId;
    }

    public Long getContentId()
    {
        return contentId;
    }
    public void setBucket(String bucket) 
    {
        this.bucket = bucket;
    }

    public String getBucket() 
    {
        return bucket;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setSize(String size) 
    {
        this.size = size;
    }

    public String getSize() 
    {
        return size;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setSuffix(String suffix) 
    {
        this.suffix = suffix;
    }

    public String getSuffix() 
    {
        return suffix;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("contentId", getContentId())
            .append("bucket", getBucket())
            .append("name", getName())
            .append("size", getSize())
            .append("type", getType())
            .append("url", getUrl())
            .append("suffix", getSuffix())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
