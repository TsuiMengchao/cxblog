package me.mcx.modules.blog.admin.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.SiteClass;
import me.mcx.modules.blog.admin.mapper.SiteClassMapper;
import me.mcx.modules.blog.admin.service.SiteClassService;
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
public class SiteClassServiceImpl extends ServiceImpl<SiteClassMapper, SiteClass> implements SiteClassService {


    @Override
    public ResponseResult selectSiteClassList() {
        Page<SiteClass> siteClassPage = baseMapper.selectPage(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()), null);
        return ResponseResult.success(siteClassPage);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertSiteClass(SiteClass siteClass) {
        baseMapper.insert(siteClass);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateSiteClass(SiteClass siteClass) {
        baseMapper.updateById(siteClass);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteBatch(List<Integer> ids) {
        baseMapper.deleteBatchIds(ids);
        return ResponseResult.success();
    }
}
