package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import me.mcx.common.ResponseResult;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.domain.ArticleCollect;
import me.mcx.modules.blog.domain.UserInfo;
import me.mcx.modules.blog.mapper.TipsoonCommentMapper;
import me.mcx.modules.blog.mapper.TipsoonMapper;
import me.mcx.modules.blog.domain.TipsoonComment;
import me.mcx.modules.blog.domain.Tipsoon;
import me.mcx.modules.blog.domain.vo.tipsoon.ApiTipsoonCommentVO;
import me.mcx.modules.blog.domain.vo.tipsoon.ApiTipsoonLikeListVO;
import me.mcx.modules.blog.domain.vo.tipsoon.ApiTipsoonVO;
import me.mcx.modules.blog.domain.vo.UserInfoVO;
import me.mcx.modules.blog.mapper.UserInfoMapper;
import me.mcx.modules.blog.web.handle.RelativeDateFormat;
import me.mcx.modules.blog.web.service.ApiTipsoonService;
import me.mcx.modules.system.mapper.UserMapper;
import me.mcx.utils.PageUtils;
import me.mcx.utils.RequestHolder;
import me.mcx.utils.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


@Service
@RequiredArgsConstructor
public class ApiTipsoonServiceImpl implements ApiTipsoonService {

    private final TipsoonMapper tipsoonMapper;

    private final UserMapper userMapper;

    private final TipsoonCommentMapper tipsoonCommentMapper;

    private final UserInfoMapper userInfoMapper;


    @Override
    public ResponseResult selectTipsoon() {
        Long id = SecurityUtils.getLoginIdDefaultNull();
        ApiTipsoonVO  tipsoon = tipsoonMapper.selectTipsoon(Math.toIntExact(id!=null? id:0));
        if (tipsoon==null) throw new BusinessException(204, "已加载全部数据");

        Integer count = Math.toIntExact(tipsoonCommentMapper.selectCount(new LambdaQueryWrapper<TipsoonComment>().eq(TipsoonComment::getTipsoonId, tipsoon.getId())));
        tipsoon.setCommentCount(count);
        int likeCount = tipsoonMapper.countTipsoonLike(tipsoon.getId());
        tipsoon.setLikeCount(likeCount);
        if (SecurityUtils.getLoginIdDefaultNull() != null) {
            int flag = tipsoonMapper.selectTipsoonUserIsLike(tipsoon.getId(), String.valueOf(SecurityUtils.getCurrentUserId()));
            tipsoon.setIsLike(flag == 1);
        }
        Page<ApiTipsoonLikeListVO> likePages = tipsoonMapper.selectTipsoonLikeList(new Page<>(1,3),tipsoon.getId());
        tipsoon.setLikeListVO(likePages.getRecords());

        List<TipsoonComment> tipsoonComments = tipsoonCommentMapper.selectList(new LambdaQueryWrapper<TipsoonComment>().eq(TipsoonComment::getTipsoonId, tipsoon.getId()));
        List<ApiTipsoonCommentVO> tipsoonCommentVOList = new ArrayList<>();
        for (TipsoonComment tipsoonComment : tipsoonComments) {
            UserInfoVO userInfoVO = userMapper.selectInfoByUserIdTwo(tipsoonComment.getUserId());
            ApiTipsoonCommentVO apiTipsoonCommentVO = ApiTipsoonCommentVO.builder().userId(tipsoonComment.getUserId()).nickname(userInfoVO.getNickname()).replyUserId(tipsoonComment.getReplyUserId())
                    .content(tipsoonComment.getContent()).address(tipsoonComment.getAddress()).createTime(tipsoonComment.getCreateTime()).build();
            if (StringUtils.isNotBlank(tipsoonComment.getReplyUserId())) {
                userInfoVO = userMapper.selectInfoByUserIdTwo(tipsoonComment.getReplyUserId());
                apiTipsoonCommentVO.setReplyUserNickname(userInfoVO.getNickname());
            }
            tipsoonCommentVOList.add(apiTipsoonCommentVO);
        }
        tipsoon.setTipsoonCommentVOList(tipsoonCommentVOList);

        if(id!=null) tipsoonMapper.insertTipsoonReaded(tipsoon.getId(), String.valueOf(SecurityUtils.getCurrentUserId()));

        return ResponseResult.success(tipsoon);
    }

    @Override
    public ResponseResult select10Tipsoon() {
        Long id = SecurityUtils.getLoginIdDefaultNull();
        List<ApiTipsoonVO>  tipsoonPages = tipsoonMapper.select10Tipsoon(Math.toIntExact(id!=null? id:0));
        if (tipsoonPages==null) throw new BusinessException(204, "已加载全部数据");

        for (ApiTipsoonVO tipsoon : tipsoonPages) {
            Integer count = Math.toIntExact(tipsoonCommentMapper.selectCount(new LambdaQueryWrapper<TipsoonComment>().eq(TipsoonComment::getTipsoonId, tipsoon.getId())));
            tipsoon.setCommentCount(count);
            int likeCount = tipsoonMapper.countTipsoonLike(tipsoon.getId());
            tipsoon.setLikeCount(likeCount);
            if (SecurityUtils.getLoginIdDefaultNull() != null) {
                int flag = tipsoonMapper.selectTipsoonUserIsLike(tipsoon.getId(), String.valueOf(SecurityUtils.getCurrentUserId()));
                tipsoon.setIsLike(flag == 1);
            }
            Page<ApiTipsoonLikeListVO> likePages = tipsoonMapper.selectTipsoonLikeList(new Page<>(1, 3), tipsoon.getId());
            tipsoon.setLikeListVO(likePages.getRecords());

            //获取收藏量
            int collectCount = Math.toIntExact(tipsoonMapper.countTipsoonCollect(tipsoon.getId()));
            tipsoon.setCollectCount(collectCount);
            if (SecurityUtils.getLoginIdDefaultNull() != null) {
                int flag = tipsoonMapper.selectTipsoonUserIsCollect(tipsoon.getId(), String.valueOf(SecurityUtils.getCurrentUserId()));
                tipsoon.setIsCollect(flag == 1);
            }

            List<TipsoonComment> tipsoonComments = tipsoonCommentMapper.selectList(new LambdaQueryWrapper<TipsoonComment>().eq(TipsoonComment::getTipsoonId, tipsoon.getId()));
            List<ApiTipsoonCommentVO> tipsoonCommentVOList = new ArrayList<>();
            for (TipsoonComment tipsoonComment : tipsoonComments) {
                UserInfoVO userInfoVO = userMapper.selectInfoByUserIdTwo(tipsoonComment.getUserId());
                ApiTipsoonCommentVO apiTipsoonCommentVO = ApiTipsoonCommentVO.builder().userId(tipsoonComment.getUserId()).nickname(userInfoVO.getNickname()).replyUserId(tipsoonComment.getReplyUserId())
                        .content(tipsoonComment.getContent()).address(tipsoonComment.getAddress()).createTime(tipsoonComment.getCreateTime()).build();
                if (StringUtils.isNotBlank(tipsoonComment.getReplyUserId())) {
                    userInfoVO = userMapper.selectInfoByUserIdTwo(tipsoonComment.getReplyUserId());
                    apiTipsoonCommentVO.setReplyUserNickname(userInfoVO.getNickname());
                }
                tipsoonCommentVOList.add(apiTipsoonCommentVO);
            }
            tipsoon.setTipsoonCommentVOList(tipsoonCommentVOList);
        }
        return ResponseResult.success(tipsoonPages);
    }

    @Override
    public ResponseResult selectTipsoonById(String tipsoonId) {
        Long id = SecurityUtils.getLoginIdDefaultNull();
        ApiTipsoonVO  tipsoon = tipsoonMapper.selectTipsoonById(Math.toIntExact(id), tipsoonId);
        if (tipsoon==null) throw new BusinessException(204, "该文章暂未解锁");

        Integer count = Math.toIntExact(tipsoonCommentMapper.selectCount(new LambdaQueryWrapper<TipsoonComment>().eq(TipsoonComment::getTipsoonId, tipsoon.getId())));
        tipsoon.setCommentCount(count);
        int likeCount = tipsoonMapper.countTipsoonLike(tipsoon.getId());
        tipsoon.setLikeCount(likeCount);
        if (SecurityUtils.getLoginIdDefaultNull() != null) {
            int flag = tipsoonMapper.selectTipsoonUserIsLike(tipsoon.getId(), String.valueOf(SecurityUtils.getCurrentUserId()));
            tipsoon.setIsLike(flag == 1);
        }
        Page<ApiTipsoonLikeListVO> likePages = tipsoonMapper.selectTipsoonLikeList(new Page<>(1,3),tipsoon.getId());
        tipsoon.setLikeListVO(likePages.getRecords());

        List<TipsoonComment> tipsoonComments = tipsoonCommentMapper.selectList(new LambdaQueryWrapper<TipsoonComment>().eq(TipsoonComment::getTipsoonId, tipsoon.getId()));
        List<ApiTipsoonCommentVO> tipsoonCommentVOList = new ArrayList<>();
        for (TipsoonComment tipsoonComment : tipsoonComments) {
            UserInfoVO userInfoVO = userMapper.selectInfoByUserIdTwo(tipsoonComment.getUserId());
            ApiTipsoonCommentVO apiTipsoonCommentVO = ApiTipsoonCommentVO.builder().userId(tipsoonComment.getUserId()).nickname(userInfoVO.getNickname()).replyUserId(tipsoonComment.getReplyUserId())
                    .content(tipsoonComment.getContent()).address(tipsoonComment.getAddress()).createTime(tipsoonComment.getCreateTime()).build();
            if (StringUtils.isNotBlank(tipsoonComment.getReplyUserId())) {
                userInfoVO = userMapper.selectInfoByUserIdTwo(tipsoonComment.getReplyUserId());
                apiTipsoonCommentVO.setReplyUserNickname(userInfoVO.getNickname());
            }
            tipsoonCommentVOList.add(apiTipsoonCommentVO);
        }
        tipsoon.setTipsoonCommentVOList(tipsoonCommentVOList);

        return ResponseResult.success(tipsoon);
    }

    @Override
    public ResponseResult like(String tipsoonId) {
        int count = tipsoonMapper.selectTipsoonUserIsLike(tipsoonId, String.valueOf(SecurityUtils.getCurrentUserId()));
        if (count > 0) {
            tipsoonMapper.deleteTipsoonLikeByUerIdAndTipsoonId(tipsoonId, String.valueOf(SecurityUtils.getCurrentUserId()));
            return ResponseResult.success("取消点赞");

        }
        tipsoonMapper.insertTipsoonLike(tipsoonId, String.valueOf(SecurityUtils.getCurrentUserId()));
        return ResponseResult.success("点赞成功");
    }

    @Override
    public ResponseResult collect(String tipsoonId) {
        int count = tipsoonMapper.selectTipsoonUserIsCollect(tipsoonId, String.valueOf(SecurityUtils.getCurrentUserId()));
        if (count > 0) {
            tipsoonMapper.deleteTipsoonCollectByUerIdAndTipsoonId(tipsoonId, String.valueOf(SecurityUtils.getCurrentUserId()));
            return ResponseResult.success("取消点赞");

        }
        tipsoonMapper.insertTipsoonCollect(tipsoonId, String.valueOf(SecurityUtils.getCurrentUserId()));
        return ResponseResult.success("点赞成功");
    }

    @Override
    public ResponseResult read(String tipsoonId) {
        int count = tipsoonMapper.selectTipsoonUserIsRead(tipsoonId, String.valueOf(SecurityUtils.getCurrentUserId()));
        if (count > 0) {
            return ResponseResult.error("此用户已读该简讯");

        }
        tipsoonMapper.insertTipsoonReaded(tipsoonId, String.valueOf(SecurityUtils.getCurrentUserId()));
        return ResponseResult.success("已读成功");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult comment(TipsoonComment tipsoonComment) {
        tipsoonComment.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        HttpServletRequest request = RequestHolder.getHttpServletRequest();
        tipsoonComment.setIp(me.mcx.utils.StringUtils.getIp(request));
        tipsoonComment.setAddress(me.mcx.utils.StringUtils.getCityInfo(tipsoonComment.getIp()));
        tipsoonCommentMapper.insert(tipsoonComment);
        return ResponseResult.success();
    }

    @Override
    public ResponseResult commentList(String forumId) {
        Page<ApiTipsoonCommentVO> list = tipsoonCommentMapper.selectListByTipsoonId(new Page<>(PageUtils.getPageNo(),PageUtils.getPageSize()),forumId);
        //获取子级
        for (ApiTipsoonCommentVO vo : list.getRecords()) {
            List<TipsoonComment> commentList = tipsoonCommentMapper.selectList(
                    new LambdaQueryWrapper<TipsoonComment>().eq(TipsoonComment::getParentId, vo.getId()).orderByDesc(TipsoonComment::getCreateTime));
            for (TipsoonComment e : commentList) {
                UserInfo replyUserInfo = userInfoMapper.getByUserId(e.getReplyUserId());
                UserInfo userInfo1 = userInfoMapper.getByUserId(e.getUserId());
                ApiTipsoonCommentVO apiForumCommentListVO = ApiTipsoonCommentVO.builder()
                        .id(e.getId())
                        .userId(e.getUserId())
                        .replyUserId(e.getReplyUserId())
                        .nickname(userInfo1.getNickname())
                        .replyUserNickname(replyUserInfo.getNickname())
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
    public ResponseResult insertTipsoon(Tipsoon tipsoon) {
        String userId = String.valueOf(SecurityUtils.getCurrentUserId());
        tipsoon.setUserId(userId);
        tipsoonMapper.insert(tipsoon);
        return ResponseResult.success();
    }
}
