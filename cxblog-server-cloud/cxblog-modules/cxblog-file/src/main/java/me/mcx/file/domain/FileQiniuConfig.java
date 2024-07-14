package me.mcx.file.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 七牛云配置对象 file_qiniu_config
 * 
 * @author mcx
 * @date 2024-05-03
 */
public class FileQiniuConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long configId;

    /** accessKey */
    @Excel(name = "accessKey")
    private String accessKey;

    /** Bucket 识别符 */
    @Excel(name = "Bucket 识别符")
    private String bucket;

    /** 外链域名 */
    @Excel(name = "外链域名")
    private String host;

    /** secretKey */
    @Excel(name = "secretKey")
    private String secretKey;

    /** 空间类型 */
    @Excel(name = "空间类型")
    private String type;

    /** 机房 */
    @Excel(name = "机房")
    private String zone;

    public void setConfigId(Long configId)
    {
        this.configId = configId;
    }

    public Long getConfigId()
    {
        return configId;
    }
    public void setAccessKey(String accessKey) 
    {
        this.accessKey = accessKey;
    }

    public String getAccessKey() 
    {
        return accessKey;
    }
    public void setBucket(String bucket) 
    {
        this.bucket = bucket;
    }

    public String getBucket() 
    {
        return bucket;
    }
    public void setHost(String host) 
    {
        this.host = host;
    }

    public String getHost() 
    {
        return host;
    }
    public void setSecretKey(String secretKey) 
    {
        this.secretKey = secretKey;
    }

    public String getSecretKey() 
    {
        return secretKey;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setZone(String zone) 
    {
        this.zone = zone;
    }

    public String getZone() 
    {
        return zone;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("configId", getConfigId())
            .append("accessKey", getAccessKey())
            .append("bucket", getBucket())
            .append("host", getHost())
            .append("secretKey", getSecretKey())
            .append("type", getType())
            .append("zone", getZone())
            .toString();
    }
}
