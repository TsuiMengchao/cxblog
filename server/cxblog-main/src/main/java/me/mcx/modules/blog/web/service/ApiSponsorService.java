package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;

/**
 *  打赏服务类
 *
 * @author MCX
 * @since 2021-11-10
 */
public interface ApiSponsorService {

    /**
     * 记录列表
     * @return
     */
    ResponseResult selectSponsorList();



    /**
     * 添加记录
     * @param payImage 支付截图
     * @return
     */
    ResponseResult addSponsor(String payImage);



}
