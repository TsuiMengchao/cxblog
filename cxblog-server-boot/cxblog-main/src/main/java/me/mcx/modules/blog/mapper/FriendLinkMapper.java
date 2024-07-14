package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.mcx.modules.blog.domain.FriendLink;
import me.mcx.modules.blog.domain.vo.ApiFriendLinkVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * 友情链接表 Mapper 接口
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Mapper
public interface FriendLinkMapper extends BaseMapper<FriendLink> {

    Integer getMaxSort();

    void top(@Param("id") Integer id, @Param("sort") int sort);

    List<ApiFriendLinkVO> selectLinkList(@Param("status") Integer status);

}
