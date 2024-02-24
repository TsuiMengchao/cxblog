package me.mcx.modules.blog.admin.rest;

import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.TalkService;
import me.mcx.modules.blog.domain.Talk;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author: MCX
 * @date: 2023/10/18
 * @describe:
 */
@RestController
@RequestMapping("/api/talk")
@Api(tags = "圈子管理")
@RequiredArgsConstructor
public class TalkController {

    private final TalkService talkService;

    @GetMapping("list")
    @PreAuthorize("@cx.check('talk:list')")
    @ApiOperation(value = "圈子列表",httpMethod = "GET", response = ResponseResult.class, notes = "圈子列表")
    public ResponseResult selectSystemTalkList(String name){
        return talkService.selectSystemTalkList(name);
    }

    @GetMapping("info")
    @PreAuthorize("@cx.check('talk:info')")
    @ApiOperation(value = "圈子详情",httpMethod = "GET", response = ResponseResult.class, notes = "圈子详情")
    public ResponseResult selectSystemTalkById(Integer id){
        return talkService.selectSystemTalkById(id);
    }

    @PostMapping("add")
    @Log(value = "添加圈子")
    @PreAuthorize("@cx.check('talk:add')")
    @ApiOperation(value = "添加圈子",httpMethod = "POST", response = ResponseResult.class, notes = "添加圈子")
    public ResponseResult addTalk(@RequestBody Talk talk){
        return talkService.addTalk(talk);
    }

    @PutMapping("update")
    @Log(value = "修改圈子")
    @PreAuthorize("@cx.check('talk:edit')")
    @ApiOperation(value = "修改圈子",httpMethod = "PUT", response = ResponseResult.class, notes = "修改圈子")
    public ResponseResult updateTalk(@RequestBody Talk talk){
        return talkService.updateTalk(talk);
    }

    @DeleteMapping("delete")
    @Log(value = "删除圈子")
    @PreAuthorize("@cx.check('talk:del')")
    @ApiOperation(value = "删除圈子",httpMethod = "DELETE", response = ResponseResult.class, notes = "删除圈子")
    public ResponseResult deleteTalk(@RequestBody List<Integer> ids){
        return talkService.deleteTalk(ids);
    }
}
