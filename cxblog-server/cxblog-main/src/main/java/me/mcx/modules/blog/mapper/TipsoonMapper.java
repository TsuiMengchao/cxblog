package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.Followed;
import me.mcx.modules.blog.domain.Tipsoon;
import me.mcx.modules.blog.domain.vo.tipsoon.ApiTipsoonLikeListVO;
import me.mcx.modules.blog.domain.vo.tipsoon.ApiTipsoonListVO;
import me.mcx.modules.blog.domain.vo.tipsoon.ApiTipsoonVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Mapper
public interface TipsoonMapper extends BaseMapper<Tipsoon> {

    Page<ApiTipsoonListVO> selectTipsoonListByTalkId(@Param("page") Page<Object> page, @Param("talkId") Integer talkId,@Param("followedList") List<Followed> followedList);

    void insertTipsoonLike(@Param("tipsoonId") String tipsoonId, @Param("userId")String userId);

    void insertTipsoonCollect(@Param("tipsoonId") String tipsoonId, @Param("userId")String userId);

    int selectTipsoonUserIsRead(@Param("tipsoonId") String tipsoonId, @Param("userId")String userId);

    void insertTipsoonReaded(@Param("tipsoonId") String tipsoonId, @Param("userId")String userId);

    int selectTipsoonUserIsLike(@Param("tipsoonId") String tipsoonId, @Param("userId")String userId);

    int selectTipsoonUserIsCollect(@Param("tipsoonId") String tipsoonId, @Param("userId")String userId);

    void deleteTipsoonLikeByUerIdAndTipsoonId(@Param("tipsoonId") String tipsoonId, @Param("userId")String userId);

    void deleteTipsoonCollectByUerIdAndTipsoonId(@Param("tipsoonId") String tipsoonId, @Param("userId")String userId);

    int countTipsoonLike(String tipsoonId);

    int countTipsoonCollect(String tipsoonId);

    Page<ApiTipsoonLikeListVO> selectTipsoonLikeList(@Param("page") Page<Object> page,@Param("tipsoonId") String tipsoonId);

    ApiTipsoonVO selectTipsoon(Integer userId);

    List<ApiTipsoonVO> select10Tipsoon(Integer userId);

    ApiTipsoonVO selectTipsoonById(Integer userId, String tipsoonId);
}
