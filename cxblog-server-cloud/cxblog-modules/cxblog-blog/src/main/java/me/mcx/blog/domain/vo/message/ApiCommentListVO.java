package me.mcx.blog.domain.vo.message;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ApiCommentListVO {
    @ApiModelProperty(value = "主键id")
    private Integer id;

    @ApiModelProperty(value = "发表用户id")
    private String userId;

    @ApiModelProperty(value = "评论用户id")
    private String replyUserId;

    @ApiModelProperty(value = "评论内容")
    private String content;

    @ApiModelProperty(value = "发表用户昵称")
    private String nickname;
    @ApiModelProperty(value = "用户站点")
    private String webSite;

    @ApiModelProperty(value = "回复用户昵称")
    private String replyNickname;

    @ApiModelProperty(value = "回复用户站点")
    private String replyWebSite;

    @ApiModelProperty(value = "发表用户头像")
    private String avatar;

    @ApiModelProperty(value = "发表时间")
    private Date createTime;

    @ApiModelProperty(value = "发表时间")
    private String createTimeStr;

    @ApiModelProperty(value = "浏览器")
    private String browser;

    @ApiModelProperty(value = "浏览器版本")
    private String browserVersion;

    @ApiModelProperty(value = "电脑系统")
    private String system;

    @ApiModelProperty(value = "系统版本")
    private String systemVersion;

    @ApiModelProperty(value = "ip地址")
    private String ipAddress;

    @ApiModelProperty(value = "子评论集合")
    List<ApiCommentListVO> children = new ArrayList<>();


}
