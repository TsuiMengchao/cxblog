package me.mcx.blog.controller.web;

import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import me.mcx.common.security.annotation.AccessLimit;
import me.mcx.blog.service.web.ApiArticleCollectService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.web.page.TableDataInfo;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author blue
 * @date 2022/1/13
 * @apiNote
 */
@RestController
@RequestMapping("/v1/collect")
@RequiredArgsConstructor
@Api(tags = "文章收藏API-V1")
public class ApiArticleCollectController extends BaseController {

    private final ApiArticleCollectService apiCollectService;

    /**
     * 我的收藏列表
     * @return
     */
    @GetMapping
    public TableDataInfo selectCollectList() {
        return getDataTable(apiCollectService.selectCollectList());
    }

    /**
     * 收藏文章
     * @param articleId
     * @return
     */
    @AccessLimit
    @GetMapping(value = "/collect")
    public AjaxResult collect(Integer articleId) {
        return apiCollectService.collect(articleId);
    }

    /**
     * 取消收藏
     * @param articleId
     * @return
     */
    @AccessLimit
    @DeleteMapping
    public AjaxResult cancel(Integer articleId) {
        return apiCollectService.cancel(articleId);
    }
}
