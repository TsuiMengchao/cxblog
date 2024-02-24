/*
 *  Copyright 2019-2020 MCX
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package me.mcx.service.impl;

import cn.hutool.extra.mail.Mail;
import cn.hutool.extra.mail.MailAccount;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.common.RedisConstants;
import me.mcx.domain.EmailConfig;
import me.mcx.domain.vo.EmailVo;
import me.mcx.exception.BadRequestException;
import me.mcx.mapper.EmailConfigMapper;
import me.mcx.service.EmailService;
import me.mcx.utils.EncryptUtils;
import me.mcx.utils.SpringContextHolder;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

import static me.mcx.utils.enums.FriendLinkEnum.DOWN;
import static me.mcx.utils.enums.FriendLinkEnum.UP;

/**
 * @author MCX
 * @date 2018-12-26
 */
@Service
@Slf4j
@RequiredArgsConstructor
@CacheConfig(cacheNames = "email")
public class EmailServiceImpl extends ServiceImpl<EmailConfigMapper, EmailConfig> implements EmailService {

    private JavaMailSenderImpl javaMailSender = null;
    private String user;
    private String fromUser;


    public void initial(EmailConfig emailConfig){
        if (javaMailSender != null) return;

        if(emailConfig.getId() == null){
            throw new BadRequestException("请先配置，再操作");
        }

        javaMailSender = new JavaMailSenderImpl();

        javaMailSender.setHost(emailConfig.getHost());
        javaMailSender.setUsername(emailConfig.getFromUser().split("@")[0]);
        try {
            // 对称解密
            javaMailSender.setPassword(EncryptUtils.desDecrypt(emailConfig.getPass()));
        } catch (Exception e) {
            throw new BadRequestException(e.getMessage());
        }
        javaMailSender.setPort(Integer.parseInt(emailConfig.getPort()));
        javaMailSender.setDefaultEncoding("UTF-8");
        Properties p = new Properties();
        p.setProperty("mail.smtp.auth", "true");
        // ssl方式发送
        p.setProperty("mail.smtp.ssl.enable", "true");
        // 使用STARTTLS安全连接
        p.setProperty("mail.smtp.starttls.enable", "true");
        // 解决jdk8之后默认禁用部分tls协议，导致邮件发送失败的问题
        p.setProperty("mail.smtp.ssl.protocols", "TLSv1 TLSv1.1 TLSv1.2");
        p.setProperty("mail.debug", "true");
        javaMailSender.setJavaMailProperties(p);

        user = emailConfig.getUser();
        fromUser = emailConfig.getFromUser();

    }



    @Override
    @CachePut(key = "'config'")
    @Transactional(rollbackFor = Exception.class)
    public EmailConfig config(EmailConfig emailConfig, EmailConfig old) throws Exception {
        emailConfig.setId(1L);
        if(!emailConfig.getPass().equals(old.getPass())){
            // 对称加密
            emailConfig.setPass(EncryptUtils.desEncrypt(emailConfig.getPass()));
        }
        saveOrUpdate(emailConfig);
        return emailConfig;
    }

    @Override
    @Cacheable(key = "'config'")
    public EmailConfig find() {
        EmailConfig emailConfig = getById(1L);
        return emailConfig == null ? new EmailConfig() : emailConfig;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void send(EmailVo emailVo, EmailConfig emailConfig){
        if(emailConfig.getId() == null){
            throw new BadRequestException("请先配置，再操作");
        }
        // 封装
        MailAccount account = new MailAccount();
        // 设置用户
        String user = emailConfig.getFromUser().split("@")[0];
        account.setUser(user);
        account.setHost(emailConfig.getHost());
        account.setPort(Integer.parseInt(emailConfig.getPort()));
        account.setAuth(true);
        try {
            // 对称解密
            account.setPass(EncryptUtils.desDecrypt(emailConfig.getPass()));
        } catch (Exception e) {
            throw new BadRequestException(e.getMessage());
        }
        account.setFrom(emailConfig.getUser()+"<"+emailConfig.getFromUser()+">");
        // ssl方式发送
        account.setSslEnable(true);
        // 使用STARTTLS安全连接
        account.setStarttlsEnable(true);
        // 解决jdk8之后默认禁用部分tls协议，导致邮件发送失败的问题
        account.setSslProtocols("TLSv1 TLSv1.1 TLSv1.2");
        String content = emailVo.getContent();
        // 发送
        try {
            int size = emailVo.getTos().size();
            Mail.create(account)
                    .setTos(emailVo.getTos().toArray(new String[size]))
                    .setTitle(emailVo.getSubject())
                    .setContent(content)
                    .setHtml(true)
                    //关闭session
                    .setUseGlobalSession(false)
                    .send();
        }catch (Exception e){
            throw new BadRequestException(e.getMessage());
        }
    }

    // new


    /**
     * 通知我
     */
    @Override
    @Async("threadPoolTaskExecutor")
    public void emailNoticeMe(String subject,String content) {
        // 构建一个邮件对象
        SimpleMailMessage message = new SimpleMailMessage();
        // 设置邮件主题
        message.setSubject(subject);
        // 设置邮件发送者
        message.setFrom(user+"<"+fromUser+">");
        // 设置邮件接收者，可以有多个接收者，中间用逗号隔开
        message.setTo("484132820@qq.com");
        // 设置邮件发送日期
        message.setSentDate(new Date());
        // 设置邮件的正文
        message.setText(content);
        // 发送邮件
        javaMailSender.send(message);
    }

    /**
     * 友链通过发送通知
     * @param email 邮箱账号
     */
    @Override
    public void friendPassSendEmail(String email){

        String content = "<html>\n" +
                "<body>\n" +
                "    <p>您在"+"<a href='http://辰雪博客.赵浩悦.我爱你'>辰雪博客</a>"+"站点申请友链加入审核通过!!</span>\n" +
                "<p style='padding: 20px;'>感谢您的选择，本站将会竭尽维护好站点稳定，分享高质量的文章，欢迎相互交流互访。</p>" +
                "<p>可前往<a href='http://辰雪博客.赵浩悦.我爱你/links'>本站友链</a>查阅您的站点。</p></body>\n" +
                "</html>";
        try {
            send(email,content);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 友链未通过发送通知
     * @param email 邮箱账号
     * @param reason 原因
     */
    @Override
    public void friendFailedSendEmail(String email,String reason){

        String content = "<html>\n" +
                "<body>\n" +
                "    <p>您在"+"<a href='http://辰雪博客.赵浩悦.我爱你'>辰雪博客</a>"+"站点申请的友链加入审核未通过!具体原因为:"+ reason +"</span>\n" +
                "<p style='padding: 20px;'>感谢您的选择，本站将会竭尽维护好站点稳定，分享高质量的文章，欢迎相互交流互访。</p>" +
                "<p>可前往<a href='http://辰雪博客.赵浩悦.我爱你/links'>本站友链</a>查阅您的站点。</p></body>\n" +
                "</html>";
        try {
            send(email,content);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 发送邮箱验证码
     */
    public int sendCode(String email) throws MessagingException {
        int code = (int) ((Math.random() * 9 + 1) * 100000);
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
                "                <img style=\"padding: 15px 0 15px 30px;width:50px\" src=\"http://七牛云.辰雪博客.赵浩悦.我爱你/9cf1222617fd4fa197991476a53cc883.jpg\">" +
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
                "                <p style=\"text-align: center;line-height:1.75em;\">mcx - <a href='http://辰雪博客.赵浩悦.我爱你' style='text-decoration: none;color:#ff6574'>辰雪博客</a></p>\n" +
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
        send(email,content);
        log.info("邮箱验证码发送成功,邮箱:{},验证码:{}",email,code);
        return code;
    }

    private void send(String email, String template) throws MessagingException {
        if (javaMailSender == null) initial(SpringContextHolder.getBean(EmailService.class).find());


        //创建一个MINE消息
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mineHelper = new MimeMessageHelper(mimeMessage, true);
        // 设置邮件主题
        mineHelper.setSubject("辰雪博客");
        // 设置邮件发送者
        log.info("javaMailSender.getUsername():"+javaMailSender.getUsername());
        log.info("Objects.requireNonNull(javaMailSender.getUsername()):"+Objects.requireNonNull(javaMailSender.getUsername()));
        mineHelper.setFrom(user+"<"+fromUser+">");
        // 设置邮件接收者，可以有多个接收者，中间用逗号隔开
        mineHelper.setTo(email);
        // 设置邮件发送日期
        mineHelper.setSentDate(new Date());
        // 设置邮件的正文
        mineHelper.setText(template,true);
        // 发送邮件
        javaMailSender.send(mimeMessage);
    }
}
