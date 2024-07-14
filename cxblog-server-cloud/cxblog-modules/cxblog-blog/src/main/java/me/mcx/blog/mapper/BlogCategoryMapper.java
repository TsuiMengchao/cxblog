package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogCategory;
import me.mcx.blog.domain.vo.category.ApiCategoryListVO;
import me.mcx.blog.domain.vo.category.SystemCategoryCountVO;
import me.mcx.blog.domain.vo.category.SystemCategoryListVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;

/**
 * 博客分类Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogCategoryMapper 
{
    /**
     * 查询博客分类
     * 
     * @param id 博客分类主键
     * @return 博客分类
     */
    public BlogCategory selectBlogCategoryById(Long id);

    /**
     * 查询博客分类列表
     * 
     * @param blogCategory 博客分类
     * @return 博客分类集合
     */
    public List<BlogCategory> selectBlogCategoryList(BlogCategory blogCategory);

    /**
     * 新增博客分类
     * 
     * @param blogCategory 博客分类
     * @return 结果
     */
    public int insertBlogCategory(BlogCategory blogCategory);

    /**
     * 修改博客分类
     * 
     * @param blogCategory 博客分类
     * @return 结果
     */
    public int updateBlogCategory(BlogCategory blogCategory);

    /**
     * 删除博客分类
     * 
     * @param id 博客分类主键
     * @return 结果
     */
    public int deleteBlogCategoryById(Long id);

    /**
     * 批量删除博客分类
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogCategoryByIds(Long[] ids);

//    ===========================================
    /**
     * 分页获取分类
     * @param objectPage 分页对象
     * @param name 分类名
     * @return
     */
    Page<SystemCategoryListVO> selectCategory(@Param("page")Page<BlogCategory> objectPage, @Param("name")String name);

    /**
     * 统计分类
     * @return
     */
    List<SystemCategoryCountVO> countArticle();

    List<ApiCategoryListVO> selectCategoryListApi();
}
