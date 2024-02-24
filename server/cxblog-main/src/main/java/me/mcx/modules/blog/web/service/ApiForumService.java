package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Forum;
import me.mcx.modules.blog.domain.ForumComment;

/**
 * @author: 辰雪
 * @date: 2023/10/16
 * @describe:
 */
public interface ApiForumService {
    /**
     * 根据圈子id获取内容
     * @param talkId
     * @return
     */
    ResponseResult selectForumListByTalkId(Integer talkId,String orderBy);

    /**
     * 添加圈子内容
     * @param forum
     * @return
     */
    ResponseResult addForum(Forum forum);

    /**
     * 圈子内容评论
     * @param forumComment
     * @return
     */
    ResponseResult comment(ForumComment forumComment);

    /**
     * 圈子内容评论列表
     * @param forumId
     * @return
     */
    ResponseResult commentList(Integer forumId);

    /**
     * 内容点赞
     * @param forumId
     * @return
     */
    ResponseResult like(Integer forumId);

    /**
     * 内容点赞列表
     * @param forumId
     * @return
     */
    ResponseResult likeList(Integer forumId);
}
