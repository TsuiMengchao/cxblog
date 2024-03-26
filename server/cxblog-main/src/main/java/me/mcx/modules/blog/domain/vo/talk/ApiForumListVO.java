package me.mcx.modules.blog.domain.vo.talk;

import com.fasterxml.jackson.annotation.JsonFormat;
import me.mcx.utils.DateUtil;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author: 辰雪
 * @date: 2023/10/16
 * @describe:
 */
@Data
public class ApiForumListVO {
    @ApiModelProperty(value = "主键id")
    private Integer id;


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

    @ApiModelProperty(value = "圈子id")
    private Integer talkId;

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
    private List<ApiForumLikeListVO> likeListVO;

    @ApiModelProperty(value = "评论量")
    private int commentCount;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date createTime;

    @ApiModelProperty(value = "当前用户是否关注作者")
    private int isFollowed;
}
