package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogSponsorMapper;
import me.mcx.blog.domain.BlogSponsor;
import me.mcx.blog.service.admin.IBlogSponsorService;

/**
 * 打赏记录Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogSponsorServiceImpl implements IBlogSponsorService 
{
    @Autowired
    private BlogSponsorMapper blogSponsorMapper;

    /**
     * 查询打赏记录
     * 
     * @param id 打赏记录主键
     * @return 打赏记录
     */
    @Override
    public BlogSponsor selectBlogSponsorById(Long id)
    {
        return blogSponsorMapper.selectBlogSponsorById(id);
    }

    /**
     * 查询打赏记录列表
     * 
     * @param blogSponsor 打赏记录
     * @return 打赏记录
     */
    @Override
    public List<BlogSponsor> selectBlogSponsorList(BlogSponsor blogSponsor)
    {
        return blogSponsorMapper.selectBlogSponsorList(blogSponsor);
    }

    /**
     * 新增打赏记录
     * 
     * @param blogSponsor 打赏记录
     * @return 结果
     */
    @Override
    public int insertBlogSponsor(BlogSponsor blogSponsor)
    {
        blogSponsor.setCreateTime(DateUtils.getNowDate());
        return blogSponsorMapper.insertBlogSponsor(blogSponsor);
    }

    /**
     * 修改打赏记录
     * 
     * @param blogSponsor 打赏记录
     * @return 结果
     */
    @Override
    public int updateBlogSponsor(BlogSponsor blogSponsor)
    {
        blogSponsor.setUpdateTime(DateUtils.getNowDate());
        return blogSponsorMapper.updateBlogSponsor(blogSponsor);
    }

    /**
     * 批量删除打赏记录
     * 
     * @param ids 需要删除的打赏记录主键
     * @return 结果
     */
    @Override
    public int deleteBlogSponsorByIds(Long[] ids)
    {
        return blogSponsorMapper.deleteBlogSponsorByIds(ids);
    }

    /**
     * 删除打赏记录信息
     * 
     * @param id 打赏记录主键
     * @return 结果
     */
    @Override
    public int deleteBlogSponsorById(Long id)
    {
        return blogSponsorMapper.deleteBlogSponsorById(id);
    }
}
