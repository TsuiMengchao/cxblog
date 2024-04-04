package me.mcx.modules.blog.web.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import me.mcx.annotation.AccessLimit;
import me.mcx.annotation.WebLog;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.web.service.ApiSignService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "签到接口-API")
@RequestMapping("v1/sign")
@RequiredArgsConstructor
public class ApiSignController {

    private final ApiSignService apiSignService;

    @GetMapping(value = "getSignRecords")
    @ApiOperation(value = "用户签到记录", httpMethod = "GET", response = ResponseResult.class, notes = "用户签到记录")
    public ResponseResult getSignRecords(String startTime,String endTime){
        return apiSignService.getSignRecords(startTime,endTime);
    }

    @AccessLimit
    @GetMapping(value = "/")
    @WebLog(value = "签到-用户签到",type = "添加",desc = "用户签到")
    @ApiOperation(value = "用户签到", httpMethod = "GET", response = ResponseResult.class, notes = "用户签到")
    public ResponseResult sign(String time){
        return apiSignService.sign(time);
    }

    @GetMapping(value = "validateTodayIsSign")
    @ApiOperation(value = "验证用户当日是否签到", httpMethod = "GET", response = ResponseResult.class, notes = "验证用户当日是否签到")
    public ResponseResult validateTodayIsSign(){
        return apiSignService.validateTodayIsSign();
    }

}
