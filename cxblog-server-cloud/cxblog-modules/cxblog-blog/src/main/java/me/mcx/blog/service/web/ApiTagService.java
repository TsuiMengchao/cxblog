package me.mcx.blog.service.web;

import me.mcx.common.core.web.domain.AjaxResult;

public interface ApiTagService {
    /**
     * 获取所有标签
     * @return
     */
    public AjaxResult selectTagList();

}
