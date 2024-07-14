package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.ArticleElastic;
import org.dromara.easyes.core.kernel.BaseEsMapper;
import org.springframework.stereotype.Repository;

@Repository
public interface EasyesMapper extends BaseEsMapper<ArticleElastic> {
}
