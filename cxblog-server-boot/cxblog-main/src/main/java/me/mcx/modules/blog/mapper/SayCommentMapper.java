package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.SayComment;
import me.mcx.modules.blog.domain.vo.SystemCommentVO;
import me.mcx.modules.blog.domain.vo.ApiSayCommentListVO;
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
public interface SayCommentMapper extends BaseMapper<SayComment> {
    Page<SystemCommentVO> selectPageList(@Param("page")Page<Object> objectPage, @Param("keywords")String keywords);

    Page<ApiSayCommentListVO> selectListBySayId(@Param("page")Page<Object> page, @Param("sayId") Integer sayId);
}
