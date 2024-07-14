package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 评论对象 blog_article_comment
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogArticleComment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 评论人ID */
    @Excel(name = "评论人ID")
    private String userId;

    /** 文章id */
    @Excel(name = "文章id")
    private Long articleId;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 回复人id */
    @Excel(name = "回复人id")
    private String replyUserId;

    /** 父id */
    @Excel(name = "父id")
    private Long parentId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String browser;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String browserVersion;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String system;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String systemVersion;

    /** ip地址 */
    @Excel(name = "ip地址")
    private String ipAddress;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
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
    public void setArticleId(Long articleId) 
    {
        this.articleId = articleId;
    }

    public Long getArticleId() 
    {
        return articleId;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setReplyUserId(String replyUserId) 
    {
        this.replyUserId = replyUserId;
    }

    public String getReplyUserId() 
    {
        return replyUserId;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setBrowser(String browser) 
    {
        this.browser = browser;
    }

    public String getBrowser() 
    {
        return browser;
    }
    public void setBrowserVersion(String browserVersion) 
    {
        this.browserVersion = browserVersion;
    }

    public String getBrowserVersion() 
    {
        return browserVersion;
    }
    public void setSystem(String system) 
    {
        this.system = system;
    }

    public String getSystem() 
    {
        return system;
    }
    public void setSystemVersion(String systemVersion) 
    {
        this.systemVersion = systemVersion;
    }

    public String getSystemVersion() 
    {
        return systemVersion;
    }
    public void setIpAddress(String ipAddress) 
    {
        this.ipAddress = ipAddress;
    }

    public String getIpAddress() 
    {
        return ipAddress;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("articleId", getArticleId())
            .append("content", getContent())
            .append("replyUserId", getReplyUserId())
            .append("parentId", getParentId())
            .append("browser", getBrowser())
            .append("browserVersion", getBrowserVersion())
            .append("system", getSystem())
            .append("systemVersion", getSystemVersion())
            .append("ipAddress", getIpAddress())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
