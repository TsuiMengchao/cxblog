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
package me.mcx.modules.system.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.exception.BadRequestException;
import me.mcx.modules.system.domain.DictDetail;
import me.mcx.modules.system.service.DictDetailService;
import me.mcx.modules.system.domain.vo.DictDetailQueryCriteria;
import me.mcx.utils.PageResult;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* @author MCX
* @date 2019-04-10
*/
@RestController
@RequiredArgsConstructor
@Api(tags = "系统：字典详情管理")
@RequestMapping("/api/dictDetail")
public class DictDetailController {

    private final DictDetailService dictDetailService;
    private static final String ENTITY_NAME = "dictDetail";

    @ApiOperation("查询字典详情")
    @GetMapping
    public ResponseEntity<PageResult<DictDetail>> queryDictDetail(DictDetailQueryCriteria criteria, Page<Object> page){
        return new ResponseEntity<>(dictDetailService.queryAll(criteria, page),HttpStatus.OK);
    }

    @ApiOperation("查询多个字典详情")
    @GetMapping(value = "/map")
    public ResponseEntity<Object> getDictDetailMaps(@RequestParam String dictName){
        String[] names = dictName.split("[,，]");
        Map<String, List<DictDetail>> dictMap = new HashMap<>(16);
        for (String name : names) {
            dictMap.put(name, dictDetailService.getDictByName(name));
        }
        return new ResponseEntity<>(dictMap, HttpStatus.OK);
    }

    @Log("新增字典详情")
    @ApiOperation("新增字典详情")
    @PostMapping
    @PreAuthorize("@cx.check('dict:add')")
    public ResponseEntity<Object> createDictDetail(@Validated @RequestBody DictDetail resources){
        if (resources.getId() != null) {
            throw new BadRequestException("A new "+ ENTITY_NAME +" cannot already have an ID");
        }
        dictDetailService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @Log("修改字典详情")
    @ApiOperation("修改字典详情")
    @PutMapping
    @PreAuthorize("@cx.check('dict:edit')")
    public ResponseEntity<Object> updateDictDetail(@Validated(DictDetail.Update.class) @RequestBody DictDetail resources){
        dictDetailService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @Log("删除字典详情")
    @ApiOperation("删除字典详情")
    @DeleteMapping(value = "/{id}")
    @PreAuthorize("@cx.check('dict:del')")
    public ResponseEntity<Object> deleteDictDetail(@PathVariable Long id){
        dictDetailService.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    // new


    @AnonymousGetMapping(value = "/list")
    @PreAuthorize("@cx.check('blogDictData:list')")
    @ApiOperation(value = "字典数据列表", httpMethod = "GET", response = ResponseResult.class, notes = "字典数据列表")
    public ResponseResult list(Integer dictId, Integer isPublish){
        return dictDetailService.listDictData(dictId,isPublish);
    }

    @PostMapping(value = "/add")
    @PreAuthorize("@cx.check('blogDictData:add')")
    @ApiOperation(value = "添加字典数据", httpMethod = "POST", response = ResponseResult.class, notes = "添加字典数据")
    @Log(value = "添加字典数据")
    public ResponseResult insert(@RequestBody DictDetail dictData){
        return dictDetailService.insertDictData(dictData);
    }

    @PostMapping(value = "/update")
    @PreAuthorize("@cx.check('blogDictData:edit')")
    @ApiOperation(value = "修改字典数据", httpMethod = "POST", response = ResponseResult.class, notes = "修改字典数据")
    @Log(value = "修改字典数据")
    public ResponseResult update(@RequestBody DictDetail dictData){
        return dictDetailService.updateDictData(dictData);
    }

    @DeleteMapping(value = "/delete")
    @PreAuthorize("@cx.check('blogDictData:del')")
    @ApiOperation(value = "删除字典数据", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除字典数据")
    @Log(value = "删除字典数据")
    public ResponseResult deleteDictData(Long id){
        return dictDetailService.deleteDictData(id);
    }

    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('blogDictData:deleteBatch')")
    @ApiOperation(value = "批量删除字典数据", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除字典数据")
    @Log(value = "批量删除字典数据")
    public ResponseResult deleteBatch(@RequestBody List<Long> ids){
        return dictDetailService.deleteBatch(ids);
    }

    @PostMapping(value = "/getDataByDictType")
    @PreAuthorize("@cx.check('blogDictData:getDataByDictType')")
    public ResponseResult getDataByDictType(@RequestBody List<String> names){
        return dictDetailService.getDataByDictName(names);
    }
}