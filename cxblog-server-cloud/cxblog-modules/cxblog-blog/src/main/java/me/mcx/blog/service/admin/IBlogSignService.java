package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogSign;

/**
 * 签到Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogSignService 
{
    /**
     * 查询签到
     * 
     * @param id 签到主键
     * @return 签到
     */
    public BlogSign selectBlogSignById(String id);

    /**
     * 查询签到列表
     * 
     * @param blogSign 签到
     * @return 签到集合
     */
    public List<BlogSign> selectBlogSignList(BlogSign blogSign);

    /**
     * 新增签到
     * 
     * @param blogSign 签到
     * @return 结果
     */
    public int insertBlogSign(BlogSign blogSign);

    /**
     * 修改签到
     * 
     * @param blogSign 签到
     * @return 结果
     */
    public int updateBlogSign(BlogSign blogSign);

    /**
     * 批量删除签到
     * 
     * @param ids 需要删除的签到主键集合
     * @return 结果
     */
    public int deleteBlogSignByIds(String[] ids);

    /**
     * 删除签到信息
     * 
     * @param id 签到主键
     * @return 结果
     */
    public int deleteBlogSignById(String id);
}
