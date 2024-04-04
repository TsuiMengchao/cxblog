package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.vo.ImMessageVO;
import me.mcx.modules.blog.domain.vo.ImOnlineUserVO;

import java.util.List;
import java.util.Set;

/**
 *  聊天服务类
 *
 * @author MCX
 * @since 2021-11-10
 */
public interface ApiImMessageService {


    /**
     * 获取历史聊天记录
     * @return
     */
    ResponseResult selectHistoryList();


    /**
     * 获取在线用户列表
     */
    List<ImOnlineUserVO> selectOnlineUserList(Set<String> strings);

    /**
     * 获取单聊历史消息
     * @return
     */
    ResponseResult selectUserImHistoryList(String fromUserId, String toUserId);

    /**
     * 获取房间列表
     * @return
     */
    ResponseResult selectRoomList();

    /**
     * 创建房间
     * @param userId
     * @return
     */
    ResponseResult addRoom(String userId);

    /**
     * 已读消息
     * @param userId
     * @return
     */
    ResponseResult read(String userId);

    /**
     * 删除房间
     * @param roomId 房间id
     * @return
     */
    ResponseResult deleteRoom(String roomId);

    /**
     * 发送消息
     * @param message 消息
     * @return
     */
    ResponseResult chat(ImMessageVO message);

    /**
     * 撤回消息
     * @param message 消息对象
     * @return
     */
    ResponseResult withdraw(ImMessageVO message);

    /**
     * 获取跟当前用户有关的系统通知
     * @return
     */
    ResponseResult getMessageNotice(Integer type);

    /**
     * 获取未读的最新系统通知
     * @return
     */
    ResponseResult getNewSystemNotice();

    /**
     * 根绝类型删除所有消息
     * @param type
     * @return
     */
    ResponseResult deleteByNoticeType(String id,Integer type);

    /**
     * 获取系统通知-小程序
     * @param type
     * @return
     */
    ResponseResult getMessageNoticeApplet(Integer type);

    /**
     * 标记消息为已读
     * @param id
     * @return
     */
    ResponseResult markReadMessageNoticeApplet(String id);

}
