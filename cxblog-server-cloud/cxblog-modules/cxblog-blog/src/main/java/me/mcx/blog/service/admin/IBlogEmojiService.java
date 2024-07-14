package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogEmoji;

/**
 * 情Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogEmojiService 
{
    /**
     * 查询情
     * 
     * @param id 情主键
     * @return 情
     */
    public BlogEmoji selectBlogEmojiById(Long id);

    /**
     * 查询情列表
     * 
     * @param blogEmoji 情
     * @return 情集合
     */
    public List<BlogEmoji> selectBlogEmojiList(BlogEmoji blogEmoji);

    /**
     * 新增情
     * 
     * @param blogEmoji 情
     * @return 结果
     */
    public int insertBlogEmoji(BlogEmoji blogEmoji);

    /**
     * 修改情
     * 
     * @param blogEmoji 情
     * @return 结果
     */
    public int updateBlogEmoji(BlogEmoji blogEmoji);

    /**
     * 批量删除情
     * 
     * @param ids 需要删除的情主键集合
     * @return 结果
     */
    public int deleteBlogEmojiByIds(Long[] ids);

    /**
     * 删除情信息
     * 
     * @param id 情主键
     * @return 结果
     */
    public int deleteBlogEmojiById(Long id);
}
