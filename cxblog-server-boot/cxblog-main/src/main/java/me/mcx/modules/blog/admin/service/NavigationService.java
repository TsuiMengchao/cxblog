package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Navigation;

import java.util.List;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author MCX
 * @since 2022-01-13
 */
public interface NavigationService extends IService<Navigation> {

    ResponseResult selectNavigationList(Integer siteClassId);

    ResponseResult insertNavigation(Navigation navigation);

    ResponseResult updateNavigation(Navigation navigation);

    ResponseResult deleteBatch(List<Integer> ids);
}
