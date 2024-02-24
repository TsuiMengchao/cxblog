package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Category;
import me.mcx.modules.blog.admin.mapper.CategoryMapper;
import me.mcx.modules.blog.web.service.ApiCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiCategoryServiceImpl implements ApiCategoryService {

    private final CategoryMapper categoryMapper;

    /**
     * 首页分类列表
     * @return
     */
    @Override
    public ResponseResult selectCategoryList() {
        List<Category> list = categoryMapper.selectList(new LambdaQueryWrapper<Category>().orderByDesc(Category::getSort));
        return ResponseResult.success(list);
    }
}
