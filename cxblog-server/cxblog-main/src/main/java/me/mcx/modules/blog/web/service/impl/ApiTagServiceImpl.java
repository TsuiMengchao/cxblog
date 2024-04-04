package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Tags;
import me.mcx.modules.blog.mapper.TagsMapper;
import me.mcx.modules.blog.web.service.ApiTagService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiTagServiceImpl implements ApiTagService {

    private final TagsMapper tagsMapper;

    /**
     *  标签列表
     * @return
     */
    @Override
    public ResponseResult selectTagList() {
        List<Tags> tags = tagsMapper.selectList(new LambdaQueryWrapper<Tags>().orderByDesc(Tags::getSort));
        return ResponseResult.success(tags);
    }
}
