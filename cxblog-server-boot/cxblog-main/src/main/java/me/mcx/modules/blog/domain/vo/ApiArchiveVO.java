package me.mcx.modules.blog.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import me.mcx.utils.DateUtil;
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
    @JsonFormat(pattern = DateUtil.MM_DD,timezone="GMT+8")
    private Date formatTime;


}
