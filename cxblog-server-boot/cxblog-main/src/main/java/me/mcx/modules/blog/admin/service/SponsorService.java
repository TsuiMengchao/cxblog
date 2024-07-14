package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Sponsor;

import java.util.List;


/**
 *  打赏服务类
 *
 * @author MCX
 * @since 2021-11-10
 */
public interface SponsorService extends IService<Sponsor> {


    /**
     * 列表
     * @return
     */
    ResponseResult selectSponsorList();


    /**
     * 打赏详情
     * @param id
     * @return
     */
    ResponseResult selectSponsorInfo(Integer id);

    /**
     * 修改
     * @param sponsor
     * @return
     */
    ResponseResult updateSponsor(Sponsor sponsor);

    /**
     * 删除打赏
     * @param ids
     * @return
     */
    ResponseResult deleteSponsor(List<Integer> ids);

}
