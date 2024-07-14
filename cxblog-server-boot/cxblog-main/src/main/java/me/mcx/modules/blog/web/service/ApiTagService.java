package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;

public interface ApiTagService {
    /**
     * 获取所有标签
     * @return
     */
    public ResponseResult selectTagList();

}
