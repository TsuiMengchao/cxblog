package me.mcx.payment.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 支付宝配置类对象 payment_alipay_config
 * 
 * @author mcx
 * @date 2024-05-08
 */
public class PaymentAlipayConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long configId;

    /** 应用ID */
    @Excel(name = "应用ID")
    private String appId;

    /** 编码 */
    @Excel(name = "编码")
    private String charset;

    /** 类型 固定格式json */
    @Excel(name = "类型 固定格式json")
    private String format;

    /** 网关地址 */
    @Excel(name = "网关地址")
    private String gatewayUrl;

    /** 异步回调 */
    @Excel(name = "异步回调")
    private String notifyUrl;

    /** 私钥 */
    @Excel(name = "私钥")
    private String privateKey;

    /** 公钥 */
    @Excel(name = "公钥")
    private String publicKey;

    /** 回调地址 */
    @Excel(name = "回调地址")
    private String returnUrl;

    /** 签名方式 */
    @Excel(name = "签名方式")
    private String signType;

    /** 商户号 */
    @Excel(name = "商户号")
    private String sysServiceProviderId;

    public void setConfigId(Long configId) 
    {
        this.configId = configId;
    }

    public Long getConfigId() 
    {
        return configId;
    }
    public void setAppId(String appId) 
    {
        this.appId = appId;
    }

    public String getAppId() 
    {
        return appId;
    }
    public void setCharset(String charset) 
    {
        this.charset = charset;
    }

    public String getCharset() 
    {
        return charset;
    }
    public void setFormat(String format) 
    {
        this.format = format;
    }

    public String getFormat() 
    {
        return format;
    }
    public void setGatewayUrl(String gatewayUrl) 
    {
        this.gatewayUrl = gatewayUrl;
    }

    public String getGatewayUrl() 
    {
        return gatewayUrl;
    }
    public void setNotifyUrl(String notifyUrl) 
    {
        this.notifyUrl = notifyUrl;
    }

    public String getNotifyUrl() 
    {
        return notifyUrl;
    }
    public void setPrivateKey(String privateKey) 
    {
        this.privateKey = privateKey;
    }

    public String getPrivateKey() 
    {
        return privateKey;
    }
    public void setPublicKey(String publicKey) 
    {
        this.publicKey = publicKey;
    }

    public String getPublicKey() 
    {
        return publicKey;
    }
    public void setReturnUrl(String returnUrl) 
    {
        this.returnUrl = returnUrl;
    }

    public String getReturnUrl() 
    {
        return returnUrl;
    }
    public void setSignType(String signType) 
    {
        this.signType = signType;
    }

    public String getSignType() 
    {
        return signType;
    }
    public void setSysServiceProviderId(String sysServiceProviderId) 
    {
        this.sysServiceProviderId = sysServiceProviderId;
    }

    public String getSysServiceProviderId() 
    {
        return sysServiceProviderId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("configId", getConfigId())
            .append("appId", getAppId())
            .append("charset", getCharset())
            .append("format", getFormat())
            .append("gatewayUrl", getGatewayUrl())
            .append("notifyUrl", getNotifyUrl())
            .append("privateKey", getPrivateKey())
            .append("publicKey", getPublicKey())
            .append("returnUrl", getReturnUrl())
            .append("signType", getSignType())
            .append("sysServiceProviderId", getSysServiceProviderId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
