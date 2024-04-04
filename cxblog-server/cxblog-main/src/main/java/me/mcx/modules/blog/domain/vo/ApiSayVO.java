package me.mcx.modules.blog.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import me.mcx.utils.DateUtil;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ApiSayVO {
    @ApiModelProperty(value = "主键id")
    private String id;


    @ApiModelProperty(value = "用户Id")
    private String userId;

    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    @ApiModelProperty(value = "用户头像")
    private String avatar;


    @ApiModelProperty(value = "图片地址 逗号分隔  最多九张")
    private String imgUrl;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "发表地址。可输入或者地图插件选择")
    private String address;

    @ApiModelProperty(value = "是否开放查看  0未开放 1开放")
    private Integer isPublic;

    @ApiModelProperty(value = "点赞用户")
    private List<UserInfoVO> userLikeList;

    @ApiModelProperty(value = "是否点赞")
    private Boolean isLike;

    @ApiModelProperty(value = "评论集合")
    private List<ApiSayCommentVO> sayCommentVOList;


    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date createTime;

    @ApiModelProperty(value = "创建时间")
    private String createTimeStr;
}
