package me.mcx.file.context;

import lombok.RequiredArgsConstructor;
import me.mcx.file.service.ISysFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;


/**
 * @apiNote 文件上传策略上下文
 */
@Service

public class SysFileServiceContext {

    @Autowired
    private Map<String, ISysFileService> fileUploadStrategyMap;

    /**
     * 执行文件上传策略
     *
     * @param file 文件对象
     * @return {@link String} 文件名
     */
    public String executeFileUploadStrategy(String fileUploadMode, MultipartFile file,String path) throws Exception {
         return fileUploadStrategyMap.get(fileUploadMode).uploadFile(file, path);
    }
}
