package me.mcx.blog.controller.web;

import me.mcx.blog.service.web.ApiCategoryService;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 分类处理器
 * @author blue
 */
@RestController
@RequestMapping("v1/category")
public class ApiCategoryController {

    @Autowired
    private ApiCategoryService categoryService;

    /**
     * 分类列表
     * @return
     */
    @GetMapping
    public AjaxResult selectCategoryList(){
        return categoryService.selectCategoryList();
    }
}
