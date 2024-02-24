package me.mcx.modules.blog.web.handle;

import me.mcx.modules.blog.domain.ImMessage;
import me.mcx.modules.blog.admin.mapper.ImMessageMapper;
import me.mcx.utils.IpUtil;
import me.mcx.utils.SecurityUtils;
import me.mcx.utils.SpringUtils;
import lombok.extern.slf4j.Slf4j;


@Slf4j
public class SystemNoticeHandle {


    /**
     *
     * 发送系统通知
     * @param toUserId
     * @param noticeType
     * @param noticeCode
     */
    public static void sendNotice(String toUserId,Integer noticeType,Integer noticeCode,Integer articleId,Integer commentMark,String content) {
        ImMessageMapper imMessageMapper = SpringUtils.getBean(ImMessageMapper.class);
        try {
            String ip = IpUtil.getIp();

            ImMessage message = ImMessage.builder().fromUserId(String.valueOf(SecurityUtils.getCurrentUserId())).toUserId(toUserId).content(content).commentMark(commentMark)
                    .noticeType(noticeType).code(noticeCode).ip(ip).ipSource(IpUtil.getIp2region(ip)).articleId(articleId).build();
            imMessageMapper.insert(message);
        } catch (Exception e) {
            //添加失败的话不抛异常，还是要执行成功
            log.error("生成消息通知失败，错误原因：{}",e.getMessage());
        }
    }
}
