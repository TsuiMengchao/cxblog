package me.mcx.blog.service.web;

import me.mcx.blog.domain.vo.message.ImMessageVO;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.system.api.model.user.ImOnlineUserVO;

import java.util.List;
import java.util.Set;

/**
 *  聊天服务类
 *
 * @author blue
 * @since 2021-11-10
 */
public interface ApiImMessageService {


    /**
     * 获取历史聊天记录
     * @return
     */
    List<ImMessageVO> selectHistoryList();


    /**
     * 获取在线用户列表
     */
    List<ImOnlineUserVO> selectOnlineUserList(Set<String> strings);

    /**
     * 获取单聊历史消息
     * @return
     */
    List<ImMessageVO> selectUserImHistoryList(String fromUserId, String toUserId);

    /**
     * 获取房间列表
     * @return
     */
    AjaxResult selectRoomList();

    /**
     * 创建房间
     * @param userId
     * @return
     */
    AjaxResult addRoom(String userId);

    /**
     * 已读消息
     * @param userId
     * @return
     */
    AjaxResult read(String userId);

    /**
     * 删除房间
     * @param roomId 房间id
     * @return
     */
    AjaxResult deleteRoom(String roomId);

    /**
     * 发送消息
     * @param message 消息
     * @return
     */
    AjaxResult chat(ImMessageVO message);

    /**
     * 撤回消息
     * @param message 消息对象
     * @return
     */
    AjaxResult withdraw(ImMessageVO message);

    /**
     * 获取跟当前用户有关的系统通知
     * @return
     */
    List<ImMessageVO> getMessageNotice(Integer type);

    /**
     * 获取未读的最新系统通知
     * @return
     */
    AjaxResult getNewSystemNotice();

    /**
     * 根据类型删除所有消息
     * @param type
     * @return
     */
    AjaxResult deleteByNoticeType(String id,Integer type);

    /**
     * 获取系统通知-小程序
     * @param type
     * @return
     */
    List<ImMessageVO> getMessageNoticeApplet(Integer type);

    /**
     * 标记消息为已读
     * @param id
     * @return
     */
    AjaxResult markReadMessageNoticeApplet(String id);
}
