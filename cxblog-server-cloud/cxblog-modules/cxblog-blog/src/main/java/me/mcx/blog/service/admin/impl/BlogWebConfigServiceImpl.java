package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogWebConfigMapper;
import me.mcx.blog.domain.BlogWebConfig;
import me.mcx.blog.service.admin.IBlogWebConfigService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 网站配置Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogWebConfigServiceImpl implements IBlogWebConfigService 
{
    @Autowired
    private BlogWebConfigMapper blogWebConfigMapper;

    /**
     * 查询网站配置
     * 
     * @param id 网站配置主键
     * @return 网站配置
     */
    @Override
    public BlogWebConfig selectBlogWebConfigById(Long id)
    {
        return blogWebConfigMapper.selectBlogWebConfigById(id);
    }

    /**
     * 查询网站配置列表
     * 
     * @param blogWebConfig 网站配置
     * @return 网站配置
     */
    @Override
    public List<BlogWebConfig> selectBlogWebConfigList(BlogWebConfig blogWebConfig)
    {
        return blogWebConfigMapper.selectBlogWebConfigList(blogWebConfig);
    }

    /**
     * 新增网站配置
     * 
     * @param blogWebConfig 网站配置
     * @return 结果
     */
    @Override
    public int insertBlogWebConfig(BlogWebConfig blogWebConfig)
    {
        blogWebConfig.setCreateTime(DateUtils.getNowDate());
        return blogWebConfigMapper.insertBlogWebConfig(blogWebConfig);
    }

    /**
     * 修改网站配置
     * 
     * @param blogWebConfig 网站配置
     * @return 结果
     */
    @Override
    public int updateBlogWebConfig(BlogWebConfig blogWebConfig)
    {
        blogWebConfig.setUpdateTime(DateUtils.getNowDate());
        return blogWebConfigMapper.updateBlogWebConfig(blogWebConfig);
    }

    /**
     * 批量删除网站配置
     * 
     * @param ids 需要删除的网站配置主键
     * @return 结果
     */
    @Override
    public int deleteBlogWebConfigByIds(Long[] ids)
    {
        return blogWebConfigMapper.deleteBlogWebConfigByIds(ids);
    }

    /**
     * 删除网站配置信息
     * 
     * @param id 网站配置主键
     * @return 结果
     */
    @Override
    public int deleteBlogWebConfigById(Long id)
    {
        return blogWebConfigMapper.deleteBlogWebConfigById(id);
    }

//    =============================
    /**
     * 网站配置
     * @return
     */
    @Override
    public AjaxResult getWebConfig() {
        BlogWebConfig webConfig = blogWebConfigMapper.selectBlogWebConfigById(1L);
        return AjaxResult.success(webConfig);
    }

    /**
     * 修改网站配置
     * @param webConfig
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult updateWebConfig(BlogWebConfig webConfig) {
        blogWebConfigMapper.updateBlogWebConfig(webConfig);
        return AjaxResult.success();
    }
}
