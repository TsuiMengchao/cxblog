package me.mcx.modules.blog.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.SystemConfig;
import me.mcx.modules.blog.admin.mapper.SystemConfigMapper;
import me.mcx.modules.blog.admin.service.SystemConfigService;
import lombok.RequiredArgsConstructor;
import me.mcx.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static me.mcx.common.FieldConstants.LIMIT_ONE;

/**
 * <p>
 * 系统配置表 服务实现类
 * </p>
 *
 * @author MCX
 * @since 2021-11-25
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SystemConfigServiceImpl extends ServiceImpl<SystemConfigMapper, SystemConfig> implements SystemConfigService {


    /**
     * 获取系统配置
     * @return
     */
    @Override
    public ResponseResult getConfig() {
        SystemConfig systemConfig = baseMapper.selectOne(new QueryWrapper<SystemConfig>().last(LIMIT_ONE));
        if (!SecurityUtils.hasRole("admin")){
            systemConfig.setQiNiuAccessKey(null);
            systemConfig.setQiNiuSecretKey(null);
            systemConfig.setEmailPassword(null);
            systemConfig.setEmailUsername(null);
        }
        return ResponseResult.success(systemConfig);
    }

    /**
     * 修改系统配置
     * @param systemConfig
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateConfig(SystemConfig systemConfig) {
        baseMapper.updateById(systemConfig);
        return ResponseResult.success();
    }

    //---------自定义方法----------
    @Override
    public SystemConfig getCustomizeOne() {
        return baseMapper.selectOne(new QueryWrapper<SystemConfig>().last(LIMIT_ONE));
    }
}
