package me.mcx.blog.event;

import me.mcx.blog.enums.DataEventEnum;
import org.springframework.context.ApplicationEvent;

/**
 * 消息事件数据类
 */
public class DataEvent extends ApplicationEvent {

    private final Object data;

    private final DataEventEnum eventEnum;


    public DataEvent(Object source, DataEventEnum eventEnum, Object data) {
        super(source);
        this.data = data;
        this.eventEnum = eventEnum;
    }

    public Object getData() {
        return data;
    }

    public DataEventEnum getEventEnum() {
        return eventEnum;
    }
}
