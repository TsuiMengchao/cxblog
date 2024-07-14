package me.mcx.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * github登录配置属性
 *
 * @author MCX
 * @date 2021/10/14
 **/
@Data
@Configuration
@ConfigurationProperties(prefix = "github")
public class GithubConfigProperties {

    /**
     * 微博appId
     */
    private String appId;

    /**
     * 微博appSecret
     */
    private String appSecret;

    /**
     * 微博回调域名
     */
    private String redirectUrl;



}

