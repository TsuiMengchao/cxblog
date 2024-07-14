package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogFriendLink;
import me.mcx.blog.domain.vo.friendLink.ApiFriendLinkVO;
import org.apache.ibatis.annotations.Param;

/**
 * 友情链接Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogFriendLinkMapper 
{
    /**
     * 查询友情链接
     * 
     * @param id 友情链接主键
     * @return 友情链接
     */
    public BlogFriendLink selectBlogFriendLinkById(Long id);

    /**
     * 查询友情链接列表
     * 
     * @param blogFriendLink 友情链接
     * @return 友情链接集合
     */
    public List<BlogFriendLink> selectBlogFriendLinkList(BlogFriendLink blogFriendLink);

    /**
     * 新增友情链接
     * 
     * @param blogFriendLink 友情链接
     * @return 结果
     */
    public int insertBlogFriendLink(BlogFriendLink blogFriendLink);

    /**
     * 修改友情链接
     * 
     * @param blogFriendLink 友情链接
     * @return 结果
     */
    public int updateBlogFriendLink(BlogFriendLink blogFriendLink);

    /**
     * 删除友情链接
     * 
     * @param id 友情链接主键
     * @return 结果
     */
    public int deleteBlogFriendLinkById(Long id);

    /**
     * 批量删除友情链接
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogFriendLinkByIds(Long[] ids);

//    =======================================
Integer getMaxSort();

    void top(@Param("id") Integer id, @Param("sort") int sort);

    List<ApiFriendLinkVO> selectLinkList(@Param("status") Integer status);
}
