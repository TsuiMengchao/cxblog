package me.mcx.blog.domain.vo.article;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author blue
 * @date 2021/12/30
 * @apiNote
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ApiArticleSearchVO {

    @ApiModelProperty(value = "id")
    private Long id;


    @ApiModelProperty(value = "文章标题")
    private String title;


    @ApiModelProperty(value = "文章内容")
    private String summary;
}
