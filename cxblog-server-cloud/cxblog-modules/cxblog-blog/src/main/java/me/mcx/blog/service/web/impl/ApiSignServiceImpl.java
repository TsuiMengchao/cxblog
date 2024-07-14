package me.mcx.blog.service.web.impl;

import cn.hutool.core.thread.ThreadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.BlogSign;
import me.mcx.blog.handle.SystemNoticeHandle;
import me.mcx.blog.im.MessageConstant;
import me.mcx.blog.mapper.BlogSignMapper;
import me.mcx.blog.service.web.ApiSignService;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.DateUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.security.utils.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class ApiSignServiceImpl implements ApiSignService {

    private final BlogSignMapper signMapper;

    private final BlogSignMapper blogSignMapper;

    /**
     * 用户的签到记录
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return
     */
    @Override
    public AjaxResult getSignRecords(String startTime, String endTime) {
        List<String> list = signMapper.getSignRecordsByUserId(startTime,endTime,SecurityUtils.getLoginIdAsString());
        return AjaxResult.success(list);
    }

    /**
     * 用户签到
     * @param time 签到时间
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult sign(String time) {
        String userId = SecurityUtils.getLoginIdAsString();

        BlogSign sign = signMapper.selctSignByUserIdAndTime(userId,time);
        if (sign != null) {
            throw new ServiceException("当日已签到，无需再次签到！");
        }

        sign = new BlogSign(){{setUserId(userId);setId(String.valueOf(UUID.randomUUID()));}};
        blogSignMapper.insertBlogSign(sign);

        //发送系统通知
        ThreadUtil.execAsync(() ->{
            SystemNoticeHandle.sendNotice(userId, MessageConstant.MESSAGE_SYSTEM_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE,null,null,"恭喜您签到成功");
        });
        return AjaxResult.success();
    }

    /**
     * 验证用户当日是否签到
     * @return
     */
    @Override
    public AjaxResult validateTodayIsSign() {
        String today = DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD, DateUtils.getNowDate());
        BlogSign sign = signMapper.validateTodayIsSign(today,SecurityUtils.getLoginIdAsString());
        return AjaxResult.success(sign);
    }
}
