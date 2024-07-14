package me.mcx.modules.blog.admin.rest;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.ForumService;
import me.mcx.modules.blog.domain.Forum;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/forum")
@Api(tags = "论坛管理")
@RequiredArgsConstructor
@Slf4j
public class ForumController {

    private final ForumService forumService;

    @PreAuthorize("@cx.check('forum:list')")
    @AnonymousGetMapping(value = "/list")
    @ApiOperation(value = "讨论列表", httpMethod = "GET", response = ResponseResult.class, notes = "讨论列表")
    public ResponseResult list(String keywords){
        return forumService.selectForumList(keywords);
    }

    @PreAuthorize("@cx.check('forum:info')")
    @AnonymousGetMapping(value = "/info")
    @ApiOperation(value = "讨论详情", httpMethod = "GET", response = ResponseResult.class, notes = "讨论详情")
    public ResponseResult info(String id){
        return forumService.selectForumById(id);
    }

    @Log(value = "修改讨论")
    @PreAuthorize("@cx.check('forum:edit')")
    @PutMapping(value = "/update")
    @ApiOperation(value = "修改讨论", httpMethod = "PUT", response = ResponseResult.class, notes = "修改讨论")
    public ResponseResult update(@RequestBody Forum forum){
        return forumService.updateForumById(forum);
    }

    @Log(value = "发表讨论")
    @PreAuthorize("@cx.check('forum:add')")
    @PostMapping(value = "/")
    @ApiOperation(value = "发表讨论", httpMethod = "POST", response = ResponseResult.class, notes = "发表讨论")
    public ResponseResult insertForum(@RequestBody Forum forum){
        return forumService.insertForum(forum);
    }

    @Log(value = "删除讨论")
    @PreAuthorize("@cx.check('forum:del')")
    @DeleteMapping(value = "/delete")
    @ApiOperation(value = "删除讨论", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除讨论")
    public ResponseResult deleteForum(@RequestBody List<String> ids){
        return forumService.deleteForum(ids);
    }

}
