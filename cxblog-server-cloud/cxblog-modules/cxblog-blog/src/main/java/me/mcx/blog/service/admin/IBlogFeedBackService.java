package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogFeedBack;

/**
 * 问题反馈Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogFeedBackService 
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
     * 批量删除问题反馈
     * 
     * @param ids 需要删除的问题反馈主键集合
     * @return 结果
     */
    public int deleteBlogFeedBackByIds(Long[] ids);

    /**
     * 删除问题反馈信息
     * 
     * @param id 问题反馈主键
     * @return 结果
     */
    public int deleteBlogFeedBackById(Long id);
}
