package me.mcx.modules.blog.domain;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;


import java.io.Serializable;
import java.sql.Timestamp;

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
@TableName("blog_article_comment")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value="Comment对象", description="评论实体类")
public class ArticleComment extends Base2Entity implements Serializable {

    private static final long serialVersionUID=1L;


    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    @ApiModelProperty(value = "评论用户Id")
    private String userId;

    /**
     * 回复用户id
     */
    @ApiModelProperty(value = "回复用户id")
    private String replyUserId;

    /**
     * 评论文章id
     */
    @ApiModelProperty(value = "文章id")
    private Integer articleId;

    /**
     * 评论内容
     */
    @ApiModelProperty(value = "评论内容")
    private String content;

    /**
     * 父评论id
     */
    @ApiModelProperty(value = "父级id")
    private Integer parentId;

    /**
     * 创建时间
     */
    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Timestamp createTime;

    @ApiModelProperty(value = "浏览器名")
    private String browser;

    @ApiModelProperty(value = "浏览器版本")
    private String browserVersion;

    @ApiModelProperty(value = "系统名")
    @TableField("`system`")
    private String system;

    @ApiModelProperty(value = "系统版本")
    private String systemVersion;
    @ApiModelProperty(value = "ip地址")
    private String ipAddress;



}
