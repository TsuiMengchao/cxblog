package me.mcx.blog.domain.vo.category;

import lombok.Data;

/**
 * @author: 拾壹
 * @date: 2024/1/19
 * @describe:
 */
@Data
public class ApiCategoryListVO {

    private Integer id;

    private String name;

    private String icon;

    private int articleNum;
}
