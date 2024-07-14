package me.mcx.blog.domain;

import lombok.Data;
import org.dromara.easyes.annotation.HighLight;
import org.dromara.easyes.annotation.IndexField;
import org.dromara.easyes.annotation.IndexId;
import org.dromara.easyes.annotation.IndexName;
import org.dromara.easyes.annotation.rely.Analyzer;
import org.dromara.easyes.annotation.rely.FieldType;
import org.dromara.easyes.annotation.rely.IdType;

@Data
@IndexName(value = "blog")
public class ArticleElastic {

    /**
     * es中的唯一id
     */
    @IndexId(type = IdType.CUSTOMIZE)
    private Long id;
    /**
     * 文档标题
     */
    @HighLight(preTag = "<em style='color:red'>", postTag = "</em>")
    @IndexField(fieldType = FieldType.TEXT,analyzer = Analyzer.IK_MAX_WORD, searchAnalyzer = Analyzer.IK_MAX_WORD)
    private String title;
    /**
     * 文档内容
     */
    @HighLight(preTag = "<em style='color:red'>", postTag = "</em>")
    @IndexField(fieldType = FieldType.TEXT,analyzer = Analyzer.IK_MAX_WORD, searchAnalyzer = Analyzer.IK_MAX_WORD)
    private String summary;

    @IndexField(fieldType = FieldType.INTEGER)
    private Integer isPublish;


    @IndexField(fieldType = FieldType.DATE, dateFormat = "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis")
    private String createTime;
}
