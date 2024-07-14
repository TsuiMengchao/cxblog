package me.mcx.modules.blog.web.rest;

import cn.dev33.satoken.annotation.SaCheckLogin;
import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Emoji;
import me.mcx.modules.blog.web.service.ApiEmojiService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/emoji")
@Api(tags = "表情API-V1")
@RequiredArgsConstructor
public class ApiEmojiController {

    private final ApiEmojiService apiEmojiService;


    @GetMapping(value = "/list")
    @ApiOperation(value = "我的收藏表情列表", httpMethod = "GET", response = ResponseResult.class, notes = "我的收藏表情列表")
    public ResponseResult selectEmojiListByUserId() {
        return  apiEmojiService.selectEmojiListByUserId();
    }

    @PostMapping(value = "/add")
    @ApiOperation(value = "添加表情", httpMethod = "POST", response = ResponseResult.class, notes = "添加表情")
    public ResponseResult addEmoji(@RequestBody Emoji emoji) {
        return  apiEmojiService.addEmoji(emoji);
    }

    @DeleteMapping(value = "/delete")
    @ApiOperation(value = "删除表情", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除表情")
    public ResponseResult deleteEmoji(Integer id) {
        return  apiEmojiService.deleteEmoji(id);
    }

    @GetMapping(value = "/stick")
    @ApiOperation(value = "置顶表情", httpMethod = "GET", response = ResponseResult.class, notes = "置顶表情")
    public ResponseResult stickEmoji(Integer id) {
        return  apiEmojiService.stickEmoji(id);
    }
}
