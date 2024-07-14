package me.mcx.file.mapper;

import java.util.List;
import me.mcx.file.domain.FileLocalContent;

/**
 * 本地存储Mapper接口
 * 
 * @author mcx
 * @date 2024-05-08
 */
public interface FileLocalContentMapper 
{
    /**
     * 查询本地存储
     * 
     * @param storageId 本地存储主键
     * @return 本地存储
     */
    public FileLocalContent selectFileLocalContentByStorageId(Long storageId);

    /**
     * 查询本地存储列表
     * 
     * @param fileLocalContent 本地存储
     * @return 本地存储集合
     */
    public List<FileLocalContent> selectFileLocalContentList(FileLocalContent fileLocalContent);

    /**
     * 新增本地存储
     * 
     * @param fileLocalContent 本地存储
     * @return 结果
     */
    public int insertFileLocalContent(FileLocalContent fileLocalContent);

    /**
     * 修改本地存储
     * 
     * @param fileLocalContent 本地存储
     * @return 结果
     */
    public int updateFileLocalContent(FileLocalContent fileLocalContent);

    /**
     * 删除本地存储
     * 
     * @param storageId 本地存储主键
     * @return 结果
     */
    public int deleteFileLocalContentByStorageId(Long storageId);

    /**
     * 批量删除本地存储
     * 
     * @param storageIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFileLocalContentByStorageIds(Long[] storageIds);
}
