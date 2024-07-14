package me.mcx.system.api.model.user;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author blue
 * @date 2022/1/5
 * @apiNote
 */
public class UserInfoVO {
    public UserInfoVO() {
    }

    public UserInfoVO(String id, Integer userInfoId, String email, Integer loginType, String nickname, String avatar, String intro, String webSite, String address, String registerTime, String lastLoginTime, int articleCount, int collectCount, int noteCount, int commentCount, int fansCount, int watchCount, int qiDayFollowedCount, String bjCover, String token) {
        this.id = id;
        this.userInfoId = userInfoId;
        this.email = email;
        this.loginType = loginType;
        this.nickname = nickname;
        this.avatar = avatar;
        this.intro = intro;
        this.webSite = webSite;
        this.address = address;
        this.registerTime = registerTime;
        this.lastLoginTime = lastLoginTime;
        this.articleCount = articleCount;
        this.collectCount = collectCount;
        this.noteCount = noteCount;
        this.commentCount = commentCount;
        this.fansCount = fansCount;
        this.watchCount = watchCount;
        this.qiDayFollowedCount = qiDayFollowedCount;
        this.bjCover = bjCover;
        this.token = token;
    }

    /**
     * 用户账号id
     */
    private String id;

    /**
     * 用户信息id
     */
    private Integer userInfoId;

    /**
     * 邮箱号
     */
    private String email;

    /**
     * 登录方式
     */
    private Integer loginType;


    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 用户简介
     */
    private String intro;

    /**
     * 个人网站
     */
    private String webSite;

    /**
     * 地址
     */
    private String address;

    /**
     * 注册时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String registerTime;

    /**
     * 最后登录时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String lastLoginTime;

    /**
     * 文章量
     */
    private int articleCount;

    /**
     * 收藏量
     */
    private int collectCount;

    /**
     * 笔记量
     */
    private int noteCount;

    /**
     * 评论量
     */
    private int commentCount;

    /**
     * 粉丝量
     */
    private int fansCount;


    /**
     * 粉丝量
     */
    private int watchCount;

    /**
     * 七天关注量
     */
    private int qiDayFollowedCount;

    /**
     * 背景封面
     */
    private String bjCover;

    /**
     * token
     */
    private String token;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getLoginType() {
        return loginType;
    }

    public void setLoginType(Integer loginType) {
        this.loginType = loginType;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public int getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(int articleCount) {
        this.articleCount = articleCount;
    }

    public int getCollectCount() {
        return collectCount;
    }

    public void setCollectCount(int collectCount) {
        this.collectCount = collectCount;
    }

    public int getNoteCount() {
        return noteCount;
    }

    public void setNoteCount(int noteCount) {
        this.noteCount = noteCount;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public int getFansCount() {
        return fansCount;
    }

    public void setFansCount(int fansCount) {
        this.fansCount = fansCount;
    }

    public int getWatchCount() {
        return watchCount;
    }

    public void setWatchCount(int watchCount) {
        this.watchCount = watchCount;
    }

    public int getQiDayFollowedCount() {
        return qiDayFollowedCount;
    }

    public void setQiDayFollowedCount(int qiDayFollowedCount) {
        this.qiDayFollowedCount = qiDayFollowedCount;
    }

    public String getBjCover() {
        return bjCover;
    }

    public void setBjCover(String bjCover) {
        this.bjCover = bjCover;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
