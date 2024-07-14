package me.mcx.blog.service.web;

import me.mcx.blog.domain.BlogSoftware;

import java.util.List;

public interface ApiSoftwareService {

    /**
     * 开源软件列表
     * @return
     */
    List<BlogSoftware> selectSoftwareList();


}
