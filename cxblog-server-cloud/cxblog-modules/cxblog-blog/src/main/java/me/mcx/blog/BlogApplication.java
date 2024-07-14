package me.mcx.blog;

import com.alibaba.nacos.api.NacosFactory;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.api.exception.NacosException;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import me.mcx.blog.im.WebSocketChanneInitializer;
import me.mcx.blog.im.WebSocketConstant;
import me.mcx.blog.im.WebSocketInfoService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import me.mcx.common.security.annotation.EnableCustomConfig;
import me.mcx.common.security.annotation.EnableRyFeignClients;
import me.mcx.common.swagger.annotation.EnableCustomSwagger2;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * 博客模块
 * 
 * @author cxblog
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class BlogApplication
{
    public static void main(String[] args) throws UnknownHostException {
        ConfigurableApplicationContext application = SpringApplication.run(BlogApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  博客模块启动成功   ლ(´ڡ`ლ)ﾞ");

        Environment env = application.getEnvironment();
        String ip = InetAddress.getLocalHost().getHostAddress();
        String port = env.getProperty("server.port");
        String path = env.getProperty("server.servlet.context-path");
        System.out.println("\n----------------------------------------------------------\n\t" +
                "blog is running! Access URLs:\n\t" +
                "Local: \t\thttp://localhost:" + port + path + "/\n\t" +
                "External: \thttp://" + ip + ":" + port + path + "/\n\t" +
                "Knife4j-ui: \thttp://" + ip + ":" + port + path + "/doc.html\n\t" +
                "----------------------------------------------------------");

        startNettyMsgServer();
    }

    private static void startNettyMsgServer() {
        // 使用多Reactor多线程模型，EventLoopGroup相当于线程池，内部维护一个或多个线程（EventLoop），每个EventLoop可处理多个Channel（单线程处理多个IO任务）
        // 创建主线程组EventLoopGroup，专门负责建立连接
        EventLoopGroup bossGroup = new NioEventLoopGroup(1);
        // 创建子线程组，专门负责IO任务的处理
        EventLoopGroup workGroup = new NioEventLoopGroup();
        try {
            ServerBootstrap b = new ServerBootstrap();
            b.group(bossGroup, workGroup);
            b.channel(NioServerSocketChannel.class);
            b.childHandler(new WebSocketChanneInitializer());
            System.out.println("服务端开启等待客户端连接....");
            Channel ch = b.bind(WebSocketConstant.WEB_SOCKET_PORT).sync().channel();

            //创建一个定长线程池，支持定时及周期性任务执行
            ScheduledExecutorService executorService = Executors.newScheduledThreadPool(3);
            WebSocketInfoService webSocketInfoService = new WebSocketInfoService();
            //定时任务:扫描所有的Channel，关闭失效的Channel
            executorService.scheduleAtFixedRate(webSocketInfoService::scanNotActiveChannel,
                    3, 60, TimeUnit.SECONDS);

            //定时任务:向所有客户端发送Ping消息
            executorService.scheduleAtFixedRate(webSocketInfoService::sendPing,
                    3, 10, TimeUnit.SECONDS);

            ch.closeFuture().sync();


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            //退出程序
            bossGroup.shutdownGracefully();
            workGroup.shutdownGracefully();
        }
    }
}
