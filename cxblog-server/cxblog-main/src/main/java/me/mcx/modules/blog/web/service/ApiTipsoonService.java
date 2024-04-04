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
     * 收藏说说
     * @param tipsoonId
     * @return
     */
    ResponseResult collect(String tipsoonId);

    /**
     * 说说已读
     * @param tipsoonId
     * @return
     */
    ResponseResult read(String tipsoonId);

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
    /**
     * 圈子内容评论列表
     * @param forumId
     * @return
     */
    ResponseResult commentList(String forumId);
}
