package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogEmojiMapper;
import me.mcx.blog.domain.BlogEmoji;
import me.mcx.blog.service.admin.IBlogEmojiService;

/**
 * 情Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogEmojiServiceImpl implements IBlogEmojiService 
{
    @Autowired
    private BlogEmojiMapper blogEmojiMapper;

    /**
     * 查询情
     * 
     * @param id 情主键
     * @return 情
     */
    @Override
    public BlogEmoji selectBlogEmojiById(Long id)
    {
        return blogEmojiMapper.selectBlogEmojiById(id);
    }

    /**
     * 查询情列表
     * 
     * @param blogEmoji 情
     * @return 情
     */
    @Override
    public List<BlogEmoji> selectBlogEmojiList(BlogEmoji blogEmoji)
    {
        return blogEmojiMapper.selectBlogEmojiList(blogEmoji);
    }

    /**
     * 新增情
     * 
     * @param blogEmoji 情
     * @return 结果
     */
    @Override
    public int insertBlogEmoji(BlogEmoji blogEmoji)
    {
        blogEmoji.setCreateTime(DateUtils.getNowDate());
        return blogEmojiMapper.insertBlogEmoji(blogEmoji);
    }

    /**
     * 修改情
     * 
     * @param blogEmoji 情
     * @return 结果
     */
    @Override
    public int updateBlogEmoji(BlogEmoji blogEmoji)
    {
        blogEmoji.setUpdateTime(DateUtils.getNowDate());
        return blogEmojiMapper.updateBlogEmoji(blogEmoji);
    }

    /**
     * 批量删除情
     * 
     * @param ids 需要删除的情主键
     * @return 结果
     */
    @Override
    public int deleteBlogEmojiByIds(Long[] ids)
    {
        return blogEmojiMapper.deleteBlogEmojiByIds(ids);
    }

    /**
     * 删除情信息
     * 
     * @param id 情主键
     * @return 结果
     */
    @Override
    public int deleteBlogEmojiById(Long id)
    {
        return blogEmojiMapper.deleteBlogEmojiById(id);
    }
}
