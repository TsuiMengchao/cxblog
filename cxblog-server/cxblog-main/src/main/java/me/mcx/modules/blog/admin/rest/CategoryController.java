package me.mcx.modules.blog.admin.rest;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.CategoryService;
import me.mcx.modules.blog.domain.Category;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 博客分类表 前端控制器
 * </p>
 *
 * @author MCX
 * @since 2021-12-29
 */
@RestController
@RequestMapping("/api/category")
@RequiredArgsConstructor
@Api(tags = "分类管理")
public class CategoryController {

    private final CategoryService categoryService;

    @AnonymousGetMapping(value = "/list")
    @PreAuthorize("@cx.check('category:list')")
    @ApiOperation(value = "分类列表", httpMethod = "GET", response = ResponseResult.class, notes = "分类列表")
    public ResponseResult list(String name){
        return categoryService.selectCategoryList(name);
    }

    @AnonymousGetMapping(value = "/info")
    @PreAuthorize("@cx.check('category:info')")
    @ApiOperation(value = "分类详情", httpMethod = "GET", response = ResponseResult.class, notes = "分类详情")
    public ResponseResult getCategoryById(@RequestParam() Long id){
        return categoryService.getCategoryById(id);
    }

    @PostMapping(value = "/add")
    @PreAuthorize("@cx.check('category:add')")
    @ApiOperation(value = "新增分类", httpMethod = "POST", response = ResponseResult.class, notes = "新增分类")
    @Log(value = "新增分类")
    public ResponseResult insertCategory(@RequestBody Category category){
        return categoryService.insertCategory(category);
    }

    @PostMapping(value = "/update")
    @PreAuthorize("@cx.check('category:edit')")
    @ApiOperation(value = "修改分类", httpMethod = "POST", response = ResponseResult.class, notes = "修改分类")
    @Log(value = "修改分类")
    public ResponseResult update(@RequestBody Category category){
        return categoryService.updateCategory(category);
    }

    @DeleteMapping(value = "/delete")
    @PreAuthorize("@cx.check('category:del')")
    @ApiOperation(value = "删除分类", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除分类")
    @Log(value = "删除分类")
    public ResponseResult deleteCategory(Long id){
        return categoryService.deleteCategory(id);
    }

    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('category:deleteBatch')")
    @ApiOperation(value = "批量删除分类", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除分类")
    @Log(value = "批量删除分类")
    public ResponseResult deleteBatch(@RequestBody List<Category> list){
        return categoryService.deleteBatch(list);
    }

    @AnonymousGetMapping(value = "/top")
    @PreAuthorize("@cx.check('category:top')")
    @ApiOperation(value = "置顶分类", httpMethod = "GET", response = ResponseResult.class, notes = "置顶分类")
    @Log(value = "置顶分类")
    public ResponseResult top(Long id){
        return categoryService.top(id);
    }
}

