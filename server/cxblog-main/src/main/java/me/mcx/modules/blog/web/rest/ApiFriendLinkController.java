package me.mcx.modules.blog.web.rest;


import me.mcx.annotation.WebLog;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.annotation.rest.AnonymousPostMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.FriendLink;
import me.mcx.modules.blog.web.service.ApiFriendLinkService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 友情链接表 前端控制器
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@RestController
@RequestMapping("/v1/link")
@Api(tags = "友情链接API-V1")
@RequiredArgsConstructor
public class ApiFriendLinkController {

    private final ApiFriendLinkService friendLinkService;

    @WebLog(value = "友链模块-用户访问页面",type = "查询",desc = "友链列表")
    @AnonymousGetMapping(value = "/")
    @ApiOperation(value = "友链列表", httpMethod = "GET", response = ResponseResult.class, notes = "友链列表")
    public ResponseResult selectFriendLinkList(){
        return friendLinkService.selectFriendLinkList();
    }

    @WebLog(value = "友链模块-用户申请友链",type = "添加",desc = "用户申请友链")
    @AnonymousPostMapping(value = "/")
    @ApiOperation(value = "申请友链", httpMethod = "POST", response = ResponseResult.class, notes = "申请友链")
    public ResponseResult insertFriendLink(@RequestBody FriendLink friendLink){
        return friendLinkService.insertFriendLink(friendLink);
    }



}

