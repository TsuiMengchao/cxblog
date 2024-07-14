package me.mcx.blog.service.web.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.*;
import me.mcx.blog.domain.dto.user.UserInfoDTO;
import me.mcx.blog.mapper.*;
import me.mcx.blog.service.web.ApiUserService;
import me.mcx.blog.util.BeanCopyUtil;
import me.mcx.common.core.constant.Constants;
import me.mcx.common.core.constant.SecurityConstants;
import me.mcx.common.core.domain.R;
import me.mcx.common.core.utils.StringUtils;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.system.api.RemoteUserInfoService;
import me.mcx.system.api.RemoteUserService;
import me.mcx.system.api.domain.SysUserInfo;
import me.mcx.system.api.model.user.UserInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class ApiUserServiceImpl implements ApiUserService {

    @Autowired
    private RemoteUserInfoService remoteUserInfoService;

    private final BlogArticleMapper articleMapper;

    private final BlogArticleCollectMapper collectMapper;

    private final BlogFollowedMapper followedMapper;

    private final String[] userAvatarList = {"http://img.shiyit.com/avatars/buxie.png","http://img.shiyit.com/avatars/daizhi.png",
            "http://img.shiyit.com/avatars/fennu.png","http://img.shiyit.com/avatars/jingxi.png","http://img.shiyit.com/avatars/kaixin.png",
            "http://img.shiyit.com/avatars/shuanshuai.png"};


    /**
     * 获取用户信息
     *
     * @return
     */
    @Override
    public AjaxResult selectUserInfo(String userId) {
        userId = StringUtils.isNotBlank(userId) ? userId : SecurityUtils.getLoginIdAsString();
        R<UserInfoVO> userInfo = remoteUserInfoService.selectUserInfoByUserId(userId, SecurityConstants.INNER);
        return AjaxResult.success(userInfo.getData());
    }

    /**
     * 修改用户信息
     *
     * @param vo
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult updateUser(UserInfoDTO vo) {
        R<UserInfoVO> userInfoVo = remoteUserInfoService.getByUserId(SecurityUtils.getLoginIdAsString(), SecurityConstants.INNER);
        if (StringUtils.isNull(userInfoVo) || StringUtils.isNull(userInfoVo.getData()))
        {
            throw new ServiceException("用户不存在");
        }
        SysUserInfo userInfo = BeanCopyUtil.copyObject(vo, SysUserInfo.class);
        userInfo.setId(Long.valueOf(userInfoVo.getData().getUserInfoId()));
        return remoteUserInfoService.updateUserInfo(userInfo, SecurityConstants.INNER);
    }

    /**
     * 根据token获取用户信息
     *
     * @param token
     * @return
     */
    @Override
    public AjaxResult selectUserInfoByToken(String token) {
        Object userId = SecurityUtils.getUserId();
        R<UserInfoVO> userInfoVO = remoteUserInfoService.selectInfoByUserIdNew(String.valueOf(userId), SecurityConstants.INNER);
        return AjaxResult.success(userInfoVO.getData());
    }

    @Override
    public AjaxResult getUserCount(String id) {
        id = StringUtils.isBlank(id) ? SecurityUtils.getLoginIdAsString() : id;
        String finalId = id;
        Integer articleCount = articleMapper.selectCount(new BlogArticle(){{setUserId(finalId);}});
        Integer collectCount = collectMapper.selectCount(new BlogArticleCollect(){{setUserId(finalId);}});
        Integer followedCount = followedMapper.selectCount(new BlogFollowed(){{setUserId(finalId);}});
        return AjaxResult.success().put("articleCount", articleCount).put("collectCount", collectCount)
                .put("followedCount", followedCount);
    }
}
