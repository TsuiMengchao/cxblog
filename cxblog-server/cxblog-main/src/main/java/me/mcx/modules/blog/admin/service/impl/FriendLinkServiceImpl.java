package me.mcx.modules.blog.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import me.mcx.common.FieldConstants;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.FriendLink;
import me.mcx.modules.blog.mapper.FriendLinkMapper;
import me.mcx.modules.blog.admin.service.FriendLinkService;
import me.mcx.service.EmailService;
import me.mcx.utils.PageUtils;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static me.mcx.utils.enums.FriendLinkEnum.DOWN;
import static me.mcx.utils.enums.FriendLinkEnum.UP;


/**
 * <p>
 * 友情链接表 服务实现类
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Service
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class FriendLinkServiceImpl extends ServiceImpl<FriendLinkMapper, FriendLink> implements FriendLinkService {

    private final EmailService emailService;

    /**
     * 友链列表
     * @param name
     * @param status
     * @return
     */
    @Override
    public ResponseResult listFriendLink(String name, Integer status) {
        QueryWrapper<FriendLink> queryWrapper= new QueryWrapper<FriendLink>()
                .orderByDesc(FieldConstants.DICT_SORT).like(StringUtils.isNotBlank(name), FieldConstants.NAME,name)
                .eq(status != null, FieldConstants.STATUS,status);
        Page<FriendLink> friendLinkPage = baseMapper.selectPage(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()),queryWrapper);
        return ResponseResult.success(friendLinkPage);
    }

    /**
     * 添加友链
     * @param friendLink
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertFriendLink(FriendLink friendLink) {
        baseMapper.insert(friendLink);
        return ResponseResult.success();
    }

    /**
     * 修改友链
     * @param friendLink
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateFriendLink(FriendLink friendLink) {
        baseMapper.updateById(friendLink);

        if (friendLink.getEmail() != null) {
            //审核通过和未通过发送邮件通知
            if (friendLink.getStatus() == UP.getCode()) {
                emailService.friendPassSendEmail(friendLink.getEmail());
            } else if (friendLink.getStatus() == DOWN.getCode()) {
                emailService.friendFailedSendEmail(friendLink.getEmail(), friendLink.getReason());
            }
        }
        return ResponseResult.success();
    }

    /**
     * 删除友链
     * @param ids
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteBatch(List<Integer> ids) {
        int rows = baseMapper.deleteBatchIds(ids);
        return rows > 0 ? ResponseResult.success(): ResponseResult.error("删除友链失败");
    }

    /**
     * 置顶友链
     * @param id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult top(Integer id) {
        Integer sort = baseMapper.getMaxSort();
        baseMapper.top(id,sort+1);
        return ResponseResult.success();
    }


}
