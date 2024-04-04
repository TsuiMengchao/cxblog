package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Emoji;

public interface ApiEmojiService {

    /**
     * 我的收藏表情列表
     * @return
     */
    public ResponseResult selectEmojiListByUserId();

    /**
     * 收藏表情
     * @param emoji
     * @return
     */
    public ResponseResult addEmoji(Emoji emoji);

    /**
     * 删除表情
     * @param id
     * @return
     */
    public ResponseResult deleteEmoji(Integer id);

    /**
     * 置顶表情
     * @param id
     * @return
     */
    public ResponseResult stickEmoji(Integer id);
}
