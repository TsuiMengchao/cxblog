package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Say;

import java.util.List;

/**
 * <p>
 * 博客文章表 服务类
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
public interface SayService extends IService<Say> {


    ResponseResult selectSayList(String keywords);

    ResponseResult insertSay(Say say);

    ResponseResult deleteSay(List<String> ids);

    ResponseResult selectSayById(String id);

    ResponseResult updateSayById(Say say);
}
