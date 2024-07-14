package me.mcx.blog.service.web;

import me.mcx.common.core.web.domain.AjaxResult;

public interface ApiSignService {


    /**
     * 用户的签到记录
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return
     */
    AjaxResult getSignRecords(String startTime, String endTime);


    /**
     * 用户签到
     * @param time 签到时间
     * @return
     */
    AjaxResult sign(String time);

    /**
     * 验证用户当日是否签到
     * @return
     */
    AjaxResult validateTodayIsSign();


}
