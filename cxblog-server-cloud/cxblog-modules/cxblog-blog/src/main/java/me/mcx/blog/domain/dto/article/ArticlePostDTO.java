package me.mcx.blog.domain.dto.article;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class ArticlePostDTO {
    @ApiModelProperty(name = "id", value = "文章id")
    private Long id;
    @ApiModelProperty(name = "title", value = "文章标题")
    private String title;

    @ApiModelProperty(name = "summary", value = "文章简介")
    private String summary;

    @ApiModelProperty(name = "avatar", value = "文章封面")
    private String avatar;

    @ApiModelProperty(name = "categoryId", value = "文章分类id")
    private Long categoryId;

    @ApiModelProperty(value = "是否发布")
    private Integer isPublish = 2;

    @ApiModelProperty(value = "是否原创 0：转载 1:原创")
    private Integer isOriginal;

    @ApiModelProperty(value = "转发地址")
    private String originalUrl;

    @ApiModelProperty(value = "文章内容")
    private String content;

    @ApiModelProperty(value = "文章内容MD版")
    private String contentMd;

    @ApiModelProperty(value = "关键词")
    private String keywords;

    @ApiModelProperty(name = "userId", value = "用户id")
    private String userId;

    @ApiModelProperty(value = "文章标签id集合")
    private List<Long> tagList;
}
