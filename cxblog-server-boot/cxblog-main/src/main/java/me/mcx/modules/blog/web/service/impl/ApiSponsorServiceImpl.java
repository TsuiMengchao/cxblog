package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Sponsor;
import me.mcx.modules.blog.mapper.SponsorMapper;
import me.mcx.modules.blog.web.service.ApiSponsorService;
import me.mcx.utils.PageUtils;
import me.mcx.modules.blog.domain.vo.sponsor.SponsorListVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.utils.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


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
@RequiredArgsConstructor
public class ApiSponsorServiceImpl implements ApiSponsorService {

    private final SponsorMapper sponsorMapper;


    @Override
    public ResponseResult selectSponsorList() {
        Page<SponsorListVO> page = sponsorMapper.selectSponsorList(new Page<>(PageUtils.getPageNo(),PageUtils.getPageSize()),1);
        return ResponseResult.success(page);
    }

    @Override
    @Transactional(rollbackFor =  Exception.class)
    public ResponseResult addSponsor(String payImage) {
        Sponsor sponsor = Sponsor.builder().userId(String.valueOf(SecurityUtils.getCurrentUserId())).payImg(payImage).build();
        sponsorMapper.insert(sponsor);
        return ResponseResult.success();
    }


}
