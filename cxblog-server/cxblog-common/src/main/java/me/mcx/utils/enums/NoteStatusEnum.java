package me.mcx.utils.enums;

/**
 * 笔记状态枚举
 */
public enum NoteStatusEnum {

    NO_PASS(0, "未通过"),

    /**
     * 友链申请
     */
    PASS(1, "通过"),

    /**
     * 友链上架
     */
    APPLY(2, "待审核");


    //创建构造函数
    NoteStatusEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    //定义私有方法，获取枚举值
    public final int code;
    public final String desc;

    public Integer getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
