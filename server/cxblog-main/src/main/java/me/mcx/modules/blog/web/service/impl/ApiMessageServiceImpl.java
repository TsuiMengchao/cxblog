package me.mcx.modules.blog.web.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Message;
import me.mcx.modules.blog.admin.mapper.MessageMapper;
import me.mcx.modules.blog.web.service.ApiMessageService;
import me.mcx.utils.IpUtil;
import lombok.RequiredArgsConstructor;
import me.mcx.utils.RequestHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiMessageServiceImpl implements ApiMessageService {

    private final MessageMapper messageMapper;


    /**
     * 留言列表
     * @return
     */
    @Override
    public ResponseResult selectMessageList() {
        // 查询留言列表
        List<Message> messageList = messageMapper.selectList(new LambdaQueryWrapper<Message>()
                .select(Message::getId, Message::getNickname, Message::getAvatar,
                        Message::getContent, Message::getTime));
        return ResponseResult.success(messageList);
    }

    /**
     * 添加留言
     * @param message
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertMessage(Message message) {
        // 获取用户ip
        HttpServletRequest request = RequestHolder.getHttpServletRequest();
        String ipAddress = me.mcx.utils.StringUtils.getIp(request);
        String ipSource = IpUtil.getIp2region(ipAddress);
        message.setIpAddress(ipAddress);
        message.setIpSource(ipSource);
        message.setCreateTime(new Date());
        messageMapper.insert(message);
        return ResponseResult.success("留言成功");
    }
}
