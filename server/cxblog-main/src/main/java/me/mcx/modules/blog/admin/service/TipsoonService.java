package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Tipsoon;

import java.util.List;

/**
 * <p>
 * 博客文章表 服务类
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
public interface TipsoonService extends IService<Tipsoon> {


    ResponseResult selectTipsoonList(String keywords);

    ResponseResult insertTipsoon(Tipsoon tipsoon);

    ResponseResult deleteTipsoon(List<String> ids);

    ResponseResult selectTipsoonById(String id);

    ResponseResult updateTipsoonById(Tipsoon tipsoon);
}
