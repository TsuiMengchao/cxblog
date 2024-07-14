package me.mcx.modules.blog.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

/**
 * @author MCX
 * @date 2021/12/30
 * @apiNote
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Document(indexName = "blog")
public class ApiArticleSearchVO {

    /**
     * 文章id
     */
    @Id
    private Long id;

    /**
     * 文章标题
     */
    @Field(type = FieldType.Text, analyzer = "ik_max_word")
    private String title;

    /**
     * 文章内容
     */
    @Field(type = FieldType.Text, analyzer = "ik_max_word")
    private String content;
}
