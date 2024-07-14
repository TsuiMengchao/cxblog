package me.mcx.file.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.nacos.common.utils.IoUtils;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import lombok.extern.slf4j.Slf4j;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.file.FileUtils;
import me.mcx.file.config.MinioConfig;
import me.mcx.file.domain.FileQiniuConfig;
import me.mcx.file.domain.FileQiniuContent;
import me.mcx.file.mapper.FileQiniuConfigMapper;
import me.mcx.file.mapper.FileQiniuContentMapper;
import me.mcx.file.service.ISysFileService;
import me.mcx.file.utils.FileUploadUtils;
import me.mcx.file.utils.QiNiuUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

/**
 * Minio 文件存储
 *
 * @author cxblog
 */
@Service
@Slf4j
public class QiniuSysFileServiceImpl implements ISysFileService
{
    @Autowired
    private FileQiniuConfigMapper qiniuConfigMapper;

    @Autowired
    private FileQiniuContentMapper qiniuContentMapper;

    @Value("${qiniu.max-size}")
    private Long maxSize;

    /**
     * Minio文件上传接口
     *
     * @param file 上传的文件
     * @return 访问地址
     * @throws Exception
     */
    @Override
    public String uploadFile(MultipartFile file, String path) throws Exception
    {
        if (!path.isEmpty()) path = path.replace(".", "/");
        FileQiniuConfig qiniuConfig = qiniuConfigMapper.selectFileQiniuConfigByConfigId(1L);
        FileUtils.checkSize(maxSize, file.getSize());
        if(qiniuConfig.getConfigId() == null){
            throw new ServiceException("请先添加相应配置，再操作");
        }
        // 构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(QiNiuUtil.getRegion(qiniuConfig.getZone()));
        UploadManager uploadManager = new UploadManager(cfg);
        Auth auth = Auth.create(qiniuConfig.getAccessKey(), qiniuConfig.getSecretKey());
        String upToken = auth.uploadToken(qiniuConfig.getBucket());
        try {
            String key = file.getOriginalFilename();
            String finalKey = key;
            if(qiniuContentMapper.selectFileQiniuContentList(new FileQiniuContent() {{setName(finalKey);}}).size() != 0) {
                key = QiNiuUtil.getKey(key);
            }
            Response response = uploadManager.put(file.getBytes(), path + "/" + key, upToken);
            //解析上传成功的结果
            DefaultPutRet putRet = JSON.parseObject(response.bodyString(), DefaultPutRet.class);

            List<FileQiniuContent> contentList = qiniuContentMapper.selectFileQiniuContentList(new FileQiniuContent() {{setName(FileUtils.getFileNameNoEx(putRet.key));}});
            if(contentList.size() == 0){
                //存入数据库
                FileQiniuContent qiniuContent = new FileQiniuContent();
                qiniuContent.setSuffix(FileUtils.getExtensionName(putRet.key));
                qiniuContent.setBucket(qiniuConfig.getBucket());
                qiniuContent.setType(qiniuConfig.getType());
                qiniuContent.setName(FileUtils.getFileNameNoEx(putRet.key));
                qiniuContent.setUrl(qiniuConfig.getHost() + "/" + putRet.key);
                qiniuContent.setSize(FileUtils.getSize(Integer.parseInt(String.valueOf(file.getSize()))));
                qiniuContentMapper.insertFileQiniuContent(qiniuContent);
            }
            FileQiniuContent content = qiniuContentMapper.selectFileQiniuContentList(new FileQiniuContent() {{setName(FileUtils.getFileNameNoEx(putRet.key));}}).get(0);

            return content.getUrl();
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }
}
