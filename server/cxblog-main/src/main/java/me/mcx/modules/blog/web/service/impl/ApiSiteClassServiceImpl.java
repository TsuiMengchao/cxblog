package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Navigation;
import me.mcx.modules.blog.domain.SiteClass;
import me.mcx.modules.blog.admin.mapper.NavigationMapper;
import me.mcx.modules.blog.admin.mapper.SiteClassMapper;
import me.mcx.modules.blog.web.service.ApiSiteClassService;
import me.mcx.modules.blog.domain.vo.ApiNavigationVO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiSiteClassServiceImpl implements ApiSiteClassService {

    private final SiteClassMapper siteClassMapper;

    private final NavigationMapper navigationMapper;


    @Override
    public ResponseResult selectNavigationList() {
        List<ApiNavigationVO> list = new ArrayList<>();
        List<SiteClass> siteClasses = siteClassMapper.selectList(new LambdaQueryWrapper<SiteClass>().orderByDesc(SiteClass::getSort));
        for (SiteClass siteClass : siteClasses) {

            List<Navigation> navigations = navigationMapper.selectList(new LambdaQueryWrapper<Navigation>()
                    .eq(Navigation::getSiteClassId, siteClass.getId()));
            if (ObjectUtils.isEmpty(navigations)) {
                continue;
            }
            ApiNavigationVO vo = ApiNavigationVO.builder().siteClassName(siteClass.getName()).navigations(navigations).build();
            list.add(vo);
        }
        return ResponseResult.success(list);
    }
}
