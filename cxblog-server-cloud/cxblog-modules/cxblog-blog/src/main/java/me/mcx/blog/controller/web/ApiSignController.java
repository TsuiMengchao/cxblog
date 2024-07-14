package me.mcx.blog.controller.web;

import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import me.mcx.common.security.annotation.AccessLimit;
import me.mcx.blog.service.web.ApiSignService;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "签到接口-API")
@RequestMapping("v1/sign")
@RequiredArgsConstructor
public class ApiSignController {

    private final ApiSignService apiSignService;

    /**
     * 用户签到记录
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping(value = "/getSignRecords",method = RequestMethod.GET)
    public AjaxResult getSignRecords(String startTime, String endTime){
        return apiSignService.getSignRecords(startTime,endTime);
    }

    /**
     * 签到-用户签到
     * @param time
     * @return
     */
    @AccessLimit
    @GetMapping
    public AjaxResult sign(String time){
        return apiSignService.sign(time);
    }

    /**
     * 验证用户当日是否签到
     * @return
     */
    @GetMapping(value = "validateTodayIsSign")
    public AjaxResult validateTodayIsSign(){
        return apiSignService.validateTodayIsSign();
    }

}
