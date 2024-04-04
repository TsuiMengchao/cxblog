package me.mcx.modules.blog.web.service.impl;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.FeedBack;
import me.mcx.modules.blog.mapper.FeedBackMapper;
import me.mcx.modules.blog.web.service.ApiFeedBackService;
import lombok.RequiredArgsConstructor;
import me.mcx.utils.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ApiFeedBackServiceImpl implements ApiFeedBackService {

    private final FeedBackMapper feedBackMapper;

    /**
     * 添加反馈
     *
     * @param feedBack
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertFeedback(FeedBack feedBack) {
        feedBack.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        int rows = feedBackMapper.insert(feedBack);
        return rows > 0 ? ResponseResult.success() : ResponseResult.error("添加反馈失败");
    }
}
