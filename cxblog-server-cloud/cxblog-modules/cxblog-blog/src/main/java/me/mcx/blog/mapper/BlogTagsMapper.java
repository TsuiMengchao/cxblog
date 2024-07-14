package me.mcx.blog.mapper;

import java.util.List;
import java.util.Map;

import me.mcx.blog.domain.BlogTags;
import me.mcx.blog.domain.vo.tag.ApiTagListVO;
import me.mcx.blog.domain.vo.tag.SystemTagListVo;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;

/**
 * 博客标签Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogTagsMapper 
{
    /**
     * 查询博客标签
     * 
     * @param id 博客标签主键
     * @return 博客标签
     */
    public BlogTags selectBlogTagsById(Long id);

    /**
     * 查询博客标签列表
     * 
     * @param blogTags 博客标签
     * @return 博客标签集合
     */
    public List<BlogTags> selectBlogTagsList(BlogTags blogTags);

    /**
     * 新增博客标签
     * 
     * @param blogTags 博客标签
     * @return 结果
     */
    public int insertBlogTags(BlogTags blogTags);

    /**
     * 修改博客标签
     * 
     * @param blogTags 博客标签
     * @return 结果
     */
    public int updateBlogTags(BlogTags blogTags);

    /**
     * 删除博客标签
     * 
     * @param id 博客标签主键
     * @return 结果
     */
    public int deleteBlogTagsById(Long id);

    /**
     * 批量删除博客标签
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogTagsByIds(Long[] ids);

//    =====================================
    /**
     * 添加标签
     * @param articleId
     * @param tags
     */
    void saveArticleTags(@Param("articleId") Long articleId, @Param("tags")List<Long> tags);

    /**
     * 根据id删除文章对应中间表数据
     * @param ids
     */
    void deleteByArticleIds(@Param("ids") List<Long> ids);

    List<String> selectByArticleId(Long articleId);


    /**
     * 分页获取标签
     * @param objectPage
     * @param name
     * @return
     */
    Page<SystemTagListVo> selectPageRecord(@Param("page") Page<BlogTags> objectPage, @Param("name") String name);

    /**
     * 标签统计
     * @return
     */
    @MapKey("id")
    List<Map<String, Object>> countTags();


    /**
     * 根据文章id获取标签
     * @param articleId
     * @return
     */
    List<BlogTags> selectTagByArticleId(Long articleId);

    /**
     * 校验此标签是否存在文章关联
     * @param id
     * @return
     */
    int validateTagIdIsExistArticle(Long id);

    List<ApiTagListVO> selectTagListApi();
}
