package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.FriendLink;

import java.util.List;

/**
 * <p>
 * 友情链接表 服务类
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
public interface FriendLinkService extends IService<FriendLink> {

    ResponseResult listFriendLink(String name, Integer status);

    ResponseResult insertFriendLink(FriendLink friendLink);

    ResponseResult updateFriendLink(FriendLink friendLink);

    ResponseResult deleteBatch(List<Integer> ids);

    ResponseResult top(Integer id);

}
