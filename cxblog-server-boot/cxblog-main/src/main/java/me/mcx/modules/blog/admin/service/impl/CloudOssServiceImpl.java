package me.mcx.modules.blog.admin.service.impl;

import me.mcx.common.ResponseResult;
import me.mcx.utils.SecurityUtils;
import me.mcx.utils.enums.FileUploadModelEnum;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.admin.service.CloudOssService;
import me.mcx.modules.blog.admin.service.SystemConfigService;
import me.mcx.modules.blog.strategy.context.FileUploadStrategyContext;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class CloudOssServiceImpl implements CloudOssService {

    private final SystemConfigService systemConfigService;

    private final FileUploadStrategyContext fileUploadStrategyContext;

    private String strategy;

    /**
     * 批量获取文件列表
     * @param strategyModel 文件模式（0：本地 1：七牛云 2：阿里云）
     * @param pageNo 页码
     * @param pageSize 页数
     * @return
     */
    @Override
    public ResponseResult list(int strategyModel,int pageNo, int pageSize) {
        strategy = FileUploadModelEnum.getStrategy(strategyModel);
        return fileUploadStrategyContext.executeFileListStrategy(strategy, pageNo, pageSize);
    }

    /**
     * 上传文件
     * @param file
     * @return
     */
    @Override
    public ResponseResult upload(MultipartFile file, String path) {
        if (SecurityUtils.getDataScopeType() == ("demonstrate")) {
            throw new BusinessException("演示模式，不允许上传文件");
        }
        //获取文件后缀
        String suffix = Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        if (!"jpg,jpeg,gif,png,mp4".toUpperCase().contains(suffix.toUpperCase())) {
            return ResponseResult.error("请选择jpg,jpeg,gif,png,mp4格式的图片");
        }
        getFileUploadWay();
        String key = fileUploadStrategyContext.executeFileUploadStrategy(strategy, file, path);
        return ResponseResult.success(key);
    }


    /**
     * 删除文件
     * @param key
     * @return
     */
    @Override
    public ResponseResult delBatchFile(String ...key) {
        getFileUploadWay();
        Boolean isSuccess = fileUploadStrategyContext.executeDeleteFileStrategy(strategy, key);
        if (!isSuccess) {
            return ResponseResult.error("删除文件失败");
        }
        return ResponseResult.success();
    }

    private void getFileUploadWay() {
        strategy = FileUploadModelEnum.getStrategy(systemConfigService.getCustomizeOne().getFileUploadWay());
    }
}
