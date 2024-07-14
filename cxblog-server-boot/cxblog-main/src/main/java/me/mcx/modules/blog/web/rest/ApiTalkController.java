package me.mcx.modules.blog.web.rest;

import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.web.service.ApiTalkService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: 辰雪
 * @date: 2023/10/16
 * @describe:
 */
@RequestMapping("/v1/talk")
@RestController
@Api(tags = "话题接口")
@RequiredArgsConstructor
public class ApiTalkController {

    private final ApiTalkService apiTalkService;

    @AnonymousGetMapping("list")
    @ApiOperation(value = "话题列表", httpMethod = "GET", response = ResponseResult.class, notes = "话题列表")
    public ResponseResult selectList(){
        return apiTalkService.selectList();
    }

    @AnonymousGetMapping("analysis")
    @ApiOperation(value = "解析网页地址", httpMethod = "GET", response = ResponseResult.class, notes = "解析网页地址")
    public ResponseResult analysis(String url){
        return apiTalkService.analysis(url);
    }

}
