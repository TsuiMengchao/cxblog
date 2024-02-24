package me.mcx.modules.blog.web.rest;


import me.mcx.annotation.WebLog;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.web.service.ApiTagService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 博客标签表 前端控制器
 * </p>
 *
 * @author MCX
 * @since 2021-09-09
 */
@RestController
@RequestMapping("/v1/tag")
@Api(tags = "标签分类接口")
@RequiredArgsConstructor
public class ApiTagsController {

    private final ApiTagService tagsService;

    @WebLog(value = "标签模块-用户访问页面",type = "查询",desc = "用户访问页面")
    @AnonymousGetMapping(value = "/")
    @ApiOperation(value = "标签列表", httpMethod = "GET", response = ResponseResult.class, notes = "标签列表")
    public ResponseResult selectTagList(){
        return tagsService.selectTagList();
    }

}

