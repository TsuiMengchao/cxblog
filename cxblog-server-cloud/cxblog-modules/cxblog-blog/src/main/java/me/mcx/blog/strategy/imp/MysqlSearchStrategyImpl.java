package me.mcx.blog.strategy.imp;


import lombok.RequiredArgsConstructor;
import me.mcx.blog.common.Constants;
import me.mcx.blog.domain.vo.article.ApiArticleSearchVO;
import me.mcx.blog.mapper.BlogArticleMapper;
import me.mcx.blog.strategy.SearchStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("mysqlSearch")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class MysqlSearchStrategyImpl implements SearchStrategy {

    private final BlogArticleMapper articleMapper;

    @Override
    public List<ApiArticleSearchVO> searchArticle(String keywords){
        // 搜索文章
        List<ApiArticleSearchVO> articlePage = articleMapper.selectSearchArticle(keywords);
        //高亮处理
        articlePage.forEach(item -> item.setTitle(item.getTitle().replaceAll(keywords, Constants.PRE_TAG + keywords + Constants.POST_TAG)));

        return articlePage;
    }
}
