package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import me.mcx.common.FieldConstants;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.FriendLink;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.mapper.FriendLinkMapper;
import me.mcx.modules.blog.web.service.ApiFriendLinkService;
import me.mcx.modules.blog.domain.vo.ApiFriendLinkVO;
import lombok.RequiredArgsConstructor;
import me.mcx.service.EmailService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static me.mcx.utils.enums.FriendLinkEnum.APPLY;
import static me.mcx.utils.enums.FriendLinkEnum.UP;

@Service
@RequiredArgsConstructor
public class ApiFriendLinkServiceImpl implements ApiFriendLinkService {

    private final FriendLinkMapper friendLinkMapper;

    private final EmailService emailService;

    /**
     * 友链列表
     * @return
     */
    @Override
    public ResponseResult selectFriendLinkList() {
        List<ApiFriendLinkVO> list = friendLinkMapper.selectLinkList(UP.code);
        return ResponseResult.success(list);
    }

    /**
     * 申请友链
     * @param friendLink
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertFriendLink(FriendLink friendLink) {

        //如果已经申请过友链 再次接入则会进行下架处理 需重新审核
        FriendLink entity = friendLinkMapper.selectOne(new QueryWrapper<FriendLink>()
                .eq(FieldConstants.URL,friendLink.getUrl()));
        if (entity != null){
            throw new BusinessException("友链已存在，如需修改请留言!");
        }
        friendLink.setStatus(APPLY.getCode());
        friendLinkMapper.insert(friendLink);
        //异步操作邮箱发送
        emailService.emailNoticeMe("友链接入通知","网站有新的友链接入啦("+friendLink.getUrl()+")，快去审核吧!!!");
        return ResponseResult.success();
    }
}
