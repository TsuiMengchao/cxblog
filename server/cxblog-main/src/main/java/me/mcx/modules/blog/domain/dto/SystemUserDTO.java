package me.mcx.modules.blog.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class SystemUserDTO {

    @ApiModelProperty(name = "id", value = "用户id", required = true, dataType = "Long")
    private Long id;

    @ApiModelProperty(name = "avatar", value = "头像", required = true, dataType = "String")
    private String avatar;

    @NotBlank(message = "用户名不能为空")
    @ApiModelProperty(name = "username", value = "用户名", required = true, dataType = "String")
    private String username;

    @NotBlank(message = "密码不能为空")
    @ApiModelProperty(name = "password", value = "密码", required = true, dataType = "String")
    private String password;

    @NotBlank(message = "昵称不能为空")
    @ApiModelProperty(name = "nickname", value = "昵称", required = true, dataType = "String")
    private String nickname;

    @ApiModelProperty(name = "status", value = "状态", required = true, dataType = "int")
    private int status;

    @ApiModelProperty(name = "roleId", value = "角色", required = true, dataType = "int")
    private int roleId;
}
