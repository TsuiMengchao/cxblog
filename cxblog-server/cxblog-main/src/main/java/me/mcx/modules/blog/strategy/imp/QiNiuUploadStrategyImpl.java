package me.mcx.modules.blog.strategy.imp;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.BatchStatus;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.storage.model.FileListing;
import com.qiniu.storage.persistent.FileRecorder;
import com.qiniu.util.Auth;
import lombok.extern.slf4j.Slf4j;
import me.mcx.common.ResponseResult;
import me.mcx.domain.QiniuConfig;
import me.mcx.domain.QiniuContent;
import me.mcx.exception.BadRequestException;
import me.mcx.mapper.QiniuContentMapper;
import me.mcx.service.QiNiuConfigService;
import me.mcx.utils.FileUtil;
import me.mcx.utils.QiNiuUtil;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.strategy.FileUploadStrategy;
import me.mcx.utils.DateUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Paths;


@Service("qiNiuUploadStrategyImpl")
@Slf4j
@RequiredArgsConstructor
public class QiNiuUploadStrategyImpl implements FileUploadStrategy {

    private final QiNiuConfigService qiNiuConfigService;

    private final QiniuContentMapper qiniuContentMapper;
    private final Logger logger = LoggerFactory.getLogger(QiNiuUploadStrategyImpl.class);
//    private String qi_niu_accessKey;
//    private String qi_niu_secretKey;
//    private String qi_niu_bucket;
//    private String region;
//    private String qi_niu_url;

    @Value("${qiniu.max-size}")
    private Long maxSize;
    private QiniuConfig config;


    @PostConstruct
    private void init(){
        config = qiNiuConfigService.getConfig();

        if(config.getId() == null){
            throw new BadRequestException("请先添加相应配置，再操作");
        }
//
//        qi_niu_accessKey = config.getAccessKey();
//        qi_niu_secretKey = config.getSecretKey();
//        qi_niu_bucket = config.getBucket();
//        qi_niu_url = config.getHost();
//        region = config.getZone();
//
//        logger.info("------初始化七牛云上传配置文件成功-----");
    }

    /**
     * 获取文件列表 暂不进行分页（云存储使用的返回参数marker标记来区分是否有下一页，不太好进行跟每一页对应）
     * @param pageNo 页码
     * @param limit 页数
     * @return
     */
    @Override
    public ResponseResult fileList(int pageNo, int limit) {
//        Configuration configuration = new Configuration(QiNiuUtil.getRegion(config.getZone()));
//        Auth auth = Auth.create(config.getAccessKey(), config.getSecretKey());
//        BucketManager bucketManager = new BucketManager(auth,configuration);
//        try {
//            //第一个参数：桶名称，第二个参数：指定文件名前缀，第三个参数：下一页标记（从filesV2 结果中取），第四个参数：每次显示最大数
//            FileListing filesV2 = bucketManager.listFilesV2(config.getBucket(), null, null, 1000, null);
//            return ResponseResult.success(filesV2.items);
//        } catch (QiniuException e) {
//            logger.error(e.getMessage());
//            throw new BusinessException("获取文件资源列表失败！");
//        }
        return null;
    }

    @Override
    public String fileUpload(MultipartFile file,String path) {
        if (!path.isEmpty()) path = path.replace(".", "/");
        try {
            return fragmentationUpload(file, path);
        } catch (Exception e) {
            return "";
        }

    }

    /**
     * 默认上传也称简单上传
     * @param file
     * @param path
     * @return
     */
    private String defaultUpload(MultipartFile file,String path){
        FileUtil.checkSize(maxSize, file.getSize());
        if(config.getId() == null){
            throw new BadRequestException("请先添加相应配置，再操作");
        }
        String url = null;
        //构造一个带指定 Region 对象的配置类
        Configuration cfg = new Configuration(QiNiuUtil.getRegion(config.getZone()));

        //...其他参数参考类注释
        UploadManager uploadManager = new UploadManager(cfg);
        //...生成上传凭证，然后准备上传
        Auth auth = Auth.create(config.getAccessKey(), config.getSecretKey());
        String upToken = auth.uploadToken(config.getBucket());

        try {
            String key = file.getOriginalFilename();
            if(qiniuContentMapper.findByKey(key) != null) {
                key = QiNiuUtil.getKey(key);
            }
            Response response = uploadManager.put(file.getBytes(), path + "/" + key, upToken);
            //解析上传成功的结果
            DefaultPutRet putRet = JSON.parseObject(response.bodyString(),DefaultPutRet.class);
            QiniuContent content = qiniuContentMapper.findByKey(FileUtil.getFileNameNoEx(putRet.key));
            if(content == null){
                //存入数据库
                QiniuContent qiniuContent = new QiniuContent();
                qiniuContent.setSuffix(FileUtil.getExtensionName(putRet.key));
                qiniuContent.setBucket(config.getBucket());
                qiniuContent.setType(config.getType());
                qiniuContent.setName(FileUtil.getFileNameNoEx(putRet.key));
                qiniuContent.setUrl(config.getHost() + "/" + putRet.key);
                qiniuContent.setSize(FileUtil.getSize(Integer.parseInt(String.valueOf(file.getSize()))));
                qiniuContentMapper.insert(qiniuContent);
            }
            content = qiniuContentMapper.findByKey(FileUtil.getFileNameNoEx(putRet.key));
            url = content.getUrl();
        } catch (QiniuException ex) {
            Response r = ex.response;
            logger.info("QiniuException:{}",r.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return url;
    }

    /**
     * 分片上传
     * @param file
     * @param path
     * @return
     */
    private String fragmentationUpload(MultipartFile file,String path) throws IOException {
        FileUtil.checkSize(maxSize, file.getSize());
        if(config.getId() == null){
            throw new BadRequestException("请先添加相应配置，再操作");
        }

        String url = null;
        //设置断点续传文件进度保存目录
        String localTempDir = Paths.get(System.getProperty("java.io.tmpdir"), config.getBucket()).toString();
        FileRecorder fileRecorder = new FileRecorder(localTempDir);
        //构造一个带指定 Region 对象的配置类
        Configuration cfg = new Configuration(QiNiuUtil.getRegion(config.getZone()));
        cfg.resumableUploadAPIVersion = Configuration.ResumableUploadAPIVersion.V2;// 指定分片上传版本
        cfg.resumableUploadMaxConcurrentTaskCount = 2;  // 设置分片上传并发，1：采用同步上传；大于1：采用并发上传
        UploadManager uploadManager = new UploadManager(cfg, fileRecorder);

        Auth auth = Auth.create(config.getAccessKey(), config.getSecretKey());
        String upToken = auth.uploadToken(config.getBucket());
        try {
            String key = file.getOriginalFilename();
            if(qiniuContentMapper.findByKey(key) != null) {
                key = QiNiuUtil.getKey(key);
            }
            Response response = uploadManager.put(file.getBytes(), path + "/" + key, upToken);
                //解析上传成功的结果
                DefaultPutRet putRet = JSON.parseObject(response.bodyString(), DefaultPutRet.class);
                QiniuContent content = qiniuContentMapper.findByKey(FileUtil.getFileNameNoEx(putRet.key));
                if(content == null){
                    //存入数据库
                    QiniuContent qiniuContent = new QiniuContent();
                    qiniuContent.setSuffix(FileUtil.getExtensionName(putRet.key));
                    qiniuContent.setBucket(config.getBucket());
                    qiniuContent.setType(config.getType());
                    qiniuContent.setName(FileUtil.getFileNameNoEx(putRet.key));
                    qiniuContent.setUrl(config.getHost() + "/" + putRet.key);
                    qiniuContent.setSize(FileUtil.getSize(Integer.parseInt(String.valueOf(file.getSize()))));
                    qiniuContentMapper.insert(qiniuContent);
                }
                content = qiniuContentMapper.findByKey(FileUtil.getFileNameNoEx(putRet.key));

                url = content.getUrl();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return url;
    }

    /**
     * 批量删除文件
     * @return
     */
    @Override
    public Boolean deleteFile(String ...keys) {
//        //构造一个带指定 Region 对象的配置类
//        Configuration cfg = new Configuration(QiNiuUtil.getRegion(config.getZone()));
//
//        //...其他参数参考类注释
//        Auth auth = Auth.create(config.getAccessKey(), config.getSecretKey());
//        BucketManager bucketManager = new BucketManager(auth, cfg);
//        try {
//            BucketManager.BatchOperations batchOperations = new BucketManager.BatchOperations();
//            batchOperations.addDeleteOp(config.getBucket(), keys);
//            Response response = bucketManager.batch(batchOperations);
//            BatchStatus[] batchStatusList = response.jsonToObject(BatchStatus[].class);
//            for (int i = 0; i < keys.length; i++) {
//                BatchStatus status = batchStatusList[i];
//                String key = keys[i];
//                System.out.print(key + "\t");
//                if (status.code == 200) {
//                    System.out.println("delete success");
//                } else {
//                    System.out.println(status.data.error);
//                }
//            }
//            return true;
//        } catch (QiniuException ex) {
//            System.err.println(ex.response.toString());
//            return false;
//        }
        return null;
    }
}
