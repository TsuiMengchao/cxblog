package me.mcx.blog.event;

import cn.hutool.core.thread.ThreadUtil;
import lombok.RequiredArgsConstructor;
import me.mcx.blog.domain.ArticleElastic;
import me.mcx.blog.enums.DataEventEnum;
import me.mcx.blog.mapper.web.EasyesMapper;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class DataListener {

    private final EasyesMapper easyesMapper;


    @EventListener
    public void handleDataSyncEvent(DataEvent event) {
        DataEventEnum eventEnum = event.getEventEnum();

        ThreadUtil.execAsync(() -> {
            //同步es数据
            switch (eventEnum) {
                case ES_ADD:
                case ES_UPDATE:
                    updateOrAdd(event.getData());
                    break;
                case ES_DELETE:
                        easyesMapper.deleteBatchIds((List<Long>) event.getData());
                    break;
                default:
                    break;
            }
        });

    }


    private void updateOrAdd(Object data){
        ArticleElastic articleElastic = (ArticleElastic)data;
        if (articleElastic.getId() == null) {
            easyesMapper.insert(articleElastic);
        } else {
            easyesMapper.updateById(articleElastic);
        }
    }
}
