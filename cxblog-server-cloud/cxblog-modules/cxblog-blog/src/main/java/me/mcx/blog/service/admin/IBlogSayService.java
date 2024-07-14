package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogSay;

/**
 * 说说Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogSayService 
{
    /**
     * 查询说说
     * 
     * @param id 说说主键
     * @return 说说
     */
    public BlogSay selectBlogSayById(String id);

    /**
     * 查询说说列表
     * 
     * @param blogSay 说说
     * @return 说说集合
     */
    public List<BlogSay> selectBlogSayList(BlogSay blogSay);

    /**
     * 新增说说
     * 
     * @param blogSay 说说
     * @return 结果
     */
    public int insertBlogSay(BlogSay blogSay);

    /**
     * 修改说说
     * 
     * @param blogSay 说说
     * @return 结果
     */
    public int updateBlogSay(BlogSay blogSay);

    /**
     * 批量删除说说
     * 
     * @param ids 需要删除的说说主键集合
     * @return 结果
     */
    public int deleteBlogSayByIds(String[] ids);

    /**
     * 删除说说信息
     * 
     * @param id 说说主键
     * @return 结果
     */
    public int deleteBlogSayById(String id);
}
