package me.mcx.modules.blog.domain.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import me.mcx.utils.DateUtil;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ApiTipsoonCommentVO {
    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private String id;

    @ApiModelProperty(value = "用户Id")
    private String userId;

    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    @ApiModelProperty(value = "回复用户Id")
    private String replyUserId;

    @ApiModelProperty(value = "回复用户昵称")
    private String replyUserNickname;

    @ApiModelProperty(value = "说说id")
    private String tipsoonId;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "ip")
    private String ip;

    @ApiModelProperty(value = "ip来源")
    private String address;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date createTime;

    @ApiModelProperty(value = "创建时间")
    private String createTimeStr;


}
