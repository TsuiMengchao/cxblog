package me.mcx.modules.security.service;


import me.mcx.utils.Captcha;
import org.springframework.http.ResponseEntity;

/**
 * @author MCX
 * @description:
 * @date 2021/7/30 14:58
 */
public interface LoginService {
    ResponseEntity getCaptcha(Captcha captcha);
}
