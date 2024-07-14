package me.mcx.file.config;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 通用映射配置
 * 
 * @author cxblog
 */
@Configuration
public class ResourcesConfig implements WebMvcConfigurer
{
    @Autowired
    private FileProperties properties;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry)
    {
        String prefix = properties.getPrefix();
        String path = properties.getPath().getPath();
        /** 本地文件上传路径 */
        registry.addResourceHandler( prefix + "/**")
                .addResourceLocations("file:" + path + File.separator);
    }
    
    /**
     * 开启跨域
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        String prefix = properties.getPrefix();
        // 设置允许跨域的路由
        registry.addMapping(prefix  + "/**")
                // 设置允许跨域请求的域名
                .allowedOrigins("*")
                // 设置允许的方法
                .allowedMethods("GET");
    }
}