package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.SayComment;

import java.util.List;

/**
 * <p>
 * 博客文章表 服务类
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
public interface SayCommentService extends IService<SayComment> {

    ResponseResult listComment(String keywords);

    ResponseResult deleteBatch(List<Integer> ids);

}
