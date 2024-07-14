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
package me.mcx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.domain.LocalStorageConfig;

/**
 * @author MCX
 * @date 2018-12-31
 */
public interface LocalStorageConfigService extends IService<LocalStorageConfig> {

    /**
     * 查询配置
     * @return QiniuConfig
     */
    LocalStorageConfig getConfig();

    /**
     * 保存
     * @param type 类型
     */
    void saveConfig(LocalStorageConfig type);
}