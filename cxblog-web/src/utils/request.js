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
        return response.data
    },
    error => {
        // store.commit('SET_LOADING',false);
        // if the custom code is not 20000, it is judged as an error.

        // 兼容blob下载出错json提示
        if (error.response.data instanceof Blob && error.response.data.type.toLowerCase().indexOf('json') !== -1) {
            const reader = new FileReader()
            reader.readAsText(error.response.data, 'utf-8')
            reader.onload = function(e) {
                const errorMsg = JSON.parse(reader.result).message
                Notification.error({
                    title: errorMsg,
                    duration: 5000
                })
            }
        } else {
            let code = 0
            try {
                code = error.response.data.status
            } catch (e) {
                if (error.toString().indexOf('Error: timeout') !== -1) {
                    Notification.error({
                        title: '网络请求超时',
                        duration: 5000
                    })
                    return Promise.reject(error)
                }
            }
            if (code) {
                if (code === 401) {
                    removeToken()
                    sessionStorage.removeItem("user")
                    store.state.userInfo = null
                }
                //如果是校验微信登录是否授权的接口 则不进行错误输出
                if (error.response.config.url !== "/oauth/wechat/is_login") {
                    window.vm.$toast.error(error.response.message);
                }
            } else {
                Notification.error({
                    title: '接口请求失败',
                    duration: 5000
                })
            }
        }
        return Promise.reject(error)
    }
)

export default service
