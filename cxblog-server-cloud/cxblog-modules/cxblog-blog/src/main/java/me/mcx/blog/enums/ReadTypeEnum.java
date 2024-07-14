package me.mcx.blog.enums;

public enum ReadTypeEnum {
    /**
     * 评论阅读
     */
    COMMENT(1),

    /**
     * 点赞阅读
     */
    LIKE(2),
    /**
     * 扫码阅读
     */
    CODE(3);

    public int index;

    ReadTypeEnum(int index) {
        this.index = index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getIndex() {
        return index;
    }
}
