package me.mcx.modules.blog.admin.service;


import me.mcx.common.ResponseResult;
import me.mcx.utils.Captcha;
import me.mcx.modules.blog.domain.dto.LoginDTO;

/**
 * @author MCX
 * @description:
 * @date 2021/7/30 14:58
 */
public interface LoginService {

    ResponseResult login(LoginDTO vo);

    ResponseResult getCaptcha(Captcha captcha);
}
