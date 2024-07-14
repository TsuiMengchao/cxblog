package me.mcx.blog.service.web.impl;


import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.BlogTags;
import me.mcx.blog.domain.BlogWebConfig;
import me.mcx.blog.mapper.BlogArticleMapper;
import me.mcx.blog.mapper.BlogTagsMapper;
import me.mcx.blog.mapper.BlogWebConfigMapper;
import me.mcx.blog.service.web.ApiHomeService;
import me.mcx.blog.service.common.RedisService;
import me.mcx.blog.util.CustomHttpUtil;
import me.mcx.common.core.constant.RedisConstants;
import me.mcx.common.core.utils.ip.IpUtils;
import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import me.mcx.blog.domain.vo.article.SystemArticleListVO;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;
import java.util.Optional;


@Service
@Slf4j
public class ApiHomeServiceImpl implements ApiHomeService {

    @Autowired
    private RedisService redisService;

    @Autowired
    private BlogWebConfigMapper webConfigMapper;

    @Autowired
    private BlogArticleMapper articleMapper;

    @Autowired
    private BlogTagsMapper tagsMapper;


    /**
     * 添加访问量
     * @return
     */

    public AjaxResult report() {
        // 获取ip
        String ipAddress = IpUtils.getIpAddr();
        String browser = IpUtils.getHostName();
        // 生成唯一用户标识
        String uuid = ipAddress + browser;
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

        return AjaxResult.success(ipAddress);
    }

    /**
     * 获取首页数据
     * @return
     */
    public AjaxResult getHomeData() {

        //获取首页轮播
        List<SystemArticleListVO> articles = articleMapper.selectListByBanner();

        //获取标签云
        List<BlogTags> tags = tagsMapper.selectBlogTagsList(null);
        //推荐文章
        List<ApiArticleListVO> apiArticleListVOS = articleMapper.selectRecommendArticle();

        return AjaxResult.success().put("articles",articles).put("newArticleList",apiArticleListVOS).put("tagCloud",tags);

    }

    /**
     * 获取网站相关信息
     * @return
     */
    public AjaxResult getWebSiteInfo() {
        //网站信息
        BlogWebConfig webConfig = webConfigMapper.selectBlogWebConfigById(1L);

        //获取访问量
        Object count = redisService.getCacheObject(RedisConstants.BLOG_VIEWS_COUNT);
        //获取访客量
        Long visitorAccess = redisService.getCacheSetKeyNumber(RedisConstants.UNIQUE_VISITOR);
        return AjaxResult.success(webConfig).put("siteAccess", Optional.ofNullable(count).orElse(0))
                .put("visitorAccess",visitorAccess);
    }

    /**
     * 获取各大平台的热搜
     * @param type 平台
     * @return
     */
    @Override
    public AjaxResult hot(String type) {
        String url = "https://www.coderutil.com/api/resou/v1/" + type;
        JSONObject jsonObject = CustomHttpUtil.sendCuApiHttpUrl(url);
        return AjaxResult.success(jsonObject);
    }
}
