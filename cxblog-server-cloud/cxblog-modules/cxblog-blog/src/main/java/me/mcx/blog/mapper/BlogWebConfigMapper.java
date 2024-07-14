package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogWebConfig;

/**
 * 网站配置Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogWebConfigMapper 
{
    /**
     * 查询网站配置
     * 
     * @param id 网站配置主键
     * @return 网站配置
     */
    public BlogWebConfig selectBlogWebConfigById(Long id);

    /**
     * 查询网站配置列表
     * 
     * @param blogWebConfig 网站配置
     * @return 网站配置集合
     */
    public List<BlogWebConfig> selectBlogWebConfigList(BlogWebConfig blogWebConfig);

    /**
     * 新增网站配置
     * 
     * @param blogWebConfig 网站配置
     * @return 结果
     */
    public int insertBlogWebConfig(BlogWebConfig blogWebConfig);

    /**
     * 修改网站配置
     * 
     * @param blogWebConfig 网站配置
     * @return 结果
     */
    public int updateBlogWebConfig(BlogWebConfig blogWebConfig);

    /**
     * 删除网站配置
     * 
     * @param id 网站配置主键
     * @return 结果
     */
    public int deleteBlogWebConfigById(Long id);

    /**
     * 批量删除网站配置
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogWebConfigByIds(Long[] ids);
}
