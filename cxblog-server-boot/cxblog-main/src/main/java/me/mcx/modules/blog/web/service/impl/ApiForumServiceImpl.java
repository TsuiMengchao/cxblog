package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.*;
import me.mcx.modules.blog.web.handle.RelativeDateFormat;
import me.mcx.modules.blog.web.service.ApiForumService;
import me.mcx.modules.blog.mapper.FollowedMapper;
import me.mcx.modules.blog.mapper.ForumCommentMapper;
import me.mcx.modules.blog.mapper.ForumMapper;
import me.mcx.modules.blog.mapper.UserInfoMapper;
import me.mcx.utils.PageUtils;
import me.mcx.modules.blog.domain.vo.talk.ApiForumCommentListVO;
import me.mcx.modules.blog.domain.vo.talk.ApiForumLikeListVO;
import me.mcx.modules.blog.domain.vo.talk.ApiForumListVO;
import lombok.RequiredArgsConstructor;
import me.mcx.utils.RequestHolder;
import me.mcx.utils.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author: 辰雪
 * @date: 2023/10/16
 * @describe:
 */
@Service
@RequiredArgsConstructor
public class ApiForumServiceImpl implements ApiForumService {

    private final ForumMapper forumMapper;

    private final ForumCommentMapper forumCommentMapper;

    private final UserInfoMapper userInfoMapper;

    private final FollowedMapper followedMapper;

    @Override
    public ResponseResult selectForumListByTalkId(Integer talkId, String orderBy) {
        Page<ApiForumListVO> page = new Page<>();
        if (StringUtils.isNotBlank(orderBy) && orderBy.equals("followed") &&  SecurityUtils.isLogin()) {
            List<Followed>  followedList = followedMapper.selectList(new LambdaQueryWrapper<Followed>().eq(Followed::getUserId, SecurityUtils.getCurrentUserId()));
            if (followedList.size() > 0) {
                page = forumMapper.selectForumListByTalkId(new Page<>(PageUtils.getPageNo(),PageUtils.getPageSize()),talkId,followedList);
            }
        }else {
            page = forumMapper.selectForumListByTalkId(new Page<>(PageUtils.getPageNo(),PageUtils.getPageSize()),talkId,null);
        }

        page.getRecords().forEach(item ->{
            String format = RelativeDateFormat.format(item.getCreateTime());
            Integer count = Math.toIntExact(forumCommentMapper.selectCount(new LambdaQueryWrapper<ForumComment>().eq(ForumComment::getForumId, item.getId())));
            item.setCommentCount(count);
            int likeCount = forumMapper.countForumLike(item.getId());
            item.setLikeCount(likeCount);
            if (SecurityUtils.getLoginIdDefaultNull() != null) {
                int flag = forumMapper.selectForumUserIsLike(item.getId(), String.valueOf(SecurityUtils.getCurrentUserId()));
                item.setIsLike(flag);
            }
            Page<ApiForumLikeListVO> likePages = forumMapper.selectForumLikeList(new Page<>(1,3),item.getId());
            item.setLikeListVO(likePages.getRecords());
            item.setCreateTimeStr(format);
        });
        return ResponseResult.success(page);
    }

    @Override
    public ResponseResult getForumById(Integer forumId) {

        ApiForumListVO forumVO = forumMapper.getForumById(forumId);


            String format = RelativeDateFormat.format(forumVO.getCreateTime());
            Integer count = Math.toIntExact(forumCommentMapper.selectCount(new LambdaQueryWrapper<ForumComment>().eq(ForumComment::getForumId, forumVO.getId())));
        forumVO.setCommentCount(count);
            int likeCount = forumMapper.countForumLike(forumVO.getId());
        forumVO.setLikeCount(likeCount);
            if (SecurityUtils.getLoginIdDefaultNull() != null) {
                int flag = forumMapper.selectForumUserIsLike(forumVO.getId(), String.valueOf(SecurityUtils.getCurrentUserId()));
                forumVO.setIsLike(flag);
                int followed = Math.toIntExact(followedMapper.selectCount(new LambdaQueryWrapper<Followed>().eq(Followed::getUserId, SecurityUtils.getCurrentUserId())
                        .eq(Followed::getFollowedUserId, forumVO.getUserId())));
                forumVO.setIsFollowed(followed);
            }
            Page<ApiForumLikeListVO> likePages = forumMapper.selectForumLikeList(new Page<>(1,3),forumVO.getId());
        forumVO.setLikeListVO(likePages.getRecords());
        forumVO.setCreateTimeStr(format);

        return ResponseResult.success(forumVO);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult addForum(Forum forum) {
        forum.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        forumMapper.insert(forum);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult comment(ForumComment forumComment) {
        forumComment.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        HttpServletRequest request = RequestHolder.getHttpServletRequest();
        String ip = me.mcx.utils.StringUtils.getIp(request);
        String address = me.mcx.utils.StringUtils.getCityInfo(ip);
        forumComment.setIp(ip);
        forumComment.setAddress(address);
        forumCommentMapper.insert(forumComment);
        return ResponseResult.success();
    }

    @Override
    public ResponseResult commentList(Integer forumId) {
        Page<ApiForumCommentListVO> list = forumCommentMapper.selectListByForumId(new Page<>(PageUtils.getPageNo(),PageUtils.getPageSize()),forumId);
        //获取子级
        for (ApiForumCommentListVO vo : list.getRecords()) {
            List<ForumComment> commentList = forumCommentMapper.selectList(
                    new LambdaQueryWrapper<ForumComment>().eq(ForumComment::getParentId, vo.getId()).orderByDesc(ForumComment::getCreateTime));
            for (ForumComment e : commentList) {
                UserInfo replyUserInfo = userInfoMapper.getByUserId(e.getReplyUserId());
                UserInfo userInfo1 = userInfoMapper.getByUserId(e.getUserId());
                ApiForumCommentListVO apiForumCommentListVO = ApiForumCommentListVO.builder()
                        .id(e.getId())
                        .userId(e.getUserId())
                        .replyUserId(e.getReplyUserId())
                        .nickname(userInfo1.getNickname())
                        .replyNickname(replyUserInfo.getNickname())
                        .content(e.getContent())
                        .avatar(userInfo1.getAvatar())
                        .createTimeStr(RelativeDateFormat.format(e.getCreateTime()))
                        .address(e.getAddress())
                        .build();
                vo.getChildren().add(apiForumCommentListVO);
            }
            vo.setCreateTimeStr(RelativeDateFormat.format(vo.getCreateTime()));
        }
        return ResponseResult.success(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult like(Integer forumId) {
        int count = forumMapper.selectForumUserIsLike(forumId, String.valueOf(SecurityUtils.getCurrentUserId()));
        if (count > 0) {
            forumMapper.deleteForumLikeByUerIdAndForumId(forumId, String.valueOf(SecurityUtils.getCurrentUserId()));
            return ResponseResult.success("取消点赞");

        }
        forumMapper.insertForumLike(forumId, String.valueOf(SecurityUtils.getCurrentUserId()));
        return ResponseResult.success("点赞成功");
    }

    @Override
    public ResponseResult likeList(Integer forumId) {
        Object userId = SecurityUtils.getLoginIdDefaultNull();
        Page<ApiForumLikeListVO> likePages = forumMapper.selectForumLikeList(new Page<>(PageUtils.getPageNo(),PageUtils.getPageSize()),forumId);
        likePages.getRecords().forEach(item ->{
            if (userId != null){
                int count = Math.toIntExact(followedMapper.selectCount(new LambdaQueryWrapper<Followed>().eq(Followed::getUserId, userId).eq(Followed::getFollowedUserId, item.getUserId())));
                item.setIsFollowed(count);
            }
        });
        return ResponseResult.success(likePages);
    }
}
