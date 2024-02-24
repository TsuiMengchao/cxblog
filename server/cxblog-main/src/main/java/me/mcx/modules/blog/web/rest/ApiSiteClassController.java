package me.mcx.modules.blog.web.rest;

import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.web.service.ApiSiteClassService;
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
@RequestMapping("/v1/site")
@RequiredArgsConstructor
@Api(tags = "网址导航API-V1")
public class ApiSiteClassController {

    private final ApiSiteClassService siteClassService;

    @AnonymousGetMapping(value = "/getNavigations")
    @ApiOperation(value = "网址导航列表", httpMethod = "GET", response = ResponseResult.class, notes = "网址导航列表")
    public ResponseResult selectNavigationList() {
        return  siteClassService.selectNavigationList();
    }

}
