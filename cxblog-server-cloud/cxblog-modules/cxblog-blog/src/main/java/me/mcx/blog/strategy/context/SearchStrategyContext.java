package me.mcx.blog.strategy.context;

import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.vo.article.ApiArticleSearchVO;
import me.mcx.blog.strategy.SearchStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author blue
 * @date 2022/1/5
 * @apiNote 搜索策略上下文
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SearchStrategyContext {

    private final Map<String, SearchStrategy> searchStrategyMap;

    /**
     * 执行搜索策略
     *
     * @param keywords 关键字
     * @return {@link List<  ApiArticleSearchVO  >} 搜索文章
     */
    public List<ApiArticleSearchVO> executeSearchStrategy(String searchMode, String keywords) {
        return searchStrategyMap.get(searchMode).searchArticle(keywords);
    }

}
