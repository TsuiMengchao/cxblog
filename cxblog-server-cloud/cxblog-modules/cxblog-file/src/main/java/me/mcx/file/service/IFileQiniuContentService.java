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
package me.mcx.file.service;

import me.mcx.file.domain.FileQiniuConfig;
import me.mcx.file.domain.FileQiniuContent;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author MCX
 * @date 2018-12-31
 */
public interface IFileQiniuContentService {

    /**
     * 查询七牛云文件存储
     *
     * @param contentId 七牛云文件存储主键
     * @return 七牛云文件存储
     */
    public FileQiniuContent selectFileQiniuContentByContentId(Long contentId);
    /**
     * 查询全部
     * @param content 条件
     * @return /
     */
    List<FileQiniuContent> queryAll(FileQiniuContent content);

    /**
     * 上传文件
     * @param file 文件
     * @param qiniuConfig 配置
     * @return QiniuContent
     */
    FileQiniuContent upload(MultipartFile file, FileQiniuConfig qiniuConfig);

    /**
     * 下载文件
     * @param content 文件信息
     * @param config 配置
     * @return String
     */
    String download(FileQiniuContent content, FileQiniuConfig config);

    /**
     * 删除文件
     * @param content 文件
     * @param config 配置
     */
    void delete(FileQiniuContent content, FileQiniuConfig config);

    /**
     * 同步数据
     * @param config 配置
     */
    void synchronize(FileQiniuConfig config);

    /**
     * 删除文件
     * @param ids 文件ID数组
     * @param config 配置
     */
    void deleteAll(Long[] ids, FileQiniuConfig config);

    /**
     * 导出数据
     * @param queryAll /
     * @param response /
     * @throws IOException /
     */
    void downloadList(List<FileQiniuContent> queryAll, HttpServletResponse response) throws IOException;
}
