package me.mcx.blog.service.web;

import me.mcx.blog.domain.BlogFriendLink;
import me.mcx.common.core.web.domain.AjaxResult;

public interface ApiFriendLinkService {
    /**
     * 获取所有友链
     * @return
     */
    AjaxResult selectFriendLinkList();

    /**
     * 用户申请友链
     * @param friendLink
     * @return
     */
    AjaxResult addFriendLink(BlogFriendLink friendLink);


}
