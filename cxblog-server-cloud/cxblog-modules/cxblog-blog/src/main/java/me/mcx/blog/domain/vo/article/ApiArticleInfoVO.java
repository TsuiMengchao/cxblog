package me.mcx.blog.domain.vo.article;

import me.mcx.blog.domain.BlogCategory;
import me.mcx.blog.domain.BlogTags;
import me.mcx.blog.domain.vo.message.ApiCommentListVO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ApiArticleInfoVO {

    @ApiModelProperty(value = "主键id")
    private Long id;

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "所属用户名")
    private String nickname;

    @ApiModelProperty(value = "文章标题")
    private String title;

    @ApiModelProperty(value = "作者头像")
    private String avatar;

    @ApiModelProperty(value = "文章简介")
    private String summary;
    @ApiModelProperty(value = "文章内容")
    private String content;

    @ApiModelProperty(value = "文章内容MD版")
    private String contentMd;

    @ApiModelProperty(value = "是否置顶 0否 1是")
    private Integer isStick;

    @ApiModelProperty(value = "发布状态")
    private Integer isPublish;

    @ApiModelProperty(value = "是否原创  0：转载 1:原创")
    private Integer isOriginal;

    @ApiModelProperty(value = "转载地址")
    private String originalUrl;

    @ApiModelProperty(value = "关键词")
    private String keywords;

    @ApiModelProperty(value = "发布地址")
    private String address;

    @ApiModelProperty(value = "阅读方式 0无需验证 1：评论阅读 2：点赞阅读 3：扫码阅读")
    private Integer readType;

    @ApiModelProperty(value = "文章阅读量")
    private Integer quantity;


    @ApiModelProperty(value = "点赞量")
    private Object likeCount;

    @ApiModelProperty(value = "评论量")
    private Integer commentCount;

    @ApiModelProperty(value = "发表时间")
    private Date createTime;

    @ApiModelProperty(value = "修改时间")
    private Date updateTime;

    @ApiModelProperty(value = "标签集合")
    private List<BlogTags> tagList;

    @ApiModelProperty(value = "分类")
    private BlogCategory category;

    @ApiModelProperty(value = "当前用户是否点赞")
    private Boolean isLike = false;

    @ApiModelProperty(value = "当前用户是否收藏")
    private int isCollect;

    @ApiModelProperty(value = "当前用户是否关注作者")
    private int isFollowed;

    @ApiModelProperty(value = "收藏量")
    private int collectCount;

    @ApiModelProperty(value = "当前用户激活阅读方式 如已评论或已点赞或已扫码验证过")
    private Boolean activeReadType = false;

    @ApiModelProperty(value = "评论")
    private List<ApiCommentListVO> apiCommentListVos;


}
