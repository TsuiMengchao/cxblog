package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogSay;
import me.mcx.blog.domain.vo.say.ApiSayVO;

/**
 * 说说Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogSayMapper 
{
    /**
     * 查询说说
     * 
     * @param id 说说主键
     * @return 说说
     */
    public BlogSay selectBlogSayById(String id);

    /**
     * 查询说说列表
     * 
     * @param blogSay 说说
     * @return 说说集合
     */
    public List<BlogSay> selectBlogSayList(BlogSay blogSay);

    /**
     * 新增说说
     * 
     * @param blogSay 说说
     * @return 结果
     */
    public int insertBlogSay(BlogSay blogSay);

    /**
     * 修改说说
     * 
     * @param blogSay 说说
     * @return 结果
     */
    public int updateBlogSay(BlogSay blogSay);

    /**
     * 删除说说
     * 
     * @param id 说说主键
     * @return 结果
     */
    public int deleteBlogSayById(String id);

    /**
     * 批量删除说说
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogSayByIds(String[] ids);

    List<ApiSayVO> selectPublicSayList(boolean showPrivate);
}
