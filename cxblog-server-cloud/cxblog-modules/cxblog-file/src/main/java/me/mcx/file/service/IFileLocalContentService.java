package me.mcx.file.service;

import java.util.List;
import me.mcx.file.domain.FileLocalContent;
import org.springframework.web.multipart.MultipartFile;

/**
 * 本地存储Service接口
 * 
 * @author mcx
 * @date 2024-05-08
 */
public interface IFileLocalContentService 
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
     * 上传
     * @param name 文件名称
     * @param file 文件
     * @return /
     */
    public FileLocalContent create(String name, MultipartFile file);

    /**
     * 修改本地存储
     * 
     * @param fileLocalContent 本地存储
     * @return 结果
     */
    public int updateFileLocalContent(FileLocalContent fileLocalContent);

    /**
     * 批量删除本地存储
     * 
     * @param storageIds 需要删除的本地存储主键集合
     * @return 结果
     */
    public int deleteFileLocalContentByStorageIds(Long[] storageIds);

    /**
     * 删除本地存储信息
     * 
     * @param storageId 本地存储主键
     * @return 结果
     */
    public int deleteFileLocalContentByStorageId(Long storageId);
}
