package me.mcx.modules.blog.admin.service;

import me.mcx.common.ResponseResult;
import org.springframework.web.multipart.MultipartFile;

public interface CloudOssService {

    /**
     * 批量获取文件列表
     * @param strategyModel 文件模式（0：本地 1：七牛云 2：阿里云）
     * @param pageNo 页码
     * @param pageSize 页数
     * @return
     */
    public ResponseResult list(int strategyModel,int pageNo,int pageSize);
    /**
     * 上传
     * @param file 文件
     * @return
     */
    ResponseResult upload(MultipartFile file, String path);

    /**
     * 批量删除文件
     * @param key 文件名
     * @return
     */
    ResponseResult delBatchFile(String ...key);
}
