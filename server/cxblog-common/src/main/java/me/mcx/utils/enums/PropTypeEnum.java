package me.mcx.utils.enums;

public enum PropTypeEnum {
    /**
     * 文章下架
     */
    SIGN_CARD(1),

    /**
     * 文章发布
     */
    INTEGRAL(2);


    public int code;

    PropTypeEnum(int code) {
        this.code = code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
