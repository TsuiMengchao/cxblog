package me.mcx.gateway.service;

import java.io.IOException;
import me.mcx.common.core.exception.CaptchaException;
import me.mcx.common.core.web.domain.AjaxResult;

/**
 * 验证码处理
 *
 * @author cxblog
 */
public interface ValidateCodeService
{
    /**
     * 生成验证码
     */
    public AjaxResult createCaptcha() throws IOException, CaptchaException;

    /**
     * 校验验证码
     */
    public void checkCaptcha(String key, String value) throws CaptchaException;
}
