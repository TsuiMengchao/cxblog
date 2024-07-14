package me.mcx.modules.blog.domain.dto;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import me.mcx.utils.DateUtil;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @author MCX
 * @date 2022/1/25
 * @apiNote
 */
@Data
public class ArticleDTO {
    private Long id;
    private Long userId;
    private String title;
    private String avatar;
    private String summary;
    private Integer quantity;
    private String content;
    private String contentMd;

    private String keywords;
    @ApiModelProperty(value = "阅读方式 0无需验证 1：评论阅读 2：点赞阅读 3：扫码阅读")
    private Integer readType;
    private Integer isStick;
    private Integer isOriginal;
    private String originalUrl;
    private String categoryName;
    private Integer isPublish;

    private Integer isCarousel;

    private Integer isRecommend;

    private List<String> tags;

    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date createTime;
    @TableField(fill = FieldFill.UPDATE)
    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date updateTime;
}
