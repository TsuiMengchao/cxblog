package me.mcx.blog.controller.web;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.BlogMessage;
import me.mcx.blog.service.web.ApiMessageService;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author blue
 * @since 2021-09-03
 */
@RestController
@RequestMapping("/v1/message")
@Api(tags = "评论留言接口")
@RequiredArgsConstructor
public class ApiMessageController {

    private final ApiMessageService messageService;

    /**
     * 留言列表
     * @return
     */
    @GetMapping
    public AjaxResult selectMessageList(){
        return messageService.selectMessageList();
    }


    /**
     * 添加留言
     * @param message
     * @return
     */
    @PostMapping
    public AjaxResult addMessage(@RequestBody BlogMessage message){
        return messageService.addMessage(message);
    }

}

