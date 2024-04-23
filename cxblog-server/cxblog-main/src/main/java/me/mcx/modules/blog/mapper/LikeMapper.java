package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.ArticleLike;
import me.mcx.modules.blog.domain.vo.ApiArticleListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Mapper
public interface LikeMapper extends BaseMapper<ArticleLike> {

    /**
     * 我的收藏列表
     * @return
     */
    Page<ApiArticleListVO> selectLikeList(Page<ApiArticleListVO> tPage, @Param("userId") String userId);
}
