package me.mcx.modules.blog.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import me.mcx.utils.DateUtil;
import lombok.Data;

import java.util.Date;

/**
 * @author: 辰雪
 * @date: 2023/10/30
 * @describe:
 */
@Data
public class TableListVO {

    private String  name;

    private String  comment;

    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date  createTime;

    @JsonFormat(pattern = DateUtil.FORMAT_STRING,timezone="GMT+8")
    private Date updateTime;
}
