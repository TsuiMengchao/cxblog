package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Say;
import me.mcx.modules.blog.domain.SayComment;

public interface ApiSayService {


    /**
     * 说说列表
     * @return
     */
    ResponseResult selectSayList();

    /**
     * 点赞说说
     * @param sayId
     * @return
     */
    ResponseResult like(String sayId);

    /**
     * 评论说说
     * @param sayComment
     * @return
     */
    ResponseResult comment(SayComment sayComment);

    /**
     * 添加说说说
     * @param say
     * @return
     */
    ResponseResult insertSay(Say say);

}
