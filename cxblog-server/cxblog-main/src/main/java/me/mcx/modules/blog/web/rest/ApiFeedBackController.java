package me.mcx.modules.blog.web.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.FeedBack;
import me.mcx.modules.blog.web.service.ApiFeedBackService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author MCX
 * @date 2022/1/13
 * @apiNote
 */
@RestController
@RequestMapping("/v1/feedback")
@RequiredArgsConstructor
@Api(tags = "反馈API-V1")
public class ApiFeedBackController {

    private final ApiFeedBackService feedBackService;

    @PostMapping(value = "/")
    @ApiOperation(value = "添加反馈", httpMethod = "POST", response = ResponseResult.class, notes = "添加反馈")
    public ResponseResult insertFeedback(@RequestBody FeedBack feedBack) {
        return  feedBackService.insertFeedback(feedBack);
    }

}
