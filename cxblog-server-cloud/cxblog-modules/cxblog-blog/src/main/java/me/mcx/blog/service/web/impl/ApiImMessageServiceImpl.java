package me.mcx.blog.service.web.impl;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.BlogImMessage;
import me.mcx.blog.domain.BlogImRoom;
import me.mcx.blog.domain.vo.message.ImMessageVO;
import me.mcx.blog.domain.vo.message.ImRoomListVO;
import me.mcx.blog.enums.YesOrNoEnum;
import me.mcx.blog.handle.RelativeDateFormat;
import me.mcx.blog.im.MessageConstant;
import me.mcx.blog.im.WebSocketInfoService;
import me.mcx.blog.mapper.BlogImMessageMapper;
import me.mcx.blog.mapper.BlogImRoomMapper;
import me.mcx.blog.service.web.ApiImMessageService;
import me.mcx.blog.util.BeanCopyUtil;
import me.mcx.common.core.constant.SecurityConstants;
import me.mcx.common.core.domain.R;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.DateUtils;
import me.mcx.common.core.utils.ip.IpUtils;
import me.mcx.common.core.utils.uuid.IdUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.system.api.RemoteUserInfoService;
import me.mcx.system.api.RemoteUserService;
import me.mcx.system.api.model.user.ImOnlineUserVO;
import me.mcx.system.api.model.user.UserInfoVO;
import me.mcx.system.api.model.user.UserVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author blue
 * @since 2021-11-10
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ApiImMessageServiceImpl implements ApiImMessageService {

    private final RemoteUserService remoteUserService;

    private final BlogImMessageMapper imMessageMapper;

    private final BlogImMessageMapper blogImMessageMapper;

    private final BlogImRoomMapper blogImRoomMapper;

    private final RemoteUserInfoService remoteUserInfoService;


    private final WebSocketInfoService webSocketInfoService;

    private Pattern pattern = Pattern.compile("(http|https)://[\\w\\d.-]+(/[\\w\\d./?=#&-]*)?");

    @Override
    public List<ImMessageVO> selectHistoryList() {
        List<ImMessageVO> page = imMessageMapper.selectPublicHistoryList();
        for (ImMessageVO item : page) {
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(item.getFromUserId()), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            item.setFromUserAvatar(user.getAvatar());
            item.setFromUserNickname(user.getNickName());
        }
        formatCreateTime(page);
        return page;
    }

    @Override
    public List<ImOnlineUserVO> selectOnlineUserList(Set<String> keys) {
        List<ImOnlineUserVO> imOnlineUserVOs = new ArrayList<>();
        for (String id : keys) {
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(id), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            imOnlineUserVOs.add(new ImOnlineUserVO() {{
                setId(String.valueOf(user.getUserId()));
                setNickname(user.getNickName());
                setAvatar(user.getAvatar());
            }});
        }
        return imOnlineUserVOs;
    }

    @Override
    public List<ImMessageVO> selectUserImHistoryList(String fromUserId, String toUserId) {
        List<ImMessageVO> page = imMessageMapper.selectPublicUserImHistoryList(fromUserId, toUserId);
        for (ImMessageVO item : page) {
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(item.getFromUserId()), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            item.setFromUserAvatar(user.getAvatar());
            item.setFromUserNickname(user.getNickName());
        }
        formatCreateTime(page);
        return page;
    }

    /**
     * 获取房间列表
     *
     * @return
     */
    @Override
    public AjaxResult selectRoomList() {
        List<ImRoomListVO> list = new ArrayList<>();
        List<BlogImRoom> imRooms = blogImRoomMapper.selectBlogImRoomList(new BlogImRoom() {{setFromUserId(SecurityUtils.getLoginIdAsString());}});
        for (BlogImRoom imRoom : imRooms) {
            String toUserId = imRoom.getToUserId();
            UserInfoVO userInfoVO = remoteUserInfoService.selectInfoByUserId(toUserId, SecurityConstants.INNER).getData();
            ImRoomListVO vo = ImRoomListVO.builder().id(imRoom.getId()).receiveId(toUserId).nickname(userInfoVO.getNickname())
                    .avatar(userInfoVO.getAvatar()).createTimeStr(RelativeDateFormat.format(imRoom.getCreateTime())).build();
            int readNum = imMessageMapper.selectListReadByUserId(toUserId, SecurityUtils.getLoginIdAsString());
            vo.setReadNum(readNum);
            list.add(vo);
        }
        return AjaxResult.success(list);
    }

    /**
     * 创建房间
     *
     * @param toUserId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addRoom(String toUserId) {
        String fromUserId = SecurityUtils.getLoginIdAsString();
        if (StringUtils.isBlank(toUserId)) {
            throw new ServiceException("请选择用户！");
        }
        if (toUserId.equals(fromUserId)) {
            throw new ServiceException("不能跟自己聊天！");
        }
        List<BlogImRoom> imRoomList = blogImRoomMapper.selectBlogImRoomList(new BlogImRoom(){{setFromUserId(fromUserId); setToUserId(toUserId);}});
        if (imRoomList.size() != 0) {
            return AjaxResult.success();
        }
        BlogImRoom imRoom = new BlogImRoom(){{
            setType(1L); setFromUserId(fromUserId); setToUserId(toUserId);
        }};
        blogImRoomMapper.insertBlogImRoom(imRoom);
        UserInfoVO userInfoVO = remoteUserInfoService.selectInfoByUserId(toUserId, SecurityConstants.INNER).getData();
        ImRoomListVO vo = ImRoomListVO.builder().id(imRoom.getId()).receiveId(toUserId).nickname(userInfoVO.getNickname())
                .avatar(userInfoVO.getAvatar()).createTimeStr(RelativeDateFormat.format(imRoom.getCreateTime())).build();
        return AjaxResult.success(vo);
    }

    /**
     * 已读消息
     *
     * @param userId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult read(String userId) {
        imMessageMapper.updateRead(userId, SecurityUtils.getLoginIdAsString());
        return AjaxResult.success();
    }

    /**
     * 删除房间
     *
     * @param roomId 房间id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult deleteRoom(String roomId) {
        blogImRoomMapper.deleteBlogImRoomById(roomId);
        return AjaxResult.success();
    }

    /**
     * 发送消息
     *
     * @param obj     消息
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult chat(ImMessageVO obj) {
        Matcher matcher = pattern.matcher(obj.getContent());
        //字符串找出http地址
        String content = obj.getContent();
        String url = null;
        try {
            while (matcher.find()) {
                url = matcher.group();
                if (url.contains("cxblog.qiniu.zhaohaoyue.love") ||  url.contains("res.wx.qq.com") || url.contains("npm.elemecdn.com")) {
                    continue;
                }
                Document doc = Jsoup.connect(url).get();
                String hrefContent = String.format("<a href=\"%s\" target=\"_blank\" >%s</a>", url, doc.title());
                content = content.replace(url, hrefContent);
            }
        } catch (IOException e) {
            log.error("网址={} 解析失败", url);
        }
        //图片不进行敏感词过滤，会把图片地址部分过滤掉
//        if (obj.getType() != MessageConstant.MESSAGE_TYPE_IMG) {
//            //过滤敏感词
//            String filterContent = SensitiveUtils.filter(content);
//            obj.setContent(filterContent);
//        }

        obj.setIp(IpUtils.getIpAddr());
        obj.setIpSource(IpUtils.getIpAddr());
        obj.setContent(content);
        BlogImMessage imMessage = BeanCopyUtil.copyObject(obj, BlogImMessage.class);
        //保存消息到数据库
        imMessage.setId(IdUtils.randomUUID());
        blogImMessageMapper.insertBlogImMessage(imMessage);
        //如果是私聊，则发送聊天的同时给发送人创建房间
        if (obj.getCode() == MessageConstant.PRIVATE_CHAT_CODE) {
            List<BlogImRoom> imRoomList = blogImRoomMapper.selectBlogImRoomList(new BlogImRoom() {{setFromUserId(obj.getToUserId());
            setToUserId(obj.getFromUserId());}});
            if (imRoomList.size() == 0) {
                BlogImRoom room = new BlogImRoom(){{
                    setFromUserId(obj.getToUserId());
                    setToUserId(obj.getFromUserId());
                    setType(Long.valueOf(obj.getCode()));
                }};
                blogImRoomMapper.insertBlogImRoom(room);
            }
        }

        //组装发送消息数据
        obj.setId(imMessage.getId());
        obj.setCreateTimeStr(RelativeDateFormat.format(imMessage.getCreateTime()));
        //发送消息
        webSocketInfoService.chat(obj);
        return AjaxResult.success();
    }

    /**
     * 撤回消息
     *
     * @param message 消息对象
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult withdraw(ImMessageVO message) {
        BlogImMessage entity = blogImMessageMapper.selectBlogImMessageById(message.getId());
        if (DateUtils.getDiffDateToMinutes(entity.getCreateTime(), DateUtils.getNowDate()) >= 2) {
            throw new ServiceException("撤回失败，只能撤回俩分钟以内的消息！");
        }
        if (!entity.getFromUserId().equals(SecurityUtils.getLoginIdAsString())) {
            throw new ServiceException("只能撤回自己的消息哦！");
        }
        BlogImMessage imMessage = BeanCopyUtil.copyObject(message, BlogImMessage.class);
        imMessage.setIp(IpUtils.getIpAddr());
        imMessage.setIpSource(imMessage.getIp());

        //修改消息
        blogImMessageMapper.updateBlogImMessage(imMessage);

        //发送消息
        webSocketInfoService.chat(message);

        return AjaxResult.success();
    }

    /**
     * 获取跟当前用户有关的系统通知
     *
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public List<ImMessageVO> getMessageNotice(Integer type) {
        List<ImMessageVO> page = imMessageMapper.getMessageNotice(SecurityUtils.getLoginIdAsString(), type);
        page.forEach(item -> {
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(item.getFromUserId()), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            item.setFromUserAvatar(user.getAvatar());
            item.setFromUserNickname(user.getNickName());

            item.setCreateTimeStr(RelativeDateFormat.format(item.getCreateTime()));
        });
        //修改该类型的所有消息为已读
        BlogImMessage message = new BlogImMessage() {{setIsRead(1); setToUserId(SecurityUtils.getLoginIdAsString()); setNoticeType(Long.valueOf(type));}};
        blogImMessageMapper.updateBlogImMessage(message);
        return page;
    }

    /**
     * 获取未读的最新系统通知
     *
     * @return
     */
    @Override
    public AjaxResult getNewSystemNotice() {
        int systemCount = blogImMessageMapper.selectBlogImMessageCount(new BlogImMessage() {{
            setCode(MessageConstant.SYSTEM_MESSAGE_CODE);
            setToUserId(SecurityUtils.getLoginIdAsString());
            setIsRead(0);
            setNoticeType(Long.valueOf(MessageConstant.MESSAGE_SYSTEM_NOTICE));
        }});

        int commentCount = blogImMessageMapper.selectBlogImMessageCount(new BlogImMessage() {{
            setCode(MessageConstant.SYSTEM_MESSAGE_CODE);
            setToUserId(SecurityUtils.getLoginIdAsString());
            setIsRead(0);
            setNoticeType(Long.valueOf(MessageConstant.MESSAGE_COMMENT_NOTICE));
        }});

        int privateCount = blogImMessageMapper.selectBlogImMessageCount(new BlogImMessage() {{
            setCode(MessageConstant.PRIVATE_CHAT_CODE);
            setToUserId(SecurityUtils.getLoginIdAsString());
            setIsRead(0);
        }});

        Map<String, Integer> map = new HashMap<>();
        map.put("system", systemCount);
        map.put("comment", commentCount);
        map.put("private", privateCount);
        return AjaxResult.success(map);
    }

    /**
     * 根绝类型删除消息
     *
     * @param type 通知类型
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult deleteByNoticeType(String id, Integer type) {
        if (StringUtils.isNotBlank(id)) {
            blogImMessageMapper.deleteBlogImMessageById(id);
            return AjaxResult.success();
        }
        List<BlogImMessage> blogImMessageList = blogImMessageMapper.selectBlogImMessageList(new BlogImMessage() {{
            setToUserId(SecurityUtils.getLoginIdAsString()); setNoticeType(Long.valueOf(type));
        }});
        List<String> ids = new ArrayList<>();
        blogImMessageList.forEach(item->{
            ids.add(item.getId());
        });
        blogImMessageMapper.deleteBlogImMessageByIds((String[]) ids.toArray());
        return AjaxResult.success();
    }

    @Override
    public List<ImMessageVO> getMessageNoticeApplet(Integer type) {
        List<ImMessageVO> page = imMessageMapper.getMessageNotice(SecurityUtils.getLoginIdAsString(), type);
        page.forEach(item -> {
            R<UserVO> userVOR = remoteUserService.getUserVO(Long.valueOf(item.getFromUserId()), SecurityConstants.INNER);
            UserVO user = userVOR.getData();
            item.setFromUserAvatar(user.getAvatar());
            item.setFromUserNickname(user.getNickName());

            item.setCreateTimeStr(RelativeDateFormat.format(item.getCreateTime()));
        });
        return page;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult markReadMessageNoticeApplet(String id) {
        if (StringUtils.isNotBlank(id)) {
            blogImMessageMapper.updateBlogImMessage(new BlogImMessage() {{setId(id);setIsRead(YesOrNoEnum.YES.getCode());}});
            return AjaxResult.success();
        }
        blogImMessageMapper.updateBlogImMessage(new BlogImMessage() {{
            setIsRead(YesOrNoEnum.YES.getCode());
            setToUserId(SecurityUtils.getLoginIdAsString());
        }});
        return AjaxResult.success();
    }

    private void formatCreateTime(List<ImMessageVO> page) {
        page.forEach(item -> item.setCreateTimeStr(RelativeDateFormat.format(item.getCreateTime())));
    }

}
