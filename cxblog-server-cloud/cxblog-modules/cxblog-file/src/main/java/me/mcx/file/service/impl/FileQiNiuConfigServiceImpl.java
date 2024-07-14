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


import me.mcx.common.core.exception.ServiceException;
import me.mcx.file.domain.FileQiniuConfig;
import me.mcx.file.mapper.FileQiniuConfigMapper;
import me.mcx.file.service.IFileQiNiuConfigService;
import org.springframework.beans.factory.annotation.Autowired;
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
@CacheConfig(cacheNames = "qiNiu")
public class FileQiNiuConfigServiceImpl implements IFileQiNiuConfigService {
    @Autowired
    private FileQiniuConfigMapper baseMapper;
    @Override
    @Cacheable(key = "'config'")
    public FileQiniuConfig getConfig() {
        FileQiniuConfig qiniuConfig = baseMapper.selectFileQiniuConfigByConfigId(1L);
        return qiniuConfig == null ? new FileQiniuConfig() : qiniuConfig;
    }

    @Override
    @CacheEvict(key = "'config'")
    @Transactional(rollbackFor = Exception.class)
    public void saveConfig(FileQiniuConfig qiniuConfig) {
        qiniuConfig.setConfigId(1L);
        String http = "http://", https = "https://";
        if (!(qiniuConfig.getHost().toLowerCase().startsWith(http)||qiniuConfig.getHost().toLowerCase().startsWith(https))) {
            throw new ServiceException("外链域名必须以http://或者https://开头");
        }
        baseMapper.updateFileQiniuConfig(qiniuConfig);
    }

    @Override
    @CacheEvict(key = "'config'")
    @Transactional(rollbackFor = Exception.class)
    public void updateType(String type) {
        FileQiniuConfig qiniuConfig = baseMapper.selectFileQiniuConfigByConfigId(1L);
        qiniuConfig.setType(type);
        baseMapper.updateFileQiniuConfig(qiniuConfig);
    }
}
