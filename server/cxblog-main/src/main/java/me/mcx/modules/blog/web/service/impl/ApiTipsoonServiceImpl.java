package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.val;
import me.mcx.common.RedisConstants;
import me.mcx.common.ResponseResult;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.admin.mapper.TipsoonCommentMapper;
import me.mcx.modules.blog.admin.mapper.TipsoonMapper;
import me.mcx.modules.blog.admin.service.RedisService;
import me.mcx.modules.blog.domain.TipsoonComment;
import me.mcx.modules.blog.domain.Tipsoon;
import me.mcx.modules.blog.domain.vo.ApiTipsoonCommentVO;
import me.mcx.modules.blog.domain.vo.ApiTipsoonLikeListVO;
import me.mcx.modules.blog.domain.vo.ApiTipsoonVO;
import me.mcx.modules.blog.domain.vo.UserInfoVO;
import me.mcx.modules.blog.web.service.ApiTipsoonService;
import me.mcx.modules.system.mapper.UserMapper;
import me.mcx.utils.IpUtil;
import me.mcx.utils.PageUtils;
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
public class ApiTipsoonServiceImpl implements ApiTipsoonService {

    private final TipsoonMapper tipsoonMapper;

    private final UserMapper userMapper;

    private final TipsoonCommentMapper tipsoonCommentMapper;


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

            if (id != null)
                tipsoonMapper.insertTipsoonReaded(tipsoon.getId(), String.valueOf(SecurityUtils.getCurrentUserId()));
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
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult comment(TipsoonComment tipsoonComment) {
        tipsoonComment.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        HttpServletRequest request = RequestHolder.getHttpServletRequest();
        tipsoonComment.setIp(me.mcx.utils.StringUtils.getIp(request));
        tipsoonComment.setAddress(IpUtil.getIp2region(tipsoonComment.getIp()));
        tipsoonCommentMapper.insert(tipsoonComment);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertTipsoon(Tipsoon tipsoon) {
        String userId = String.valueOf(SecurityUtils.getCurrentUserId());
        tipsoon.setUserId(userId);
        tipsoon.setCreateTime(new Date());
        tipsoonMapper.insert(tipsoon);
        return ResponseResult.success();
    }
}
