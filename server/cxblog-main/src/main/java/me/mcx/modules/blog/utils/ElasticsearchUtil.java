package me.mcx.modules.blog.utils;

import com.alibaba.fastjson.JSON;
import me.mcx.modules.blog.domain.vo.ApiArticleSearchVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.document.Document;
import org.springframework.data.elasticsearch.core.mapping.IndexCoordinates;
import org.springframework.data.elasticsearch.core.query.UpdateQuery;
import org.springframework.data.elasticsearch.core.query.UpdateResponse;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author MCX
 * @date 2022/1/19
 * @apiNote Elasticsearch工具类
 */
@Component
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class ElasticsearchUtil {

    private static final Logger logger = LoggerFactory.getLogger(ElasticsearchUtil.class);

    private final ElasticsearchRestTemplate elasticsearchRestTemplate;
    /**
     * 新增数据
     * @param apiArticleSearchVO 数据对象
     */
    public void save(ApiArticleSearchVO apiArticleSearchVO) {
        long time = System.currentTimeMillis();
        elasticsearchRestTemplate.save(apiArticleSearchVO);
        logger.info("耗时:"+(System.currentTimeMillis() - time));
    }

    /**
     * 删除数据
     * @param ids 文章ID集合
     */
    @Async("threadPoolTaskExecutor")
    public void delete(List<Long> ids) {
        ids.forEach(id -> elasticsearchRestTemplate.delete(id.toString(), ApiArticleSearchVO.class));
    }

    /**
     * 修改数据
     * @param apiArticleSearchVO 数据对象
     */
    public void update(ApiArticleSearchVO apiArticleSearchVO) {
        String obj = JSON.toJSONString(apiArticleSearchVO);
        Document document = Document.parse(obj);

        UpdateQuery query = UpdateQuery
                .builder(String.valueOf(apiArticleSearchVO.getId()))
                .withDocument(document)
                .build();

        IndexCoordinates indexCoordinates = elasticsearchRestTemplate.getIndexCoordinatesFor(ApiArticleSearchVO.class);

        UpdateResponse update = elasticsearchRestTemplate.update(query, indexCoordinates);
    }
}
