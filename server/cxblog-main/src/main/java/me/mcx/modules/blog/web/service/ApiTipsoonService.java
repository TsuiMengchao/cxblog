package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Tipsoon;
import me.mcx.modules.blog.domain.TipsoonComment;

public interface ApiTipsoonService {


    /**
     * 说说列表
     * @return
     */
    ResponseResult selectTipsoon();

    ResponseResult select10Tipsoon();

    ResponseResult selectTipsoonById(String tipsoonId);

    /**
     * 点赞说说
     * @param tipsoonId
     * @return
     */
    ResponseResult like(String tipsoonId);

    /**
     * 评论说说
     * @param tipsoonComment
     * @return
     */
    ResponseResult comment(TipsoonComment tipsoonComment);

    /**
     * 添加说说说
     * @param tipsoon
     * @return
     */
    ResponseResult insertTipsoon(Tipsoon tipsoon);

}
