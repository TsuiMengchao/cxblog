package me.mcx.blog.controller.web;

import me.mcx.blog.service.web.ApiTagService;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 博客标签表 前端控制器
 * </p>
 *
 * @author blue
 * @since 2021-09-09
 */
@RestController
@RequestMapping("/v1/tag")
public class ApiTagsController {

    @Autowired
    private ApiTagService tagsService;

    /**
     * 标签列表
     * @return
     */
    @GetMapping
    public AjaxResult selectTagList(){
        return tagsService.selectTagList();
    }

}

