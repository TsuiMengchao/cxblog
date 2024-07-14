package me.mcx.modules.blog.web.rest;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Tipsoon;
import me.mcx.modules.blog.domain.TipsoonComment;
import me.mcx.modules.blog.web.service.ApiTipsoonService;
import org.springframework.web.bind.annotation.*;

@RestController
@Api(tags = "说说接口-API")
@RequestMapping("v1/tipsoon")
@RequiredArgsConstructor
public class ApiTipsoonController {

    private final ApiTipsoonService apiTipsoonService;

    @AnonymousGetMapping(value = "getTipsoon")
    @ApiOperation(value = "说说列表", httpMethod = "GET", response = ResponseResult.class, notes = "说说列表")
    public ResponseResult selectTipsoon(){
        return apiTipsoonService.selectTipsoon();
    }

    @AnonymousGetMapping(value = "get10Tipsoon")
    @ApiOperation(value = "说说列表", httpMethod = "GET", response = ResponseResult.class, notes = "说说列表")
    public ResponseResult select10Tipsoon(){
        return apiTipsoonService.select10Tipsoon();
    }

    @GetMapping(value = "getTipsoonById")
    @ApiOperation(value = "说说列表", httpMethod = "GET", response = ResponseResult.class, notes = "说说列表")
    public ResponseResult selectTipsoonById(String tipsoonId){
        return apiTipsoonService.selectTipsoonById(tipsoonId);
    }

    @GetMapping(value = "read")
    @ApiOperation(value = "说说已读", httpMethod = "GET", response = ResponseResult.class, notes = "说说已读")
    public ResponseResult read(String tipsoonId){
        return apiTipsoonService.read(tipsoonId);
    }

    @GetMapping(value = "like")
    @ApiOperation(value = "点赞说说", httpMethod = "GET", response = ResponseResult.class, notes = "点赞说说")
    public ResponseResult like(String tipsoonId){
        return apiTipsoonService.like(tipsoonId);
    }

    @GetMapping(value = "collect")
    @ApiOperation(value = "收藏说说", httpMethod = "GET", response = ResponseResult.class, notes = "收藏说说")
    public ResponseResult collect(String tipsoonId){
        return apiTipsoonService.collect(tipsoonId);
    }

    @PostMapping(value = "comment")
    @ApiOperation(value = "评论说说", httpMethod = "POST", response = ResponseResult.class, notes = "评论说说")
    public ResponseResult comment(@RequestBody TipsoonComment tipsoonComment){
        return apiTipsoonService.comment(tipsoonComment);
    }

    @PostMapping(value = "insertTipsoon")
    @ApiOperation(value = "添加说说", httpMethod = "POST", response = ResponseResult.class, notes = "添加说说说")
    public ResponseResult insertTipsoon(@RequestBody Tipsoon tipsoon){
        return apiTipsoonService.insertTipsoon(tipsoon);
    }

    @AnonymousGetMapping("commentList")
    @ApiOperation(value = "圈子内容评论列表", httpMethod = "GET", response = ResponseResult.class, notes = "圈子内容评论列表")
    public ResponseResult commentList(String tipsoonId){
        return apiTipsoonService.commentList(tipsoonId);
    }

}
