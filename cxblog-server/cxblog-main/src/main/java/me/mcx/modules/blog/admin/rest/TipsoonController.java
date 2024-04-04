package me.mcx.modules.blog.admin.rest;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.TipsoonService;
import me.mcx.modules.blog.domain.Tipsoon;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tipsoon")
@Api(tags = "论坛管理")
@RequiredArgsConstructor
@Slf4j
public class TipsoonController {

    private final TipsoonService tipsoonService;

    @PreAuthorize("@cx.check('tipsoon:list')")
    @AnonymousGetMapping(value = "/list")
    @ApiOperation(value = "简讯列表", httpMethod = "GET", response = ResponseResult.class, notes = "简讯列表")
    public ResponseResult list(String keywords){
        return tipsoonService.selectTipsoonList(keywords);
    }

    @PreAuthorize("@cx.check('tipsoon:info')")
    @AnonymousGetMapping(value = "/info")
    @ApiOperation(value = "简讯详情", httpMethod = "GET", response = ResponseResult.class, notes = "简讯详情")
    public ResponseResult info(String id){
        return tipsoonService.selectTipsoonById(id);
    }

    @Log(value = "修改简讯")
    @PreAuthorize("@cx.check('tipsoon:edit')")
    @PutMapping(value = "/update")
    @ApiOperation(value = "修改简讯", httpMethod = "PUT", response = ResponseResult.class, notes = "修改简讯")
    public ResponseResult update(@RequestBody Tipsoon tipsoon){
        return tipsoonService.updateTipsoonById(tipsoon);
    }

    @Log(value = "发表简讯")
    @PreAuthorize("@cx.check('tipsoon:add')")
    @PostMapping(value = "/")
    @ApiOperation(value = "发表简讯", httpMethod = "POST", response = ResponseResult.class, notes = "发表简讯")
    public ResponseResult insertTipsoon(@RequestBody Tipsoon tipsoon){
        return tipsoonService.insertTipsoon(tipsoon);
    }

    @Log(value = "删除简讯")
    @PreAuthorize("@cx.check('tipsoon:del')")
    @DeleteMapping(value = "/delete")
    @ApiOperation(value = "删除简讯", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除简讯")
    public ResponseResult deleteTipsoon(@RequestBody List<String> ids){
        return tipsoonService.deleteTipsoon(ids);
    }

}
