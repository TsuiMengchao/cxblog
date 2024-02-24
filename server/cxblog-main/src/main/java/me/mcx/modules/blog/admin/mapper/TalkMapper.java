package me.mcx.modules.blog.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.mcx.modules.blog.domain.Talk;
import me.mcx.modules.blog.domain.vo.talk.ApiTalkListVO;
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
public interface TalkMapper extends BaseMapper<Talk> {

    /**
     * 门户获取话题列表
     * @return
     */
    List<ApiTalkListVO> selectTalkListApi();


}
