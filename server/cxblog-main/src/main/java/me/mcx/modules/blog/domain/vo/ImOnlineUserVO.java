package me.mcx.modules.blog.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 聊天室在线用户列表
 */
@Data
public class ImOnlineUserVO {
    @ApiModelProperty(value = "用户id")
    private String id;
    @ApiModelProperty(value = "用户昵称")
    private String nickname;
    @ApiModelProperty(value = "用户头像")
    private String avatar;
}
