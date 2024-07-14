package me.mcx.blog.service.web.impl;

import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.BlogMessage;
import me.mcx.blog.mapper.BlogMessageMapper;
import me.mcx.blog.service.web.ApiMessageService;
import me.mcx.common.core.utils.ip.IpUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiMessageServiceImpl implements ApiMessageService {

    private final BlogMessageMapper messageMapper;


    /**
     * 留言列表
     * @return
     */
    @Override
    public AjaxResult selectMessageList() {
        // 查询留言列表
        List<BlogMessage> messageList = messageMapper.selectBlogMessageList(null);
        return AjaxResult.success(messageList);
    }

    /**
     * 添加留言
     * @param message
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addMessage(BlogMessage message) {
        // 获取用户ip
        String ipAddress = IpUtils.getIpAddr();
        String ipSource = IpUtils.getIpAddr();
        message.setIpAddress(ipAddress);
        message.setIpSource(ipSource);
        messageMapper.insertBlogMessage(message);
        return AjaxResult.success("留言成功");
    }
}
