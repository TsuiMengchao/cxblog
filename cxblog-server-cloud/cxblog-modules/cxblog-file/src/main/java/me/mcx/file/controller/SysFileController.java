package me.mcx.file.controller;

import me.mcx.file.context.SysFileServiceContext;
import me.mcx.file.emnus.FileUploadModelEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import me.mcx.common.core.domain.R;
import me.mcx.common.core.utils.file.FileUtils;
import me.mcx.file.service.ISysFileService;
import me.mcx.system.api.domain.SysFile;

/**
 * 文件请求处理
 * 
 * @author cxblog
 */
@RestController
public class SysFileController
{
    private static final Logger log = LoggerFactory.getLogger(SysFileController.class);

    @Autowired
    private ISysFileService sysFileService;

    @Autowired
    private SysFileServiceContext sysFileServiceContext;
    private FileUploadModelEnum strategy;

    @Value("${files.upload-way}")
    private String fileUploadWay;

    /**
     * 文件上传请求
     */
    @PostMapping("upload")
    public R<SysFile> upload(MultipartFile file, String path)
    {
        try
        {
            strategy = FileUploadModelEnum.getService(fileUploadWay);
            // 上传并返回访问地址
            String url = sysFileServiceContext.executeFileUploadStrategy(strategy.getService(), file, path);
            SysFile sysFile = new SysFile();
            sysFile.setName(FileUtils.getName(url));
            sysFile.setUrl(url);
            return R.ok(sysFile);
        }
        catch (Exception e)
        {
            log.error("上传文件失败", e);
            return R.fail(e.getMessage());
        }
    }
}