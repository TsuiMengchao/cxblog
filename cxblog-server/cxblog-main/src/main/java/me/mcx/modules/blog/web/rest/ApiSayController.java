package me.mcx.modules.blog.web.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Say;
import me.mcx.modules.blog.domain.SayComment;
import me.mcx.modules.blog.web.service.ApiSayService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@Api(tags = "说说接口-API")
@RequestMapping("v1/say")
@RequiredArgsConstructor
public class ApiSayController {

    private final ApiSayService apiSayService;

    @AnonymousGetMapping(value = "getSayList")
    @ApiOperation(value = "说说列表", httpMethod = "GET", response = ResponseResult.class, notes = "说说列表")
    public ResponseResult selectSayList(){
        return apiSayService.selectSayList();
    }

    @GetMapping(value = "like")
    @ApiOperation(value = "点赞说说", httpMethod = "GET", response = ResponseResult.class, notes = "点赞说说")
    public ResponseResult like(String sayId){
        return apiSayService.like(sayId);
    }

    @PostMapping(value = "comment")
    @ApiOperation(value = "评论说说", httpMethod = "POST", response = ResponseResult.class, notes = "评论说说")
    public ResponseResult comment(@RequestBody SayComment sayComment){
        return apiSayService.comment(sayComment);
    }

    @PostMapping(value = "insertSay")
    @ApiOperation(value = "添加说说", httpMethod = "POST", response = ResponseResult.class, notes = "添加说说说")
    public ResponseResult insertSay(@RequestBody Say say){
        return apiSayService.insertSay(say);
    }

}
