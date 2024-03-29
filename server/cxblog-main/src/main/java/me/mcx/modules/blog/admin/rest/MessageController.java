package me.mcx.modules.blog.admin.rest;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.MessageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author MCX
 * @since 2021-09-26
 */
@RestController
@RequestMapping("/api/message")
@Api(tags = "留言管理-接口")
@RequiredArgsConstructor
public class MessageController {

    private final MessageService messageService;

    @AnonymousGetMapping(value="/list")
    @PreAuthorize("@cx.check('message:list')")
    @ApiOperation(value = "留言列表", httpMethod = "GET", response = ResponseResult.class, notes = "留言列表")
    public ResponseResult list(String name){
        return messageService.listMessage(name);
    }

    @PostMapping(value="/passBatch")
    @PreAuthorize("@cx.check('message:passBatch')")
    @Log(value = "批量通过")
    @ApiOperation(value = "批量通过", httpMethod = "POST", response = ResponseResult.class, notes = "批量通过")
    public ResponseResult passBatch(@RequestBody List<Integer> ids){
        return messageService.passBatch(ids);
    }


    @DeleteMapping(value = "/remove")
    @PreAuthorize("@cx.check('message:del')")
    @Log(value = "删除留言")
    @ApiOperation(value = "删除留言", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除留言")
    public ResponseResult deleteMessageById(int id){
        return messageService.deleteMessageById(id);
    }


    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('message:deleteBatch')")
    @Log(value = "批量删除留言")
    @ApiOperation(value = "批量删除留言", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除留言")
    public ResponseResult deleteBatch(@RequestBody List<Integer> ids){
        return messageService.deleteBatch(ids);
    }
}

