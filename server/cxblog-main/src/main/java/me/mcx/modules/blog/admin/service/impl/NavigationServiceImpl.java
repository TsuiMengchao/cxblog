package me.mcx.modules.blog.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Navigation;
import me.mcx.modules.blog.admin.mapper.NavigationMapper;
import me.mcx.modules.blog.admin.service.NavigationService;
import me.mcx.utils.PageUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author MCX
 * @since 2021-11-10
 */
@Service
public class NavigationServiceImpl extends ServiceImpl<NavigationMapper, Navigation> implements NavigationService {


    @Override
    public ResponseResult selectNavigationList(Integer siteClassId) {
        Page<Navigation> siteClassPage = baseMapper.selectPage(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()),
                new LambdaQueryWrapper<Navigation>().eq(Navigation::getSiteClassId,siteClassId));
        return ResponseResult.success(siteClassPage);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertNavigation(Navigation navigation) {
        baseMapper.insert(navigation);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateNavigation(Navigation navigation) {
        baseMapper.updateById(navigation);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteBatch(List<Integer> ids) {
        baseMapper.deleteBatchIds(ids);
        return ResponseResult.success();
    }
}
