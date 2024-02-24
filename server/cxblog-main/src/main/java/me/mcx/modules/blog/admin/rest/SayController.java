package me.mcx.modules.blog.admin.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import lombok.extern.slf4j.Slf4j;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Say;
import me.mcx.modules.blog.admin.service.SayService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/say")
@Api(tags = "说说管理")
@RequiredArgsConstructor
@Slf4j
public class SayController {

    private final SayService sayService;

    @PreAuthorize("@cx.check('say:list')")
    @AnonymousGetMapping(value = "/list")
    @ApiOperation(value = "说说列表", httpMethod = "GET", response = ResponseResult.class, notes = "说说列表")
    public ResponseResult list(String keywords){
        return sayService.selectSayList(keywords);
    }

    @PreAuthorize("@cx.check('say:info')")
    @AnonymousGetMapping(value = "/info")
    @ApiOperation(value = "说说详情", httpMethod = "GET", response = ResponseResult.class, notes = "说说详情")
    public ResponseResult info(String id){
        return sayService.selectSayById(id);
    }

    @Log(value = "修改说说")
    @PreAuthorize("@cx.check('say:edit')")
    @PutMapping(value = "/update")
    @ApiOperation(value = "修改说说", httpMethod = "PUT", response = ResponseResult.class, notes = "修改说说")
    public ResponseResult update(@RequestBody Say say){
        return sayService.updateSayById(say);
    }

    @Log(value = "发表说说")
    @PreAuthorize("@cx.check('say:add')")
    @PostMapping(value = "/")
    @ApiOperation(value = "发表说说", httpMethod = "POST", response = ResponseResult.class, notes = "发表说说")
    public ResponseResult insertSay(@RequestBody Say say){
        return sayService.insertSay(say);
    }

    @Log(value = "删除说说")
    @PreAuthorize("@cx.check('say:del')")
    @DeleteMapping(value = "/delete")
    @ApiOperation(value = "删除说说", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除说说")
    public ResponseResult deleteSay(@RequestBody List<String> ids){
        return sayService.deleteSay(ids);
    }

}
