package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogSponsor;

/**
 * 打赏记录Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogSponsorService 
{
    /**
     * 查询打赏记录
     * 
     * @param id 打赏记录主键
     * @return 打赏记录
     */
    public BlogSponsor selectBlogSponsorById(Long id);

    /**
     * 查询打赏记录列表
     * 
     * @param blogSponsor 打赏记录
     * @return 打赏记录集合
     */
    public List<BlogSponsor> selectBlogSponsorList(BlogSponsor blogSponsor);

    /**
     * 新增打赏记录
     * 
     * @param blogSponsor 打赏记录
     * @return 结果
     */
    public int insertBlogSponsor(BlogSponsor blogSponsor);

    /**
     * 修改打赏记录
     * 
     * @param blogSponsor 打赏记录
     * @return 结果
     */
    public int updateBlogSponsor(BlogSponsor blogSponsor);

    /**
     * 批量删除打赏记录
     * 
     * @param ids 需要删除的打赏记录主键集合
     * @return 结果
     */
    public int deleteBlogSponsorByIds(Long[] ids);

    /**
     * 删除打赏记录信息
     * 
     * @param id 打赏记录主键
     * @return 结果
     */
    public int deleteBlogSponsorById(Long id);
}
