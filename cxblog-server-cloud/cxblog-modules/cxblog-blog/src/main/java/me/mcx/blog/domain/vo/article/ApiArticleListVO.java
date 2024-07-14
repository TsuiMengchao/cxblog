package me.mcx.blog.domain.vo.article;

import com.fasterxml.jackson.annotation.JsonFormat;
import me.mcx.blog.domain.BlogTags;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * 门户的文章列表vo多个地方使用到了 修改需谨慎
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ApiArticleListVO {

    @ApiModelProperty(value = "主键id")
    private Long id;

    @ApiModelProperty(value = "作者昵称")
    private String nickname;

    @ApiModelProperty(value = "作者头像")
    private String userAvatar;

    @ApiModelProperty(value = "作者id")
    private String userId;

    @ApiModelProperty(value = "文章标题")
    private String title;

    @ApiModelProperty(value = "文章封面图")
    private String avatar;

    @ApiModelProperty(value = "文章描述")
    private String summary;

    @ApiModelProperty(value = "文章内容")
    private String content;

    @ApiModelProperty(value = "是否置顶")
    private Integer isStick;

    @ApiModelProperty(value = "是否原创")
    private Integer isOriginal;

    @ApiModelProperty(value = "是否发布")
    private Integer isPublish;

    @ApiModelProperty(value = "阅读量")
    private Integer quantity;

    @ApiModelProperty(value = "评论数")
    private Integer commentCount;

    @ApiModelProperty(value = "点赞量")
    private Object likeCount;

    @ApiModelProperty(value = "收藏量")
    private int collectCount;

    @ApiModelProperty(value = "当前用户是否收藏")
    private Boolean isCollect;

    @ApiModelProperty(value = "我的评论内容")
    private String commentContent;

    @ApiModelProperty(value = "分类名")
    private String categoryName;

    @ApiModelProperty(value = "分类id")
    private String categoryId;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @ApiModelProperty(value = "格式化后的创建时间")
    private String formatCreateTime;

    @ApiModelProperty(value = "标签集合")
    private List<BlogTags> tagList;
}
