package me.mcx.modules.blog.web.service;


import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Message;

public interface ApiMessageService {

    /**
     * 获取所有留言
     * @return
     */
    ResponseResult selectMessageList();

    /**
     * 添加留言
     * @param message
     * @return
     */
    ResponseResult insertMessage(Message message);
}
