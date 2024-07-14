package me.mcx.modules.blog.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Talk;
import me.mcx.modules.blog.mapper.TalkMapper;
import me.mcx.modules.blog.admin.service.TalkService;
import me.mcx.utils.PageUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author MCX
 * @since 2022-01-13
 */
@Service
public class TalkServiceImpl extends ServiceImpl<TalkMapper, Talk> implements TalkService {


    @Override
    public ResponseResult selectSystemTalkList(String name) {
        LambdaQueryWrapper<Talk> queryWrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(name)) {
            queryWrapper.like(Talk::getName, name);
        }
        Page<Talk> talkPage = baseMapper.selectPage(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()), queryWrapper);
        return ResponseResult.success(talkPage);
    }

    @Override
    public ResponseResult selectSystemTalkById(Integer id) {
        Talk talk = baseMapper.selectById(id);
        return ResponseResult.success(talk);
    }

    @Override
    @Transactional(rollbackFor =  Exception.class)
    public ResponseResult addTalk(Talk talk) {
        baseMapper.insert(talk);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor =  Exception.class)
    public ResponseResult updateTalk(Talk talk) {
        baseMapper.updateById(talk);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor =  Exception.class)
    public ResponseResult deleteTalk(List<Integer> ids) {
        baseMapper.deleteBatchIds(ids);
        return ResponseResult.success();
    }
}
