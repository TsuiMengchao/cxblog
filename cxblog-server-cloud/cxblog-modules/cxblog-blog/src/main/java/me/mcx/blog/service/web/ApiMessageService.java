package me.mcx.blog.service.web;

import me.mcx.blog.domain.BlogMessage;
import me.mcx.common.core.web.domain.AjaxResult;

public interface ApiMessageService {

    /**
     * 获取所有留言
     * @return
     */
    AjaxResult selectMessageList();

    /**
     * 添加留言
     * @param message
     * @return
     */
    AjaxResult addMessage(BlogMessage message);
}
