package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.Sponsor;
import me.mcx.modules.blog.domain.vo.sponsor.SponsorListVO;
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
public interface SponsorMapper extends BaseMapper<Sponsor> {

    Page<SponsorListVO> selectSponsorList(@Param("objectPage")Page<Object> objectPage,@Param("status") Integer status);
}
