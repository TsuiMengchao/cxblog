package me.mcx.blog.service.admin.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogSignMapper;
import me.mcx.blog.domain.BlogSign;
import me.mcx.blog.service.admin.IBlogSignService;

/**
 * 签到Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogSignServiceImpl implements IBlogSignService 
{
    @Autowired
    private BlogSignMapper blogSignMapper;

    /**
     * 查询签到
     * 
     * @param id 签到主键
     * @return 签到
     */
    @Override
    public BlogSign selectBlogSignById(String id)
    {
        return blogSignMapper.selectBlogSignById(id);
    }

    /**
     * 查询签到列表
     * 
     * @param blogSign 签到
     * @return 签到
     */
    @Override
    public List<BlogSign> selectBlogSignList(BlogSign blogSign)
    {
        return blogSignMapper.selectBlogSignList(blogSign);
    }

    /**
     * 新增签到
     * 
     * @param blogSign 签到
     * @return 结果
     */
    @Override
    public int insertBlogSign(BlogSign blogSign)
    {
        blogSign.setCreateTime(DateUtils.getNowDate());
        return blogSignMapper.insertBlogSign(blogSign);
    }

    /**
     * 修改签到
     * 
     * @param blogSign 签到
     * @return 结果
     */
    @Override
    public int updateBlogSign(BlogSign blogSign)
    {
        blogSign.setUpdateTime(DateUtils.getNowDate());
        return blogSignMapper.updateBlogSign(blogSign);
    }

    /**
     * 批量删除签到
     * 
     * @param ids 需要删除的签到主键
     * @return 结果
     */
    @Override
    public int deleteBlogSignByIds(String[] ids)
    {
        return blogSignMapper.deleteBlogSignByIds(ids);
    }

    /**
     * 删除签到信息
     * 
     * @param id 签到主键
     * @return 结果
     */
    @Override
    public int deleteBlogSignById(String id)
    {
        return blogSignMapper.deleteBlogSignById(id);
    }
}
