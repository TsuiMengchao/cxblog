package me.mcx.blog.im;

import io.netty.channel.Channel;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class SessionHolder {

    /**
     * 存储每个客户端接入进来时的 channel 对象
     * 主要用于使用 writeAndFlush 方法广播信息
     * GlobalEventExecutor：单线程单例EventExecutor。它自动启动线程，并在1秒内任务队列中没有挂起的任务时停止线程。请注意，将大量任务调度到此执行程序是不可扩展的;使用专用的执行程序。
     */
    public static ChannelGroup channelGroup = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    /**
     * 用于客户端和服务端握手时存储用户id和netty Channel对应关系
     */
    public static Map<String, Channel> channelMap = new ConcurrentHashMap<String, Channel>();

}


