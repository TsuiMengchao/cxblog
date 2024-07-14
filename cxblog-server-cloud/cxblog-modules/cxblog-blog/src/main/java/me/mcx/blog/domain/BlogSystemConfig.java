package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 系统配置对象 blog_system_config
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogSystemConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 七牛云公钥 */
    @Excel(name = "七牛云公钥")
    private String qiNiuAccessKey;

    /** 七牛云私钥 */
    @Excel(name = "七牛云私钥")
    private String qiNiuSecretKey;

    /** 七牛云存储区域 华东（z0），华北(z1)，华南(z2)，北美(na0)，东南亚(as0) */
    @Excel(name = "七牛云存储区域 华东", readConverterExp = "z=0")
    private String qiNiuArea;

    /** 七牛云上传空间 */
    @Excel(name = "七牛云上传空间")
    private String qiNiuBucket;

    /** 七牛云域名前缀：http://images.moguit.cn */
    @Excel(name = "七牛云域名前缀：http://images.moguit.cn")
    private String qiNiuPictureBaseUrl;

    /** 文件上传七牛云(0:否， 1:是) */
    @Excel(name = "文件上传七牛云(0:否， 1:是)")
    private String uploadQiNiu;

    /** 是否开启注册用户邮件激活(0:否， 1:是) */
    @Excel(name = "是否开启注册用户邮件激活(0:否， 1:是)")
    private String openEmailActivate;

    /** 是否开启邮件通知(0:否， 1:是) */
    @Excel(name = "是否开启邮件通知(0:否， 1:是)")
    private String startEmailNotification;

    /** 是否开启仪表盘通知(0:否， 1:是) */
    @Excel(name = "是否开启仪表盘通知(0:否， 1:是)")
    private String openDashboardNotification;

    /** 仪表盘通知【用于首次登录弹框】MD */
    @Excel(name = "仪表盘通知【用于首次登录弹框】MD")
    private String dashboardNotificationMd;

    /** 仪表盘通知【用于首次登录弹框】 */
    @Excel(name = "仪表盘通知【用于首次登录弹框】")
    private String dashboardNotification;

    /** 搜索模式【0:SQL搜索 、1：全文检索】 */
    @Excel(name = "搜索模式【0:SQL搜索 、1：全文检索】")
    private Integer searchModel;

    /** 邮箱地址 */
    @Excel(name = "邮箱地址")
    private String emailHost;

    /** 邮箱发件人 */
    @Excel(name = "邮箱发件人")
    private String emailUsername;

    /** 邮箱授权码 */
    @Excel(name = "邮箱授权码")
    private String emailPassword;

    /** 邮箱发送端口 */
    @Excel(name = "邮箱发送端口")
    private Integer emailPort;

    /** 启用邮箱发送 */
    @Excel(name = "启用邮箱发送")
    private Integer openEmail;

    /** 本地文件地址 */
    @Excel(name = "本地文件地址")
    private String localFileUrl;

    /** 文件上传方式 1:本地 2：七牛云 */
    @Excel(name = "文件上传方式 1:本地 2：七牛云")
    private Integer fileUploadWay;

    /** 阿里云ak */
    @Excel(name = "阿里云ak")
    private String aliYunAccessKey;

    /** 阿里云sk */
    @Excel(name = "阿里云sk")
    private String aliYunSecretKey;

    /** 阿里云存储桶名 */
    @Excel(name = "阿里云存储桶名")
    private String aliYunBucket;

    /** 阿里云Endpoint */
    @Excel(name = "阿里云Endpoint")
    private String aliYunEndpoint;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setQiNiuAccessKey(String qiNiuAccessKey) 
    {
        this.qiNiuAccessKey = qiNiuAccessKey;
    }

    public String getQiNiuAccessKey() 
    {
        return qiNiuAccessKey;
    }
    public void setQiNiuSecretKey(String qiNiuSecretKey) 
    {
        this.qiNiuSecretKey = qiNiuSecretKey;
    }

    public String getQiNiuSecretKey() 
    {
        return qiNiuSecretKey;
    }
    public void setQiNiuArea(String qiNiuArea) 
    {
        this.qiNiuArea = qiNiuArea;
    }

    public String getQiNiuArea() 
    {
        return qiNiuArea;
    }
    public void setQiNiuBucket(String qiNiuBucket) 
    {
        this.qiNiuBucket = qiNiuBucket;
    }

    public String getQiNiuBucket() 
    {
        return qiNiuBucket;
    }
    public void setQiNiuPictureBaseUrl(String qiNiuPictureBaseUrl) 
    {
        this.qiNiuPictureBaseUrl = qiNiuPictureBaseUrl;
    }

    public String getQiNiuPictureBaseUrl() 
    {
        return qiNiuPictureBaseUrl;
    }
    public void setUploadQiNiu(String uploadQiNiu) 
    {
        this.uploadQiNiu = uploadQiNiu;
    }

    public String getUploadQiNiu() 
    {
        return uploadQiNiu;
    }
    public void setOpenEmailActivate(String openEmailActivate) 
    {
        this.openEmailActivate = openEmailActivate;
    }

    public String getOpenEmailActivate() 
    {
        return openEmailActivate;
    }
    public void setStartEmailNotification(String startEmailNotification) 
    {
        this.startEmailNotification = startEmailNotification;
    }

    public String getStartEmailNotification() 
    {
        return startEmailNotification;
    }
    public void setOpenDashboardNotification(String openDashboardNotification) 
    {
        this.openDashboardNotification = openDashboardNotification;
    }

    public String getOpenDashboardNotification() 
    {
        return openDashboardNotification;
    }
    public void setDashboardNotificationMd(String dashboardNotificationMd) 
    {
        this.dashboardNotificationMd = dashboardNotificationMd;
    }

    public String getDashboardNotificationMd() 
    {
        return dashboardNotificationMd;
    }
    public void setDashboardNotification(String dashboardNotification) 
    {
        this.dashboardNotification = dashboardNotification;
    }

    public String getDashboardNotification() 
    {
        return dashboardNotification;
    }
    public void setSearchModel(Integer searchModel) 
    {
        this.searchModel = searchModel;
    }

    public Integer getSearchModel() 
    {
        return searchModel;
    }
    public void setEmailHost(String emailHost) 
    {
        this.emailHost = emailHost;
    }

    public String getEmailHost() 
    {
        return emailHost;
    }
    public void setEmailUsername(String emailUsername) 
    {
        this.emailUsername = emailUsername;
    }

    public String getEmailUsername() 
    {
        return emailUsername;
    }
    public void setEmailPassword(String emailPassword) 
    {
        this.emailPassword = emailPassword;
    }

    public String getEmailPassword() 
    {
        return emailPassword;
    }
    public void setEmailPort(Integer emailPort) 
    {
        this.emailPort = emailPort;
    }

    public Integer getEmailPort() 
    {
        return emailPort;
    }
    public void setOpenEmail(Integer openEmail) 
    {
        this.openEmail = openEmail;
    }

    public Integer getOpenEmail() 
    {
        return openEmail;
    }
    public void setLocalFileUrl(String localFileUrl) 
    {
        this.localFileUrl = localFileUrl;
    }

    public String getLocalFileUrl() 
    {
        return localFileUrl;
    }
    public void setFileUploadWay(Integer fileUploadWay) 
    {
        this.fileUploadWay = fileUploadWay;
    }

    public Integer getFileUploadWay() 
    {
        return fileUploadWay;
    }
    public void setAliYunAccessKey(String aliYunAccessKey) 
    {
        this.aliYunAccessKey = aliYunAccessKey;
    }

    public String getAliYunAccessKey() 
    {
        return aliYunAccessKey;
    }
    public void setAliYunSecretKey(String aliYunSecretKey) 
    {
        this.aliYunSecretKey = aliYunSecretKey;
    }

    public String getAliYunSecretKey() 
    {
        return aliYunSecretKey;
    }
    public void setAliYunBucket(String aliYunBucket) 
    {
        this.aliYunBucket = aliYunBucket;
    }

    public String getAliYunBucket() 
    {
        return aliYunBucket;
    }
    public void setAliYunEndpoint(String aliYunEndpoint) 
    {
        this.aliYunEndpoint = aliYunEndpoint;
    }

    public String getAliYunEndpoint() 
    {
        return aliYunEndpoint;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("qiNiuAccessKey", getQiNiuAccessKey())
            .append("qiNiuSecretKey", getQiNiuSecretKey())
            .append("qiNiuArea", getQiNiuArea())
            .append("qiNiuBucket", getQiNiuBucket())
            .append("qiNiuPictureBaseUrl", getQiNiuPictureBaseUrl())
            .append("uploadQiNiu", getUploadQiNiu())
            .append("openEmailActivate", getOpenEmailActivate())
            .append("startEmailNotification", getStartEmailNotification())
            .append("openDashboardNotification", getOpenDashboardNotification())
            .append("dashboardNotificationMd", getDashboardNotificationMd())
            .append("dashboardNotification", getDashboardNotification())
            .append("searchModel", getSearchModel())
            .append("emailHost", getEmailHost())
            .append("emailUsername", getEmailUsername())
            .append("emailPassword", getEmailPassword())
            .append("emailPort", getEmailPort())
            .append("openEmail", getOpenEmail())
            .append("localFileUrl", getLocalFileUrl())
            .append("fileUploadWay", getFileUploadWay())
            .append("aliYunAccessKey", getAliYunAccessKey())
            .append("aliYunSecretKey", getAliYunSecretKey())
            .append("aliYunBucket", getAliYunBucket())
            .append("aliYunEndpoint", getAliYunEndpoint())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
