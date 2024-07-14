package me.mcx.msg.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import me.mcx.common.core.constant.ServiceNameConstants;
import me.mcx.common.core.domain.R;
import me.mcx.msg.api.domain.MsgEmail;
import me.mcx.msg.api.factory.RemoteEmailFallbackFactory;

/**
 * 邮件服务
 * 
 * @author cxblog
 */
@FeignClient(contextId = "remoteEmailService", value = ServiceNameConstants.MSG_SERVICE, fallbackFactory = RemoteEmailFallbackFactory.class)
public interface RemoteEmailService
{
    /**
     * 发送邮件
     *
     * @param email 邮件信息
     * @return 结果
     */
    @PostMapping(value = "/email")
    public R<Boolean> send(@Validated @RequestBody MsgEmail email);
}
