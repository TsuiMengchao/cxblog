package me.mcx.msg;

import com.alibaba.nacos.api.NacosFactory;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.api.exception.NacosException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import me.mcx.common.security.annotation.EnableCustomConfig;
import me.mcx.common.security.annotation.EnableRyFeignClients;
import me.mcx.common.swagger.annotation.EnableCustomSwagger2;

import java.util.Properties;

/**
 * 通信模块
 * 
 * @author cxblog
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class MsgApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(MsgApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  通信模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
