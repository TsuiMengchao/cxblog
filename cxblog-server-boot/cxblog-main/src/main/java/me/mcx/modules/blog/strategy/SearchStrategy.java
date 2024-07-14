package me.mcx.modules.blog.strategy;

import me.mcx.modules.blog.domain.vo.ApiArticleSearchVO;

import java.util.List;

/**
 * @author MCX
 * @date 2022/1/19
 * @apiNote 搜索策略
 */
public interface SearchStrategy {
    /**
     * 搜索文章
     *
     * @param keywords 关键字
     * @return {@link List<  ApiArticleSearchVO  >} 文章列表
     */
    List<ApiArticleSearchVO> searchArticle(String keywords);
}
