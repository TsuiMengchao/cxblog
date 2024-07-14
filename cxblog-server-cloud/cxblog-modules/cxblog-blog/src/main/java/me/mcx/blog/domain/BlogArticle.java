package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 博客文章对象 blog_article
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogArticle extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 分类id */
    @Excel(name = "分类id")
    private Long categoryId;

    /** 文章标题 */
    @Excel(name = "文章标题")
    private String title;

    /** 文章封面地址 */
    @Excel(name = "文章封面地址")
    private String avatar;

    /** 文章简介 */
    @Excel(name = "文章简介")
    private String summary;

    /** 文章内容 （最多两百字） */
    @Excel(name = "文章内容 ", readConverterExp = "最=多两百字")
    private String content;

    /** 文章内容md版 */
    @Excel(name = "文章内容md版")
    private String contentMd;

    /** 阅读方式 0无需验证 1：评论阅读 2：点赞阅读 3：扫码阅读 */
    @Excel(name = "阅读方式 0无需验证 1：评论阅读 2：点赞阅读 3：扫码阅读")
    private Integer readType;

    /** 是否置顶 0否 1是 */
    @Excel(name = "是否置顶 0否 1是")
    private Long isStick;

    /** 是否发布 0：下架 1：发布 */
    @Excel(name = "是否发布 0：下架 1：发布")
    private Long isPublish;

    /** 是否原创  0：转载 1:原创 */
    @Excel(name = "是否原创  0：转载 1:原创")
    private Long isOriginal;

    /** 转载地址 */
    @Excel(name = "转载地址")
    private String originalUrl;

    /** 文章阅读量 */
    @Excel(name = "文章阅读量")
    private Long quantity;

    /** 是否首页轮播 */
    @Excel(name = "是否首页轮播")
    private Long isCarousel;

    /** 是否推荐 */
    @Excel(name = "是否推荐")
    private Long isRecommend;

    /** 关键词 */
    @Excel(name = "关键词")
    private String keywords;

    /** 发布地址 */
    @Excel(name = "发布地址")
    private String address;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setCategoryId(Long categoryId) 
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId() 
    {
        return categoryId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }
    public void setSummary(String summary) 
    {
        this.summary = summary;
    }

    public String getSummary() 
    {
        return summary;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setContentMd(String contentMd) 
    {
        this.contentMd = contentMd;
    }

    public String getContentMd() 
    {
        return contentMd;
    }
    public void setReadType(Integer readType) 
    {
        this.readType = readType;
    }

    public Integer getReadType() 
    {
        return readType;
    }
    public void setIsStick(Long isStick) 
    {
        this.isStick = isStick;
    }

    public Long getIsStick() 
    {
        return isStick;
    }
    public void setIsPublish(Long isPublish) 
    {
        this.isPublish = isPublish;
    }

    public Long getIsPublish() 
    {
        return isPublish;
    }
    public void setIsOriginal(Long isOriginal) 
    {
        this.isOriginal = isOriginal;
    }

    public Long getIsOriginal() 
    {
        return isOriginal;
    }
    public void setOriginalUrl(String originalUrl) 
    {
        this.originalUrl = originalUrl;
    }

    public String getOriginalUrl() 
    {
        return originalUrl;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }
    public void setIsCarousel(Long isCarousel) 
    {
        this.isCarousel = isCarousel;
    }

    public Long getIsCarousel() 
    {
        return isCarousel;
    }
    public void setIsRecommend(Long isRecommend) 
    {
        this.isRecommend = isRecommend;
    }

    public Long getIsRecommend() 
    {
        return isRecommend;
    }
    public void setKeywords(String keywords) 
    {
        this.keywords = keywords;
    }

    public String getKeywords() 
    {
        return keywords;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("categoryId", getCategoryId())
            .append("title", getTitle())
            .append("avatar", getAvatar())
            .append("summary", getSummary())
            .append("content", getContent())
            .append("contentMd", getContentMd())
            .append("readType", getReadType())
            .append("isStick", getIsStick())
            .append("isPublish", getIsPublish())
            .append("isOriginal", getIsOriginal())
            .append("originalUrl", getOriginalUrl())
            .append("quantity", getQuantity())
            .append("isCarousel", getIsCarousel())
            .append("isRecommend", getIsRecommend())
            .append("keywords", getKeywords())
                .append("address", getAddress())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
