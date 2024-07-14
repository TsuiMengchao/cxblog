package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogForumMapper;
import me.mcx.blog.domain.BlogForum;
import me.mcx.blog.service.admin.IBlogForumService;

/**
 * 圈子话题Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogForumServiceImpl implements IBlogForumService 
{
    @Autowired
    private BlogForumMapper blogForumMapper;

    /**
     * 查询圈子话题
     * 
     * @param id 圈子话题主键
     * @return 圈子话题
     */
    @Override
    public BlogForum selectBlogForumById(Long id)
    {
        return blogForumMapper.selectBlogForumById(id);
    }

    /**
     * 查询圈子话题列表
     * 
     * @param blogForum 圈子话题
     * @return 圈子话题
     */
    @Override
    public List<BlogForum> selectBlogForumList(BlogForum blogForum)
    {
        return blogForumMapper.selectBlogForumList(blogForum);
    }

    /**
     * 新增圈子话题
     * 
     * @param blogForum 圈子话题
     * @return 结果
     */
    @Override
    public int insertBlogForum(BlogForum blogForum)
    {
        blogForum.setCreateTime(DateUtils.getNowDate());
        return blogForumMapper.insertBlogForum(blogForum);
    }

    /**
     * 修改圈子话题
     * 
     * @param blogForum 圈子话题
     * @return 结果
     */
    @Override
    public int updateBlogForum(BlogForum blogForum)
    {
        blogForum.setUpdateTime(DateUtils.getNowDate());
        return blogForumMapper.updateBlogForum(blogForum);
    }

    /**
     * 批量删除圈子话题
     * 
     * @param ids 需要删除的圈子话题主键
     * @return 结果
     */
    @Override
    public int deleteBlogForumByIds(Long[] ids)
    {
        return blogForumMapper.deleteBlogForumByIds(ids);
    }

    /**
     * 删除圈子话题信息
     * 
     * @param id 圈子话题主键
     * @return 结果
     */
    @Override
    public int deleteBlogForumById(Long id)
    {
        return blogForumMapper.deleteBlogForumById(id);
    }
}
