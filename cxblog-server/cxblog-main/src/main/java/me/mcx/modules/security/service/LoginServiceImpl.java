package me.mcx.modules.security.service;

import me.mcx.utils.Captcha;
import org.springframework.http.ResponseEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author MCX
 * @description:
 * @date 2021/7/30 14:59
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class LoginServiceImpl implements LoginService {

    private final CaptchaServiceImpl captchaService;

    @Override
    public ResponseEntity getCaptcha(Captcha captcha) {
        return ResponseEntity.ok(captchaService.getCaptcha(captcha));
    }
}
