package me.mcx.blog.controller.web;


import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.service.web.ApiHomeService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author blue
 * @since 2021-09-03
 */
@RestController
@RequestMapping("/v1")
@Slf4j
public class ApiHomeController extends BaseController {

    @Autowired
    private ApiHomeService homeService;


    /**
     * 增加访问量
     * @return
     */
    @RequestMapping(value = "/report",method = RequestMethod.GET)
    public AjaxResult report(){
        return homeService.report();
    }

    /**
     * 网站相关信息
     * @return
     */
    @GetMapping("/webSiteInfo")
    public AjaxResult getWebSiteInfo(){
        return homeService.getWebSiteInfo();
    }

    /**
     * 首页共享数据
     * @return
     */
    @GetMapping
    public AjaxResult getHomeData(){
        return homeService.getHomeData();
    }

    /**
     * 获取各大平台热搜
     * @param type
     * @return
     */
    @GetMapping("/hot")
    public AjaxResult hot(String type){
        return homeService.hot(type);
    }

}

