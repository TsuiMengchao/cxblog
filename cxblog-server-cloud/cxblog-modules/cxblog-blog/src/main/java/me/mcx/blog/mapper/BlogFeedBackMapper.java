package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogFeedBack;

/**
 * 问题反馈Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogFeedBackMapper 
{
    /**
     * 查询问题反馈
     * 
     * @param id 问题反馈主键
     * @return 问题反馈
     */
    public BlogFeedBack selectBlogFeedBackById(Long id);

    /**
     * 查询问题反馈列表
     * 
     * @param blogFeedBack 问题反馈
     * @return 问题反馈集合
     */
    public List<BlogFeedBack> selectBlogFeedBackList(BlogFeedBack blogFeedBack);

    /**
     * 新增问题反馈
     * 
     * @param blogFeedBack 问题反馈
     * @return 结果
     */
    public int insertBlogFeedBack(BlogFeedBack blogFeedBack);

    /**
     * 修改问题反馈
     * 
     * @param blogFeedBack 问题反馈
     * @return 结果
     */
    public int updateBlogFeedBack(BlogFeedBack blogFeedBack);

    /**
     * 删除问题反馈
     * 
     * @param id 问题反馈主键
     * @return 结果
     */
    public int deleteBlogFeedBackById(Long id);

    /**
     * 批量删除问题反馈
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogFeedBackByIds(Long[] ids);
}
