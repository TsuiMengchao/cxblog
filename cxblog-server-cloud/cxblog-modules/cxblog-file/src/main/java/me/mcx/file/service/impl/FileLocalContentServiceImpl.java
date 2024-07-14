package me.mcx.file.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import cn.hutool.core.util.ObjectUtil;
import lombok.extern.slf4j.Slf4j;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.DateUtils;
import me.mcx.common.core.utils.StringUtils;
import me.mcx.common.core.utils.file.FileUtils;
import me.mcx.file.config.FileProperties;
import me.mcx.file.domain.FileLocalConfig;
import me.mcx.file.mapper.FileLocalConfigMapper;
import me.mcx.file.utils.FileUploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import me.mcx.file.mapper.FileLocalContentMapper;
import me.mcx.file.domain.FileLocalContent;
import me.mcx.file.service.IFileLocalContentService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * 本地存储Service业务层处理
 * 
 * @author mcx
 * @date 2024-05-08
 */
@Service
@Slf4j
public class FileLocalContentServiceImpl implements IFileLocalContentService 
{
    @Autowired
    private FileLocalContentMapper fileLocalContentMapper;

    @Autowired
    private FileLocalConfigMapper configMapper;

    @Autowired
    private FileProperties properties;

    /**
     * 资源映射路径 前缀
     */
    public String localFilePrefix;

    /**
     * 域名或本机访问地址
     */
    public String domain;

    /**
     * 查询本地存储
     * 
     * @param storageId 本地存储主键
     * @return 本地存储
     */
    @Override
    public FileLocalContent selectFileLocalContentByStorageId(Long storageId)
    {
        return fileLocalContentMapper.selectFileLocalContentByStorageId(storageId);
    }

    /**
     * 查询本地存储列表
     * 
     * @param fileLocalContent 本地存储
     * @return 本地存储
     */
    @Override
    public List<FileLocalContent> selectFileLocalContentList(FileLocalContent fileLocalContent)
    {
        return fileLocalContentMapper.selectFileLocalContentList(fileLocalContent);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public FileLocalContent create(String name, MultipartFile multipartFile)
    {
       FileLocalConfig config = configMapper.selectFileLocalConfigByConfigId(1L);
        if(config == null){
            throw new ServiceException("请先添加相应配置，再操作");
        }
        domain = config.getDomain();
        localFilePrefix = config.getPrefix();

        FileUtils.checkSize(properties.getMaxSize(), multipartFile.getSize());
        String suffix = FileUtils.getExtensionName(multipartFile.getOriginalFilename());
        String type = FileUtils.getFileType(suffix);
        String filename = null;
        try {
            filename = FileUploadUtils.upload(properties.getPath().getPath() +  File.separator, multipartFile);
            log.info(properties.getPath().getPath() +  File.separator);
        } catch (IOException e) {
            throw new ServiceException("上传失败");
        }
        try {
            name = StringUtils.isBlank(name) ? FileUtils.getFileNameNoEx(multipartFile.getOriginalFilename()) : name;
            FileLocalContent fileLocalContent = new FileLocalContent(
                    filename,
                    name,
                    suffix,
                    domain + localFilePrefix + filename,
                    type,
                    FileUtils.getSize(multipartFile.getSize())
            );
            fileLocalContent.setCreateTime(DateUtils.getNowDate());
            fileLocalContentMapper.insertFileLocalContent(fileLocalContent);
            return fileLocalContent;
        }catch (Exception e){
            throw e;
        }

    }

    /**
     * 修改本地存储
     * 
     * @param fileLocalContent 本地存储
     * @return 结果
     */
    @Override
    public int updateFileLocalContent(FileLocalContent fileLocalContent)
    {
        fileLocalContent.setUpdateTime(DateUtils.getNowDate());
        return fileLocalContentMapper.updateFileLocalContent(fileLocalContent);
    }

    /**
     * 批量删除本地存储
     * 
     * @param storageIds 需要删除的本地存储主键
     * @return 结果
     */
    @Override
    public int deleteFileLocalContentByStorageIds(Long[] storageIds)
    {
        return fileLocalContentMapper.deleteFileLocalContentByStorageIds(storageIds);
    }

    /**
     * 删除本地存储信息
     * 
     * @param storageId 本地存储主键
     * @return 结果
     */
    @Override
    public int deleteFileLocalContentByStorageId(Long storageId)
    {
        return fileLocalContentMapper.deleteFileLocalContentByStorageId(storageId);
    }
}
