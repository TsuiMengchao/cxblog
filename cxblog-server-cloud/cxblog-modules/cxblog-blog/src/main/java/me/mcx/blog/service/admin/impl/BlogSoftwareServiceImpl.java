package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogSoftwareMapper;
import me.mcx.blog.domain.BlogSoftware;
import me.mcx.blog.service.admin.IBlogSoftwareService;

/**
 * 开源软件Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-29
 */
@Service
public class BlogSoftwareServiceImpl implements IBlogSoftwareService 
{
    @Autowired
    private BlogSoftwareMapper blogSoftwareMapper;

    /**
     * 查询开源软件
     * 
     * @param id 开源软件主键
     * @return 开源软件
     */
    @Override
    public BlogSoftware selectBlogSoftwareById(Long id)
    {
        return blogSoftwareMapper.selectBlogSoftwareById(id);
    }

    /**
     * 查询开源软件列表
     * 
     * @param blogSoftware 开源软件
     * @return 开源软件
     */
    @Override
    public List<BlogSoftware> selectBlogSoftwareList(BlogSoftware blogSoftware)
    {
        return blogSoftwareMapper.selectBlogSoftwareList(blogSoftware);
    }

    /**
     * 新增开源软件
     * 
     * @param blogSoftware 开源软件
     * @return 结果
     */
    @Override
    public int insertBlogSoftware(BlogSoftware blogSoftware)
    {
        blogSoftware.setCreateTime(DateUtils.getNowDate());
        return blogSoftwareMapper.insertBlogSoftware(blogSoftware);
    }

    /**
     * 修改开源软件
     * 
     * @param blogSoftware 开源软件
     * @return 结果
     */
    @Override
    public int updateBlogSoftware(BlogSoftware blogSoftware)
    {
        return blogSoftwareMapper.updateBlogSoftware(blogSoftware);
    }

    /**
     * 批量删除开源软件
     * 
     * @param ids 需要删除的开源软件主键
     * @return 结果
     */
    @Override
    public int deleteBlogSoftwareByIds(Long[] ids)
    {
        return blogSoftwareMapper.deleteBlogSoftwareByIds(ids);
    }

    /**
     * 删除开源软件信息
     * 
     * @param id 开源软件主键
     * @return 结果
     */
    @Override
    public int deleteBlogSoftwareById(Long id)
    {
        return blogSoftwareMapper.deleteBlogSoftwareById(id);
    }
}
