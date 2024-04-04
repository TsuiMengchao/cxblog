package me.mcx.modules.blog.admin.service.impl;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.mapper.SponsorMapper;
import me.mcx.modules.blog.domain.Sponsor;
import me.mcx.modules.blog.admin.service.SponsorService;
import me.mcx.utils.PageUtils;
import me.mcx.modules.blog.domain.vo.sponsor.SponsorListVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author MCX
 * @since 2021-11-10
 */
@Slf4j
@Service
public class SponsorServiceImpl extends ServiceImpl<SponsorMapper, Sponsor> implements SponsorService {

    @Override
    public ResponseResult selectSponsorList() {
        Page<SponsorListVO> page = baseMapper.selectSponsorList(new Page<>(PageUtils.getPageNo(),PageUtils.getPageSize()),null);
        return ResponseResult.success(page);
    }

    @Override
    public ResponseResult selectSponsorInfo(Integer id) {
        Sponsor sponsor = baseMapper.selectById(id);
        return ResponseResult.success(sponsor);
    }

    @Override
    @Transactional(rollbackFor =  Exception.class)
    public ResponseResult updateSponsor(Sponsor sponsor) {
        baseMapper.updateById(sponsor);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor =  Exception.class)
    public ResponseResult deleteSponsor(List<Integer> ids) {
        baseMapper.deleteBatchIds(ids);
        return ResponseResult.success();
    }
}
