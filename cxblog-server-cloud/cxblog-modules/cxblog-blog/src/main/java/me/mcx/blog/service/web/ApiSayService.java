package me.mcx.blog.service.web;

import me.mcx.blog.domain.BlogSay;
import me.mcx.blog.domain.BlogSayComment;
import me.mcx.blog.domain.vo.say.ApiSayVO;
import me.mcx.common.core.web.domain.AjaxResult;

import java.util.List;

public interface ApiSayService {


    /**
     * 说说列表
     * @return
     */
    List<ApiSayVO> selectSayList();

    /**
     * 点赞说说
     * @param sayId
     * @return
     */
    AjaxResult like(String sayId);

    /**
     * 评论说说
     * @param sayComment
     * @return
     */
    AjaxResult comment(BlogSayComment sayComment);

    /**
     * 添加说说说
     * @param say
     * @return
     */
    AjaxResult insertSay(BlogSay say);

}
