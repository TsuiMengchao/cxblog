package me.mcx.modules.blog.domain.vo;

import me.mcx.modules.blog.domain.Article;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

/**
 * @author MCX
 * @date 2022/1/26
 * @apiNote
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SystemHomeDataVO {
    private Map<String, Object> contribute;
    private Map<String, Object> categoryList;
    private List<Map<String,Object>> userAccess;
    private List<Map<String,Object>> tagsList;
    private String dashboard;
    private List<Article> articles;
}
