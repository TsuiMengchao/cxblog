package me.mcx.modules.blog.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.mcx.modules.blog.domain.Prop;
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
public interface PropMapper extends BaseMapper<Prop> {


    /**
     * 根据用户id和道具id查看用户获取的详情
     * @param userId 用户id
     * @param id 道具id
     * @return
     */
    Integer selectPropByUserIdAndPropId(@Param("userId") String userId, @Param("propId")Integer id);

    /**
     * 扣除道具卡
     * @param userId 用户id
     * @param id 道具id
     * @param num 数据
     */
    void deductPropByUserIdAndPropId(@Param("userId") String userId, @Param("propId")Integer id,@Param("num")int num);
}
