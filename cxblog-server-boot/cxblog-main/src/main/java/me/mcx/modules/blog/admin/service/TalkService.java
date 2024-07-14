package me.mcx.modules.blog.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Talk;

import java.util.List;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author MCX
 * @since 2022-01-13
 */
public interface TalkService extends IService<Talk> {

    /**
     * 圈子列表
     * @param pageNo
     * @param pageSize
     * @return
     */
    ResponseResult selectSystemTalkList(String name);

    /**
     * 圈子详情
     * @param id
     * @return
     */
    ResponseResult selectSystemTalkById(Integer id);


    /**
     * 添加圈子
     * @param talk
     * @return
     */
    ResponseResult addTalk(Talk talk);

    /**
     * 修改圈子
     * @param talk
     * @return
     */
    ResponseResult updateTalk(Talk talk);

    /**
     * 批量删除圈子
     * @param ids
     * @return
     */
    ResponseResult deleteTalk(List<Integer> ids);

}
