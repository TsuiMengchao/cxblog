package me.mcx.file.mapper;

import me.mcx.file.domain.FileLocalConfig;

import java.util.List;

/**
 * 本地配置Mapper接口
 * 
 * @author mcx
 * @date 2024-05-08
 */
public interface FileLocalConfigMapper 
{
    /**
     * 查询本地配置
     * 
     * @param configId 本地配置主键
     * @return 本地配置
     */
    public FileLocalConfig selectFileLocalConfigByConfigId(Long configId);

    /**
     * 查询本地配置列表
     * 
     * @param fileLocalConfig 本地配置
     * @return 本地配置集合
     */
    public List<FileLocalConfig> selectFileLocalConfigList(FileLocalConfig fileLocalConfig);

    /**
     * 新增本地配置
     * 
     * @param fileLocalConfig 本地配置
     * @return 结果
     */
    public int insertFileLocalConfig(FileLocalConfig fileLocalConfig);

    /**
     * 修改本地配置
     * 
     * @param fileLocalConfig 本地配置
     * @return 结果
     */
    public int updateFileLocalConfig(FileLocalConfig fileLocalConfig);

    /**
     * 删除本地配置
     * 
     * @param configId 本地配置主键
     * @return 结果
     */
    public int deleteFileLocalConfigByConfigId(Long configId);

    /**
     * 批量删除本地配置
     * 
     * @param configIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFileLocalConfigByConfigIds(Long[] configIds);
}
