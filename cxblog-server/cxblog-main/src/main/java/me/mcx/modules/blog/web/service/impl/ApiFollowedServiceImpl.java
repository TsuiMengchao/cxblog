package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Followed;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.web.handle.SystemNoticeHandle;
import me.mcx.modules.blog.web.im.MessageConstant;
import me.mcx.modules.blog.web.service.ApiFollowedService;
import me.mcx.modules.blog.mapper.FollowedMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.utils.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Slf4j
@Service
@RequiredArgsConstructor
public class ApiFollowedServiceImpl implements ApiFollowedService {

    private final FollowedMapper followedMapper;


    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertFollowed(String userId) {
        if (StringUtils.isBlank(userId)) {
            throw new BusinessException("被关注用户id不能为空！");
        }
        if (userId.equals(SecurityUtils.getCurrentUserId().toString())) {
            throw new BusinessException("不能关注自己哦！");
        }
        Followed followed = Followed.builder().userId(String.valueOf(SecurityUtils.getCurrentUserId())).followedUserId(userId).build();
        followedMapper.insert(followed);
        // 发送系统通知
        SystemNoticeHandle.sendNotice(userId, MessageConstant.MESSAGE_WATCH_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE,null,null,null);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteFollowed(String userId) {
        if (StringUtils.isBlank(userId)) {
            throw new BusinessException("被关注用户id不能为空！");
        }
        followedMapper.delete(new LambdaQueryWrapper<Followed>().eq(Followed::getUserId,SecurityUtils.getCurrentUserId()).eq(Followed::getFollowedUserId,userId));
        return ResponseResult.success();
    }
}
