package me.mcx.blog.controller.web;

import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import me.mcx.common.security.annotation.AccessLimit;
import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.service.web.ApiCommentService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.web.page.TableDataInfo;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/comment")
@Api(tags = "评论API-V1")
@RequiredArgsConstructor
public class ApiArticleCommentController extends BaseController {

    private final ApiCommentService commentService;

    /**
     * 添加评论
     * @param comment
     * @return
     */
    @AccessLimit
    @PostMapping
    public AjaxResult addComment(@RequestBody BlogArticleComment comment){
        return commentService.addComment(comment);
    }

    /**
     * 根据文章id获取相关评论
     * @param articleId
     * @return
     */
    @GetMapping
    public TableDataInfo selectCommentByArticleId(Long articleId){
        startPage();
        return getDataTable(commentService.selectCommentByArticleId(articleId));
    }

    /**
     * 获取我的评论
     * @return
     */
    @GetMapping(value = "/getMyComment")
    public TableDataInfo selectMyComment(){
        startPage();
        return getDataTable(commentService.selectMyComment());
    }
}
