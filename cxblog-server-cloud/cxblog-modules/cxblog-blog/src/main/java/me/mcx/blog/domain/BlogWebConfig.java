package me.mcx.blog.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 网站配置对象 blog_web_config
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogWebConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** logo(文件UID) */
    @Excel(name = "logo(文件UID)")
    private String logo;

    /** 网站名称 */
    @Excel(name = "网站名称")
    private String name;

    /** 介绍 */
    @Excel(name = "介绍")
    private String summary;

    /** 关键字 */
    @Excel(name = "关键字")
    private String keyword;

    /** 作者 */
    @Excel(name = "作者")
    private String author;

    /** 备案号 */
    @Excel(name = "备案号")
    private String recordNum;

    /** 网站地址 */
    @Excel(name = "网站地址")
    private String webUrl;

    /** 支付宝收款码FileId */
    @Excel(name = "支付宝收款码FileId")
    private String aliPay;

    /** 微信收款码FileId */
    @Excel(name = "微信收款码FileId")
    private String weixinPay;

    /** github地址 */
    @Excel(name = "github地址")
    private String github;

    /** gitee地址 */
    @Excel(name = "gitee地址")
    private String gitee;

    /** QQ号 */
    @Excel(name = "QQ号")
    private String qqNumber;

    /** QQ群 */
    @Excel(name = "QQ群")
    private String qqGroup;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 微信 */
    @Excel(name = "微信")
    private String wechat;

    /** 显示的列表（用于控制邮箱、QQ、QQ群、Github、Gitee、微信是否显示在前端） */
    @Excel(name = "显示的列表", readConverterExp = "用=于控制邮箱、QQ、QQ群、Github、Gitee、微信是否显示在前端")
    private String showList;

    /** 登录方式列表（用于控制前端登录方式，如账号密码,码云,Github,QQ,微信） */
    @Excel(name = "登录方式列表", readConverterExp = "用=于控制前端登录方式，如账号密码,码云,Github,QQ,微信")
    private String loginTypeList;

    /** 是否开启评论(0:否 1:是) */
    @Excel(name = "是否开启评论(0:否 1:是)")
    private String openComment;

    /** 是否开启赞赏(0:否， 1:是) */
    @Excel(name = "是否开启赞赏(0:否， 1:是)")
    private Integer openAdmiration;

    /** 游客头像 */
    @Excel(name = "游客头像")
    private String touristAvatar;

    /** 公告 */
    @Excel(name = "公告")
    private String bulletin;

    /** 作者简介 */
    @Excel(name = "作者简介")
    private String authorInfo;

    /** 作者头像 */
    @Excel(name = "作者头像")
    private String authorAvatar;

    /** 关于我 */
    @Excel(name = "关于我")
    private String aboutMe;

    /** 是否开启音乐播放器 */
    @Excel(name = "是否开启音乐播放器")
    private Integer isMusicPlayer;

    /** 是否显示公告  0 不显示 1显示 */
    @Excel(name = "是否显示公告  0 不显示 1显示")
    private Integer showBulletin;

    /** 版权声明 */
    @Excel(name = "版权声明")
    private String copyright;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date releaseTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setLogo(String logo) 
    {
        this.logo = logo;
    }

    public String getLogo() 
    {
        return logo;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setSummary(String summary) 
    {
        this.summary = summary;
    }

    public String getSummary() 
    {
        return summary;
    }
    public void setKeyword(String keyword) 
    {
        this.keyword = keyword;
    }

    public String getKeyword() 
    {
        return keyword;
    }
    public void setAuthor(String author) 
    {
        this.author = author;
    }

    public String getAuthor() 
    {
        return author;
    }
    public void setRecordNum(String recordNum) 
    {
        this.recordNum = recordNum;
    }

    public String getRecordNum() 
    {
        return recordNum;
    }
    public void setWebUrl(String webUrl) 
    {
        this.webUrl = webUrl;
    }

    public String getWebUrl() 
    {
        return webUrl;
    }
    public void setAliPay(String aliPay) 
    {
        this.aliPay = aliPay;
    }

    public String getAliPay() 
    {
        return aliPay;
    }
    public void setWeixinPay(String weixinPay) 
    {
        this.weixinPay = weixinPay;
    }

    public String getWeixinPay() 
    {
        return weixinPay;
    }
    public void setGithub(String github) 
    {
        this.github = github;
    }

    public String getGithub() 
    {
        return github;
    }
    public void setGitee(String gitee) 
    {
        this.gitee = gitee;
    }

    public String getGitee() 
    {
        return gitee;
    }
    public void setQqNumber(String qqNumber) 
    {
        this.qqNumber = qqNumber;
    }

    public String getQqNumber() 
    {
        return qqNumber;
    }
    public void setQqGroup(String qqGroup) 
    {
        this.qqGroup = qqGroup;
    }

    public String getQqGroup() 
    {
        return qqGroup;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setWechat(String wechat) 
    {
        this.wechat = wechat;
    }

    public String getWechat() 
    {
        return wechat;
    }
    public void setShowList(String showList) 
    {
        this.showList = showList;
    }

    public String getShowList() 
    {
        return showList;
    }
    public void setLoginTypeList(String loginTypeList) 
    {
        this.loginTypeList = loginTypeList;
    }

    public String getLoginTypeList() 
    {
        return loginTypeList;
    }
    public void setOpenComment(String openComment) 
    {
        this.openComment = openComment;
    }

    public String getOpenComment() 
    {
        return openComment;
    }
    public void setOpenAdmiration(Integer openAdmiration) 
    {
        this.openAdmiration = openAdmiration;
    }

    public Integer getOpenAdmiration() 
    {
        return openAdmiration;
    }
    public void setTouristAvatar(String touristAvatar) 
    {
        this.touristAvatar = touristAvatar;
    }

    public String getTouristAvatar() 
    {
        return touristAvatar;
    }
    public void setBulletin(String bulletin) 
    {
        this.bulletin = bulletin;
    }

    public String getBulletin() 
    {
        return bulletin;
    }
    public void setAuthorInfo(String authorInfo) 
    {
        this.authorInfo = authorInfo;
    }

    public String getAuthorInfo() 
    {
        return authorInfo;
    }
    public void setAuthorAvatar(String authorAvatar) 
    {
        this.authorAvatar = authorAvatar;
    }

    public String getAuthorAvatar() 
    {
        return authorAvatar;
    }
    public void setAboutMe(String aboutMe) 
    {
        this.aboutMe = aboutMe;
    }

    public String getAboutMe() 
    {
        return aboutMe;
    }
    public void setIsMusicPlayer(Integer isMusicPlayer) 
    {
        this.isMusicPlayer = isMusicPlayer;
    }

    public Integer getIsMusicPlayer() 
    {
        return isMusicPlayer;
    }
    public void setShowBulletin(Integer showBulletin) 
    {
        this.showBulletin = showBulletin;
    }

    public Integer getShowBulletin() 
    {
        return showBulletin;
    }
    public void setCopyright(String copyright) 
    {
        this.copyright = copyright;
    }

    public String getCopyright() 
    {
        return copyright;
    }
    public void setReleaseTime(Date releaseTime) 
    {
        this.releaseTime = releaseTime;
    }

    public Date getReleaseTime() 
    {
        return releaseTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("logo", getLogo())
            .append("name", getName())
            .append("summary", getSummary())
            .append("keyword", getKeyword())
            .append("author", getAuthor())
            .append("recordNum", getRecordNum())
            .append("webUrl", getWebUrl())
            .append("aliPay", getAliPay())
            .append("weixinPay", getWeixinPay())
            .append("github", getGithub())
            .append("gitee", getGitee())
            .append("qqNumber", getQqNumber())
            .append("qqGroup", getQqGroup())
            .append("email", getEmail())
            .append("wechat", getWechat())
            .append("showList", getShowList())
            .append("loginTypeList", getLoginTypeList())
            .append("openComment", getOpenComment())
            .append("openAdmiration", getOpenAdmiration())
            .append("touristAvatar", getTouristAvatar())
            .append("bulletin", getBulletin())
            .append("authorInfo", getAuthorInfo())
            .append("authorAvatar", getAuthorAvatar())
            .append("aboutMe", getAboutMe())
            .append("isMusicPlayer", getIsMusicPlayer())
            .append("showBulletin", getShowBulletin())
            .append("copyright", getCopyright())
            .append("releaseTime", getReleaseTime())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
