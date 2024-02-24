package me.mcx.modules.blog.web.service.impl;

import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.StpUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import me.mcx.common.RedisConstants;
import me.mcx.common.ResponseResult;
import me.mcx.common.ResultCode;
import me.mcx.exception.EntityExistException;
import me.mcx.modules.blog.admin.mapper.ArticleMapper;
import me.mcx.modules.blog.admin.mapper.CollectMapper;
import me.mcx.modules.blog.admin.mapper.FollowedMapper;
import me.mcx.modules.blog.admin.mapper.UserInfoMapper;
import me.mcx.modules.blog.domain.*;
import me.mcx.modules.blog.domain.dto.EmailForgetPasswordDTO;
import me.mcx.modules.blog.domain.dto.EmailLoginDTO;
import me.mcx.modules.blog.domain.dto.EmailRegisterDTO;
import me.mcx.modules.blog.domain.dto.UserInfoDTO;
import me.mcx.modules.security.config.bean.LoginProperties;
import me.mcx.modules.security.config.bean.SecurityProperties;
import me.mcx.modules.security.security.TokenProvider;
import me.mcx.modules.security.service.OnlineUserService;
import me.mcx.modules.security.service.dto.JwtUserDto;
import me.mcx.modules.system.domain.Dept;
import me.mcx.modules.system.domain.Job;
import me.mcx.modules.system.domain.Role;
import me.mcx.modules.system.domain.User;
import me.mcx.modules.blog.admin.service.RedisService;
import me.mcx.modules.system.mapper.UserMapper;
import me.mcx.modules.system.service.UserService;
import me.mcx.service.EmailService;
import me.mcx.utils.enums.LoginTypeEnum;
import me.mcx.utils.enums.UserStatusEnum;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.web.service.ApiUserService;
import me.mcx.utils.*;
import me.mcx.modules.blog.domain.vo.UserInfoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.zhyd.oauth.model.AuthResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Slf4j
@Service
@RequiredArgsConstructor
public class ApiUserServiceImpl implements ApiUserService {

    private final UserMapper userMapper;

    private final ArticleMapper articleMapper;

    private final CollectMapper collectMapper;

    private final RedisService redisService;

    private final UserInfoMapper userInfoMapper;

    private final FollowedMapper followedMapper;

    private final EmailService emailService;

    private final PasswordEncoder passwordEncoder;

    private final UserService userService;

    private final AuthenticationManagerBuilder authenticationManagerBuilder;
    private final TokenProvider tokenProvider;
    private final SecurityProperties properties;
    private final OnlineUserService onlineUserService;

    private final UserDetailsService userDetailsService;

    @Value("${oauth_callback_url}")
    private String callback_url;

    private final String[] userAvatarList = {"http://七牛云.辰雪博客.赵浩悦.我爱你/avatars/buxie.png","http://七牛云.辰雪博客.赵浩悦.我爱你/avatars/daizhi.png",
            "http://七牛云.辰雪博客.赵浩悦.我爱你/avatars/fennu.png","http://七牛云.辰雪博客.赵浩悦.我爱你/avatars/jingxi.png","http://七牛云.辰雪博客.赵浩悦.我爱你/avatars/kaixin.png",
            "http://七牛云.辰雪博客.赵浩悦.我爱你/avatars/shuanshuai.png"};

    @Resource
    private LoginProperties loginProperties;
    /**
     * 邮箱登录
     *
     * @param vo
     * @return
     */
    @Override
    public ResponseResult emailLogin(EmailLoginDTO vo, HttpServletRequest request) throws Exception {

        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(vo.getUsername(), vo.getPassword());
        Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        // 生成令牌与第三方系统获取令牌方式
        // UserDetails userDetails = userDetailsService.loadUserByUsername(userInfo.getUsername());
        // Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        // SecurityContextHolder.getContext().setAuthentication(authentication);
        String token = tokenProvider.createToken(authentication);
        final JwtUserDto jwtUserDto = (JwtUserDto) authentication.getPrincipal();
        String finalToken = properties.getTokenStartWith() + token;
        if (loginProperties.isSingleLogin()) {
            // 踢掉之前已经登录的token
            onlineUserService.kickOutForUsername(vo.getUsername());
        }
        // 保存在线信息
        onlineUserService.save(jwtUserDto, token, request);
        User user = userMapper.selectName(vo.getUsername());

        UserInfo userInfo = userInfoMapper.selectById(user.getUserInfoId());

        //组装数据
        UserInfoVO userInfoVO = UserInfoVO.builder()
                .id(String.valueOf(jwtUserDto.getUser().getId()))
                .avatar(userInfo.getAvatar()).nickname(userInfo.getNickname())
                .intro(userInfo.getIntro()).webSite(userInfo.getWebSite()).email(jwtUserDto.getUser().getEmail())
                .loginType(user.getLoginType()).bjCover(userInfo.getBjCover()).token(finalToken).build();

        return ResponseResult.success(userInfoVO);
    }

    /**
     * 判断用户是否微信登录成功
     *
     * @param loginCode 用户临时id
     * @return
     */
    @Override
    public ResponseResult wxIsLogin(String loginCode) {
        UserInfoVO user = (UserInfoVO) redisService.getCacheObject(RedisConstants.WX_LOGIN_USER + loginCode);
        if (user == null) {
            return ResponseResult.error("用户未被授权");
        }
        StpUtil.login(user.getId(), new SaLoginModel().setDevice("PC").setTimeout(60 * 60 * 24 * 7));
        user.setToken(StpUtil.getTokenValue());
        return ResponseResult.success(user);
    }

    /**
     * 微信扫码公众号登录
     * @param message
     * @return
     */
    @Override
    public String wechatLogin(WxMpXmlMessage message) {
        String content = message.getContent().toUpperCase();
        //先判断登录码是否已过期
        boolean loginFlag = redisService.hasKey(RedisConstants.WX_LOGIN_USER_STATUE + content);
        if (!loginFlag) {
            return "验证码已过期";
        }
        UserInfoVO userInfoVO = userMapper.selectByUserName(message.getFromUser());
        if (userInfoVO == null) {
            String ip = IpUtil.getIp();
            String ipSource = IpUtil.getIp2region(ip);

            // 保存用户信息
            UserInfo userInfo = UserInfo.builder()
                    .nickname("WECHAT-" + RandomUtils.generationCapital(6))
                    .avatar(userAvatarList[RandomUtils.generationNumber(userAvatarList.length)])
                    .build();
            userInfoMapper.insert(userInfo);
            // 保存账号信息
            User user = User.builder()
                    .userInfoId(userInfo.getId())
                    .username(message.getFromUser())
                    .password(AesEncryptUtils.aesEncrypt(message.getFromUser()))
                    .loginType(LoginTypeEnum.WECHAT.getType())
                    .lastLoginTime(DateUtil.getNowDate())
                    .ipAddress(ip)
                    .ipSource(ipSource)
                    .build();
            userMapper.insert(user);
            //组装返回信息
            userInfoVO = UserInfoVO.builder().id(String.valueOf(user.getId())).loginType(user.getLoginType())
                    .avatar(userInfo.getAvatar()).email(userInfo.getEmail()).nickname(userInfo.getNickname())
                    .intro(userInfo.getIntro()).webSite(userInfo.getWebSite()).build();
        }


        //修改redis缓存 以便监听是否已经授权成功
        redisService.setCacheObject(RedisConstants.WX_LOGIN_USER + content, userInfoVO, 60, TimeUnit.SECONDS);
        return "网站登录成功！(若页面长时间未跳转请刷新验证码)";
    }

    /**
     * 获取微信公众号登录验证码
     *
     * @return
     */
    @Override
    public ResponseResult getWechatLoginCode() {
        String code = "DL" + RandomUtils.generationNumberChar(4);
        redisService.setCacheObject(RedisConstants.WX_LOGIN_USER_STATUE + code, false, 60, TimeUnit.SECONDS);
        return ResponseResult.success(code);
    }

    /**
     * 获取用户信息
     *
     * @return
     */
    @Override
    public ResponseResult selectUserInfo(String userId) {
        userId = StringUtils.isNotBlank(userId) ? userId : String.valueOf(SecurityUtils.getCurrentUserId());
        UserInfoVO userInfo = userInfoMapper.selectUserInfoByUserId(userId);
        return ResponseResult.success(userInfo);
    }

    /**
     * 修改用户信息
     *
     * @param vo
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateUser(UserInfoDTO vo) {
        UserInfo userInfo = BeanCopyUtils.copyObject(vo, UserInfo.class);
        userInfo.setId(vo.getUserInfoId());
        int update = userInfoMapper.updateById(userInfo);
        return ResponseResult.success("修改信息成功");
    }

    /**
     * 根据token获取用户信息
     *
     * @return
     */
    @Override
    public ResponseResult selectUserInfoByToken() {
        Object userId = SecurityUtils.getCurrentUserId();
        UserInfoVO userInfoVO = userMapper.selectInfoByUserIdNew(userId);
        return ResponseResult.success(userInfoVO);
    }

    /**
     * 第三方登录授权之后的逻辑
     *
     * @param response
     * @param source
     * @param httpServletResponse
     * @throws IOException
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void authLogin(AuthResponse response, String source, HttpServletResponse httpServletResponse, HttpServletRequest request) throws IOException {
        String result = com.alibaba.fastjson.JSONObject.toJSONString(response.getData());
        log.info("第三方登录验证结果:{}", result);

        com.alibaba.fastjson.JSONObject jsonObject = JSON.parseObject(result);
        Object uuid = jsonObject.get("uuid");
        // 获取用户ip信息
        String ipAddress = IpUtil.getIp();
        String ipSource = IpUtil.getIp2region(ipAddress);
        // 判断是否已注册
        User user =null;
        switch (source) {
            case "qq":
                user = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getQq_id, uuid));
                break;
            case "weibo":
                user = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getWeibo_id, uuid));
                break;
            case "gitee":
                user = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getGitee_id, uuid));
                break;
            case "github":
                user = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getGithub_id, uuid));
                break;
            default:
                throw new BusinessException("未知授权方");
    }

        if (Objects.nonNull(user)) {
            // 更新登录信息
            userMapper.update(new User(), new LambdaUpdateWrapper<User>()
                    .set(User::getLastLoginTime, LocalDateTime.now())
                    .set(User::getIpAddress, ipAddress)
                    .set(User::getIpSource, ipSource)
                    .eq(User::getId, user.getId()));
        } else {
            // 获取第三方用户信息，保存到数据库返回
            // 保存用户信息
            UserInfo userInfo = UserInfo.builder()
                    .nickname(source.equals("github") ? jsonObject.get("username").toString() : jsonObject.get("nickname").toString())
                    .avatar(jsonObject.get("avatar").toString())
                    .build();
            userInfoMapper.insert(userInfo);
            // 保存账号信息

            user = User.builder()
                    .userInfoId(userInfo.getId())
                    .username(source+uuid.toString())
                    .password(passwordEncoder.encode("123456"))
                    .nickName(source.equals("github") ? jsonObject.get("username").toString() : jsonObject.get("nickname").toString())
                    .loginType(LoginTypeEnum.getType(source))
                    .lastLoginTime(me.mcx.utils.DateUtil.getNowDate())
                    .ipAddress(ipAddress)
                    .ipSource(ipSource)
                    .enabled(UserStatusEnum.normal.getCode() == 1)
                    .dept(new Dept() {{setId(18L);}})
                    .jobs(new HashSet<Job>() {{add(new Job() {{setId(13L);}});}})
                    .roles(new HashSet<Role>() {{add(new Role() {{setId(2L);}});}})
                    .build();

            switch (source) {
                case "qq":
                    user.setQq_id(uuid.toString());
                    break;
                case "weibo":
                    user.setWeibo_id(uuid.toString());
                    break;
                case "gitee":
                    user.setGitee_id(uuid.toString());
                    break;
                case "github":
                    user.setGithub_id(uuid.toString());
                    break;
                default:
                    throw new BusinessException("未知授权方");
            }
            userService.create(user);
            user = userService.findByName(source+uuid.toString());
        }

        // 生成令牌与第三方系统获取令牌方式
         UserDetails userDetails = userDetailsService.loadUserByUsername(user.getUsername());
         Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
         SecurityContextHolder.getContext().setAuthentication(authentication);
        String token = tokenProvider.createToken(authentication);
        final JwtUserDto jwtUserDto = (JwtUserDto) authentication.getPrincipal();

        if (loginProperties.isSingleLogin()) {
            // 踢掉之前已经登录的token
            onlineUserService.kickOutForUsername(user.getUsername());
        }
        // 保存在线信息
        onlineUserService.save(jwtUserDto, token, request);

        httpServletResponse.sendRedirect(callback_url+"?token=" + token);
    }

    @Override
    public ResponseResult sendEmailCode(String email) {
        try {
            int code = emailService.sendCode(email);
            redisService.setCacheObject(RedisConstants.EMAIL_CODE+ email, code +"");
            redisService.expire(RedisConstants.EMAIL_CODE+ email,RedisConstants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
            return ResponseResult.success();
        } catch (MessagingException e) {
            throw new BusinessException("发送邮件失败");
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult emailRegister(EmailRegisterDTO emailRegisterDTO) {
        //校验邮箱验证码
        boolean b = redisService.hasKey(RedisConstants.EMAIL_CODE + emailRegisterDTO.getEmail());
        if (!b) {
            throw new BusinessException(ResultCode.ERROR_EXCEPTION_MOBILE_CODE);
        }
        if (userMapper.findByUsername(emailRegisterDTO.getUsername()) != null) {
            throw new EntityExistException(User.class, "username", emailRegisterDTO.getUsername());
        }
        if (userMapper.findByEmail(emailRegisterDTO.getEmail()) != null) {
            throw new EntityExistException(User.class, "email", emailRegisterDTO.getEmail());
        }
        // 保存用户信息
        UserInfo userInfo = UserInfo.builder()
                .nickname(emailRegisterDTO.getNickname())
                .email(emailRegisterDTO.getEmail())
                .build();
        userInfoMapper.insert(userInfo);
        // 保存账号信息
        User user = User.builder()
                .userInfoId(userInfo.getId())
                .username(emailRegisterDTO.getUsername())
                .nickName(emailRegisterDTO.getNickname())
                .password(passwordEncoder.encode(emailRegisterDTO.getPassword()))
                .email(emailRegisterDTO.getEmail())
                .loginType(LoginTypeEnum.getType("email"))
                .enabled(UserStatusEnum.normal.getCode() == 1)
                .dept(new Dept() {{setId(18L);}})
                .jobs(new HashSet<Job>() {{add(new Job() {{setId(13L);}});}})
                .roles(new HashSet<Role>() {{add(new Role() {{setId(2L);}});}})
                .build();
        userService.create(user);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult forgetPassword(EmailForgetPasswordDTO emailForgetPasswordDTO) {
        //校验邮箱验证码
        boolean b = redisService.hasKey(RedisConstants.EMAIL_CODE + emailForgetPasswordDTO.getEmail());
        if (!b) {
            throw new BusinessException(ResultCode.ERROR_EXCEPTION_MOBILE_CODE);
        }
        User user = userMapper.findByEmail(emailForgetPasswordDTO.getEmail());
        userService.updatePass(user.getUsername(),passwordEncoder.encode(emailForgetPasswordDTO.getPassword()));
        return ResponseResult.success();
    }

    @Override
    public ResponseResult getUserCount(String id) {
        id = StringUtils.isBlank(id) ? String.valueOf(SecurityUtils.getCurrentUserId()) : id;
        Integer articleCount = Math.toIntExact(articleMapper.selectCount(new LambdaQueryWrapper<Article>().eq(Article::getUserId, id)));
        Integer collectCount = Math.toIntExact(collectMapper.selectCount(new LambdaQueryWrapper<Collect>().eq(Collect::getUserId, id)));
        Integer followedCount = Math.toIntExact(followedMapper.selectCount(new LambdaQueryWrapper<Followed>().eq(Followed::getUserId, id)));
        return ResponseResult.success().putExtra("articleCount", articleCount).putExtra("collectCount", collectCount)
                .putExtra("followedCount", followedCount);
    }

    @Override
    public void logout(HttpServletRequest request) {
        String token = tokenProvider.getToken(request);
        log.info(token);
        onlineUserService.logout(tokenProvider.getToken(request));
    }

}
