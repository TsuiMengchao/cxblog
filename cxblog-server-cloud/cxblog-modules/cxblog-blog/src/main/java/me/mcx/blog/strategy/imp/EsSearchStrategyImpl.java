package me.mcx.blog.strategy.imp;

import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.ArticleElastic;
import me.mcx.blog.domain.vo.article.ApiArticleSearchVO;
import me.mcx.blog.enums.PublishEnum;
import me.mcx.blog.strategy.SearchStrategy;
import me.mcx.blog.util.BeanCopyUtil;
import org.dromara.easyes.core.biz.EsPageInfo;
import org.dromara.easyes.core.conditions.select.LambdaEsQueryWrapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("elasticsearch")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class EsSearchStrategyImpl implements SearchStrategy {

    private static final Logger logger = LoggerFactory.getLogger(EsSearchStrategyImpl.class);

//    private final EasyesMapper easyesMapper;

    @Override
    public List<ApiArticleSearchVO> searchArticle(String keywords) {

        List<ApiArticleSearchVO> results = new ArrayList<>();

        LambdaEsQueryWrapper<ArticleElastic> wrapper = new LambdaEsQueryWrapper<>();
        wrapper.multiMatchQuery(keywords,ArticleElastic::getTitle,ArticleElastic::getSummary)
                .eq(ArticleElastic::getIsPublish, PublishEnum.PUBLISH.getCode()).orderByDesc(ArticleElastic::getCreateTime);
//        EsPageInfo<ArticleElastic> pageInfo = easyesMapper.pageQuery(wrapper);
//
//        pageInfo.getList().forEach(item -> results.add(BeanCopyUtil.copyObject(item, ApiArticleSearchVO.class)));

        logger.info("es分词搜索结果：{}",results);

        List<ApiArticleSearchVO> resultPage = results;
        return resultPage;
    }

}
