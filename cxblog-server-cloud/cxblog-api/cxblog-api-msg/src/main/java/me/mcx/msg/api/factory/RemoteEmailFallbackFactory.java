package me.mcx.msg.api.factory;

import me.mcx.msg.api.RemoteEmailService;
import me.mcx.msg.api.domain.MsgEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;
import me.mcx.common.core.domain.R;

/**
 * 文件服务降级处理
 * 
 * @author cxblog
 */
@Component
public class RemoteEmailFallbackFactory implements FallbackFactory<RemoteEmailService>
{
    private static final Logger log = LoggerFactory.getLogger(RemoteEmailFallbackFactory.class);

    @Override
    public RemoteEmailService create(Throwable throwable)
    {
        log.error("邮件服务调用失败:{}", throwable.getMessage());
        return new RemoteEmailService()
        {
            @Override
            public R<Boolean> send(@Validated @RequestBody MsgEmail email)
            {
                return R.fail("发送邮件失败:" + throwable.getMessage());
            }
        };
    }
}
