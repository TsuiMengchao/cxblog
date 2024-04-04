package me.mcx.modules.blog.admin.rest;



import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.service.impl.HomeServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/home")
@Api(tags = "后台首页")
@RequiredArgsConstructor
public class HomeController {

    private final HomeServiceImpl homeService;

    @GetMapping(value = "/init")
    @ApiOperation(value = "首页各种统计信息", httpMethod = "GET", response = ResponseResult.class, notes = "首页各种统计信息")
    public ResponseResult init() {
        return ResponseResult.success(homeService.init());
    }

    @GetMapping(value = "/lineCount")
    @ApiOperation(value = "首页文章、ip用户、留言统计", httpMethod = "GET", response = ResponseResult.class, notes = "首页文章、ip用户、留言统计")
    public ResponseResult lineCount() {
        return ResponseResult.success(homeService.lineCount());
    }
}
