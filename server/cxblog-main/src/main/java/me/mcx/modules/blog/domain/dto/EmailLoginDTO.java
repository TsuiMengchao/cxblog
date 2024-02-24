package me.mcx.modules.blog.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author MCX
 * @date 2022/2/25
 * @apiNote
 */
@Data
@ApiModel(description = "邮箱登录信息")
public class EmailLoginDTO {
    /**
     *  邮箱
     */
    @NotBlank(message = "用户名不能为空")
    @ApiModelProperty(name = "username", value = "username", required = true, dataType = "String")
    private String username;

    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空")
    @ApiModelProperty(name = "password", value = "password", required = true, dataType = "String")
    private String password;

}
