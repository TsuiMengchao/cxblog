package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.common.RedisConstants;
import me.mcx.common.ResponseResult;
import me.mcx.common.ResultCode;
import me.mcx.modules.blog.domain.Say;
import me.mcx.modules.blog.domain.SayComment;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.admin.service.RedisService;
import me.mcx.modules.blog.web.handle.RelativeDateFormat;
import me.mcx.modules.blog.web.handle.SystemNoticeHandle;
import me.mcx.modules.blog.web.im.MessageConstant;
import me.mcx.modules.blog.web.service.ApiSayService;
import me.mcx.modules.system.mapper.UserMapper;
import me.mcx.modules.blog.admin.mapper.SayCommentMapper;
import me.mcx.modules.blog.admin.mapper.SayMapper;
import me.mcx.utils.IpUtil;
import me.mcx.utils.PageUtils;
import me.mcx.modules.blog.domain.vo.ApiSayCommentVO;
import me.mcx.modules.blog.domain.vo.ApiSayVO;
import me.mcx.modules.blog.domain.vo.UserInfoVO;
import lombok.RequiredArgsConstructor;
import me.mcx.utils.RequestHolder;
import me.mcx.utils.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;


@Service
@RequiredArgsConstructor
public class ApiSayServiceImpl implements ApiSayService {

    private final SayMapper sayMapper;
    private final RedisService redisService;

    private final UserMapper userMapper;

    private final SayCommentMapper sayCommentMapper;


    @Override
    public ResponseResult selectSayList() {

        //是否显示未公开的说说 登录用户id为1时显示所有说说
        boolean showPrivate = false;
        if (SecurityUtils.isLogin() && SecurityUtils.getLoginIdDefaultNull()!=null) showPrivate = SecurityUtils.getLoginIdDefaultNull() == 1;

        Page<ApiSayVO>  sayPage = sayMapper.selectPublicSayList(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()),showPrivate);
        for (ApiSayVO item : sayPage.getRecords()) {
            //获取点赞用户信息
            Set<Object> userIdList = redisService.getCacheSet(RedisConstants.SAY_LIKE_KEY + item.getId());
            List<UserInfoVO> likeUserList = new ArrayList<>();
            for (Object userId : userIdList) {
                UserInfoVO userInfoVO = userMapper.selectInfoByUserIdTwo(userId);
                likeUserList.add(userInfoVO);
            }
            item.setCreateTimeStr(RelativeDateFormat.format(item.getCreateTime()));
            item.setUserLikeList(likeUserList);
            if (SecurityUtils.isLogin()  && SecurityUtils.getLoginIdDefaultNull()!=null){
                item.setIsLike(redisService.sIsMember(RedisConstants.SAY_LIKE_USER + SecurityUtils.getLoginIdDefaultNull(), item.getId()));
            }
            List<SayComment> sayComments = sayCommentMapper.selectList(new LambdaQueryWrapper<SayComment>().eq(SayComment::getSayId, item.getId()));
            List<ApiSayCommentVO> sayCommentVOList = new ArrayList<>();
            for (SayComment sayComment : sayComments) {
                UserInfoVO userInfoVO = userMapper.selectInfoByUserIdTwo(sayComment.getUserId());
                ApiSayCommentVO apiSayCommentVO = ApiSayCommentVO.builder().userId(sayComment.getUserId()).nickname(userInfoVO.getNickname()).replyUserId(sayComment.getReplyUserId())
                        .content(sayComment.getContent()).ipAddress(sayComment.getIpAddress()).createTime(sayComment.getCreateTime()).build();
                if (StringUtils.isNotBlank(sayComment.getReplyUserId())) {
                    userInfoVO = userMapper.selectInfoByUserIdTwo(sayComment.getReplyUserId());
                    apiSayCommentVO.setReplyUserNickname(userInfoVO.getNickname());
                }
                sayCommentVOList.add(apiSayCommentVO);
            }
            item.setSayCommentVOList(sayCommentVOList);
        }

        return ResponseResult.success(sayPage);
    }

    @Override
    public ResponseResult like(String sayId) {
        String userId = String.valueOf(SecurityUtils.getCurrentUserId());
        // 判断是否点赞
        String sayLikeUser = RedisConstants.SAY_LIKE_USER + userId;
        String sayLike = RedisConstants.SAY_LIKE_KEY + sayId;
        if (redisService.sIsMember(sayLikeUser, sayId)) {
            // 点过赞则删除说说id
            redisService.sRemove(sayLikeUser, sayId);
            redisService.sRemove(sayLike, userId);
            return ResponseResult.success("取消点赞成功");
        }
            // 未点赞则增加说说id
            redisService.sAdd(sayLikeUser, sayId);
            // 说说点赞量+1
            redisService.sAdd(sayLike, userId);

            //构建通知消息
            Say article = sayMapper.selectById(sayId);
            SystemNoticeHandle.sendNotice(article.getUserId(), MessageConstant.MESSAGE_LIKE_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE,sayId,null,null);
        return ResponseResult.success("点赞成功");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult comment(SayComment sayComment) {
        sayComment.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        HttpServletRequest request = RequestHolder.getHttpServletRequest();
        sayComment.setIp(me.mcx.utils.StringUtils.getIp(request));
        sayComment.setIpAddress(IpUtil.getIp2region(sayComment.getIp()));
        sayCommentMapper.insert(sayComment);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertSay(Say say) {
        String userId = String.valueOf(SecurityUtils.getCurrentUserId());
        say.setUserId(userId);
        say.setCreateTime(new Date());
        sayMapper.insert(say);
        return ResponseResult.success();
    }
}
