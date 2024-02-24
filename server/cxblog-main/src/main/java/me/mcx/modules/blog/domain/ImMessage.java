package me.mcx.modules.blog.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import me.mcx.utils.DateUtil;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 博客评论表
 * </p>
 *
 * @author MCX
 * @since 2021-07-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("blog_im_message")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value="ImMessage对象", description="群聊实体类")
public class ImMessage implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "发送用户Id")
    private String toUserId;

    @ApiModelProperty(value = "接收用户id")
    private String fromUserId;

    @ApiModelProperty(value = "发送用户头像")
    private String toUserAvatar;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "ip")
    private String ip;

    @ApiModelProperty(value = "ip地址")
    private String ipSource;

    @ApiModelProperty(value = "是否撤回")
    private int isWithdraw;

    @ApiModelProperty(value = "评论标记 1回复评论 2发表评论")
    private Integer commentMark;

    @ApiModelProperty(value = "消息类型 1私聊 2群聊")
    private Integer code;

    @ApiModelProperty(value = "消息是否已读 0未读 2已读")
    private Integer isRead;

    @ApiModelProperty(value = "消息内容类型 1普通消息 2图片")
    private Integer type;

    @ApiModelProperty(value = "通知类型 0系统通知 1：评论 2：关注 3点赞 4收藏 5私信")
    private Integer noticeType;

    @ApiModelProperty(value = "文章id")
    private Integer articleId;

    @ApiModelProperty(value = "@用户id 多个逗号分隔")
    private String atUserId;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date createTime;





}
