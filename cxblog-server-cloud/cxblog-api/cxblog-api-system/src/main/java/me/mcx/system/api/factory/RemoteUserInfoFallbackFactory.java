package me.mcx.system.api.factory;

import me.mcx.common.core.domain.R;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.system.api.RemoteUserInfoService;
import me.mcx.system.api.domain.SysUser;
import me.mcx.system.api.domain.SysUserInfo;
import me.mcx.system.api.model.user.UserInfoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 用户信息服务降级处理
 * 
 * @author cxblog
 */
@Component
public class RemoteUserInfoFallbackFactory implements FallbackFactory<RemoteUserInfoService>
{
    private static final Logger log = LoggerFactory.getLogger(RemoteUserInfoFallbackFactory.class);

    @Override
    public RemoteUserInfoService create(Throwable throwable)
    {
        log.error("用户信息服务调用失败:{}", throwable.getMessage());
        return new RemoteUserInfoService()
        {
            @Override
            public R<UserInfoVO> selectUserInfoByUserId(String userId, String source)
            {
                return R.fail("获取用户信息失败:" + throwable.getMessage());
            }
            @Override
            public R<UserInfoVO> selectInfoByUserId(String userId, String source)
            {
                return R.fail("获取用户信息失败:" + throwable.getMessage());
            }
            @Override
            public R<UserInfoVO> selectInfoByUserIdNew(String userId, String source)
            {
                return R.fail("获取用户信息失败:" + throwable.getMessage());
            }
            @Override
            public R<UserInfoVO> selectInfoByUserIdTwo(Object userId, String source)
            {
                return R.fail("获取用户信息失败:" + throwable.getMessage());
            }
            @Override
            public R<UserInfoVO> getByUserId(String userId, String source)
            {
                return R.fail("获取用户信息失败:" + throwable.getMessage());
            }
            @Override
            public AjaxResult updateUserInfo(SysUserInfo sysUserInfo, String source)
            {
                return AjaxResult.error("更新用户信息失败:" + throwable.getMessage());
            }
        };
    }
}
