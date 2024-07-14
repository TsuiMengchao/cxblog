package me.mcx.blog.service.web.impl;

import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.BlogFeedBack;
import me.mcx.blog.mapper.BlogFeedBackMapper;
import me.mcx.blog.service.web.ApiFeedBackService;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.security.utils.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ApiFeedBackServiceImpl implements ApiFeedBackService {

    private final BlogFeedBackMapper feedBackMapper;

    /**
     * 添加反馈
     *
     * @param feedBack
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addFeedback(BlogFeedBack feedBack) {
        feedBack.setUserId(String.valueOf(SecurityUtils.getLoginIdAsString()));
        int rows = feedBackMapper.insertBlogFeedBack(feedBack);
        return rows > 0 ? AjaxResult.success() : AjaxResult.error("添加反馈失败");
    }
}
