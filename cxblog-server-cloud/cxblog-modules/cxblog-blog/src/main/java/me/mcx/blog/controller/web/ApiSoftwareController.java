package me.mcx.blog.controller.web;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.mcx.blog.service.web.ApiSoftwareService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/software")
@Api(tags = "开源软件接口")
@RequiredArgsConstructor
public class ApiSoftwareController extends BaseController {

    private final ApiSoftwareService softwareService;

    /**
     * 开源软件-用户访问开源软件
     * @return
     */
    @GetMapping
    public AjaxResult selectSoftwareList(){
        return success(softwareService.selectSoftwareList());
    }
}
