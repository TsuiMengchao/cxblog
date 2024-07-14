package me.mcx.blog.domain.dto.user;

import lombok.Data;

/**
 * @author blue
 * @date 2022/2/25
 * @apiNote
 */
@Data
public class UserInfoDTO {
    /**
     * 用户账号id
     */
    private String id;
    /**
     * 用户信息id
     */
    private Integer userInfoId;
    /**
     * 昵称
     * */
    private String nickname;
    /**
     * 简介
     * */
    private String intro;

    /**
     * 个人网站
     * */
    private String webSite;

    /**
     * 头像
     * */
    private String avatar;

   /**
     * 邮箱
     * */
    private String email;

    /**
     * 验证码
     * */
    private String code;

    /**
     * 背景封面
     * */
    private String bjCover;
}
