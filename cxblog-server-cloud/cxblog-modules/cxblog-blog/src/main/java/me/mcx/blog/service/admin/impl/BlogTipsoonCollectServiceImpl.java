package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogTipsoonCollectMapper;
import me.mcx.blog.domain.BlogTipsoonCollect;
import me.mcx.blog.service.admin.IBlogTipsoonCollectService;

/**
 * 简讯收藏Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogTipsoonCollectServiceImpl implements IBlogTipsoonCollectService 
{
    @Autowired
    private BlogTipsoonCollectMapper blogTipsoonCollectMapper;

    /**
     * 查询简讯收藏
     * 
     * @param id 简讯收藏主键
     * @return 简讯收藏
     */
    @Override
    public BlogTipsoonCollect selectBlogTipsoonCollectById(Long id)
    {
        return blogTipsoonCollectMapper.selectBlogTipsoonCollectById(id);
    }

    /**
     * 查询简讯收藏列表
     * 
     * @param blogTipsoonCollect 简讯收藏
     * @return 简讯收藏
     */
    @Override
    public List<BlogTipsoonCollect> selectBlogTipsoonCollectList(BlogTipsoonCollect blogTipsoonCollect)
    {
        return blogTipsoonCollectMapper.selectBlogTipsoonCollectList(blogTipsoonCollect);
    }

    /**
     * 新增简讯收藏
     * 
     * @param blogTipsoonCollect 简讯收藏
     * @return 结果
     */
    @Override
    public int insertBlogTipsoonCollect(BlogTipsoonCollect blogTipsoonCollect)
    {
        blogTipsoonCollect.setCreateTime(DateUtils.getNowDate());
        return blogTipsoonCollectMapper.insertBlogTipsoonCollect(blogTipsoonCollect);
    }

    /**
     * 修改简讯收藏
     * 
     * @param blogTipsoonCollect 简讯收藏
     * @return 结果
     */
    @Override
    public int updateBlogTipsoonCollect(BlogTipsoonCollect blogTipsoonCollect)
    {
        blogTipsoonCollect.setUpdateTime(DateUtils.getNowDate());
        return blogTipsoonCollectMapper.updateBlogTipsoonCollect(blogTipsoonCollect);
    }

    /**
     * 批量删除简讯收藏
     * 
     * @param ids 需要删除的简讯收藏主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonCollectByIds(Long[] ids)
    {
        return blogTipsoonCollectMapper.deleteBlogTipsoonCollectByIds(ids);
    }

    /**
     * 删除简讯收藏信息
     * 
     * @param id 简讯收藏主键
     * @return 结果
     */
    @Override
    public int deleteBlogTipsoonCollectById(Long id)
    {
        return blogTipsoonCollectMapper.deleteBlogTipsoonCollectById(id);
    }
}
