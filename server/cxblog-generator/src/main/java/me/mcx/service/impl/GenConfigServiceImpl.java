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
import me.mcx.domain.GenConfig;
import me.mcx.mapper.GenConfigMapper;
import me.mcx.service.GenConfigService;
import org.springframework.stereotype.Service;
import java.io.File;

/**
 * @author MCX
 * @date 2019-01-14
 */
@Service
@RequiredArgsConstructor
@SuppressWarnings({"unchecked","all"})
public class GenConfigServiceImpl extends ServiceImpl<GenConfigMapper, GenConfig> implements GenConfigService {

    private final GenConfigMapper genConfigMapper;

    @Override
    public GenConfig find(String tableName) {
        GenConfig genConfig = genConfigMapper.findByTableName(tableName);
        if(genConfig == null){
            return new GenConfig(tableName);
        }
        return genConfig;
    }

    @Override
    public GenConfig update(String tableName, GenConfig genConfig) {
        String separator = File.separator;
        String[] paths;
        String symbol = "\\";
        if (symbol.equals(separator)) {
            paths = genConfig.getPath().split("\\\\");
        } else {
            paths = genConfig.getPath().split(File.separator);
        }
        StringBuilder api = new StringBuilder();
        for (String path : paths) {
            api.append(path);
            api.append(separator);
            if ("src".equals(path)) {
                api.append("api");
                break;
            }
        }
        genConfig.setApiPath(api.toString());
        saveOrUpdate(genConfig);
        return genConfig;
    }
}
