package me.mcx.modules.blog.strategy.imp;

import cn.hutool.core.util.ObjectUtil;
import me.mcx.common.ResponseResult;
import me.mcx.config.FileProperties;
import me.mcx.domain.LocalStorage;
import me.mcx.domain.LocalStorageConfig;
import me.mcx.exception.BadRequestException;
import me.mcx.mapper.LocalStorageMapper;
import me.mcx.modules.blog.domain.SystemConfig;
import me.mcx.modules.blog.admin.service.SystemConfigService;
import me.mcx.modules.blog.strategy.FileUploadStrategy;
import me.mcx.service.LocalStorageConfigService;
import me.mcx.utils.FileUtil;
import me.mcx.utils.StringUtils;
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
    private final LocalStorageMapper localStorageMapper;

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
     * @param multipartFile 文件
     * @param path 后缀
     * @return 文件地址
     */
    @Override
    public String fileUpload(MultipartFile multipartFile, String path) {
        if (!path.isEmpty()) path = path.replace(".", File.separator);
        FileUtil.checkSize(properties.getMaxSize(), multipartFile.getSize());
        String suffix = FileUtil.getExtensionName(multipartFile.getOriginalFilename());
        String type = FileUtil.getFileType(suffix);
        File file = FileUtil.upload(multipartFile, properties.getPath().getPath() + path +  File.separator);
        if(ObjectUtil.isNull(file)){
            throw new BadRequestException("上传失败");
        }
        try {
            String name = FileUtil.getFileNameNoEx(multipartFile.getOriginalFilename());
            LocalStorage localStorage = new LocalStorage(
                    file.getName(),
                    name,
                    suffix,
                    file.getPath(),
                    type,
                    FileUtil.getSize(multipartFile.getSize())
            );
            localStorageMapper.insert(localStorage);
            return localFileUrl + path.replace(File.separator, "/") + '/' + localStorage.getRealName();
        } catch (Exception e) {
            FileUtil.del(file);
            throw e;
        }
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
