package me.mcx.modules.blog.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Say;
import me.mcx.modules.blog.mapper.SayMapper;
import me.mcx.modules.blog.admin.service.SayService;
import me.mcx.utils.PageUtils;
import lombok.RequiredArgsConstructor;
import me.mcx.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * <p>
 * 博客文章表 服务实现类
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Service
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SayServiceImpl extends ServiceImpl<SayMapper, Say> implements SayService {


    @Override
    public ResponseResult selectSayList(String keywords) {
        LambdaQueryWrapper<Say> sayLambdaQueryWrapper = new LambdaQueryWrapper<>();
        if (!SecurityUtils.hasRole("admin")) {
            sayLambdaQueryWrapper.eq(Say::getIsPublic,1);
        }
        sayLambdaQueryWrapper.orderByDesc(Say::getCreateTime);
        Page<Say> sayPage = baseMapper.selectPage(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()),sayLambdaQueryWrapper);
        return ResponseResult.success(sayPage);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertSay(Say say) {
        say.setUserId(SecurityUtils.getCurrentUserId().toString());
        baseMapper.insert(say);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteSay(List<String> ids) {
        baseMapper.deleteBatchIds(ids);
        return ResponseResult.success();
    }

    @Override
    public ResponseResult selectSayById(String id) {
        Say say = baseMapper.selectById(id);
        return ResponseResult.success(say);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateSayById(Say say) {
        baseMapper.updateById(say);
        return ResponseResult.success();
    }
}
