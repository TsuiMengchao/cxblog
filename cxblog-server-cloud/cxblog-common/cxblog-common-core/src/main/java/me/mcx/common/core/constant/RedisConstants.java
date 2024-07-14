package me.mcx.common.core.constant;

/**
 * @author blue
 * @description: redis常用常量
 * @date 2021/7/30 15:12
 */
public class RedisConstants {

    /**
     *
     */
    public static String LOGIN_TOKEN = "login:token:";

    /**
     * 验证码
     */
    public static String CAPTCHA_CODE = "CAPTCHA_CODE:";

    /**
     * 验证码有效期（分钟）
     */
    public static final Integer CAPTCHA_EXPIRATION = 5;

    /**
     * 标签点击量key
     */
    public static String TAG_CLICK_VOLUME = "TAG_CLICK_VOLUME";

    /**
     * 文章阅读key
     */
    public static String ARTICLE_READING = "ARTICLE_READING";


    /**
     * 邮箱验证码
     */
    public static String EMAIL_CODE = "email_code_";

    /**
     * 邮箱验证码
     */
    public static String PHONE_CODE = "phone_code_";

    /**
     * 公众号获取得验证码
     */
    public static String WECHAT_CODE = "wechat_code_";

    /**
     * 文章验证码校验通过的ip
     */
    public static String CHECK_CODE_IP = "check_code_ip";

    /**
     * 访客
     */
    public static final String UNIQUE_VISITOR = "unique_visitor";


    /**
     * 博客浏览量
     */
    public static final String BLOG_VIEWS_COUNT = "blog_views_count";

    /**
     * 访客量
     */
    public static final String UNIQUE_VISITOR_COUNT = "unique_visitor_count";

    /**
     * 用户点赞文章
     */
    public static final String ARTICLE_USER_LIKE = "article_user_like:";


    /**
     * 文章点赞量
     */
    public static final String ARTICLE_LIKE_COUNT = "article_like_count";

    /**
     * 微信登录状态
     */
    public static final String WX_LOGIN_USER = "wx_login_user:";

    /**
     * 微信登录状态
     */
    public static final String WX_LOGIN_USER_STATUE = "wx_login_user_statue:";

    /**
     * 说说点赞key
     */
    public static final String SAY_LIKE_KEY = "say_like:";
    /**
     * 说说用户点赞key
     */
    public static final String SAY_LIKE_USER = "say_like_user:";


}
