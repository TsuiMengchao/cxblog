package me.mcx.blog.im;


import cn.hutool.extra.spring.SpringUtil;
import com.alibaba.fastjson.JSONObject;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.*;
import io.netty.handler.codec.http.DefaultFullHttpResponse;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.HttpResponseStatus;
import io.netty.handler.codec.http.HttpVersion;
import io.netty.handler.codec.http.websocketx.*;
import io.netty.util.CharsetUtil;
import me.mcx.blog.domain.vo.message.ImMessageVO;
import me.mcx.blog.service.web.ApiImMessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.validation.constraints.NotNull;
import java.util.Map;



/**
 * Netty ChannelHandler，用来处理客户端和服务端的会话生命周期事件（握手、建立连接、断开连接、收消息等）
 * @Author
 * @Description 接收请求，接收 WebSocket 信息的控制类
 */
public class WebSocketSimpleChannelInboundHandler extends SimpleChannelInboundHandler<Object> {

    private static final Logger logger = LoggerFactory.getLogger(WebSocketSimpleChannelInboundHandler.class);
    // WebSocket 握手工厂类
    private WebSocketServerHandshakerFactory factory = new WebSocketServerHandshakerFactory(WebSocketConstant.WEB_SOCKET_URL, null, false);
    private WebSocketServerHandshaker handshaker;
    private WebSocketInfoService websocketInfoService = new WebSocketInfoService();

    /**
     * 处理客户端与服务端之间的 websocket 业务
     */
    private void handWebsocketFrame(ChannelHandlerContext ctx, WebSocketFrame frame) {
        //判断是否是关闭 websocket 的指令
        if (frame instanceof CloseWebSocketFrame) {
            //关闭握手
            handshaker.close(ctx.channel(), (CloseWebSocketFrame) frame.retain());
            websocketInfoService.clearSession(ctx.channel());
            return;
        }
        //判断是否是ping消息
        if (frame instanceof PingWebSocketFrame) {
            ctx.channel().write(new PongWebSocketFrame(frame.content().retain()));
            return;
        }
        // 判断是否Pong消息
        if (frame instanceof PongWebSocketFrame) {
            ctx.writeAndFlush(new PongWebSocketFrame(frame.content().retain()));
            return;
        }
        //判断是否是二进制消息，如果是二进制消息，抛出异常
        if (!(frame instanceof TextWebSocketFrame)) {
            System.out.println("目前我们不支持二进制消息");
            ctx.channel().write(new PongWebSocketFrame(frame.content().retain()));
            throw new RuntimeException("【" + this.getClass().getName() + "】不支持消息");
        }
        // 获取并解析客户端向服务端发送的 json 消息
        String message = ((TextWebSocketFrame) frame).text();
        logger.info("来自客户端的消息：{}", message);
        try {
            ImMessageVO imMessageVO = JSONObject.parseObject(message, ImMessageVO.class);
            switch (imMessageVO.getCode()) {
                //群聊
                case MessageConstant.GROUP_CHAT_CODE:
                    //向连接上来的客户端广播消息
                    SessionHolder.channelGroup.writeAndFlush(new TextWebSocketFrame(message));
                    break;
                //私聊
                case MessageConstant.PRIVATE_CHAT_CODE:
                    //接收人id
                    String toUserId = imMessageVO.getToUserId();
                    String fromUserId = imMessageVO.getFromUserId();
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
                //pong
                case MessageConstant.PONG_CHAT_CODE:
                    Channel channel = ctx.channel();
                    // 更新心跳时间
                    NettyAttrUtil.refreshLastHeartBeatTime(channel);
                default:
            }
        } catch(Exception e) {
            logger.error("转发消息异常:", e);
            e.printStackTrace();
        }
    }

    /**
     * 客户端与服务端创建连接的时候调用
     */
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        //创建新的 WebSocket 连接，保存当前 channel
        logger.info("————客户端与服务端连接开启————");
//        // 设置高水位
//        ctx.channel().config().setWriteBufferHighWaterMark();
//        // 设置低水位
//        ctx.channel().config().setWriteBufferLowWaterMark();
    }

    /**
     * 客户端与服务端断开连接的时候调用
     */
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        logger.info("————客户端与服务端连接断开————");
        websocketInfoService.clearSession(ctx.channel());
    }

    /**
     * 服务端接收客户端发送过来的数据结束之后调用
     */
    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        ctx.flush();
    }

    /**
     * 工程出现异常的时候调用
     */
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        logger.error("异常:", cause);
        ctx.close();
    }

    /**
     * 服务端处理客户端websocket请求的核心方法
     */
    @Override
    protected void channelRead0(ChannelHandlerContext channelHandlerContext, Object o) throws Exception {
        if (o instanceof FullHttpRequest) {
            //处理客户端向服务端发起 http 请求的业务
            handHttpRequest(channelHandlerContext, (FullHttpRequest) o);
        } else if (o instanceof WebSocketFrame) {
            //处理客户端与服务端之间的 websocket 业务
            handWebsocketFrame(channelHandlerContext, (WebSocketFrame) o);
        }
    }

    /**
     * 处理客户端向服务端发起 http 握手请求的业务
     * WebSocket在建立握手时，数据是通过HTTP传输的。但是建立之后，在真正传输时候是不需要HTTP协议的。
     *
     * WebSocket 连接过程：
     * 首先，客户端发起http请求，经过3次握手后，建立起TCP连接；http请求里存放WebSocket支持的版本号等信息，如：Upgrade、Connection、WebSocket-Version等；
     * 然后，服务器收到客户端的握手请求后，同样采用HTTP协议回馈数据；
     * 最后，客户端收到连接成功的消息后，开始借助于TCP传输信道进行全双工通信。
     */
    private void handHttpRequest(ChannelHandlerContext ctx, FullHttpRequest request) {
        // 如果请求失败或者该请求不是客户端向服务端发起的 http 请求，则响应错误信息
        if (!request.decoderResult().isSuccess()
                || !("websocket".equals(request.headers().get("Upgrade")))) {
            // code ：400
            sendHttpResponse(ctx, new DefaultFullHttpResponse(HttpVersion.HTTP_1_1, HttpResponseStatus.BAD_REQUEST));
            return;
        }
        //新建一个握手
        handshaker = factory.newHandshaker(request);
        if (handshaker == null) {
            //如果为空，返回响应：不受支持的 websocket 版本
            WebSocketServerHandshakerFactory.sendUnsupportedVersionResponse(ctx.channel());
        } else {
            //否则，执行握手
            Map<String, String> params = RequestParamUtil.urlSplit(request.uri());
            String userId = params.get("userId");
            Channel channel = ctx.channel();
            NettyAttrUtil.setUserId(channel, userId);
            NettyAttrUtil.refreshLastHeartBeatTime(channel);
            handshaker.handshake(ctx.channel(), request);
            SessionHolder.channelGroup.add(ctx.channel());
            SessionHolder.channelMap.put(userId, ctx.channel());
            logger.info("握手成功，客户端请求uri：{}", request.uri());

            // 推送用户上线消息，更新客户端在线用户列表
//            Set<String> userList = SessionHolder.channelMap.keySet();
//            ApiImMessageService imMessageService = getImMessageService();
//            List<ImOnlineUserVO> onlineUserList = imMessageService.selectOnlineUserList(userList);
            ImMessageVO msg = new ImMessageVO();
            msg.setCode(MessageConstant.SYSTEM_MESSAGE_CODE);
            SessionHolder.channelGroup.writeAndFlush(new TextWebSocketFrame(JSONObject.toJSONString(msg)));

        }
    }

    @NotNull
    private static ApiImMessageService getImMessageService() {
        ApiImMessageService imMessageService = SpringUtil.getBean(ApiImMessageService.class);
        return imMessageService;
    }


    /**
     * 服务端向客户端响应消息
     */
    private void sendHttpResponse(ChannelHandlerContext ctx, DefaultFullHttpResponse response) {
        if (response.status().code() != 200) {
            //创建源缓冲区
            ByteBuf byteBuf = Unpooled.copiedBuffer(response.status().toString(), CharsetUtil.UTF_8);
            //将源缓冲区的数据传送到此缓冲区
            response.content().writeBytes(byteBuf);
            //释放源缓冲区
            byteBuf.release();
        }
        //写入请求，服务端向客户端发送数据
        ChannelFuture channelFuture = ctx.channel().writeAndFlush(response);
        if (response.status().code() != 200) {
            /**
             * 如果请求失败，关闭 ChannelFuture
             * ChannelFutureListener.CLOSE 源码：future.channel().close();
             */
            channelFuture.addListener(ChannelFutureListener.CLOSE);
        }
    }
}


