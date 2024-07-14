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
package me.mcx.modules.system.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import me.mcx.common.FieldConstants;
import me.mcx.common.ResponseResult;
import me.mcx.modules.system.domain.Dict;
import me.mcx.modules.system.domain.DictDetail;
import me.mcx.modules.system.mapper.DictDetailMapper;
import me.mcx.modules.system.domain.vo.DictQueryCriteria;
import me.mcx.utils.*;
import me.mcx.modules.system.mapper.DictMapper;
import me.mcx.modules.system.service.DictService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import static me.mcx.common.FieldConstants.LIMIT_ONE;

/**
* @author MCX
* @date 2019-04-10
*/
@Service
@RequiredArgsConstructor
@CacheConfig(cacheNames = "dict")
public class DictServiceImpl extends ServiceImpl<DictMapper, Dict> implements DictService {

    private final DictMapper dictMapper;
    private final RedisUtils redisUtils;
    private final DictDetailMapper deleteDetail;

    @Override
    public PageResult<Dict> queryAll(DictQueryCriteria criteria, Page<Object> page){
        criteria.setOffset(page.offset());
        List<Dict> dicts = dictMapper.findAll(criteria);
        Long total = dictMapper.countAll(criteria);
        return PageUtil.toPage(dicts,total);
    }

    @Override
    public List<Dict> queryAll(DictQueryCriteria criteria) {
        return dictMapper.findAll(criteria);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(Dict resources) {
        save(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(Dict resources) {
        // 清理缓存
        delCaches(resources);
        Dict dict = getById(resources.getId());
        dict.setName(resources.getName());
        dict.setDescription(resources.getDescription());
        saveOrUpdate(dict);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Set<Long> ids) {
        // 清理缓存
        List<Dict> dicts = dictMapper.selectBatchIds(ids);
        for (Dict dict : dicts) {
            delCaches(dict);
        }
        // 删除字典
        dictMapper.deleteBatchIds(ids);
        // 删除字典详情
        deleteDetail.deleteByDictBatchIds(ids);
    }

    @Override
    public void download(List<Dict> dicts, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (Dict dict : dicts) {
            if(CollectionUtil.isNotEmpty(dict.getDictDetails())){
                for (DictDetail dictDetail : dict.getDictDetails()) {
                    Map<String,Object> map = new LinkedHashMap<>();
                    map.put("字典名称", dict.getName());
                    map.put("字典描述", dict.getDescription());
                    map.put("字典标签", dictDetail.getLabel());
                    map.put("字典值", dictDetail.getValue());
                    map.put("创建日期", dictDetail.getCreateTime());
                    list.add(map);
                }
            } else {
                Map<String,Object> map = new LinkedHashMap<>();
                map.put("字典名称", dict.getName());
                map.put("字典描述", dict.getDescription());
                map.put("字典标签", null);
                map.put("字典值", null);
                map.put("创建日期", dict.getCreateTime());
                list.add(map);
            }
        }
        FileUtil.downloadExcel(list, response);
    }

    public void delCaches(Dict dict){
        redisUtils.del(CacheKey.DICT_NAME + dict.getName());
    }


    // new

    /**
     * 字典列表
     * @param name
     * @param isPublish
     * @param descColumn
     * @param ascColumn
     * @return
     */
    @Override
    public ResponseResult listDict(String name, Integer isPublish, String descColumn, String ascColumn) {
        QueryWrapper<Dict> queryWrapper = new QueryWrapper<Dict>()
                .eq(isPublish != null, FieldConstants.IS_PUBLISH,isPublish)
                .like(org.apache.commons.lang3.StringUtils.isNotBlank(name), FieldConstants.NAME,name);
        if(org.apache.commons.lang3.StringUtils.isNotEmpty(ascColumn)) {
            // 将驼峰转换成下划线
            String column = HumpLineUtils.humpToLine2(ascColumn);
            queryWrapper.orderByAsc(org.apache.commons.lang3.StringUtils.isNotEmpty(ascColumn),column);
        }else if(StringUtils.isNotEmpty(descColumn)) {
            // 将驼峰转换成下划线
            String column = HumpLineUtils.humpToLine2(descColumn);
            queryWrapper.orderByDesc(column);
        } else {
            queryWrapper.orderByDesc(FieldConstants.DICT_SORT, FieldConstants.CREATE_TIME);
        }
        Page<Dict> page = new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize());
        Page<Dict> data = baseMapper.selectPage(page, queryWrapper);
        return ResponseResult.success(data);
    }

    /**
     * 添加字典
     * @param dict
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertDict(Dict dict) {
        validateType(dict.getName());
        baseMapper.insert(dict);
        return ResponseResult.success();
    }

    /**
     * 修改字典
     * @param dict
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateDict(Dict dict) {
        Dict temp = baseMapper.selectById(dict.getId());
        if (!temp.getName().equals(dict.getName())) validateType(dict.getName());
        baseMapper.updateById(dict);
        return ResponseResult.success();
    }

    /**
     * 删除字典
     * @param id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteDict(int id) {
//        int count  = (int) dictDataService.count(new QueryWrapper<DictDetail>().eq(FieldConstants.DICT_TYPE_ID,id));
//        Assert.isTrue(count==0,"该字典类型存在字典数据!");
        baseMapper.deleteById(id);
        return ResponseResult.success();
    }

    /**
     * 批量删除字典
     * @param ids
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteBatch(List<Long> ids) {
//        int count  = (int) dictDataService.count(new QueryWrapper<DictDetail>().in(FieldConstants.DICT_TYPE_ID,ids));
//        Assert.isTrue(count==0,"所选字典类型中存在字典数据!");
        baseMapper.deleteBatchIds(ids);
        return ResponseResult.success();
    }


    /* ---------自定义方法开始------------*/
    public void validateType(String type){
        Dict temp  = baseMapper.selectOne(new QueryWrapper<Dict>().eq(FieldConstants.TYPE, type).last(LIMIT_ONE));
        Assert.isNull(temp,"该字典类型已存在!");
    }
}