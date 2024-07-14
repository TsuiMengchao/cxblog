package me.mcx.common.security.aspect;

import me.mcx.common.security.annotation.AccessLimit;
import me.mcx.common.core.exception.base.BaseException;
import me.mcx.common.core.utils.ServletUtils;
import me.mcx.common.core.utils.ip.IpUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.TimeUnit;


/**
 * @title: AccessLimitAspect
 * @description: 限流切面类
 */
@Aspect
@Component
public class AccessLimitAspect {

    private static final Logger logger = LoggerFactory.getLogger(AccessLimitAspect.class);

    @Autowired
    private RedisTemplate redisTemplate;

    @Before("@annotation(accessLimit)")
    public void doBefore(JoinPoint joinPoint, AccessLimit accessLimit) throws Throwable {
        int time = accessLimit.time();

        HttpServletRequest request = ServletUtils.getRequest();
        // 拼接redis key = IP + Api限流
            String key = IpUtils.getIpAddr() + request.getRequestURI();
            // 获取redis的value
            Integer maxTimes = null;
            Object value = redisTemplate.opsForValue().get(key);
            if (value != null) {
                maxTimes = (Integer) value;
            }
            if (maxTimes == null) {
                // 如果redis中没有该ip对应的时间则表示第一次调用，保存key到redis
                redisTemplate.opsForValue().set(key, 1, time, TimeUnit.SECONDS);
            } else if (maxTimes < accessLimit.count()) {
                // 如果redis中的时间比注解上的时间小则表示可以允许访问,这是修改redis的value时间
                redisTemplate.opsForValue().set(key, maxTimes + 1, time, TimeUnit.SECONDS);
            } else {
                // 请求过于频繁
                logger.info("API请求限流拦截启动,{} 请求过于频繁", key);
                throw new BaseException("请求过于频繁,稍后重试");
            }
    }
}
