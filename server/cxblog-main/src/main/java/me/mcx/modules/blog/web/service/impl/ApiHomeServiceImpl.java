package me.mcx.modules.blog.web.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import me.mcx.common.RedisConstants;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.mapper.ArticleMapper;
import me.mcx.modules.blog.admin.mapper.TagsMapper;
import me.mcx.modules.blog.admin.mapper.WebConfigMapper;
import me.mcx.modules.blog.domain.Tags;
import me.mcx.modules.blog.domain.WebConfig;
import me.mcx.modules.blog.admin.service.RedisService;
import me.mcx.modules.blog.web.service.ApiHomeService;
import me.mcx.utils.IpUtil;
import me.mcx.utils.MyHttpUtil;
import me.mcx.modules.blog.domain.vo.ApiArticleListVO;
import me.mcx.modules.blog.domain.vo.SystemArticleListVO;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;
import java.util.Optional;


@Service
@RequiredArgsConstructor
public class ApiHomeServiceImpl implements ApiHomeService {

    private final RedisService redisService;

    private final WebConfigMapper webConfigMapper;

    private final ArticleMapper articleMapper;

    private final TagsMapper tagsMapper;


    /**
     * 添加访问量
     * @return
     */

    public ResponseResult report() {
        // 获取ip
        String ipAddress = IpUtil.getIp();
        // 通过浏览器解析工具类UserAgent获取访问设备信息
        UserAgent userAgent = IpUtil.getUserAgent(IpUtil.getRequest());
        Browser browser = userAgent.getBrowser();
        OperatingSystem operatingSystem = userAgent.getOperatingSystem();
        // 生成唯一用户标识
        String uuid = ipAddress + browser.getName() + operatingSystem.getName();
        String md5 = DigestUtils.md5DigestAsHex(uuid.getBytes());
        // 判断是否访问
        if (!redisService.sIsMember(RedisConstants.UNIQUE_VISITOR, md5)) {
            // 访客量+1
            redisService.incr(RedisConstants.UNIQUE_VISITOR_COUNT, 1);
            // 保存唯一标识
            redisService.sAdd(RedisConstants.UNIQUE_VISITOR, md5);
        }
        // 访问量+1
        redisService.incr(RedisConstants.BLOG_VIEWS_COUNT, 1);

        return ResponseResult.success(IpUtil.getIp2region(ipAddress));
    }

    /**
     * 获取首页数据
     * @return
     */
    public ResponseResult getHomeData() {

        //获取首页轮播
        List<SystemArticleListVO> articles = articleMapper.selectListByBanner();

        //获取标签云
        List<Tags> tags = tagsMapper.selectList(null);
        //推荐文章
        List<ApiArticleListVO> apiArticleListVOS = articleMapper.selectRecommendArticle();

        return ResponseResult.success().putExtra("articles",articles).putExtra("newArticleList",apiArticleListVOS).putExtra("tagCloud",tags);

    }

    /**
     * 获取网站相关信息
     * @return
     */
    public ResponseResult getWebSiteInfo() {
        //网站信息
        WebConfig webConfig = webConfigMapper.selectOne(new LambdaQueryWrapper<WebConfig>()
                .select(WebConfig::getId,WebConfig::getAuthorAvatar,WebConfig::getIsMusicPlayer,WebConfig::getAuthorInfo,WebConfig::getTouristAvatar,WebConfig::getBulletin,
                        WebConfig::getQqNumber,WebConfig::getGitee,WebConfig::getGithub,WebConfig::getLogo,WebConfig::getWechat,
                        WebConfig::getAboutMe,WebConfig::getEmail,WebConfig::getShowList,WebConfig::getLoginTypeList,
                        WebConfig::getRecordNum,WebConfig::getAuthor,WebConfig::getAliPay,WebConfig::getWeixinPay,
                        WebConfig::getQqGroup,WebConfig::getWebUrl, WebConfig::getSummary,WebConfig::getName,WebConfig::getKeyword));

        //获取访问量
        Object count = redisService.getCacheObject(RedisConstants.BLOG_VIEWS_COUNT);
        //获取访客量
        Long visitorAccess = redisService.getCacheSetKeyNumber(RedisConstants.UNIQUE_VISITOR);
        return ResponseResult.success(webConfig).putExtra("siteAccess", Optional.ofNullable(count).orElse(0))
                .putExtra("visitorAccess",visitorAccess);
    }

    /**
     * 获取各大平台的热搜
     * @param type 平台
     * @return
     */
    @Override
    public ResponseResult hot(String type) {
        String url = "https://www.coderutil.com/api/resou/v1/" + type;
        JSONObject jsonObject = MyHttpUtil.sendCuApiHttpUrl(url);
        return ResponseResult.success(jsonObject);
    }
}
