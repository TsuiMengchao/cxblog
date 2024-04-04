package me.mcx.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties(prefix = "wechat")
public class WechatProperties {

    private String appId;
    private String secret;
    private String token;
    private String aesKey;
}
