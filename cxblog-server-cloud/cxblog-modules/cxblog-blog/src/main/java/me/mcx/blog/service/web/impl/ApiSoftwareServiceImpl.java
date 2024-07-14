package me.mcx.blog.service.web.impl;

import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.BlogSoftware;
import me.mcx.blog.mapper.BlogSoftwareMapper;
import me.mcx.blog.service.web.ApiSoftwareService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiSoftwareServiceImpl implements ApiSoftwareService {

    private final BlogSoftwareMapper softwareMapper;

    @Override
    public List<BlogSoftware> selectSoftwareList() {
        List<BlogSoftware> softwares = softwareMapper.selectBlogSoftwareList(null);
        return softwares;
    }
}
