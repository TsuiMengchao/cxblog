package me.mcx.modules.blog.strategy.context;

import me.mcx.modules.blog.strategy.SearchStrategy;
import me.mcx.modules.blog.domain.vo.ApiArticleSearchVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author MCX
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
