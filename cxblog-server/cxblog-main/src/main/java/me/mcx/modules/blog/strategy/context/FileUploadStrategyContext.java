package me.mcx.modules.blog.strategy.context;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.strategy.FileUploadStrategy;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;


/**
 * @apiNote 文件上传策略上下文
 */
@Service
@RequiredArgsConstructor
public class FileUploadStrategyContext {

    private final Map<String, FileUploadStrategy> fileUploadStrategyMap;

    /**
     * 执行文件上传策略
     *
     * @param file 文件对象
     * @return {@link String} 文件名
     */
    public String executeFileUploadStrategy(String fileUploadMode, MultipartFile file,String suffix) {
         return fileUploadStrategyMap.get(fileUploadMode).fileUpload(file,suffix);
    }

    /**
     * 执行文件列表策略
     *
     * @param pageNo 页数
     * @param pageSize  每页显示数量
     * @return {@link String} 文件名
     */
    public ResponseResult executeFileListStrategy(String fileUploadMode, int pageNo, int pageSize) {
        return fileUploadStrategyMap.get(fileUploadMode).fileList(pageNo,pageSize);
    }

    /**
     * 删除文件策略
     * @param fileUploadMode
     * @param key
     * @return
     */
    public Boolean executeDeleteFileStrategy(String fileUploadMode,String ...key) {
         return fileUploadStrategyMap.get(fileUploadMode).deleteFile(key);
    }
}
