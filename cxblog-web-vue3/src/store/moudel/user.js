import { defineStore } from "pinia";

export const useUserStore = defineStore('user', {
    state: () => ({
        loginFlag: false,
        userInfo: null
    }),
    persist: {
        enabled: true, //Store中数据持久化生效
    },
    getters: {
        getLoginFlag() {
            return this.loginFlag
        },
        getUserInfo() {
            return this.userInfo
        },
    },
    actions: {
        setLoginFlag(value) {
            this.loginFlag = value
        },
        setUserInfo(value) {
            this.userInfo = value
        },
    },
})
