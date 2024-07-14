package me.mcx.modules.blog.admin.rest;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.FeedBackService;
import me.mcx.modules.blog.domain.FeedBack;
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
 * @since 2022-01-13
 */
@RestController
@RequestMapping("/api/feedback")
@Api(tags = "后台反馈管理")
@RequiredArgsConstructor
public class FeedBackController {

    private final FeedBackService feedBackService;

    @GetMapping(value = "/list")
    @PreAuthorize("@cx.check('feedback:list')")
    @ApiOperation(value = "反馈列表", httpMethod = "GET", response = ResponseResult.class, notes = "反馈列表")
    public ResponseResult list(Integer type) {
        return feedBackService.listFeedBack(type);
    }

    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('feedback:deleteBatch')")
    @ApiOperation(value = "删除反馈", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除反馈")
    @Log(value = "删除反馈")
    public ResponseResult deleteBatch(@RequestBody List<Integer> ids) {
        return feedBackService.deleteBatch(ids);
    }

    @PutMapping(value = "/update")
    @Log(value = "修改反馈")
    @PreAuthorize("@cx.check('feedback:edit')")
    @ApiOperation(value = "修改反馈", httpMethod = "PUT", response = ResponseResult.class, notes = "修改反馈")
    public ResponseResult update(@RequestBody FeedBack feedBack) {
        return feedBackService.updateFeedBack(feedBack);
    }
}

