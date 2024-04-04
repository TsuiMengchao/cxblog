package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;


public interface ApiFollowedService {
    /**
     * 关注用户
     * @param userId 关注的用户id
     * @return
     */
    public ResponseResult insertFollowed(String userId);

    /**
     * 关注用户
     * @param userId 关注的用户id
     * @return
     */
    public ResponseResult deleteFollowed(String userId);
}
