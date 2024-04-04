package me.mcx.modules.blog.admin.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.CommentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/comment")
@Api(tags = "评论管理")
@RequiredArgsConstructor
public class CommentController {

    private final CommentService commentService;

    @AnonymousGetMapping(value = "/list")
    @PreAuthorize("@cx.check('comment:list')")
    @ApiOperation(value = "评论列表", httpMethod = "GET", response = ResponseResult.class, notes = "评论列表")
    public ResponseResult list(String keywords){
        return commentService.listComment(keywords);
    }

    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('comment:deleteBatch')")
    @ApiOperation(value = "批量删除评论", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除评论")
    @Log(value = "删除评论")
    public ResponseResult deleteBatch(@RequestBody List<Integer> ids){
        return commentService.deleteBatch(ids);
    }

}
