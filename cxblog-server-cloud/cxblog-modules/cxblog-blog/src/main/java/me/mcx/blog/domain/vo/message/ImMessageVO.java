package me.mcx.blog.domain.vo.message;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import me.mcx.common.core.utils.DateUtils;

import java.util.Date;
import java.util.Map;

@Data
public class ImMessageVO {

    @ApiModelProperty(value = "主键id")
    private String id;

    @ApiModelProperty(value = "消息类型")
    private Integer code;

    @ApiModelProperty(value = "接收用户Id")
    private String toUserId;

    @ApiModelProperty(value = "发送用户id")
    private String fromUserId;

    @ApiModelProperty(value = "发送用户头像")
    private String fromUserAvatar;

    @ApiModelProperty(value = "发送用户昵称")
    private String fromUserNickname;


    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "ip")
    private String ip;

    @ApiModelProperty(value = "ip地址")
    private String ipSource;

    @ApiModelProperty(value = "是否撤回")
    private int isWithdraw;

    @ApiModelProperty(value = "文章id")
    private Integer articleId;

    @ApiModelProperty(value = "文章标题")
    private String articleTitle;

    @ApiModelProperty(value = "消息类型 1普通消息 2图片")
    private int type;

    @ApiModelProperty(value = "是否已读 0:未读 1：已读")
    private int isRead;

    @ApiModelProperty(value = "选中下标")
    private Integer index;

    @ApiModelProperty(value = "评论标记 1回复评论 2发表评论")
    private Integer commentMark;

    @ApiModelProperty(value = "通知类型 0系统通知 1：评论 2：关注 3点赞 4收藏 5私信")
    private Integer noticeType;

    @ApiModelProperty(value = "@用户id 多个逗号分隔")
    private String atUserId;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @ApiModelProperty(value = "创建时间")
    private String createTimeStr;

    @ApiModelProperty(value = "扩展信息")
    private Map<String, Object> ext;
}
