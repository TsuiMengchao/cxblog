package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogTalk;

/**
 * 话题圈子Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogTalkService 
{
    /**
     * 查询话题圈子
     * 
     * @param id 话题圈子主键
     * @return 话题圈子
     */
    public BlogTalk selectBlogTalkById(Long id);

    /**
     * 查询话题圈子列表
     * 
     * @param blogTalk 话题圈子
     * @return 话题圈子集合
     */
    public List<BlogTalk> selectBlogTalkList(BlogTalk blogTalk);

    /**
     * 新增话题圈子
     * 
     * @param blogTalk 话题圈子
     * @return 结果
     */
    public int insertBlogTalk(BlogTalk blogTalk);

    /**
     * 修改话题圈子
     * 
     * @param blogTalk 话题圈子
     * @return 结果
     */
    public int updateBlogTalk(BlogTalk blogTalk);

    /**
     * 批量删除话题圈子
     * 
     * @param ids 需要删除的话题圈子主键集合
     * @return 结果
     */
    public int deleteBlogTalkByIds(Long[] ids);

    /**
     * 删除话题圈子信息
     * 
     * @param id 话题圈子主键
     * @return 结果
     */
    public int deleteBlogTalkById(Long id);
}
