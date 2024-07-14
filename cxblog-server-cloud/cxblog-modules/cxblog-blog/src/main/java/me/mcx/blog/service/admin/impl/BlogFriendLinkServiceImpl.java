package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogFriendLinkMapper;
import me.mcx.blog.domain.BlogFriendLink;
import me.mcx.blog.service.admin.IBlogFriendLinkService;

/**
 * 友情链接Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogFriendLinkServiceImpl implements IBlogFriendLinkService 
{
    @Autowired
    private BlogFriendLinkMapper blogFriendLinkMapper;

    /**
     * 查询友情链接
     * 
     * @param id 友情链接主键
     * @return 友情链接
     */
    @Override
    public BlogFriendLink selectBlogFriendLinkById(Long id)
    {
        return blogFriendLinkMapper.selectBlogFriendLinkById(id);
    }

    /**
     * 查询友情链接列表
     * 
     * @param blogFriendLink 友情链接
     * @return 友情链接
     */
    @Override
    public List<BlogFriendLink> selectBlogFriendLinkList(BlogFriendLink blogFriendLink)
    {
        return blogFriendLinkMapper.selectBlogFriendLinkList(blogFriendLink);
    }

    /**
     * 新增友情链接
     * 
     * @param blogFriendLink 友情链接
     * @return 结果
     */
    @Override
    public int insertBlogFriendLink(BlogFriendLink blogFriendLink)
    {
        blogFriendLink.setCreateTime(DateUtils.getNowDate());
        return blogFriendLinkMapper.insertBlogFriendLink(blogFriendLink);
    }

    /**
     * 修改友情链接
     * 
     * @param blogFriendLink 友情链接
     * @return 结果
     */
    @Override
    public int updateBlogFriendLink(BlogFriendLink blogFriendLink)
    {
        blogFriendLink.setUpdateTime(DateUtils.getNowDate());
        return blogFriendLinkMapper.updateBlogFriendLink(blogFriendLink);
    }

    /**
     * 批量删除友情链接
     * 
     * @param ids 需要删除的友情链接主键
     * @return 结果
     */
    @Override
    public int deleteBlogFriendLinkByIds(Long[] ids)
    {
        return blogFriendLinkMapper.deleteBlogFriendLinkByIds(ids);
    }

    /**
     * 删除友情链接信息
     * 
     * @param id 友情链接主键
     * @return 结果
     */
    @Override
    public int deleteBlogFriendLinkById(Long id)
    {
        return blogFriendLinkMapper.deleteBlogFriendLinkById(id);
    }
}
