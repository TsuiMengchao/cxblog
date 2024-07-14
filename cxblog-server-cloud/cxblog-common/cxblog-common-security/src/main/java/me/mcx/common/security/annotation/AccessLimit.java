package me.mcx.common.security.annotation;

import java.lang.annotation.*;

/**
 * @title: AccessLimit
 * @description: 限流注解
 */
@Documented
@Target(ElementType.METHOD)//注解放置的目标位置即方法级别
@Retention(RetentionPolicy.RUNTIME)//注解在哪个阶段执行
public @interface AccessLimit {

    /**
     * 在时间窗内的限流次数
     * @return
     */
    public int count() default 10;

    /**
     * 限流时间窗
     * @return
     */
    public int time() default 10;  // 限流时间

    public boolean pass() default false;  // 超过限流次数是否也放行

}
