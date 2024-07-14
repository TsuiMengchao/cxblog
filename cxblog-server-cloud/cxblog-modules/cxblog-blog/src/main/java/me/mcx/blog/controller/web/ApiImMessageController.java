package me.mcx.blog.controller.web;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.vo.message.ImMessageVO;
import me.mcx.blog.service.web.ApiImMessageService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.web.page.TableDataInfo;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/v1/im")
@Api(tags = "聊天管理-门户")
@RequiredArgsConstructor
public class ApiImMessageController extends BaseController {

    private final ApiImMessageService imMessageService;


    /**
     * 首页-获取历史聊天记录
     * @return
     */
    @GetMapping
    public TableDataInfo selectHistoryList() {
        startPage();
        return  getDataTable(imMessageService.selectHistoryList());
    }

    /**
     * 获取房间列表
     * @return
     */
    @GetMapping(value = "/getRoomList")
    public AjaxResult selectRoomList() {
        return imMessageService.selectRoomList();
    }

    /**
     * 获取单聊历史消息
     * @param fromUserId
     * @param toUserId
     * @return
     */
    @GetMapping(value = "/selectUserImHistory")
    public TableDataInfo selectUserImHistoryList(String fromUserId,String toUserId) {
        return  getDataTable(imMessageService.selectUserImHistoryList(fromUserId,toUserId));
    }

    /**
     * 发送消息
     * @param message
     * @return
     */
    @PostMapping(value = "/chat")
    public AjaxResult chat(@RequestBody ImMessageVO message){
        return imMessageService.chat(message);
    }

    /**
     * 撤回消息
     * @param message
     * @return
     */
    @PostMapping(value = "/withdraw")
    public AjaxResult withdraw(@RequestBody ImMessageVO message){
        return imMessageService.withdraw(message);
    }

    /**
     * 已读消息
     * @param userId
     * @return
     */
    @GetMapping(value = "/read")
    public AjaxResult read(String userId) {
        return imMessageService.read(userId);
    }

    /**
     * 删除房间
     * @param roomId
     * @return
     */
    @DeleteMapping(value = "/deleteRoom")
    public AjaxResult deleteRoom(String roomId) {
        return imMessageService.deleteRoom(roomId);
    }

    /**
     * 创建房间（即点击私信按钮）
     * @param userId
     * @return
     */
    @PostMapping(value = "/addRoom")
    public AjaxResult addRoom(String userId) {
        return imMessageService.addRoom(userId);
    }

    /**
     * 获取系统通知
     * @param type
     * @return
     */
    @GetMapping(value = "/getMessageNotice")
    public TableDataInfo getMessageNotice(Integer type) {
        return getDataTable(imMessageService.getMessageNotice(type));
    }

    /**
     * 获取未读的最新通知
     * @return
     */
    @GetMapping("/getNewSystemNotice")
    public AjaxResult getNewSystemNotice(){
        return imMessageService.getNewSystemNotice();
    }

    /**
     * 根据类型删除所有消息
     * @param id
     * @param type
     * @return
     */
    @DeleteMapping("/deleteMessage")
    public AjaxResult deleteMessage(String id,Integer type){
        return imMessageService.deleteByNoticeType(id,type);
    }


    /**
     * 获取系统通知-小程序
     * @param type
     * @return
     */
    @GetMapping(value = "/getMessageNoticeApplet")
    public TableDataInfo getMessageNoticeApplet(Integer type) {
        return getDataTable(imMessageService.getMessageNoticeApplet(type));
    }

    /**
     * 标记已读-小程序
     * @param id
     * @return
     */
    @GetMapping(value = "/markReadMessageNoticeApplet")
    public AjaxResult markReadMessageNoticeApplet(String id) {
        return imMessageService.markReadMessageNoticeApplet(id);
    }

}
