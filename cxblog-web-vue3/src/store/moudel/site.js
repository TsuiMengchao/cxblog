import { defineStore } from "pinia";

export const useSiteStore = defineStore('site', {
    state: () => ({
        webInfo: {
            showList: ""
        },
        systemNotice: {},
        siteAccess: 0,
        visitorAccess: 0,
        searchDialogVisible: false,
        navBarDislogVisible: false,
        isCommentVisible: false
    }),
    persist: {
        enabled: true, //Store中数据持久化生效
    },
    getters: {
        getSiteAccess() {
            return this.siteAccess
        },
        getSystemNotice() {
            return this.systemNotice
        },
        getVsitorAccess() {
            return this.visitorAccess
        },
        getWebInfo() {
            return this.webInfo
        },
        getSearchDialogVisible() {
            return this.searchDialogVisible
        },
        getNavBarDialogVisible() {
            return this.navBarDislogVisible
        },
        getIsCommentVisible() {
            return this.isCommentVisible
        },
    },
    actions: {
        setWebInfo(value) {
            this.webInfo = value
        },
        setSystemNotice(value) {
            this.systemNotice = value
        },
        setSiteAccess(value) {
            this.siteAccess = value
        },
        setVsitorAccess(value) {
            this.visitorAccess = value
        },
        setSearchDialogVisible(value) {
            this.searchDialogVisible = value
        },
        setNavBarDialogVisible(value) {
            this.navBarDislogVisible = value
        },
        setIsCommentVisible(value) {
            this.isCommentVisible = value
        },
    },
})
