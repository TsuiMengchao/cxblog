package me.mcx.blog.enums;


public enum DataEventEnum {

    ES_ADD(0, "添加es数据"),

    ES_DELETE(0, "删除es数据"),

    ES_UPDATE(0, "修改es数据"),

    SYSTEM_NOTICE(1, "系统通知");

    //创建构造函数
    DataEventEnum(int code, String desc) {
        this.type = code;
        this.desc = desc;
    }


    /**
     * 发布类型
     */
    private final Integer type;
    /**
     * 发布描述
     */
    private final String desc;


    public Integer getType() {
        return type;
    }

    public String getDesc() {
        return desc;
    }
}
