package me.mcx.blog.service.web.impl;

import me.mcx.blog.mapper.BlogTagsMapper;
import me.mcx.blog.service.web.ApiTagService;
import me.mcx.blog.domain.vo.tag.ApiTagListVO;
import lombok.RequiredArgsConstructor;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiTagServiceImpl implements ApiTagService {

    @Autowired
    private final BlogTagsMapper tagsMapper;

    /**
     *  标签列表
     * @return
     */
    @Override
    public AjaxResult selectTagList() {
        List<ApiTagListVO> list = tagsMapper.selectTagListApi();
        return AjaxResult.success(list);
    }
}
