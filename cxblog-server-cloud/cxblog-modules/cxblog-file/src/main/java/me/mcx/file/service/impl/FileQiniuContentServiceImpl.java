/*
 *  Copyright 2019-2020 MCX
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package me.mcx.file.service.impl;

import com.alibaba.fastjson.JSON;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.Auth;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.file.FileUtils;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.file.domain.FileQiniuConfig;
import me.mcx.file.domain.FileQiniuContent;
import me.mcx.file.mapper.FileQiniuContentMapper;
import me.mcx.file.service.IFileQiniuContentService;
import me.mcx.file.utils.QiNiuUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import lombok.extern.slf4j.Slf4j;

/**
 * @author MCX
 * @date 2018-12-31
 */
@Service
@CacheConfig(cacheNames = "qiNiu")
@Slf4j
public class FileQiniuContentServiceImpl implements IFileQiniuContentService {

    @Autowired
    private FileQiniuContentMapper qiniuContentMapper;

    @Value("${qiniu.max-size}")
    private Long maxSize;

    /**
     * 查询七牛云文件存储
     *
     * @param contentId 七牛云文件存储主键
     * @return 七牛云文件存储
     */
    @Override
    public FileQiniuContent selectFileQiniuContentByContentId(Long contentId)
    {
        return qiniuContentMapper.selectFileQiniuContentByContentId(contentId);
    }

    @Override
    public List<FileQiniuContent> queryAll(FileQiniuContent content) {
        return qiniuContentMapper.selectFileQiniuContentList(content);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public FileQiniuContent upload(MultipartFile file, FileQiniuConfig qiniuConfig) {
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
            Response response = uploadManager.put(file.getBytes(), key, upToken);
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


            return content;
        } catch (Exception e) {
           throw new ServiceException(e.getMessage());
        }
    }

    @Override
    public String download(FileQiniuContent content,FileQiniuConfig config){
        String finalUrl;
        String type = "公开";
        if(type.equals(content.getType())){
            finalUrl  = content.getUrl();
        } else {
            Auth auth = Auth.create(config.getAccessKey(), config.getSecretKey());
            // 1小时，可以自定义链接过期时间
            long expireInSeconds = 3600;
            finalUrl = auth.privateDownloadUrl(content.getUrl(), expireInSeconds);
        }
        return finalUrl;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(FileQiniuContent content, FileQiniuConfig config) {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(QiNiuUtil.getRegion(config.getZone()));
        Auth auth = Auth.create(config.getAccessKey(), config.getSecretKey());
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(content.getBucket(), content.getName() + "." + content.getSuffix());
        } catch (QiniuException ex) {
            ex.printStackTrace();
        } finally {
            qiniuContentMapper.deleteFileQiniuContentByContentId(content.getContentId());
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void synchronize(FileQiniuConfig config) {
        if(config.getConfigId() == null){
            throw new ServiceException("请先添加相应配置，再操作");
        }
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(QiNiuUtil.getRegion(config.getZone()));
        Auth auth = Auth.create(config.getAccessKey(), config.getSecretKey());
        BucketManager bucketManager = new BucketManager(auth, cfg);
        //文件名前缀
        String prefix = "";
        //每次迭代的长度限制，最大1000，推荐值 1000
        int limit = 1000;
        //指定目录分隔符，列出所有公共前缀（模拟列出目录效果）。缺省值为空字符串
        String delimiter = "";
        //列举空间文件列表
        BucketManager.FileListIterator fileListIterator = bucketManager.createFileListIterator(config.getBucket(), prefix, limit, delimiter);
        while (fileListIterator.hasNext()) {
            //处理获取的file list结果
            FileQiniuContent qiniuContent;
            FileInfo[] items = fileListIterator.next();
            for (FileInfo item : items) {
                log.info(item.key);
                if(qiniuContentMapper.selectFileQiniuContentList(new FileQiniuContent() {{setName(FileUtils.getFileNameNoEx(item.key));}}).size() == 0){
                    qiniuContent = new FileQiniuContent();
                    qiniuContent.setSize(FileUtils.getSize(Integer.parseInt(String.valueOf(item.fsize))));
                    qiniuContent.setSuffix(FileUtils.getExtensionName(item.key));
                    qiniuContent.setName(FileUtils.getFileNameNoEx(item.key));
                    qiniuContent.setType(config.getType());
                    qiniuContent.setBucket(config.getBucket());
                    qiniuContent.setUrl(config.getHost()+"/"+item.key);
                    qiniuContent.setUpdateTime(new Date(item.putTime/10000));
                    qiniuContentMapper.insertFileQiniuContent(qiniuContent);
                }
            }
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteAll(Long[] ids, FileQiniuConfig config) {
        for (Long id : ids) {
            delete(qiniuContentMapper.selectFileQiniuContentByContentId(id), config);
        }
    }

    @Override
    public void downloadList(List<FileQiniuContent> list, HttpServletResponse response) {
        ExcelUtil<FileQiniuContent> util = new ExcelUtil<FileQiniuContent>(FileQiniuContent.class);
        util.exportExcel(response, list, "七牛云文件存储数据");
    }
}
