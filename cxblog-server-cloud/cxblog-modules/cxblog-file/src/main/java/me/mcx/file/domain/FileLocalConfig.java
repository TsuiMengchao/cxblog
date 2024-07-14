package me.mcx.file.domain;

import me.mcx.common.core.annotation.Excel;
import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 本地配置对象 file_local_config
 * 
 * @author mcx
 * @date 2024-05-08
 */
public class FileLocalConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long configId;

    /** 资源映射路径 */
    @Excel(name = "资源映射路径")
    private String domain;

    /** 资源映射路径前缀 */
    @Excel(name = "资源映射路径前缀")
    private String prefix;

    public void setConfigId(Long configId) 
    {
        this.configId = configId;
    }

    public Long getConfigId() 
    {
        return configId;
    }
    public void setDomain(String domain)
    {
        this.domain = domain;
    }

    public String getDomain()
    {
        return domain;
    }

    public void setPrefix(String prefix)
    {
        this.prefix = prefix;
    }

    public String getPrefix()
    {
        return prefix;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("configId", getConfigId())
            .append("domain", getDomain())
                .append("prefix", getPrefix())
            .toString();
    }
}
