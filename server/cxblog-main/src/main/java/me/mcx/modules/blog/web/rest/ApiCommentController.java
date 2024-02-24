package me.mcx.modules.blog.web.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import me.mcx.annotation.AccessLimit;
import me.mcx.annotation.WebLog;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Comment;
import me.mcx.modules.blog.web.service.ApiCommentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/comment")
@Api(tags = "评论API-V1")
@RequiredArgsConstructor
public class ApiCommentController {

    private final ApiCommentService commentService;

    @AccessLimit
    @WebLog(value = "评论模块-用户评论",type = "添加",desc = "用户评论")
    @PostMapping(value = "/")
    @ApiOperation(value = "添加评论", httpMethod = "POST", response = ResponseResult.class, notes = "添加评论")
    public ResponseResult insertComment(@RequestBody Comment comment){
        return commentService.insertComment(comment);
    }

    @AnonymousGetMapping(value = "/")
    @ApiOperation(value = "根据文章id获取相关评论", httpMethod = "GET", response = ResponseResult.class, notes = "根据文章id获取相关评论")
    public ResponseResult selectCommentByArticleId(int pageNo,int pageSize,Long articleId){
        return commentService.selectCommentByArticleId(pageNo,pageSize,articleId);
    }

    @GetMapping(value = "/getMyComment")
    @ApiOperation(value = "获取我的评论", httpMethod = "GET", response = ResponseResult.class, notes = "获取我的评论")
    public ResponseResult selectMyComment(){
        return commentService.selectMyComment();
    }
}
