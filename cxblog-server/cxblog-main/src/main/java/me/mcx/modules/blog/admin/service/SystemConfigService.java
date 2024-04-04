package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.SystemConfig;

/**
 * <p>
 * 系统配置表 服务类
 * </p>
 *
 * @author MCX
 * @since 2021-11-25
 */
public interface SystemConfigService extends IService<SystemConfig> {

    ResponseResult getConfig();

    ResponseResult updateConfig(SystemConfig systemConfig);

    SystemConfig getCustomizeOne();
}
