package me.mcx.blog.service.web.impl;


import me.mcx.blog.mapper.BlogCategoryMapper;
import me.mcx.blog.service.web.ApiCategoryService;
import me.mcx.blog.domain.vo.category.ApiCategoryListVO;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApiCategoryServiceImpl implements ApiCategoryService {

    @Autowired
    private BlogCategoryMapper categoryMapper;

    /**
     * 首页分类列表
     * @return
     */
    @Override
    public AjaxResult selectCategoryList() {
        List<ApiCategoryListVO> list = categoryMapper.selectCategoryListApi();
        return AjaxResult.success(list);
    }
}
