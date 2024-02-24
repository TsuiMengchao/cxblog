package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Category;

import java.util.List;

/**
 * <p>
 * 博客分类表 服务类
 * </p>
 *
 * @author MCX
 * @since 2021-12-29
 */
public interface CategoryService extends IService<Category> {

    /**
     * 分类列表
     * @param name 分类名
     * @return
     */
    ResponseResult selectCategoryList(String name);

    /**
     * 分类详情
     * @param id 分类id
     * @return
     */
    ResponseResult getCategoryById(Long id);

    /**
     * 添加分类
     * @param category 分类对象
     * @return
     */
    ResponseResult insertCategory(Category category);

    /**
     * 修改分类
     * @param category 分类对象
     * @return
     */
    ResponseResult updateCategory(Category category);

    /**
     * 删除分类
     * @param id 分类id
     * @return
     */
    ResponseResult deleteCategory(Long id);

    /**
     * 批量删除分类
     * @param list 分类对象集合
     * @return
     */
    ResponseResult deleteBatch(List<Category> list);


    /**
     * 置顶分类
     * @return 置顶分类
     */
    ResponseResult top(Long id);

}
