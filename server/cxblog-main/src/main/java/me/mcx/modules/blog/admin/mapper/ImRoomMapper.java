package me.mcx.modules.blog.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.mcx.modules.blog.domain.ImRoom;
import me.mcx.modules.blog.domain.vo.ImRoomListVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Mapper
public interface ImRoomMapper extends BaseMapper<ImRoom> {


    List<ImRoomListVO> selectListByUserId(String userId);
}
