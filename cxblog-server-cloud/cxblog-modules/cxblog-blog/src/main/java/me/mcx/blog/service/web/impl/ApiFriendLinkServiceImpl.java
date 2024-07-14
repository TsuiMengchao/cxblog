package me.mcx.blog.service.web.impl;

import cn.hutool.core.thread.ThreadUtil;
import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.BlogFriendLink;
import me.mcx.blog.domain.vo.friendLink.ApiFriendLinkVO;
import me.mcx.blog.mapper.BlogFriendLinkMapper;
import me.mcx.blog.service.web.ApiFriendLinkService;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.msg.api.RemoteEmailService;
import me.mcx.msg.api.domain.MsgEmail;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static me.mcx.blog.enums.FriendLinkEnum.APPLY;
import static me.mcx.blog.enums.FriendLinkEnum.UP;

@Service
@RequiredArgsConstructor
public class ApiFriendLinkServiceImpl implements ApiFriendLinkService {

    private final BlogFriendLinkMapper blogFriendLinkMapper;

    private final BlogFriendLinkMapper friendLinkMapper;

    private final RemoteEmailService remoteEmailService;

    /**
     * 友链列表
     * @return
     */
    @Override
    public AjaxResult selectFriendLinkList() {
        List<ApiFriendLinkVO> list = friendLinkMapper.selectLinkList(UP.code);
        return AjaxResult.success(list);
    }

    /**
     * 申请友链
     * @param friendLink
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addFriendLink(BlogFriendLink friendLink) {

        //如果已经申请过友链 再次接入则会进行下架处理 需重新审核
        List<BlogFriendLink> entity = blogFriendLinkMapper.selectBlogFriendLinkList(new BlogFriendLink(){{setUrl(friendLink.getUrl());}});
        if (entity.size() >= 1){
            throw new ServiceException("友链已存在，如需修改请留言!");
        }
        friendLink.setStatus(Long.valueOf(APPLY.getCode()));
        blogFriendLinkMapper.insertBlogFriendLink(friendLink);
//        //异步操作邮箱发送
        ThreadUtil.execAsync(() -> {
            remoteEmailService.send(new MsgEmail() {{
                setSubject("友链接入通知");
                setContent("网站有新的友链接入啦("+friendLink.getUrl()+")，快去审核吧!!!");
                setTos("484132820@qq.com");
            }});
        });
        return AjaxResult.success();
    }
}
