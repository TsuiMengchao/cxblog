package me.mcx.file.mapper;

import java.util.List;
import me.mcx.file.domain.FileQiniuConfig;

/**
 * 七牛云配置Mapper接口
 * 
 * @author mcx
 * @date 2024-05-03
 */
public interface FileQiniuConfigMapper 
{
    /**
     * 查询七牛云配置
     * 
     * @param configId 七牛云配置主键
     * @return 七牛云配置
     */
    public FileQiniuConfig selectFileQiniuConfigByConfigId(Long configId);

    /**
     * 查询七牛云配置列表
     * 
     * @param fileQiniuConfig 七牛云配置
     * @return 七牛云配置集合
     */
    public List<FileQiniuConfig> selectFileQiniuConfigList(FileQiniuConfig fileQiniuConfig);

    /**
     * 新增七牛云配置
     * 
     * @param fileQiniuConfig 七牛云配置
     * @return 结果
     */
    public int insertFileQiniuConfig(FileQiniuConfig fileQiniuConfig);

    /**
     * 修改七牛云配置
     * 
     * @param fileQiniuConfig 七牛云配置
     * @return 结果
     */
    public int updateFileQiniuConfig(FileQiniuConfig fileQiniuConfig);

    /**
     * 删除七牛云配置
     * 
     * @param configId 七牛云配置主键
     * @return 结果
     */
    public int deleteFileQiniuConfigByConfigId(Long configId);

    /**
     * 批量删除七牛云配置
     * 
     * @param configIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFileQiniuConfigByConfigIds(Long[] configIds);
}
