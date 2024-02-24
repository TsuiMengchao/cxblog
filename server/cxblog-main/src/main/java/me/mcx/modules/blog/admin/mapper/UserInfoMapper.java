package me.mcx.modules.blog.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.mcx.modules.blog.domain.UserInfo;
import me.mcx.modules.blog.domain.vo.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author MCX
 * @since 2021-12-25
 */
@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {

    void deleteByUserIds(@Param("ids") List<String> ids);

    /**
     * 根据用户id获取用户信息
     * @param loginId 用户id
     * @return
     */
    UserInfo getByUserId(Object loginId);

    UserInfoVO selectUserInfoByUserId(String userId);

}
