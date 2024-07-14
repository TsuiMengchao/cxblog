package me.mcx.blog.service.web;

import me.mcx.blog.domain.BlogFeedBack;
import me.mcx.common.core.web.domain.AjaxResult;

public interface ApiFeedBackService {
    /**
     * 添加反馈
     * @return
     */
    public AjaxResult addFeedback(BlogFeedBack feedBack);


}
