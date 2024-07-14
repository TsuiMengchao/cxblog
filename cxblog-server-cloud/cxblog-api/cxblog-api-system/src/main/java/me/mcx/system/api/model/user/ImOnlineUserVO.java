package me.mcx.system.api.model.user;

import io.swagger.annotations.ApiModelProperty;

/**
 * 聊天室在线用户列表
 */
public class ImOnlineUserVO {
    @ApiModelProperty(value = "用户id")
    private String id;
    @ApiModelProperty(value = "用户昵称")
    private String nickname;
    @ApiModelProperty(value = "用户头像")
    private String avatar;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
