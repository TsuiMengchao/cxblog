package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.ArticleCollect;
import me.mcx.modules.blog.domain.vo.ApiArticleListVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Mapper
public interface CollectMapper extends BaseMapper<ArticleCollect> {

    /**
     * 我的收藏列表
     * @return
     */
    Page<ApiArticleListVO> selectCollectList(Page<ApiArticleListVO> tPage, @Param("userId") String userId);
}
