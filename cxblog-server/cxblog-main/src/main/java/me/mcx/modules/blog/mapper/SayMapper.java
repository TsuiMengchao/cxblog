package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.Say;
import me.mcx.modules.blog.domain.vo.ApiSayVO;
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
public interface SayMapper extends BaseMapper<Say> {

    Page<ApiSayVO> selectPublicSayList(@Param("page") Page<Object> objectPage,@Param("showPrivate") boolean showPrivate);
}
