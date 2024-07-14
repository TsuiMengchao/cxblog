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
package me.mcx.file.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.web.page.TableDataInfo;
import me.mcx.file.domain.FileQiniuConfig;
import me.mcx.file.domain.FileQiniuContent;
import me.mcx.file.service.IFileQiNiuConfigService;
import me.mcx.file.service.IFileQiniuContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 发送邮件
 * @author MCX
 * @date 2018/09/28 6:55:53
 */
@RestController
@RequestMapping("/qiNiuContent")
@Api(tags = "工具：七牛云存储管理")
public class QiniuController extends BaseController {

    @Autowired
    private IFileQiniuContentService qiniuContentService;
    @Autowired
    private IFileQiNiuConfigService qiNiuConfigService;

    @GetMapping(value = "/config")
    public AjaxResult queryQiNiuConfig(){
        return AjaxResult.success(qiNiuConfigService.getConfig());
    }

    /**
     * 配置七牛云存储
     * @param qiniuConfig
     * @return
     */
    @PutMapping(value = "/config")
    public AjaxResult updateQiNiuConfig(@Validated @RequestBody FileQiniuConfig qiniuConfig){
        qiNiuConfigService.saveConfig(qiniuConfig);
        qiNiuConfigService.updateType(qiniuConfig.getType());
        return AjaxResult.success();
    }

    /**
     * 导出数据
     * @param response
     * @param criteria
     * @throws IOException
     */
    @PostMapping(value = "/export")
    public void exportQiNiu(HttpServletResponse response, FileQiniuContent criteria) throws IOException {
        qiniuContentService.downloadList(qiniuContentService.queryAll(criteria), response);
    }

    @ApiOperation("查询文件")
    @GetMapping
    public TableDataInfo queryQiNiu(FileQiniuContent criteria){
        startPage();
        return getDataTable(qiniuContentService.queryAll(criteria));
    }

    @ApiOperation("上传文件")
    @PostMapping
    public AjaxResult uploadQiNiu(@RequestParam MultipartFile file){
        FileQiniuContent qiniuContent = qiniuContentService.upload(file, qiNiuConfigService.getConfig());
        Map<String,Object> map = new HashMap<>(3);
        map.put("id",qiniuContent.getContentId());
        map.put("errno",0);
        map.put("data",new String[]{qiniuContent.getUrl()});
        return AjaxResult.success(map);
    }

    /**
     * 同步七牛云数据
     * @return
     */
    @PostMapping(value = "/synchronize")
    public AjaxResult synchronizeQiNiu(){
        qiniuContentService.synchronize(qiNiuConfigService.getConfig());
        return AjaxResult.success();
    }

    /**
     * 下载文件
     * @param id
     * @return
     */
    @GetMapping(value = "/download/{id}")
    public AjaxResult downloadQiNiu(@PathVariable Long id){

        Map<String,Object> map = new HashMap<>(1);
        map.put("url", qiniuContentService.download(qiniuContentService.selectFileQiniuContentByContentId(id), qiNiuConfigService.getConfig()));
        return AjaxResult.success(map);
    }

    /**
     * 删除文件
     * @param id
     * @return
     */
    @DeleteMapping(value = "/{id}")
    public AjaxResult deleteQiNiu(@PathVariable Long id){
        qiniuContentService.delete(qiniuContentService.selectFileQiniuContentByContentId(id), qiNiuConfigService.getConfig());
        return AjaxResult.success();
    }

    /**
     * 删除多张图片
     * @param ids
     * @return
     */
    @DeleteMapping
    public AjaxResult deleteAllQiNiu(@RequestBody Long[] ids) {
        qiniuContentService.deleteAll(ids, qiNiuConfigService.getConfig());
        return AjaxResult.success();
    }
}
