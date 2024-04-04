package me.mcx.modules.blog.strategy.imp;

import me.mcx.common.ResponseResult;
import me.mcx.config.FileProperties;
import me.mcx.domain.LocalStorageConfig;
import me.mcx.modules.blog.domain.SystemConfig;
import me.mcx.modules.blog.admin.service.SystemConfigService;
import me.mcx.modules.blog.strategy.FileUploadStrategy;
import me.mcx.service.LocalStorageConfigService;
import me.mcx.utils.UUIDUtils;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.File;
import java.util.ArrayList;
import java.util.List;



@Service("localUploadStrategyImpl")
@RequiredArgsConstructor
public class LocalUploadStrategyImpl implements FileUploadStrategy {

    private final Logger logger = LoggerFactory.getLogger(LocalUploadStrategyImpl.class);

    private final LocalStorageConfigService localStorageConfigService;

    private String UPLOAD_FOLDER;

    private String localFileUrl;

    private final FileProperties properties;

    @PostConstruct
    private void init(){
        UPLOAD_FOLDER = properties.getPath().getPath();
        LocalStorageConfig systemConfig = localStorageConfigService.getConfig();
        localFileUrl = systemConfig.getLocalFileUrl();
        logger.info("------初始化本地上传配置文件成功-----");
    }

    /**
     * 获取所有文件，暂不进行分页展示
     * @return
     */
    @Override
    public ResponseResult fileList(int pageNo, int limit) {
        List<String> fileNames = getFileNames(UPLOAD_FOLDER);
        return ResponseResult.success(fileNames);
    }

    /**
     * 上传文件
     * @param file 文件
     * @param suffix 后缀
     * @return 文件地址
     */
    @Override
    public String fileUpload(MultipartFile file,String suffix) {
        String savePath = UPLOAD_FOLDER;
        File savePathFile = new File(savePath);
        if (!savePathFile.exists()) {
            //若不存在该目录，则创建目录
            savePathFile.mkdir();
        }
        //通过UUID生成唯一文件名
        String filename = UUIDUtils.getUuid() + "." + suffix;
        try {
            //将文件保存指定目录
            file.transferTo(new File(savePath + filename));
        } catch (Exception e) {
            e.printStackTrace();
        }
        //返回文件名称
        return localFileUrl + filename;
    }

    /**
     * 删除文件
     * @param fileNames 文件名
     * @return
     */
    @Override
    public Boolean deleteFile(String... fileNames) {
        for (String fileName : fileNames) {
            File file = new File(UPLOAD_FOLDER + fileName);
            file.delete();
        }
        return true;
    }


    private static List<String> getFileNames(String path) {
        File file = new File(path);
        if (!file.exists()) {
            return null;
        }
        List<String> fileNames = new ArrayList<>();
        return getFileNames(file, fileNames);
    }

    /**
     * 递归查询文件
     * @param file
     * @param fileNames
     * @return
     */
    private static List<String> getFileNames(File file, List<String> fileNames) {
        File[] files = file.listFiles();
        for (File f : files) {
            if (f.isDirectory()) {
                getFileNames(f, fileNames);
            } else {
                fileNames.add(f.getName());
            }
        }
        return fileNames;
    }
}
