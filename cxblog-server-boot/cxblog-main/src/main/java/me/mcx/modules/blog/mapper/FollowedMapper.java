package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.mcx.modules.blog.domain.Followed;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Mapper
public interface FollowedMapper extends BaseMapper<Followed> {

    /**
     * 统计当前用户七天的关注量
     * @param id
     * @return
     */
    int countQiDay(String id);
}
