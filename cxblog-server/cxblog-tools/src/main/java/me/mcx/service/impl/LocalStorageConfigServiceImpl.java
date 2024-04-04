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
package me.mcx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import me.mcx.domain.LocalStorageConfig;
import me.mcx.domain.QiniuConfig;
import me.mcx.exception.BadRequestException;
import me.mcx.mapper.LocalStorageConfigMapper;
import me.mcx.mapper.QiniuConfigMapper;
import me.mcx.service.LocalStorageConfigService;
import me.mcx.service.QiNiuConfigService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author MCX
 * @date 2018-12-31
 */
@Service
@RequiredArgsConstructor
@CacheConfig(cacheNames = "localStorage")
public class LocalStorageConfigServiceImpl extends ServiceImpl<LocalStorageConfigMapper, LocalStorageConfig> implements LocalStorageConfigService {

    @Override
    @Cacheable(key = "'config'")
    public LocalStorageConfig getConfig() {
        LocalStorageConfig qiniuConfig = getById(1L);
        return qiniuConfig == null ? new LocalStorageConfig() : qiniuConfig;
    }

    @Override
    @CacheEvict(key = "'config'")
    @Transactional(rollbackFor = Exception.class)
    public void saveConfig(LocalStorageConfig qiniuConfig) {
        qiniuConfig.setId(1L);
        String http = "http://", https = "https://";
        if (!(qiniuConfig.getLocalFileUrl().toLowerCase().startsWith(http)||qiniuConfig.getLocalFileUrl().toLowerCase().startsWith(https))) {
            throw new BadRequestException("本地文件域名必须以http://或者https://开头");
        }
        saveOrUpdate(qiniuConfig);
    }
}
