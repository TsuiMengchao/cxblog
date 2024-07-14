package me.mcx.blog.event;

import me.mcx.blog.enums.DataEventEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

@Service
public class DataEventPublisherService {

    private final ApplicationEventPublisher applicationEventPublisher;

    @Autowired
    public DataEventPublisherService(ApplicationEventPublisher applicationEventPublisher) {
        this.applicationEventPublisher = applicationEventPublisher;
    }

    public void publishData(DataEventEnum dataEventEnum, Object data) {
        DataEvent event = new DataEvent(this,dataEventEnum, data);
        applicationEventPublisher.publishEvent(event);
    }
}
