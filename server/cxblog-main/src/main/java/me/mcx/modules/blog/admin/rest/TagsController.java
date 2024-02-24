package me.mcx.modules.blog.admin.rest;

import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.TagsService;
import me.mcx.modules.blog.domain.Tags;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 博客标签表 前端控制器
 * </p>
 *
 * @author MCX
 * @since 2021-09-09
 */
@RestController
@RequestMapping("/api/tags")
@Api(tags = "标签管理")
@RequiredArgsConstructor
public class TagsController {

    private final TagsService tagsService;

    @AnonymousGetMapping(value = "/list")
    @PreAuthorize("@cx.check('\t\n" +
            "tag:list')")
    @ApiOperation(value = "标签列表", httpMethod = "GET", response = ResponseResult.class, notes = "标签列表")
    public ResponseResult list(String name){
        return tagsService.listTags(name);
    }

    @PostMapping(value = "/add")
    @PreAuthorize("@cx.check('tag:add')")
    @ApiOperation(value = "新增标签", httpMethod = "POST", response = ResponseResult.class, notes = "新增标签")
    @Log(value = "新增标签")
    public ResponseResult insert(@RequestBody Tags tags){
        return tagsService.insertTag(tags);
    }

    @AnonymousGetMapping(value = "/info")
    @PreAuthorize("@cx.check('tag:info')")
    @ApiOperation(value = "标签详情", httpMethod = "GET", response = ResponseResult.class, notes = "标签详情")
    public ResponseResult getTagsById(Long id){
        return tagsService.getTagsById(id);
    }

    @PostMapping(value = "/update")
    @PreAuthorize("@cx.check('tag:edit')")
    @ApiOperation(value = "修改标签", httpMethod = "POST", response = ResponseResult.class, notes = "修改标签")
    @Log(value = "修改标签")
    public ResponseResult update(@RequestBody Tags tags){
        return tagsService.updateTag(tags);
    }

    @DeleteMapping(value = "/remove")
    @PreAuthorize("@cx.check('tag:del')")
    @ApiOperation(value = "删除标签", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除标签")
    @Log(value = "删除标签")
    public ResponseResult deleteById(Long  id){
        return tagsService.deleteById(id);
    }

    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('tag:deleteBatch')")
    @ApiOperation(value = "批量删除标签", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除标签")
    @Log(value = "批量删除标签")
    public ResponseResult deleteBatch(@RequestBody List<Long> ids){
        return tagsService.deleteBatch(ids);
    }

    @AnonymousGetMapping(value = "/top")
    @PreAuthorize("@cx.check('tag:top')")
    @ApiOperation(value = "置顶标签", httpMethod = "GET", response = ResponseResult.class, notes = "置顶标签")
    @Log(value = "置顶标签")
    public ResponseResult top(Long id){
        return tagsService.top(id);
    }
}

