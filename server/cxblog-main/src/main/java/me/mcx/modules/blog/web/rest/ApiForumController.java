package me.mcx.modules.blog.web.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import me.mcx.annotation.AccessLimit;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Forum;
import me.mcx.modules.blog.domain.ForumComment;
import me.mcx.modules.blog.web.service.ApiForumService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author: 辰雪
 * @date: 2023/10/16
 * @describe:
 */
@RequestMapping("/v1/forum")
@RestController
@Api(tags = "圈子内容接口")
@RequiredArgsConstructor
public class ApiForumController {

    private final ApiForumService apiForumService;

    @AnonymousGetMapping("list")
    @ApiOperation(value = "圈子内容列表", httpMethod = "GET", response = ResponseResult.class, notes = "圈子内容列表")
    public ResponseResult selectForumListByTalkId(Integer talkId,String orderBy){
        return apiForumService.selectForumListByTalkId(talkId,orderBy);
    }

    @PostMapping("add")
    @ApiOperation(value = "添加圈子内容", httpMethod = "POST", response = ResponseResult.class, notes = "添加圈子内容")
    public ResponseResult addForum(@RequestBody Forum forum){
        return apiForumService.addForum(forum);
    }

    @PostMapping("comment")
    @ApiOperation(value = "圈子内容评论", httpMethod = "POST", response = ResponseResult.class, notes = "圈子内容评论")
    public ResponseResult comment(@RequestBody ForumComment forumComment){
        return apiForumService.comment(forumComment);
    }

    @AnonymousGetMapping("commentList")
    @ApiOperation(value = "圈子内容评论列表", httpMethod = "GET", response = ResponseResult.class, notes = "圈子内容评论列表")
    public ResponseResult commentList(Integer forumId){
        return apiForumService.commentList(forumId);
    }

    @AccessLimit
    @GetMapping("like")
    @ApiOperation(value = "圈子内容点赞", httpMethod = "GET", response = ResponseResult.class, notes = "圈子内容点赞")
    public ResponseResult like(Integer forumId){
        return apiForumService.like(forumId);
    }

    @AnonymousGetMapping("likeList")
    @ApiOperation(value = "圈子内容点赞列表", httpMethod = "GET", response = ResponseResult.class, notes = "圈子内容点赞列表")
    public ResponseResult likeList(Integer forumId){
        return apiForumService.likeList(forumId);
    }

}
