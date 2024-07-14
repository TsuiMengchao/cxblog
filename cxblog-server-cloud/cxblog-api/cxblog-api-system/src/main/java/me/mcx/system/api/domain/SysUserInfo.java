package me.mcx.system.api.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 用户信息对象 sys_user_info
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class SysUserInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户信息ID */
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 用户简介 */
    @Excel(name = "用户简介")
    private String intro;

    /** 个人网站 */
    @Excel(name = "个人网站")
    private String webSite;

    /** 个人中心背景图 */
    @Excel(name = "个人中心背景图")
    private String bjCover;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    public void setIntro(String intro) 
    {
        this.intro = intro;
    }

    public String getIntro() 
    {
        return intro;
    }
    public void setWebSite(String webSite) 
    {
        this.webSite = webSite;
    }

    public String getWebSite() 
    {
        return webSite;
    }

    public void setBjCover(String bjCover) 
    {
        this.bjCover = bjCover;
    }

    public String getBjCover() 
    {
        return bjCover;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
                .append("userId", getUserId())
            .append("intro", getIntro())
            .append("webSite", getWebSite())
            .append("bjCover", getBjCover())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
