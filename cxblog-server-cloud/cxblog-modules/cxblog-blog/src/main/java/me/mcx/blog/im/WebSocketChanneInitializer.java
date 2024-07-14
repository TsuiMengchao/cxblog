package me.mcx.blog.im;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.stream.ChunkedWriteHandler;

public class WebSocketChanneInitializer extends ChannelInitializer<SocketChannel> {
    @Override
    protected void initChannel(SocketChannel socketChannel) throws Exception {
        //请求解码器 HttpServerCodec是netty针对http编解码的处理类,但是这些只能处理像httpget的请求
        // ,也就是数据带在url问号后面的http请求
        socketChannel.pipeline().addLast("http-codec", new HttpServerCodec());
        //将多个消息转换成单一的消息对象
        //当我们用POST方式请求服务器的时候，对应的参数信息是保存在message body中的,
        // 如果只是单纯的用HttpServerCodec是无法完全的解析Http POST请求的，
        // 因为HttpServerCodec只能获取uri中参数，所以需要加上HttpObjectAggregator,HttpObjectAggregator这个netty的处理器就是为了解决这个问题而来的.它把HttpMessage和HttpContent聚合成为一个FullHttpRquest或者FullHttpRsponse

        socketChannel.pipeline().addLast("aggregator", new HttpObjectAggregator(65536));
        //支持异步发送大的码流，一般用于发送文件流
        socketChannel.pipeline().addLast("http-chunked", new ChunkedWriteHandler());
        //处理 websocket 和处理消息的发送
        socketChannel.pipeline().addLast("handler", new WebSocketSimpleChannelInboundHandler());
    }
}

