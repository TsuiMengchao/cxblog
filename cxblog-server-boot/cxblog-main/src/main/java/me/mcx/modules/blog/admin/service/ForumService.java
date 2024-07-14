package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Forum;

import java.util.List;

/**
 * <p>
 * 博客文章表 服务类
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
public interface ForumService extends IService<Forum> {


    ResponseResult selectForumList(String keywords);

    ResponseResult insertForum(Forum forum);

    ResponseResult deleteForum(List<String> ids);

    ResponseResult selectForumById(String id);

    ResponseResult updateForumById(Forum forum);
}
