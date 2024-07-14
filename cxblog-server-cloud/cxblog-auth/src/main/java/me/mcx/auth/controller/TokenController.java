package me.mcx.auth.controller;

import javax.servlet.http.HttpServletRequest;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import me.mcx.auth.form.LoginBody;
import me.mcx.auth.form.RegisterBody;
import me.mcx.auth.service.SysLoginService;
import me.mcx.common.core.domain.R;
import me.mcx.common.core.utils.JwtUtils;
import me.mcx.common.core.utils.StringUtils;
import me.mcx.common.security.auth.AuthUtil;
import me.mcx.common.security.service.TokenService;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.system.api.model.LoginUser;

/**
 * token 控制
 * 
 * @author cxblog
 */
@RestController
public class TokenController
{
    @Autowired
    private TokenService tokenService;

    @Autowired
    private SysLoginService sysLoginService;

    @PostMapping("login")
    public R<?> login(@RequestBody LoginBody form)
    {
        // 用户登录
        LoginUser userInfo = sysLoginService.login(form.getUsername(), form.getPassword());
        // 获取登录token
        return R.ok(tokenService.createToken(userInfo));
    }

    @DeleteMapping("logout")
    public R<?> logout(HttpServletRequest request)
    {
        String token = SecurityUtils.getToken(request);
        if (StringUtils.isNotEmpty(token))
        {
            String username = JwtUtils.getUserName(token);
            // 删除用户缓存记录
            AuthUtil.logoutByToken(token);
            // 记录用户退出日志
            sysLoginService.logout(username);
        }
        return R.ok();
    }

    @PostMapping("refresh")
    public R<?> refresh(HttpServletRequest request)
    {
        LoginUser loginUser = tokenService.getLoginUser(request);
        if (StringUtils.isNotNull(loginUser))
        {
            // 刷新令牌有效期
            tokenService.refreshToken(loginUser);
            return R.ok();
        }
        return R.ok();
    }

    @PostMapping("register")
    public R<?> register(@RequestBody RegisterBody registerBody)
    {
        // 用户注册
        sysLoginService.register(registerBody);
        return R.ok();
    }

    @ApiOperation(value = "发送邮箱验证码", httpMethod = "GET", response = R.class, notes = "发送邮箱验证码")
    @GetMapping("sendEmailCode")
    public R<?> sendEmailCode(String email) {
        sysLoginService.sendEmailCode(email);
        return R.ok();
    }
}
