package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;


public interface ApiHomeService {

    /**
     * 添加访问量
     * @return
     */
    public ResponseResult report();

    /**
     * 获取首页数据
     * @return
     */
    public ResponseResult getHomeData();

    /**
     * 获取网站相关信息
     * @return
     */
    public ResponseResult getWebSiteInfo();

    /**
     * 获取各大平台的热搜
     * @param type 平台
     * @return
     */
    public ResponseResult hot(String type);
}
