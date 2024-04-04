package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.FeedBack;

public interface ApiFeedBackService {
    /**
     * 添加反馈
     * @return
     */
    public ResponseResult insertFeedback(FeedBack feedBack);


}
