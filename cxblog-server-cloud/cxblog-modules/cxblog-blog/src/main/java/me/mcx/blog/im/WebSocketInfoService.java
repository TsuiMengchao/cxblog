package me.mcx.blog.im;


import com.alibaba.fastjson.JSONObject;
import me.mcx.blog.domain.vo.message.ImMessageVO;
import io.netty.channel.Channel;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class WebSocketInfoService {

    private static final Logger logger = LoggerFactory.getLogger(WebSocketInfoService.class);


    /**
     * 清除会话信息
     *
     * @param channel
     */
    public void clearSession(Channel channel) {
        String userId = NettyAttrUtil.getUserId(channel);
        // 清除会话信息
        SessionHolder.channelGroup.remove(channel);
        SessionHolder.channelMap.remove(userId);
    }

    /**
     * 广播 ping 信息
     */
    public void sendPing() {
        ImMessageVO webSocketMessage = new ImMessageVO();
        webSocketMessage.setCode(MessageConstant.PING_MESSAGE_CODE);
        String message = JSONObject.toJSONString(webSocketMessage);
        TextWebSocketFrame tws = new TextWebSocketFrame(message);
        SessionHolder.channelGroup.writeAndFlush(tws);
    }

    /**
     * 从缓存中移除Channel，并且关闭Channel
     */
    public void scanNotActiveChannel() {
        Map<String, Channel> channelMap = SessionHolder.channelMap;
        if (channelMap.size() == 0) {
            return;
        }
        for (Channel channel : channelMap.values()) {
            if (!channel.isOpen()
                    || !channel.isActive()) {
                channelMap.remove(channel);
                SessionHolder.channelGroup.remove(channel);
                if (channel.isOpen() || channel.isActive()) {
                    channel.close();
                }
            }
        }
    }

    /**
     * 发送消息
     * @param messageData 消息对象
     */
    public void chat(ImMessageVO messageData) {
        String message = JSONObject.toJSONString(messageData);
        switch (messageData.getCode()) {
            //群聊
            case MessageConstant.GROUP_CHAT_CODE:
                //向连接上来的客户端广播消息
                SessionHolder.channelGroup.writeAndFlush(new TextWebSocketFrame(message));
                break;
            //私聊
            case MessageConstant.PRIVATE_CHAT_CODE:
                //接收人id
                String toUserId = messageData.getToUserId();
                String fromUserId = messageData.getFromUserId();
                // 点对点挨个给接收人发送消息
                for (Map.Entry<String, Channel> entry : SessionHolder.channelMap.entrySet()) {
                    String userId = entry.getKey();
                    Channel channel = entry.getValue();
                    if (toUserId.equals(userId)) {
                        channel.writeAndFlush(new TextWebSocketFrame(message));
                    }
                }
                // 如果发给别人，给自己也发一条
                if (!toUserId.equals(fromUserId)) {
                    SessionHolder.channelMap.get(fromUserId).writeAndFlush(new TextWebSocketFrame(message));
                }
                break;
            case MessageConstant.SYSTEM_MESSAGE_CODE:
                //向连接上来的客户端广播消息
                SessionHolder.channelGroup.writeAndFlush(new TextWebSocketFrame(message));
                break;
            default:
        }
    }
}

