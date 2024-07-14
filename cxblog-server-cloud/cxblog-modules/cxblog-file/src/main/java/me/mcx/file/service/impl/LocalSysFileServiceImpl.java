package me.mcx.file.service.impl;

import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.file.FileUtils;
import me.mcx.file.config.FileProperties;
import me.mcx.file.domain.FileLocalConfig;
import me.mcx.file.domain.FileQiniuConfig;
import me.mcx.file.mapper.FileLocalConfigMapper;
import me.mcx.file.service.ISysFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import me.mcx.file.utils.FileUploadUtils;

import java.io.File;

/**
 * 本地文件存储
 * 
 * @author cxblog
 */
@Primary
@Service
public class LocalSysFileServiceImpl implements ISysFileService
{
    @Autowired
    private FileLocalConfigMapper configMapper;
    /**
     * 资源映射路径 前缀
     */
    public String localFilePrefix;

    /**
     * 域名或本机访问地址
     */
    public String domain;

    @Autowired
    private FileProperties properties;
    
    /**
     * 上传文件存储在本地的根路径
     */
    private String localFilePath;

    /**
     * 本地文件上传接口
     * 
     * @param file 上传的文件
     * @return 访问地址
     * @throws Exception
     */
    @Override
    public String uploadFile(MultipartFile file, String path) throws Exception
    {
        if (!path.isEmpty()) path = path.replace(".", File.separator);
        FileLocalConfig config = configMapper.selectFileLocalConfigByConfigId(1L);
        if(config == null){
            throw new ServiceException("请先添加相应配置，再操作");
        }
        domain = config.getDomain();
        localFilePrefix = config.getPrefix();
        String name = FileUploadUtils.upload(properties.getPath().getPath() + path + File.separator, file);
        String url = domain + localFilePrefix + '/' + path.replace(File.separator, "/") + name;
        return url;
    }
}
