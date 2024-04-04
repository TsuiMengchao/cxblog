package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.SiteClass;

import java.util.List;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author MCX
 * @since 2022-01-13
 */
public interface SiteClassService extends IService<SiteClass> {


    ResponseResult selectSiteClassList();


    ResponseResult insertSiteClass(SiteClass siteClass);

    ResponseResult updateSiteClass(SiteClass siteClass);


    ResponseResult deleteBatch(List<Integer> ids);

}
