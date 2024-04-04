package me.mcx.modules.blog.web.rest;


import me.mcx.annotation.WebLog;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.annotation.rest.AnonymousPostMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Message;
import me.mcx.modules.blog.web.service.ApiMessageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author MCX
 * @since 2021-09-03
 */
@RestController
@RequestMapping("/v1/message")
@Api(tags = "评论留言接口")
@RequiredArgsConstructor
public class ApiMessageController {

    private final ApiMessageService messageService;

    @WebLog(value = "留言模块-留言列表",type = "查询",desc = "留言列表")
    @AnonymousGetMapping(value = "/")
    @ApiOperation(value = "留言列表", httpMethod = "GET", response = ResponseResult.class, notes = "留言列表")
    public ResponseResult selectMessageList(){
        return messageService.selectMessageList();
    }


    @WebLog(value = "留言模块-用户留言",type = "添加",desc = "用户留言")
    @AnonymousPostMapping(value = "/")
    @ApiOperation(value = "添加留言", httpMethod = "POST", response = ResponseResult.class, notes = "添加留言")
    public ResponseResult insertMessage(@RequestBody Message message){
        return messageService.insertMessage(message);
    }

}

