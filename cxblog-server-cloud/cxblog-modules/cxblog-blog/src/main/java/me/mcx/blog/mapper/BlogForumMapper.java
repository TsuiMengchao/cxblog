package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogForum;

/**
 * 圈子话题Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogForumMapper 
{
    /**
     * 查询圈子话题
     * 
     * @param id 圈子话题主键
     * @return 圈子话题
     */
    public BlogForum selectBlogForumById(Long id);

    /**
     * 查询圈子话题列表
     * 
     * @param blogForum 圈子话题
     * @return 圈子话题集合
     */
    public List<BlogForum> selectBlogForumList(BlogForum blogForum);

    /**
     * 新增圈子话题
     * 
     * @param blogForum 圈子话题
     * @return 结果
     */
    public int insertBlogForum(BlogForum blogForum);

    /**
     * 修改圈子话题
     * 
     * @param blogForum 圈子话题
     * @return 结果
     */
    public int updateBlogForum(BlogForum blogForum);

    /**
     * 删除圈子话题
     * 
     * @param id 圈子话题主键
     * @return 结果
     */
    public int deleteBlogForumById(Long id);

    /**
     * 批量删除圈子话题
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogForumByIds(Long[] ids);
}
