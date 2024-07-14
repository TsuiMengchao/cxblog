package me.mcx.blog.domain;

import java.math.BigDecimal;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 打赏记录对象 blog_sponsor
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogSponsor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 支付图片 */
    @Excel(name = "支付图片")
    private String payImg;

    /** 打赏金额 */
    @Excel(name = "打赏金额")
    private BigDecimal money;

    /** 状态 0 审核  1 通过  */
    @Excel(name = "状态 0 审核  1 通过 ")
    private Integer status;

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
    public void setPayImg(String payImg) 
    {
        this.payImg = payImg;
    }

    public String getPayImg() 
    {
        return payImg;
    }
    public void setMoney(BigDecimal money) 
    {
        this.money = money;
    }

    public BigDecimal getMoney() 
    {
        return money;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("payImg", getPayImg())
            .append("money", getMoney())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
