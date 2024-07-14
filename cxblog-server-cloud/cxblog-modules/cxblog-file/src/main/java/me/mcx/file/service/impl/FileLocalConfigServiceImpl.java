package me.mcx.file.service.impl;

import me.mcx.file.domain.FileLocalConfig;
import me.mcx.file.mapper.FileLocalConfigMapper;
import me.mcx.file.service.IFileLocalConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 本地配置Service业务层处理
 * 
 * @author mcx
 * @date 2024-05-08
 */
@Service
public class FileLocalConfigServiceImpl implements IFileLocalConfigService 
{
    @Autowired
    private FileLocalConfigMapper fileLocalConfigMapper;

    /**
     * 查询本地配置
     * 
     * @param configId 本地配置主键
     * @return 本地配置
     */
    @Override
    public FileLocalConfig selectFileLocalConfigByConfigId(Long configId)
    {
        return fileLocalConfigMapper.selectFileLocalConfigByConfigId(configId);
    }

    /**
     * 查询本地配置列表
     * 
     * @param fileLocalConfig 本地配置
     * @return 本地配置
     */
    @Override
    public List<FileLocalConfig> selectFileLocalConfigList(FileLocalConfig fileLocalConfig)
    {
        return fileLocalConfigMapper.selectFileLocalConfigList(fileLocalConfig);
    }

    /**
     * 新增本地配置
     * 
     * @param fileLocalConfig 本地配置
     * @return 结果
     */
    @Override
    public int insertFileLocalConfig(FileLocalConfig fileLocalConfig)
    {
        return fileLocalConfigMapper.insertFileLocalConfig(fileLocalConfig);
    }

    /**
     * 修改本地配置
     * 
     * @param fileLocalConfig 本地配置
     * @return 结果
     */
    @Override
    public int updateFileLocalConfig(FileLocalConfig fileLocalConfig)
    {
        return fileLocalConfigMapper.updateFileLocalConfig(fileLocalConfig);
    }

    /**
     * 批量删除本地配置
     * 
     * @param configIds 需要删除的本地配置主键
     * @return 结果
     */
    @Override
    public int deleteFileLocalConfigByConfigIds(Long[] configIds)
    {
        return fileLocalConfigMapper.deleteFileLocalConfigByConfigIds(configIds);
    }

    /**
     * 删除本地配置信息
     * 
     * @param configId 本地配置主键
     * @return 结果
     */
    @Override
    public int deleteFileLocalConfigByConfigId(Long configId)
    {
        return fileLocalConfigMapper.deleteFileLocalConfigByConfigId(configId);
    }
}
