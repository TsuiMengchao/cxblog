package me.mcx.modules.blog.web.rest;

import me.mcx.annotation.rest.AnonymousGetMapping;
import me.mcx.annotation.rest.AnonymousPostMapping;
import me.mcx.common.RedisConstants;
import me.mcx.modules.blog.admin.service.RedisService;
import me.mcx.modules.blog.web.service.ApiUserService;
import me.mcx.utils.RandomUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutTextMessage;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author MCX
 * @date 2022/1/11
 * @apiNote
 */
@Slf4j
@Api(tags = "微信接口相关控制器")
@RestController
@RequestMapping("/wechat")
@RequiredArgsConstructor
public class ApiWeChatController {

    private final RedisService redisService;

    private final WxMpService wxMpService;

    private final ApiUserService userService;
    private final Pattern pattern = Pattern.compile("(?i)^DL\\d{4}$");

    @ApiOperation("微信公众号服务器配置校验token")
    @AnonymousGetMapping(produces = "text/plain;charset=utf-8")
    public String checkSignature(@RequestParam(name = "signature") String signature,
                                 @RequestParam(name = "timestamp") String timestamp,
                                 @RequestParam(name = "nonce") String nonce,
                                 @RequestParam(name = "echostr") String echostr) {
        if (wxMpService.checkSignature(timestamp, nonce, signature)) {
            log.info("echostr:"+echostr);
            return echostr;
        }
        log.info("Invalid signature");
        return "Invalid signature";
    }

    @AnonymousPostMapping(produces = "application/xml; charset=UTF-8")
    public String handleMsg(HttpServletRequest request) {

        try {
            WxMpXmlMessage message = WxMpXmlMessage.fromXml(request.getInputStream());
            String content = message.getContent();
            log.info("公众号请求类型:{};内容为:{}", message.getMsgType(), content);
            if (WxConsts.XmlMsgType.TEXT.equals(message.getMsgType())){
                if ("验证码".equals(content)) {
                    String code = RandomUtils.generationNumberChar(6);
                    String msg = MessageFormat.format("您的本次验证码:{0},该验证码30分钟内有效。", code);
                    redisService.setCacheObject(RedisConstants.WECHAT_CODE+code,code,30, TimeUnit.MINUTES);
                    return returnMsg(msg, message);
                }
                //登录逻辑
                Matcher matcher = pattern.matcher(content);
                if (!matcher.matches()) {
                    return returnMsg("验证不正确或已过期", message);
                }else {
                    String msg = userService.wechatLogin(message);
                    return returnMsg(msg, message);
                }
   
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 返回消息
     * @param msg 消息内容
     * @param message
     * @return
     */
    private static String returnMsg(String msg, WxMpXmlMessage message) {
        WxMpXmlOutTextMessage outMessage = WxMpXmlOutTextMessage.TEXT().content(msg).fromUser(message.getToUser()).toUser(message.getFromUser()).build();
        return outMessage.toXml();
    }

    public static Map<String, String> parseURL(String url) {
        Map<String, String> params = new HashMap<>();

        String[] keyValuePairs = url.split("&amp;");
        for (String pair : keyValuePairs) {
            String[] keyValue = pair.split("=");
            if (keyValue.length == 2) {
                try {
                    String key = URLDecoder.decode(keyValue[0], "UTF-8");
                    String value = URLDecoder.decode(keyValue[1], "UTF-8");
                    params.put(key, value);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
        }

        return params;
    }
}

