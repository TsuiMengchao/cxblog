package me.mcx.payment;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import me.mcx.common.security.annotation.EnableCustomConfig;
import me.mcx.common.security.annotation.EnableRyFeignClients;
import me.mcx.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 支付模块
 * 
 * @author cxblog
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class PaymentApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(PaymentApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  支付模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
