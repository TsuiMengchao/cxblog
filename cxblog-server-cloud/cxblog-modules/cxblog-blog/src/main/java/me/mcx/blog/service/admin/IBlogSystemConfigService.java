package me.mcx.blog.service.admin;

import java.util.List;
import me.mcx.blog.domain.BlogSystemConfig;
import me.mcx.common.core.web.domain.AjaxResult;

/**
 * 系统配置Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogSystemConfigService 
{
    /**
     * 查询系统配置
     * 
     * @param id 系统配置主键
     * @return 系统配置
     */
    public BlogSystemConfig selectBlogSystemConfigById(Long id);

    /**
     * 查询系统配置列表
     * 
     * @param blogSystemConfig 系统配置
     * @return 系统配置集合
     */
    public List<BlogSystemConfig> selectBlogSystemConfigList(BlogSystemConfig blogSystemConfig);

    /**
     * 新增系统配置
     * 
     * @param blogSystemConfig 系统配置
     * @return 结果
     */
    public int insertBlogSystemConfig(BlogSystemConfig blogSystemConfig);

    /**
     * 修改系统配置
     * 
     * @param blogSystemConfig 系统配置
     * @return 结果
     */
    public int updateBlogSystemConfig(BlogSystemConfig blogSystemConfig);

    /**
     * 批量删除系统配置
     * 
     * @param ids 需要删除的系统配置主键集合
     * @return 结果
     */
    public int deleteBlogSystemConfigByIds(Long[] ids);

    /**
     * 删除系统配置信息
     * 
     * @param id 系统配置主键
     * @return 结果
     */
    public int deleteBlogSystemConfigById(Long id);

//    ==============================
    /**
     * 获取系统配置
     * @return
     */
    AjaxResult getSystemConfig();

    /**
     * 修改
     * @param systemConfig
     * @return
     */
    AjaxResult updateSystemConfig(BlogSystemConfig systemConfig);

    /**
     *
     * @return
     */
    BlogSystemConfig getCustomizeOne();
}
