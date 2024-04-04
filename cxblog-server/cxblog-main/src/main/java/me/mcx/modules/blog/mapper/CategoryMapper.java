package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.Category;
import me.mcx.modules.blog.domain.vo.SystemCategoryCountVO;
import me.mcx.modules.blog.domain.vo.SystemCategoryListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 博客分类表 Mapper 接口
 * </p>
 *
 * @author MCX
 * @since 2021-12-29
 */
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {

    /**
     * 分页获取分类
     * @param objectPage 分页对象
     * @param name 分类名
     * @return
     */
    Page<SystemCategoryListVO> selectCategory(@Param("page")Page<Category> objectPage, @Param("name")String name);

    /**
     * 统计分类
     * @return
     */
    List<SystemCategoryCountVO> countArticle();

}
