package me.mcx.modules.blog.web.rest;


import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.web.service.ApiHomeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author MCX
 * @since 2021-09-03
 */
@RestController
@RequestMapping("/v1")
@RequiredArgsConstructor
@Api(tags = "门户首页管理")
public class ApiHomeController {

    private final ApiHomeService homeService;


    @AnonymousGetMapping(value = "/report")
    @ApiOperation(value = "增加访问量", httpMethod = "GET", response = ResponseResult.class, notes = "增加访问量")
    public ResponseResult report(){
        return homeService.report();
    }

    @AnonymousGetMapping("/webSiteInfo")
    @ApiOperation(value = "网站相关信息", httpMethod = "GET", response = ResponseResult.class, notes = "网站相关信息")
    public ResponseResult getWebSiteInfo(){
        return homeService.getWebSiteInfo();
    }

    @AnonymousGetMapping("/")
    @ApiOperation(value = "首页共享数据", httpMethod = "GET", response = ResponseResult.class, notes = "首页共享数据")
    public ResponseResult getHomeData(){
        return homeService.getHomeData();
    }

    @AnonymousGetMapping("/hot")
    @ApiOperation(value = "获取各大平台热搜", httpMethod = "GET", response = ResponseResult.class, notes = "获取各大平台热搜")
    public ResponseResult hot(String type){
        return homeService.hot(type);
    }

}

