package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.FeedBack;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author MCX
 * @since 2022-01-13
 */
public interface FeedBackService extends IService<FeedBack> {

    ResponseResult listFeedBack(Integer type);

    ResponseResult deleteBatch(List<Integer> ids);

    ResponseResult updateFeedBack(FeedBack feedBack);
}
