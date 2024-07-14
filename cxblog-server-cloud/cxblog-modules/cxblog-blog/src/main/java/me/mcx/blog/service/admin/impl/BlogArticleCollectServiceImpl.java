package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogArticleCollectMapper;
import me.mcx.blog.domain.BlogArticleCollect;
import me.mcx.blog.service.admin.IBlogArticleCollectService;

/**
 * 文章收藏Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogArticleCollectServiceImpl implements IBlogArticleCollectService 
{
    @Autowired
    private BlogArticleCollectMapper blogArticleCollectMapper;

    /**
     * 查询文章收藏
     * 
     * @param id 文章收藏主键
     * @return 文章收藏
     */
    @Override
    public BlogArticleCollect selectBlogArticleCollectById(Long id)
    {
        return blogArticleCollectMapper.selectBlogArticleCollectById(id);
    }

    /**
     * 查询文章收藏列表
     * 
     * @param blogArticleCollect 文章收藏
     * @return 文章收藏
     */
    @Override
    public List<BlogArticleCollect> selectBlogArticleCollectList(BlogArticleCollect blogArticleCollect)
    {
        return blogArticleCollectMapper.selectBlogArticleCollectList(blogArticleCollect);
    }

    /**
     * 新增文章收藏
     * 
     * @param blogArticleCollect 文章收藏
     * @return 结果
     */
    @Override
    public int insertBlogArticleCollect(BlogArticleCollect blogArticleCollect)
    {
        blogArticleCollect.setCreateTime(DateUtils.getNowDate());
        return blogArticleCollectMapper.insertBlogArticleCollect(blogArticleCollect);
    }

    /**
     * 修改文章收藏
     * 
     * @param blogArticleCollect 文章收藏
     * @return 结果
     */
    @Override
    public int updateBlogArticleCollect(BlogArticleCollect blogArticleCollect)
    {
        blogArticleCollect.setUpdateTime(DateUtils.getNowDate());
        return blogArticleCollectMapper.updateBlogArticleCollect(blogArticleCollect);
    }

    /**
     * 批量删除文章收藏
     * 
     * @param ids 需要删除的文章收藏主键
     * @return 结果
     */
    @Override
    public int deleteBlogArticleCollectByIds(Long[] ids)
    {
        return blogArticleCollectMapper.deleteBlogArticleCollectByIds(ids);
    }

    /**
     * 删除文章收藏信息
     * 
     * @param id 文章收藏主键
     * @return 结果
     */
    @Override
    public int deleteBlogArticleCollectById(Long id)
    {
        return blogArticleCollectMapper.deleteBlogArticleCollectById(id);
    }
}
