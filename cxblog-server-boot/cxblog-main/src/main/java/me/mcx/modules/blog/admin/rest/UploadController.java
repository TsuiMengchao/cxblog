package me.mcx.modules.blog.admin.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.CloudOssService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;


@RestController
@RequestMapping("/api/file")
@Api(tags = "图片上传-接口")
@RequiredArgsConstructor
public class UploadController {

    private final CloudOssService cloudOssService;

    @AnonymousGetMapping(value = "/list")
    @ApiOperation(value = "图片列表",httpMethod = "GET", response = ResponseResult.class, notes = "图片列表")
    public ResponseResult list(int strategyModel,int pageNo, int pageSize){
        return cloudOssService.list(strategyModel,pageNo,pageSize);
    }

    @PostMapping(value = "/upload")
    @ApiOperation(value = "上传图片",httpMethod = "POST", response = ResponseResult.class, notes = "上传图片")
    public ResponseResult upload(MultipartFile multipartFile, String path){
        return cloudOssService.upload(multipartFile, path);
    }

    @Log("批量删除图片")
    @PostMapping(value = "/delBatchFile")
    @ApiOperation(value = "批量删除文件",httpMethod = "POST", response = ResponseResult.class, notes = "批量删除文件")
    public ResponseResult delBatchFile(String key){
        return cloudOssService.delBatchFile(key);
    }
}
