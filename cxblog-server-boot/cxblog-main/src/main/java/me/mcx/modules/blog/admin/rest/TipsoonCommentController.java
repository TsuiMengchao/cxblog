package me.mcx.modules.blog.admin.rest;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.TipsoonCommentService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/tipsoonComment")
@Api(tags = "评论管理")
@RequiredArgsConstructor
public class TipsoonCommentController {

    private final TipsoonCommentService tipsoonCommentService;

    @AnonymousGetMapping(value = "/list")
    @PreAuthorize("@cx.check('tipsoonComment:list')")
    @ApiOperation(value = "评论列表", httpMethod = "GET", response = ResponseResult.class, notes = "评论列表")
    public ResponseResult list(String keywords){
        return tipsoonCommentService.listComment(keywords);
    }

    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('tipsoonComment:deleteBatch')")
    @ApiOperation(value = "批量删除评论", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除评论")
    @Log(value = "删除评论")
    public ResponseResult deleteBatch(@RequestBody List<Integer> ids){
        return tipsoonCommentService.deleteBatch(ids);
    }

}
