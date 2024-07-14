package me.mcx.auth.service;

import lombok.extern.slf4j.Slf4j;
import me.mcx.auth.form.RegisterBody;
import me.mcx.common.core.constant.*;
import me.mcx.msg.api.domain.MsgEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import me.mcx.common.core.domain.R;
import me.mcx.common.core.enums.UserStatus;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.text.Convert;
import me.mcx.common.core.utils.StringUtils;
import me.mcx.common.core.utils.ip.IpUtils;
import me.mcx.common.redis.service.RedisService;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.system.api.RemoteUserService;
import me.mcx.system.api.domain.SysUser;
import me.mcx.system.api.model.LoginUser;
import me.mcx.msg.api.RemoteEmailService;

import java.util.concurrent.TimeUnit;

/**
 * 登录校验方法
 * 
 * @author cxblog
 */
@Component
@Slf4j
public class SysLoginService
{
    @Autowired
    private RemoteUserService remoteUserService;

    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private SysRecordLogService recordLogService;

    @Autowired
    private RemoteEmailService emailService;

    @Autowired
    private RedisService redisService;

    /**
     * 登录
     */
    public LoginUser login(String username, String password)
    {
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password))
        {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户/密码必须填写");
            throw new ServiceException("用户/密码必须填写");
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户密码不在指定范围");
            throw new ServiceException("用户密码不在指定范围");
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户名不在指定范围");
            throw new ServiceException("用户名不在指定范围");
        }
        // IP黑名单校验
        String blackStr = Convert.toStr(redisService.getCacheObject(CacheConstants.SYS_LOGIN_BLACKIPLIST));
        if (IpUtils.isMatchedIp(blackStr, IpUtils.getIpAddr()))
        {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "很遗憾，访问IP已被列入系统黑名单");
            throw new ServiceException("很遗憾，访问IP已被列入系统黑名单");
        }
        // 查询用户信息
        R<LoginUser> userResult = remoteUserService.getUserInfo(username, SecurityConstants.INNER);

        if (StringUtils.isNull(userResult) || StringUtils.isNull(userResult.getData()))
        {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "登录用户不存在");
            throw new ServiceException("登录用户：" + username + " 不存在");
        }

        if (R.FAIL == userResult.getCode())
        {
            throw new ServiceException(userResult.getMsg());
        }
        
        LoginUser userInfo = userResult.getData();
        SysUser user = userResult.getData().getSysUser();
        if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
        {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "对不起，您的账号已被删除");
            throw new ServiceException("对不起，您的账号：" + username + " 已被删除");
        }
        if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            recordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户已停用，请联系管理员");
            throw new ServiceException("对不起，您的账号：" + username + " 已停用");
        }
        passwordService.validate(user, password);
        recordLogService.recordLogininfor(username, Constants.LOGIN_SUCCESS, "登录成功");
        return userInfo;
    }

    public void logout(String loginName)
    {
        recordLogService.recordLogininfor(loginName, Constants.LOGOUT, "退出成功");
    }

    /**
     * 注册
     */
    public void register(RegisterBody form)
    {
        //校验邮箱验证码
        if (StringUtils.isNotEmpty(form.getEmail())) {
            boolean b = redisService.hasKey(RedisConstants.EMAIL_CODE + form.getEmail());
            if (!b) {
                throw new ServiceException("验证码不正确或已过期，请重新输入");
            }
        }

        //校验邮箱验证码
        if (StringUtils.isNotEmpty(form.getPhone())) {
            boolean b = redisService.hasKey(RedisConstants.PHONE_CODE + form.getPhone());
            if (!b) {
                throw new ServiceException("验证码不正确或已过期，请重新输入");
            }
        }

        String username = form.getUsername();
        String password = form.getPassword();
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password))
        {
            throw new ServiceException("用户/密码必须填写");
        }
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            throw new ServiceException("账户长度必须在2到20个字符之间");
        }
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            throw new ServiceException("密码长度必须在5到20个字符之间");
        }

        // 注册用户信息
        SysUser sysUser = new SysUser();
        sysUser.setUserName(username);
        sysUser.setNickName(form.getNickname());
        sysUser.setPassword(SecurityUtils.encryptPassword(password));
        sysUser.setEmail(form.getEmail());
        sysUser.setPhonenumber(form.getPhone());
        R<?> registerResult = remoteUserService.registerUserInfo(sysUser, SecurityConstants.INNER);

        if (R.FAIL == registerResult.getCode())
        {
            throw new ServiceException(registerResult.getMsg());
        }
        recordLogService.recordLogininfor(username, Constants.REGISTER, "注册成功");
    }

    public void sendEmailCode(String email) {
        try {
            int code = (int) ((Math.random() * 9 + 1) * 100000);
            String subject = code+" 是你的 辰雪博客 验证码";
            String content = "<html>\n" +
                    "\t<body><div id=\"contentDiv\" onmouseover=\"getTop().stopPropagation(event);\" onclick=\"getTop().preSwapLink(event, 'html', 'ZC0004_vDfNJayMtMUuKGIAzzsWvc8');\" style=\"position:relative;font-size:14px;height:auto;padding:15px 15px 10px 15px;z-index:1;zoom:1;line-height:1.7;\" class=\"body\">\n" +
                    "  <div id=\"qm_con_body\">\n" +
                    "    <div id=\"mailContentContainer\" class=\"qmbox qm_con_body_content qqmail_webmail_only\" style=\"opacity: 1;\">\n" +
                    "      <style type=\"text/css\">\n" +
                    "        .qmbox h1,.qmbox \t\t\th2,.qmbox \t\t\th3 {\t\t\t\tcolor: #00785a;\t\t\t}\t\t\t.qmbox p {\t\t\t\tpadding: 0;\t\t\t\tmargin: 0;\t\t\t\tcolor: #333;\t\t\t\tfont-size: 16px;\t\t\t}\t\t\t.qmbox hr {\t\t\t\tbackground-color: #d9d9d9;\t\t\t\tborder: none;\t\t\t\theight: 1px;\t\t\t}\t\t\t.qmbox .eo-link {\t\t\t\tcolor: #0576b9;\t\t\t\ttext-decoration: none;\t\t\t\tcursor: pointer;\t\t\t}\t\t\t.qmbox .eo-link:hover {\t\t\t\tcolor: #3498db;\t\t\t}\t\t\t.qmbox .eo-link:hover {\t\t\t\ttext-decoration: underline;\t\t\t}\t\t\t.qmbox .eo-p-link {\t\t\t\tdisplay: block;\t\t\t\tmargin-top: 20px;\t\t\t\tcolor: #009cff;\t\t\t\ttext-decoration: underline;\t\t\t}\t\t\t.qmbox .p-intro {\t\t\t\tpadding: 30px;\t\t\t}\t\t\t.qmbox .p-code {\t\t\t\tpadding: 0 30px 0 30px;\t\t\t}\t\t\t.qmbox .p-news {\t\t\t\tpadding: 0px 30px 30px 30px;\t\t\t}\n" +
                    "      </style>\n" +
                    "      <div style=\"max-width:800px;padding-bottom:10px;margin:20px auto 0 auto;\">\n" +
                    "        <table cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #fff;border-collapse: collapse; border:1px solid #e5e5e5;box-shadow: 0 10px 15px rgba(0, 0, 0, 0.05);text-align: left;width: 100%;font-size: 14px;border-spacing: 0;\">\n" +
                    "          <tbody>\n" +
                    "            <tr style=\"background-color: #f8f8f8;\">\n" +
                    "              <td>\n" +
                    "                <img style=\"padding: 15px 0 15px 30px;width:50px\" src=\"https://cxblog.qiniu.zhaohaoyue.love/web/9cf1222617fd4fa197991476a53cc883.jpg\">" +
                    "                <span>辰雪博客. </span>\n" +
                    "              </td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "              <td class=\"p-intro\">\n" +
                    "                <h1 style=\"font-size: 26px; font-weight: bold;\">验证您的邮箱地址</h1>\n" +
                    "                <p style=\"line-height:1.75em;\">感谢您使用 辰雪博客. </p>\n" +
                    "                <p style=\"line-height:1.75em;\">以下是您的邮箱验证码，请将它输入到 辰雪博客 的邮箱验证码输入框中:</p>\n" +
                    "              </td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "              <td class=\"p-code\">\n" +
                    "                <p style=\"color: #253858;text-align:center;line-height:1.75em;background-color: #f2f2f2;min-width: 200px;margin: 0 auto;font-size: 28px;border-radius: 5px;border: 1px solid #d9d9d9;font-weight: bold;\">"+code+"</p>\n" +
                    "              </td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "              <td class=\"p-intro\">\n" +
                    "                <p style=\"line-height:1.75em;\">这一封邮件包括一些您的私密的 辰雪博客 账号信息，请不要回复或转发它，以免带来不必要的信息泄露风险。 </p>\n" +
                    "              </td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "              <td class=\"p-intro\">\n" +
                    "                <hr>\n" +
                    "                <p style=\"text-align: center;line-height:1.75em;\">mcx - <a href='https://cxblog.zhaohaoyue.love' style='text-decoration: none;color:#ff6574'>辰雪博客</a></p>\n" +
                    "              </td>\n" +
                    "            </tr>\n" +
                    "          </tbody>\n" +
                    "        </table>\n" +
                    "      </div>\n" +
                    "      <style type=\"text/css\">\n" +
                    "        .qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {display: none !important;}\n" +
                    "      </style>\n" +
                    "    </div>\n" +
                    "  </div><!-- -->\n" +
                    "  <style>\n" +
                    "    #mailContentContainer .txt {height:auto;}\n" +
                    "  </style>\n" +
                    "</div></body>\n" +
                    "</html>\n";

            redisService.setCacheObject(RedisConstants.EMAIL_CODE+ email, code +"");
            redisService.expire(RedisConstants.EMAIL_CODE+ email,RedisConstants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
            MsgEmail msgEmail = new MsgEmail() {{
                setTos(email);
                setContent(content);
                setSubject(subject);
            }};
            R<?> sendCodeResult = emailService.send(msgEmail);
            if (R.FAIL == sendCodeResult.getCode())
            {
                throw new ServiceException(sendCodeResult.getMsg());
            }
            recordLogService.recordLogininfor(email, Constants.EMAIL_CODE, "发送邮件验证码成功");
        } catch (Exception e) {
            throw new ServiceException("发送邮件失败");
        }
    }
}
