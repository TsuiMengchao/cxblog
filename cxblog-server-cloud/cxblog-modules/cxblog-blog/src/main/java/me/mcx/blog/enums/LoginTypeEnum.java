package me.mcx.blog.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum LoginTypeEnum {

    /**
     * 邮箱登录
     */
    EMAIL(1, "email"),
    /**
     * QQ登录
     */
    QQ(2, "qq"),
    /**
     * 微博登录
     */
    WEIBO(3, "weibo"),

    /**
     * 码云登录
     */
    GITEE(4, "gitee"),
    /**
     * 微信登录
     */
    WECHAT(5, "微信登录"),

    /**
     * github登录
     */
    GITHUB(6, "github");

    /**
     * 登录方式
     */
    private final Integer type;

    /**
     * 描述
     */
    private final String desc;


    public static Integer getType(String desc) {
        for (LoginTypeEnum value : LoginTypeEnum.values()) {
            if (value.getDesc().equals(desc)) {
                return value.getType();
            }
        }
        return null;
    }

}
