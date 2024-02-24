package me.mcx.modules.blog.web.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import me.mcx.annotation.AccessLimit;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.web.service.ApiCollectService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * @author MCX
 * @date 2022/1/13
 * @apiNote
 */
@RestController
@RequestMapping("/v1/collect")
@RequiredArgsConstructor
@Api(tags = "文章收藏API-V1")
public class ApiCollectController {

    private final ApiCollectService apiCollectService;

    @GetMapping(value = "/")
    @ApiOperation(value = "我的收藏列表", httpMethod = "GET", response = ResponseResult.class, notes = "我的收藏列表")
    public ResponseResult selectCollectList() {
        return apiCollectService.selectCollectList();
    }

    @AccessLimit
    @GetMapping(value = "collect")
    @ApiOperation(value = "收藏文章", httpMethod = "GET", response = ResponseResult.class, notes = "收藏文章")
    public ResponseResult collect(Integer articleId) {
        return apiCollectService.collect(articleId);
    }

    @AccessLimit
    @DeleteMapping(value = "/")
    @ApiOperation(value = "取消收藏", httpMethod = "DELETE", response = ResponseResult.class, notes = "取消收藏")
    public ResponseResult cancel(Integer articleId) {
        return apiCollectService.cancel(articleId);
    }
}
