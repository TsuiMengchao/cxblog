package me.mcx.blog.controller.web;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.BlogFriendLink;
import me.mcx.blog.service.web.ApiFriendLinkService;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 友情链接表 前端控制器
 * </p>
 *
 * @author blue
 * @since 2021-08-18
 */
@RestController
@RequestMapping("/v1/link")
@Api(tags = "友情链接API-V1")
@RequiredArgsConstructor
public class ApiFriendLinkController {

    private final ApiFriendLinkService friendLinkService;

    /**
     * 友链列表
     * @return
     */
    @GetMapping
    public AjaxResult selectFriendLinkList(){
        return friendLinkService.selectFriendLinkList();
    }

    /**
     * 申请友链
     * @param friendLink
     * @return
     */
    @PostMapping
    public AjaxResult addFriendLink(@RequestBody BlogFriendLink friendLink){
        return friendLinkService.addFriendLink(friendLink);
    }



}

