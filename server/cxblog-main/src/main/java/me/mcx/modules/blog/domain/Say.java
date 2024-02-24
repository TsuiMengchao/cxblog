package me.mcx.modules.blog.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import me.mcx.utils.DateUtil;
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
@TableName("blog_say")
@ApiModel(value="Say", description="")
public class Say implements Serializable {
    private static final long serialVersionUID=1L;


    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;


    @ApiModelProperty(value = "用户Id")
    private String userId;


    @ApiModelProperty(value = "图片地址 逗号分隔  最多九张")
    private String imgUrl;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "发表地址。可输入或者地图插件选择")
    private String address;

    @ApiModelProperty(value = "是否开放查看  0未开放 1开放")
    private Integer isPublic;


    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date createTime;

    @ApiModelProperty(value = "修改时间")
    @TableField(fill = FieldFill.UPDATE)
    private Date updateTime;
}
