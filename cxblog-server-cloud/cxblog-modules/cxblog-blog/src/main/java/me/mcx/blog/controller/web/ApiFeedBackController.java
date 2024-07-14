package me.mcx.blog.controller.web;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.BlogFeedBack;
import me.mcx.blog.service.web.ApiFeedBackService;
import me.mcx.common.core.web.domain.AjaxResult;
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

    @PostMapping
    @ApiOperation(value = "添加反馈", httpMethod = "POST", response = AjaxResult.class, notes = "添加反馈")
    public AjaxResult addFeedback(@RequestBody BlogFeedBack feedBack) {
        return  feedBackService.addFeedback(feedBack);
    }

}
