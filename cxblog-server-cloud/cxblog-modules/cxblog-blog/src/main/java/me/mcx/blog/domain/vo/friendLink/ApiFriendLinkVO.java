package me.mcx.blog.domain.vo.friendLink;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ApiFriendLinkVO {

    @ApiModelProperty(value = "网站名称")
    private String name;

    @ApiModelProperty(value = "网站地址")
    private String url;

    @ApiModelProperty(value = "网站头像地址")
    private String avatar;

    @ApiModelProperty(value = "网站描述")
    private String info;

}
