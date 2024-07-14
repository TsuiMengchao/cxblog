package me.mcx.blog.domain.vo.article;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ApiArchiveVO {

    /**
     * 主键id
     */
    private Long id;

    /**
     * 文章标题
     */
    private String title;


    /**
     * 发表年月
     */
    private String time;

    /**
     * 发表的具体时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date formatTime;


}
