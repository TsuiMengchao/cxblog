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
import me.mcx.exception.BadRequestException;
import me.mcx.service.QiNiuConfigService;
import me.mcx.utils.QiNiuUtil;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.strategy.FileUploadStrategy;
import me.mcx.utils.DateUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Paths;


@Service("qiNiuUploadStrategyImpl")
@Slf4j
@RequiredArgsConstructor
public class QiNiuUploadStrategyImpl implements FileUploadStrategy {

    private final QiNiuConfigService qiNiuConfigService;
    private final Logger logger = LoggerFactory.getLogger(QiNiuUploadStrategyImpl.class);
    private String qi_niu_accessKey;
    private String qi_niu_secretKey;
    private String qi_niu_bucket;
    private String region;
    private String qi_niu_url;


    @PostConstruct
    private void init(){
        QiniuConfig systemConfig = qiNiuConfigService.getConfig();

        if(systemConfig.getId() == null){
            throw new BadRequestException("请先添加相应配置，再操作");
        }

        qi_niu_accessKey = systemConfig.getAccessKey();
        qi_niu_secretKey = systemConfig.getSecretKey();
        qi_niu_bucket = systemConfig.getBucket();
        qi_niu_url = systemConfig.getHost();
        region = systemConfig.getZone();

        logger.info("------初始化七牛云上传配置文件成功-----");
    }

    /**
     * 获取文件列表 暂不进行分页（云存储使用的返回参数marker标记来区分是否有下一页，不太好进行跟每一页对应）
     * @param pageNo 页码
     * @param limit 页数
     * @return
     */
    @Override
    public ResponseResult fileList(int pageNo, int limit) {
        Configuration configuration = new Configuration(QiNiuUtil.getRegion(region));
        Auth auth = Auth.create(qi_niu_accessKey, qi_niu_secretKey);
        BucketManager bucketManager = new BucketManager(auth,configuration);
        try {
            //第一个参数：桶名称，第二个参数：指定文件名前缀，第三个参数：下一页标记（从filesV2 结果中取），第四个参数：每次显示最大数
            FileListing filesV2 = bucketManager.listFilesV2(qi_niu_bucket, null, null, 1000, null);
            return ResponseResult.success(filesV2.items);
        } catch (QiniuException e) {
            logger.error(e.getMessage());
            throw new BusinessException("获取文件资源列表失败！");
        }
    }

    @Override
    public String fileUpload(MultipartFile file,String suffix) {
        return fragmentationUpload(file,suffix);
    }

    /**
     * 默认上传也称简单上传
     * @param file
     * @param suffix
     * @return
     */
    private String defaultUpload(MultipartFile file,String suffix){
        String key = null;
        //构造一个带指定 Region 对象的配置类
        Configuration cfg = new Configuration(QiNiuUtil.getRegion(region));

        //...其他参数参考类注释
        UploadManager uploadManager = new UploadManager(cfg);
        //...生成上传凭证，然后准备上传
        Auth auth = Auth.create(qi_niu_accessKey, qi_niu_secretKey);
        String upToken = auth.uploadToken(qi_niu_bucket);
        FileInputStream inputStream = null;
        try {
            inputStream = (FileInputStream) file.getInputStream();
            //使用当前时间年月日+当前时间戳作为key
            String dateStr = DateUtil.dateTimeToStr(DateUtil.getNowDate(), DateUtil.YYYYMMDD) +"_"+ DateUtil.getNowDate().getTime();
//            String dateStr = file.getOriginalFilename();
//            Response response = uploadManager.put(file.getBytes(), dateStr, upToken);
            Response response = uploadManager.put(inputStream, dateStr + "." + suffix, upToken,null,null);
            //解析上传成功的结果
            DefaultPutRet putRet = JSON.parseObject(response.bodyString(),DefaultPutRet.class);
            key =  qi_niu_url + putRet.key;
        } catch (QiniuException ex) {
            Response r = ex.response;
            logger.info("QiniuException:{}",r.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return key;
    }

    /**
     * 分片上传
     * @param file
     * @param suffix
     * @return
     */
    private String fragmentationUpload(MultipartFile file,String suffix){
        //构造一个带指定 Region 对象的配置类
        Configuration cfg = new Configuration(QiNiuUtil.getRegion(region));
        cfg.resumableUploadAPIVersion = Configuration.ResumableUploadAPIVersion.V2;// 指定分片上传版本
        cfg.resumableUploadMaxConcurrentTaskCount = 2;  // 设置分片上传并发，1：采用同步上传；大于1：采用并发上传


        String localFilePath = DateUtil.dateTimeToStr(DateUtil.getNowDate(), DateUtil.YYYYMMDD) +"_"+ DateUtil.getNowDate().getTime();
        String key = null;

        Auth auth = Auth.create(qi_niu_accessKey, qi_niu_secretKey);
        String upToken = auth.uploadToken(qi_niu_bucket);

        String localTempDir = Paths.get(System.getProperty("java.io.tmpdir"), qi_niu_bucket).toString();
        FileInputStream inputStream = null;
        try {
            //设置断点续传文件进度保存目录
            FileRecorder fileRecorder = new FileRecorder(localTempDir);

            UploadManager uploadManager = new UploadManager(cfg, fileRecorder);
            try {
                inputStream = (FileInputStream) file.getInputStream();
                Response response = uploadManager.put(inputStream, localFilePath + "." + suffix, upToken,null,null);
                //解析上传成功的结果
                DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
                key =  qi_niu_url + '/' + putRet.key;
                log.info("key-try:"+key);
            } catch (QiniuException ex) {
                ex.printStackTrace();
                if (ex.response != null) {
                    System.err.println(ex.response);

                    try {
                        String body = ex.response.toString();
                        System.err.println(body);
                    } catch (Exception ignored) {
                    }
                }
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        log.info("key"+key);
        return key;
    }

    /**
     * 批量删除文件
     * @return
     */
    @Override
    public Boolean deleteFile(String ...keys) {
        //构造一个带指定 Region 对象的配置类
        Configuration cfg = new Configuration(QiNiuUtil.getRegion(region));

        //...其他参数参考类注释
        Auth auth = Auth.create(qi_niu_accessKey, qi_niu_secretKey);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            BucketManager.BatchOperations batchOperations = new BucketManager.BatchOperations();
            batchOperations.addDeleteOp(qi_niu_bucket, keys);
            Response response = bucketManager.batch(batchOperations);
            BatchStatus[] batchStatusList = response.jsonToObject(BatchStatus[].class);
            for (int i = 0; i < keys.length; i++) {
                BatchStatus status = batchStatusList[i];
                String key = keys[i];
                System.out.print(key + "\t");
                if (status.code == 200) {
                    System.out.println("delete success");
                } else {
                    System.out.println(status.data.error);
                }
            }
            return true;
        } catch (QiniuException ex) {
            System.err.println(ex.response.toString());
            return false;
        }
    }
}
