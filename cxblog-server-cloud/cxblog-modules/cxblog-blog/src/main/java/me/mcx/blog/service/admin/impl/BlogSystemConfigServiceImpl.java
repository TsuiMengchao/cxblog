package me.mcx.blog.service.admin.impl;

import java.util.List;

import me.mcx.blog.common.Constants;
import me.mcx.common.core.utils.DateUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.security.auth.AuthUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogSystemConfigMapper;
import me.mcx.blog.domain.BlogSystemConfig;
import me.mcx.blog.service.admin.IBlogSystemConfigService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 系统配置Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogSystemConfigServiceImpl implements IBlogSystemConfigService 
{
    @Autowired
    private BlogSystemConfigMapper blogSystemConfigMapper;

    /**
     * 查询系统配置
     * 
     * @param id 系统配置主键
     * @return 系统配置
     */
    @Override
    public BlogSystemConfig selectBlogSystemConfigById(Long id)
    {
        return blogSystemConfigMapper.selectBlogSystemConfigById(id);
    }

    /**
     * 查询系统配置列表
     * 
     * @param blogSystemConfig 系统配置
     * @return 系统配置
     */
    @Override
    public List<BlogSystemConfig> selectBlogSystemConfigList(BlogSystemConfig blogSystemConfig)
    {
        return blogSystemConfigMapper.selectBlogSystemConfigList(blogSystemConfig);
    }

    /**
     * 新增系统配置
     * 
     * @param blogSystemConfig 系统配置
     * @return 结果
     */
    @Override
    public int insertBlogSystemConfig(BlogSystemConfig blogSystemConfig)
    {
        blogSystemConfig.setCreateTime(DateUtils.getNowDate());
        return blogSystemConfigMapper.insertBlogSystemConfig(blogSystemConfig);
    }

    /**
     * 修改系统配置
     * 
     * @param blogSystemConfig 系统配置
     * @return 结果
     */
    @Override
    public int updateBlogSystemConfig(BlogSystemConfig blogSystemConfig)
    {
        blogSystemConfig.setUpdateTime(DateUtils.getNowDate());
        return blogSystemConfigMapper.updateBlogSystemConfig(blogSystemConfig);
    }

    /**
     * 批量删除系统配置
     * 
     * @param ids 需要删除的系统配置主键
     * @return 结果
     */
    @Override
    public int deleteBlogSystemConfigByIds(Long[] ids)
    {
        return blogSystemConfigMapper.deleteBlogSystemConfigByIds(ids);
    }

    /**
     * 删除系统配置信息
     * 
     * @param id 系统配置主键
     * @return 结果
     */
    @Override
    public int deleteBlogSystemConfigById(Long id)
    {
        return blogSystemConfigMapper.deleteBlogSystemConfigById(id);
    }

//    ===================================

    /**
     * 获取系统配置
     * @return
     */
    @Override
    public AjaxResult getSystemConfig() {

        BlogSystemConfig systemConfig = blogSystemConfigMapper.selectBlogSystemConfigById(1l);

        if (!AuthUtil.hasRole(Constants.ADMIN_CODE)){
            BlogSystemConfig data = new BlogSystemConfig() {{
                setId(systemConfig.getId());setOpenEmail(systemConfig.getOpenEmail());
                setOpenEmailActivate(systemConfig.getOpenEmailActivate());
                setStartEmailNotification(systemConfig.getStartEmailNotification());
                setFileUploadWay(systemConfig.getFileUploadWay());
                setDashboardNotification(systemConfig.getDashboardNotification());
                setDashboardNotificationMd(systemConfig.getDashboardNotificationMd());
                setOpenDashboardNotification(systemConfig.getOpenDashboardNotification());
                setSearchModel(systemConfig.getSearchModel());
                setLocalFileUrl(systemConfig.getLocalFileUrl());
                setEmailHost(systemConfig.getEmailHost());
                setEmailPort(systemConfig.getEmailPort());
            }};
        }

        return AjaxResult.success(systemConfig);
    }

    /**
     * 修改系统配置
     * @param systemConfig
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult updateSystemConfig(BlogSystemConfig systemConfig) {
        blogSystemConfigMapper.updateBlogSystemConfig(systemConfig);
        return AjaxResult.success();
    }

    //---------自定义方法----------
    @Override
    public BlogSystemConfig getCustomizeOne() {
        return blogSystemConfigMapper.selectBlogSystemConfigById(1L);
    }
}
