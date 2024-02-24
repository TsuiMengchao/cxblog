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

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import me.mcx.common.FieldConstants;
import me.mcx.common.ResponseResult;
import me.mcx.exception.BusinessException;
import me.mcx.modules.system.domain.Dict;
import me.mcx.modules.system.domain.DictDetail;
import me.mcx.modules.system.mapper.DictMapper;
import me.mcx.modules.system.domain.vo.DictDetailQueryCriteria;
import me.mcx.modules.system.service.DictService;
import me.mcx.utils.*;
import me.mcx.modules.system.mapper.DictDetailMapper;
import me.mcx.modules.system.service.DictDetailService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static me.mcx.common.Constants.*;
import static me.mcx.common.ResultCode.DATA_TAG_IS_EXIST;
import static me.mcx.utils.enums.PublishEnum.PUBLISH;

/**
* @author MCX
* @date 2019-04-10
*/
@Service
@RequiredArgsConstructor
@CacheConfig(cacheNames = "dict")
public class DictDetailServiceImpl extends ServiceImpl<DictDetailMapper, DictDetail> implements DictDetailService {

    private final DictMapper dictMapper;
    private final DictDetailMapper dictDetailMapper;
    private final RedisUtils redisUtils;

    @Override
    public PageResult<DictDetail> queryAll(DictDetailQueryCriteria criteria, Page<Object> page) {
        return PageUtil.toPage(dictDetailMapper.findAll(criteria, page));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void create(DictDetail resources) {
        resources.setDictId(resources.getDict().getId());
        save(resources);
        // 清理缓存
        delCaches(resources);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(DictDetail resources) {
        DictDetail dictDetail = getById(resources.getId());
        resources.setId(dictDetail.getId());
        // 更新数据
        saveOrUpdate(resources);
        // 清理缓存
        delCaches(dictDetail);
    }

    @Override
    @Cacheable(key = "'name:' + #p0")
    public List<DictDetail> getDictByName(String name) {
        return dictDetailMapper.findByDictName(name);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id) {
        DictDetail dictDetail = getById(id);
        removeById(id);
        // 清理缓存
        delCaches(dictDetail);
    }

    public void delCaches(DictDetail dictDetail){
        Dict dict = dictMapper.selectById(dictDetail.getDictId());
        redisUtils.del(CacheKey.DICT_NAME + dict.getName());
    }

    // new

    private final DictService dictService;

    /**
     * 获取字典数据列表
     * @param dictId
     * @param isPublish
     * @return
     */
    @Override
    public ResponseResult listDictData(Integer dictId, Integer isPublish) {
        QueryWrapper<DictDetail> queryWrapper = new QueryWrapper<DictDetail>()
                .eq(FieldConstants.DICT_TYPE_ID,dictId).eq(isPublish != null, FieldConstants.IS_PUBLISH,isPublish);
        Page<DictDetail> data = baseMapper.selectPage(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()), queryWrapper);
        data.getRecords().forEach(item ->{
            Dict dict = dictService.getById(item.getDictId());
            item.setDict(dict);
        });
        return ResponseResult.success(data);
    }

    /**
     * 添加字典数据
     * @param dictData
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertDictData(DictDetail dictData) {
        // 判断添加的字典数据是否存在
        DictDetail temp = baseMapper.selectOne(new QueryWrapper<DictDetail>()
                .eq(FieldConstants.DICT_LABEL, dictData.getLabel())
                .eq(FieldConstants.DICT_TYPE_ID, dictData.getDictId()));
        if (temp != null) {
            throw new BusinessException(DATA_TAG_IS_EXIST);
        }
        baseMapper.insert(dictData);
        return ResponseResult.success();
    }

    /**
     * 修改字典数据
     * @param sysDictData
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateDictData(DictDetail sysDictData) {

        DictDetail dictData = baseMapper.selectOne(new QueryWrapper<DictDetail>().eq(FieldConstants.DICT_LABEL,sysDictData.getLabel()));
        if (dictData != null && !dictData.getId().equals(sysDictData.getId())){
            throw new BusinessException(DATA_TAG_IS_EXIST);
        }

        baseMapper.updateById(sysDictData);
        return ResponseResult.success();
    }

    /**
     * 批量删除字典数据
     * @param
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteBatch(List<Long> ids) {
        baseMapper.deleteBatchIds(ids);
        return ResponseResult.success();
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteDictData(Long id) {
        baseMapper.deleteById(id);
        return ResponseResult.success();
    }

    /**
     * 根据字典类型获取字典数据
     * @param types
     * @return
     */
    @Override
    public ResponseResult getDataByDictName(List<String> names) {
        Map<String, Map<String, Object>> map = new HashMap<>();
        QueryWrapper<Dict> queryWrapper = new QueryWrapper<>();
        queryWrapper.in(FieldConstants.NAME,names).eq(FieldConstants.IS_PUBLISH, PUBLISH.getCode());
        List<Dict> dictList = dictService.list(queryWrapper);
        dictList.forEach(item ->{
            QueryWrapper<DictDetail> sysDictDataQueryWrapper = new QueryWrapper<>();
            sysDictDataQueryWrapper.eq(FieldConstants.IS_PUBLISH, PUBLISH.getCode());
            sysDictDataQueryWrapper.eq(FieldConstants.DICT_TYPE_ID, item.getId());
            sysDictDataQueryWrapper.orderByAsc(FieldConstants.DICT_DETAIL_SORT);
            List<DictDetail> dataList = baseMapper.selectList(sysDictDataQueryWrapper);
            String defaultValue = null;
            for (DictDetail dictData : dataList) {
                //选取默认值
                if (dictData.getIsDefault().equals(ONE)){
                    defaultValue = dictData.getValue();
                    break;

                }
            }
            Map<String, Object> result = new HashMap<>();
            result.put(DEFAULT_VALUE,defaultValue);
            result.put(LIST,dataList);
            map.put(item.getName(),result);
        });
        return ResponseResult.success(map);
    }
}