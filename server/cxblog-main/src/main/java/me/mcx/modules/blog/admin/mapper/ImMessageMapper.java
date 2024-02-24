package me.mcx.modules.blog.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.ImMessage;
import me.mcx.modules.blog.domain.vo.ImMessageVO;
import me.mcx.modules.blog.domain.vo.ImOnlineUserVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Mapper
public interface ImMessageMapper extends BaseMapper<ImMessage> {

    /**
     * 获取历史聊天记录
     * @return
     */
    Page<ImMessageVO> selectPublicHistoryList(Page<ImMessageVO> imMessageVOPage );

    /**
     * 获取在线用户列表
     */
    List<ImOnlineUserVO> selectPublicOnlineUserList(@Param("keys") Set<String> keys);

    /**
     * 获取单聊历史聊天记录
     * @return
     */
    Page<ImMessageVO> selectPublicUserImHistoryList(@Param("page")Page<ImMessageVO> imMessageVOPage,
                                              @Param("fromUserId") String fromUserId,@Param("toUserId")String toUserId);

    int selectListReadByUserId(@Param("toUserId") String toUserId, @Param("fromUserId")String fromUserId);

    /**
     * 已读消息
     * @param userId
     * @param loginIdAsString
     */
    void updateRead(@Param("fromUserId") String userId, @Param("toUserId") String loginIdAsString);

    Page<ImMessageVO> getMessageNotice(@Param("page")Page<Object> objectPage, @Param("userId")String userId
            , @Param("noticeType")Integer noticeType);

}
