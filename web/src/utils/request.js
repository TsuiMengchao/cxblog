import axios from 'axios'
import store from '@/store'
import { getToken, removeToken } from '@/utils/cookieUtil'
import { Notification } from 'element-ui';
import Vue from 'vue'
// create an axios instance
const service = axios.create({
    baseURL: process.env.VUE_APP_BASE_API,
    timeout: 36000 // request timeout
})

// request interceptor
service.interceptors.request.use(

    config => {
        // if (config.url != '/oauth/wechat/is_login' && config.url != '/v1/im/chat' && config.url != '/v1/article/search' && config.url != '/v1/tag/') {
        //     window.vm.$bus.$emit('showLoading');
        // }
        //do something before request is sent
        let token = getToken()
        if (token != null) {
            // let each request carry token
            // ['X-Token'] is a custom headers key
            // please modify it according to the actual situation
            config.headers.Authorization = token
        }

        return config
    },
    error => {
        // do something with request error
        console.log(error) // for debug
        return Promise.reject(error)
    }
)

// response interceptor
service.interceptors.response.use(
    /**
     * If you want to get http information such as headers or status
     * Please return  response => response
     */

    /**
     * Determine the request status by custom code
     * Here is just an example
     * You can also judge the status by HTTP Status Code
     */
    response => {
        // window.vm.$bus.$emit('hideLoading');
        const res = response.data
        // store.commit('SET_LOADING',false);
        // if the custom code is not 20000, it is judged as an error.

        if (res.code !== 200) {
            if (res.code == 401) {
                removeToken()
                sessionStorage.removeItem("user")
                store.state.userInfo = null
                store.state.loginFlag = true
            }
            //如果是校验微信登录是否授权的接口 则不进行错误输出
            if (response.config.url !== "/oauth/wechat/is_login") {
                window.vm.$toast.error(res.message);
            }

            return Promise.reject(new Error(res.message || 'Error'))
        } else {
            return res
        }
    },
    error => {
        return Promise.reject(error)
    }
)

export default service