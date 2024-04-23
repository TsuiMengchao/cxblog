package me.mcx.modules.blog.admin.rest;

import lombok.AllArgsConstructor;
import me.chanjar.weixin.common.bean.WxJsapiSignature;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * jsapi 演示接口的 controller.
 *
 * @author <a href="https://github.com/binarywang">Binary Wang</a>
 * @date 2020-04-25
 */
@AllArgsConstructor
@RestController
@RequestMapping("/api/wx/jsapi")
public class WxJsapiController {
    private final WxMpService wxService;

    @GetMapping("/getJsapiTicket")
    public String getJsapiTicket() throws WxErrorException {
        final WxJsapiSignature jsapiSignature = this.wxService.createJsapiSignature("111");
        System.out.println(jsapiSignature);
        return this.wxService.getJsapiTicket(true);
    }
}
