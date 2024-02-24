package me.mcx.modules.blog.web.rest;


import cn.dev33.satoken.annotation.SaCheckLogin;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.web.service.ApiSponsorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Api(tags = "打赏接口")
@RestController
@RequestMapping("/v1/sponsor")
@RequiredArgsConstructor
public class ApiSponsorController {

    private final ApiSponsorService sponsorService;

    @AnonymousGetMapping( "list")
    @ApiOperation(value = "打赏记录列表", httpMethod = "GET", response = ResponseResult.class, notes = "打赏记录列表")
    public ResponseResult selectSponsorList(){
        return sponsorService.selectSponsorList();
    }

    @GetMapping( "add")
    @ApiOperation(value = "添加打赏记录", httpMethod = "GET", response = ResponseResult.class, notes = "添加打赏记录")
    public ResponseResult addSponsor(String payImage){
        return sponsorService.addSponsor(payImage);
    }

}
