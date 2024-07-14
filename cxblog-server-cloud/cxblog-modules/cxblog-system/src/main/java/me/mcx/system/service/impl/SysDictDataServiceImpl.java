package me.mcx.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.system.api.domain.SysDictType;
import me.mcx.system.mapper.SysDictDataMapper;
import me.mcx.system.mapper.SysDictTypeMapper;
import me.mcx.system.service.ISysDictDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.common.security.utils.DictUtils;
import me.mcx.system.api.domain.SysDictData;

/**
 * 字典 业务层处理
 * 
 * @author cxblog
 */
@Service
public class SysDictDataServiceImpl implements ISysDictDataService
{
    @Autowired
    private SysDictDataMapper dictDataMapper;

    @Autowired
    private SysDictTypeMapper dictMapper;

    /**
     * 根据条件分页查询字典数据
     * 
     * @param dictData 字典数据信息
     * @return 字典数据集合信息
     */
    @Override
    public List<SysDictData> selectDictDataList(SysDictData dictData)
    {
        return dictDataMapper.selectDictDataList(dictData);
    }

    /**
     * 根据字典类型和字典键值查询字典数据信息
     * 
     * @param dictType 字典类型
     * @param dictValue 字典键值
     * @return 字典标签
     */
    @Override
    public String selectDictLabel(String dictType, String dictValue)
    {
        return dictDataMapper.selectDictLabel(dictType, dictValue);
    }

    /**
     * 根据字典数据ID查询信息
     * 
     * @param dictCode 字典数据ID
     * @return 字典数据
     */
    @Override
    public SysDictData selectDictDataById(Long dictCode)
    {
        return dictDataMapper.selectDictDataById(dictCode);
    }

    /**
     * 批量删除字典数据信息
     * 
     * @param dictCodes 需要删除的字典数据ID
     */
    @Override
    public void deleteDictDataByIds(Long[] dictCodes)
    {
        for (Long dictCode : dictCodes)
        {
            SysDictData data = selectDictDataById(dictCode);
            dictDataMapper.deleteDictDataById(dictCode);
            List<SysDictData> dictDatas = dictDataMapper.selectDictDataByType(data.getDictType());
            DictUtils.setDictCache(data.getDictType(), dictDatas);
        }
    }

    /**
     * 新增保存字典数据信息
     * 
     * @param data 字典数据信息
     * @return 结果
     */
    @Override
    public int insertDictData(SysDictData data)
    {
        int row = dictDataMapper.insertDictData(data);
        if (row > 0)
        {
            List<SysDictData> dictDatas = dictDataMapper.selectDictDataByType(data.getDictType());
            DictUtils.setDictCache(data.getDictType(), dictDatas);
        }
        return row;
    }

    /**
     * 修改保存字典数据信息
     * 
     * @param data 字典数据信息
     * @return 结果
     */
    @Override
    public int updateDictData(SysDictData data)
    {
        int row = dictDataMapper.updateDictData(data);
        if (row > 0)
        {
            List<SysDictData> dictDatas = dictDataMapper.selectDictDataByType(data.getDictType());
            DictUtils.setDictCache(data.getDictType(), dictDatas);
        }
        return row;
    }


    /**
     * 根据字典类型获取字典数据
     * @param types
     * @return
     */
    @Override
    public AjaxResult getDataByDictType(List<String> types) {
        Map<String, Map<String, Object>> map = new HashMap<>();

        types.forEach(item ->{
            SysDictData sysDictDataQueryWrapper = new SysDictData() {{
                setStatus("0");
                setDictType(item);
            }};
            List<SysDictData> dataList = dictDataMapper.selectDictDataList(sysDictDataQueryWrapper);
            String defaultValue = null;
            for (SysDictData dictData : dataList) {
                //选取默认值
                if (dictData.getIsDefault().equals("1")){
                    defaultValue = dictData.getDictValue();
                    break;

                }
            }
            Map<String, Object> result = new HashMap<>();
            result.put("defaultValue",defaultValue);
            result.put("list",dataList);
            map.put(item,result);
        });
        return AjaxResult.success(map);
    }
}
