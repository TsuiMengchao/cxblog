package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogTalkMapper;
import me.mcx.blog.domain.BlogTalk;
import me.mcx.blog.service.admin.IBlogTalkService;

/**
 * 话题圈子Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogTalkServiceImpl implements IBlogTalkService 
{
    @Autowired
    private BlogTalkMapper blogTalkMapper;

    /**
     * 查询话题圈子
     * 
     * @param id 话题圈子主键
     * @return 话题圈子
     */
    @Override
    public BlogTalk selectBlogTalkById(Long id)
    {
        return blogTalkMapper.selectBlogTalkById(id);
    }

    /**
     * 查询话题圈子列表
     * 
     * @param blogTalk 话题圈子
     * @return 话题圈子
     */
    @Override
    public List<BlogTalk> selectBlogTalkList(BlogTalk blogTalk)
    {
        return blogTalkMapper.selectBlogTalkList(blogTalk);
    }

    /**
     * 新增话题圈子
     * 
     * @param blogTalk 话题圈子
     * @return 结果
     */
    @Override
    public int insertBlogTalk(BlogTalk blogTalk)
    {
        blogTalk.setCreateTime(DateUtils.getNowDate());
        return blogTalkMapper.insertBlogTalk(blogTalk);
    }

    /**
     * 修改话题圈子
     * 
     * @param blogTalk 话题圈子
     * @return 结果
     */
    @Override
    public int updateBlogTalk(BlogTalk blogTalk)
    {
        blogTalk.setUpdateTime(DateUtils.getNowDate());
        return blogTalkMapper.updateBlogTalk(blogTalk);
    }

    /**
     * 批量删除话题圈子
     * 
     * @param ids 需要删除的话题圈子主键
     * @return 结果
     */
    @Override
    public int deleteBlogTalkByIds(Long[] ids)
    {
        return blogTalkMapper.deleteBlogTalkByIds(ids);
    }

    /**
     * 删除话题圈子信息
     * 
     * @param id 话题圈子主键
     * @return 结果
     */
    @Override
    public int deleteBlogTalkById(Long id)
    {
        return blogTalkMapper.deleteBlogTalkById(id);
    }
}
