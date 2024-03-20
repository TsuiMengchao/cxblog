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

import cn.hutool.core.collection.CollectionUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.mcx.annotation.Log;
import me.mcx.exception.BadRequestException;
import me.mcx.modules.system.domain.Dept;
import me.mcx.modules.system.service.DeptService;
import me.mcx.modules.system.domain.vo.DeptQueryCriteria;
import me.mcx.utils.PageResult;
import me.mcx.utils.PageUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.stream.Collectors;

/**
* @author MCX
* @date 2019-03-25
*/
@RestController
@RequiredArgsConstructor
@Api(tags = "系统：部门管理")
@RequestMapping("/api/dept")
public class DeptController {

    private final DeptService deptService;
    private static final String ENTITY_NAME = "dept";

    @ApiOperation("导出部门数据")
    @GetMapping(value = "/download")
    @PreAuthorize("@cx.check('dept:list')")
    public void exportDept(HttpServletResponse response, DeptQueryCriteria criteria) throws Exception {
        deptService.download(deptService.queryAll(criteria, false), response);
    }

    @ApiOperation("查询部门")
    @GetMapping
    @PreAuthorize("@cx.check('user:list','dept:list')")
    public ResponseEntity<PageResult<Dept>> queryDept(DeptQueryCriteria criteria) throws Exception {
        List<Dept> depts = deptService.queryAll(criteria, true);
        return new ResponseEntity<>(PageUtil.toPage(depts),HttpStatus.OK);
    }

    @ApiOperation("查询部门:根据ID获取同级与上级数据")
    @PostMapping("/superior")
    @PreAuthorize("@cx.check('user:list','dept:list')")
    public ResponseEntity<Object> getDeptSuperior(@RequestBody List<Long> ids,
                                                  @RequestParam(defaultValue = "false") Boolean exclude) {
        Set<Dept> deptSet  = new LinkedHashSet<>();
        for (Long id : ids) {
            Dept dept = deptService.findById(id);
            List<Dept> depts = deptService.getSuperior(dept, new ArrayList<>());
            if(exclude){
                for (Dept data : depts) {
                    if(data.getId().equals(dept.getPid())) {
                        data.setSubCount(data.getSubCount() - 1);
                    }
                }
                // 编辑部门时不显示自己以及自己下级的数据，避免出现PID数据环形问题
                depts = depts.stream().filter(i -> !ids.contains(i.getId())).collect(Collectors.toList());
            }
            deptSet.addAll(depts);
        }
        return new ResponseEntity<>(deptService.buildTree(new ArrayList<>(deptSet)),HttpStatus.OK);
    }

    @Log("新增部门")
    @ApiOperation("新增部门")
    @PostMapping
    @PreAuthorize("@cx.check('dept:add')")
    public ResponseEntity<Object> createDept(@Validated @RequestBody Dept resources){
        if (resources.getId() != null) {
            throw new BadRequestException("A new "+ ENTITY_NAME +" cannot already have an ID");
        }
        deptService.create(resources);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @Log("修改部门")
    @ApiOperation("修改部门")
    @PutMapping
    @PreAuthorize("@cx.check('dept:edit')")
    public ResponseEntity<Object> updateDept(@Validated(Dept.Update.class) @RequestBody Dept resources){
        deptService.update(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @Log("删除部门")
    @ApiOperation("删除部门")
    @DeleteMapping
    @PreAuthorize("@cx.check('dept:del')")
    public ResponseEntity<Object> deleteDept(@RequestBody Set<Long> ids){
        Set<Dept> depts = new HashSet<>();
        for (Long id : ids) {
            List<Dept> deptList = deptService.findByPid(id);
            depts.add(deptService.findById(id));
            if(CollectionUtil.isNotEmpty(deptList)){
                depts = deptService.getDeleteDepts(deptList, depts);
            }
        }
        // 验证是否被角色或用户关联
        deptService.verification(depts);
        deptService.delete(depts);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}