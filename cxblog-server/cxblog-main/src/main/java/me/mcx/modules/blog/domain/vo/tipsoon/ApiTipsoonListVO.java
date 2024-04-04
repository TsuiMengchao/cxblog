package me.mcx.modules.blog.domain.vo.tipsoon;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import me.mcx.utils.DateUtil;

import java.util.Date;
import java.util.List;

/**
 * @author: 辰雪
 * @date: 2023/10/16
 * @describe:
 */
@Data
public class ApiTipsoonListVO {
    @ApiModelProperty(value = "主键id")
    private String id;


    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    @ApiModelProperty(value = "用户头像")
    private String avatar;

    @ApiModelProperty(value = "用户简介")
    private String intro;

    @ApiModelProperty(value = "圈子名称")
    private String talkName;

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "关联网页信息")
    private String site;

    @ApiModelProperty(value = "关联图片地址")
    private String imgUrl;

    @ApiModelProperty(value = "时间字符串")
    private String createTimeStr;

    @ApiModelProperty(value = "点赞量")
    private int likeCount;

    @ApiModelProperty(value = "用户是否点赞")
    private int isLike;

    @ApiModelProperty(value = "点赞列表")
    private List<ApiTipsoonLikeListVO> likeListVO;

    @ApiModelProperty(value = "评论量")
    private int commentCount;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date createTime;
}
