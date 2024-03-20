package me.mcx.modules.blog.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.mapper.TipsoonMapper;
import me.mcx.modules.blog.admin.service.TipsoonService;
import me.mcx.modules.blog.domain.Tipsoon;
import me.mcx.utils.PageUtils;
import me.mcx.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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
public class TipsoonServiceImpl extends ServiceImpl<TipsoonMapper, Tipsoon> implements TipsoonService {


    @Override
    public ResponseResult selectTipsoonList(String keywords) {
        LambdaQueryWrapper<Tipsoon> tipsoonLambdaQueryWrapper = new LambdaQueryWrapper<>();
        tipsoonLambdaQueryWrapper.orderByDesc(Tipsoon::getCreateTime);
        Page<Tipsoon> tipsoonPage = baseMapper.selectPage(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()),tipsoonLambdaQueryWrapper);
        return ResponseResult.success(tipsoonPage);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertTipsoon(Tipsoon tipsoon) {
        tipsoon.setUserId(SecurityUtils.getCurrentUserId().toString());
        tipsoon.setCreateTime(new Date());
        baseMapper.insert(tipsoon);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteTipsoon(List<String> ids) {
        baseMapper.deleteBatchIds(ids);
        return ResponseResult.success();
    }

    @Override
    public ResponseResult selectTipsoonById(String id) {
        Tipsoon tipsoon = baseMapper.selectById(id);
        return ResponseResult.success(tipsoon);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateTipsoonById(Tipsoon tipsoon) {
        baseMapper.updateById(tipsoon);
        return ResponseResult.success();
    }
}
