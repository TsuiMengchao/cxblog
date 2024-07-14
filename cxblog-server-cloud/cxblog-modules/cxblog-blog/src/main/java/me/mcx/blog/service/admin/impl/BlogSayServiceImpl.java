package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogSayMapper;
import me.mcx.blog.domain.BlogSay;
import me.mcx.blog.service.admin.IBlogSayService;

/**
 * 说说Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogSayServiceImpl implements IBlogSayService 
{
    @Autowired
    private BlogSayMapper blogSayMapper;

    /**
     * 查询说说
     * 
     * @param id 说说主键
     * @return 说说
     */
    @Override
    public BlogSay selectBlogSayById(String id)
    {
        return blogSayMapper.selectBlogSayById(id);
    }

    /**
     * 查询说说列表
     * 
     * @param blogSay 说说
     * @return 说说
     */
    @Override
    public List<BlogSay> selectBlogSayList(BlogSay blogSay)
    {
        return blogSayMapper.selectBlogSayList(blogSay);
    }

    /**
     * 新增说说
     * 
     * @param blogSay 说说
     * @return 结果
     */
    @Override
    public int insertBlogSay(BlogSay blogSay)
    {
        blogSay.setCreateTime(DateUtils.getNowDate());
        return blogSayMapper.insertBlogSay(blogSay);
    }

    /**
     * 修改说说
     * 
     * @param blogSay 说说
     * @return 结果
     */
    @Override
    public int updateBlogSay(BlogSay blogSay)
    {
        blogSay.setUpdateTime(DateUtils.getNowDate());
        return blogSayMapper.updateBlogSay(blogSay);
    }

    /**
     * 批量删除说说
     * 
     * @param ids 需要删除的说说主键
     * @return 结果
     */
    @Override
    public int deleteBlogSayByIds(String[] ids)
    {
        return blogSayMapper.deleteBlogSayByIds(ids);
    }

    /**
     * 删除说说信息
     * 
     * @param id 说说主键
     * @return 结果
     */
    @Override
    public int deleteBlogSayById(String id)
    {
        return blogSayMapper.deleteBlogSayById(id);
    }
}
