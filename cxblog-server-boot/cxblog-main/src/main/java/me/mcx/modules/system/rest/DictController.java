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
import me.mcx.modules.system.domain.Dict;
import me.mcx.modules.system.service.DictService;
import me.mcx.modules.system.domain.vo.DictQueryCriteria;
import me.mcx.utils.PageResult;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;

/**
* @author MCX
* @date 2019-04-10
*/
@RestController
@RequiredArgsConstructor
@Api(tags = "系统：字典管理")
@RequestMapping("/api/dict")
public class DictController {

    private final DictService dictService;
    private static final String ENTITY_NAME = "dict";

    @ApiOperation("导出字典数据")
    @GetMapping(value = "/download")
    @PreAuthorize("@cx.check('dict:list')")
    public void exportDict(HttpServletResponse response, DictQueryCriteria criteria) throws IOException {
        dictService.download(dictService.queryAll(criteria), response);
    }

    @ApiOperation("查询字典")
    @GetMapping(value = "/all")
    @PreAuthorize("@cx.check('dict:list')")
    public ResponseEntity<List<Dict>> queryAllDict(){
        return new ResponseEntity<>(dictService.queryAll(new DictQueryCriteria()),HttpStatus.OK);
    }

    @ApiOperation("查询字典")
    @GetMapping
    @PreAuthorize("@cx.check('dict:list')")
    public ResponseEntity<PageResult<Dict>> queryDict(DictQueryCriteria resources, Page<Object> page){
        return new ResponseEntity<>(dictService.queryAll(resources, page),HttpStatus.OK);
    }

    @Log("新增字典")
    @ApiOperation("新增字典")
    @PostMapping
    @PreAuthorize("@cx.check('dict:add')")
    public ResponseEntity<Object> createDict(@Validated @RequestBody Dict resources){
        if (resources.getId() != null) {
            throw new BadRequestException("A new "+ ENTITY_NAME +" cannot already have an ID");
        }
        dictService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @Log("修改字典")
    @ApiOperation("修改字典")
    @PutMapping
    @PreAuthorize("@cx.check('dict:edit')")
    public ResponseEntity<Object> updateDict(@Validated(Dict.Update.class) @RequestBody Dict resources){
        dictService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @Log("删除字典")
    @ApiOperation("删除字典")
    @DeleteMapping
    @PreAuthorize("@cx.check('dict:del')")
    public ResponseEntity<Object> deleteDict(@RequestBody Set<Long> ids){
        dictService.delete(ids);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    //new

    @AnonymousGetMapping(value = "/list")
    @PreAuthorize("@cx.check('blogDict:list')")
    @ApiOperation(value = "字典类型列表", httpMethod = "GET", response = ResponseResult.class, notes = "字典类型列表")
    public ResponseResult list(String name, Integer isPublish, String descColumn, String ascColumn){
        return dictService.listDict(name,isPublish,descColumn,ascColumn);
    }

    @PostMapping(value = "/add")
    @PreAuthorize("@cx.check('blogDict:add')")
    @ApiOperation(value = "添加字典", httpMethod = "POST", response = ResponseResult.class, notes = "添加字典")
    @Log(value = "添加字典")
    public ResponseResult insert(@RequestBody Dict dict){
        return dictService.insertDict(dict);
    }

    @PostMapping(value = "/update")
    @PreAuthorize("@cx.check('blogDict:edit')")
    @ApiOperation(value = "修改字典", httpMethod = "POST", response = ResponseResult.class, notes = "修改字典")
    @Log(value = "修改字典")
    public ResponseResult update(@RequestBody Dict dict){
        return dictService.updateDict(dict);
    }

    @DeleteMapping(value = "/delete")
    @PreAuthorize("@cx.check('blogDict:del')")
    @ApiOperation(value = "删除字典", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除字典")
    @Log(value = "删除字典")
    public ResponseResult deleteDict(int id){
        return dictService.deleteDict(id);
    }

    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('blogDict:deleteBatch')")
    @ApiOperation(value = "批量删除字典", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除字典")
    @Log(value = "批量删除字典")
    public ResponseResult deleteBatch(@RequestBody List<Long> list){
        return dictService.deleteBatch(list);
    }

}