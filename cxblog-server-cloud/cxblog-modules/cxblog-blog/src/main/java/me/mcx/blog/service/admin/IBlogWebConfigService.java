package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogWebConfig;
import me.mcx.common.core.web.domain.AjaxResult;

/**
 * 网站配置Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogWebConfigService 
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
     * 批量删除网站配置
     * 
     * @param ids 需要删除的网站配置主键集合
     * @return 结果
     */
    public int deleteBlogWebConfigByIds(Long[] ids);

    /**
     * 删除网站配置信息
     * 
     * @param id 网站配置主键
     * @return 结果
     */
    public int deleteBlogWebConfigById(Long id);

//    =============================
    /**
     * 获取网站配置详情
     * @return
     */
    AjaxResult getWebConfig();

    /**
     * 修改
     * @param webConfig
     * @return
     */
    AjaxResult updateWebConfig(BlogWebConfig webConfig);
}
