package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.WebConfig;

/**
 * <p>
 * 网站配置表 服务类
 * </p>
 *
 * @author MCX
 * @since 2021-11-27
 */
public interface WebConfigService extends IService<WebConfig> {

    ResponseResult listWebConfig();

    ResponseResult updateWebConfig(WebConfig webConfig);
}
