package me.mcx.modules.blog.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("blog_forum_comment")
@ApiModel(value="ForumComment", description="")
public class ForumComment implements Serializable {
    private static final long serialVersionUID=1L;


    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "回复用户id")
    private String replyUserId;

    @ApiModelProperty(value = "父id")
    private Integer parentId;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "圈子内容id")
    private Integer forumId;

    @ApiModelProperty(value = "ip归属地")
    private String address;

    @ApiModelProperty(value = "ip")
    private String ip;


    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
}
