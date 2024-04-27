package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.TipsoonComment;
import me.mcx.modules.blog.domain.vo.SystemCommentVO;
import me.mcx.modules.blog.domain.vo.talk.ApiForumCommentListVO;
import me.mcx.modules.blog.domain.vo.tipsoon.ApiTipsoonCommentVO;
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
public interface TipsoonCommentMapper extends BaseMapper<TipsoonComment> {
    Page<SystemCommentVO> selectPageList(@Param("page")Page<Object> objectPage, @Param("keywords")String keywords);

    Page<ApiTipsoonCommentVO> selectListByTipsoonId(@Param("page")Page<Object> page, @Param("tipsoonId") String tipsoonId);

}
