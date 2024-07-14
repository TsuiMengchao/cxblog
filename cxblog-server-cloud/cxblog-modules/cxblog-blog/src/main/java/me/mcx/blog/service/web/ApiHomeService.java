package me.mcx.blog.service.web;

import me.mcx.common.core.web.domain.AjaxResult;


public interface ApiHomeService {

    /**
     * 添加访问量
     * @return
     */
    public AjaxResult report();

    /**
     * 获取首页数据
     * @return
     */
    public AjaxResult getHomeData();

    /**
     * 获取网站相关信息
     * @return
     */
    public AjaxResult getWebSiteInfo();

    /**
     * 获取各大平台的热搜
     * @param type 平台
     * @return
     */
    public AjaxResult hot(String type);
}
