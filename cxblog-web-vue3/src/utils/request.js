import axios from 'axios'
import { getToken,removeToken } from '@/utils/cookie'
 import { useUserStore } from "@/store/moudel/user.js";


// let { userInfo,userFlag } = storeToRefs(userStore);
// create an axios instance
const service = axios.create({
    baseURL: import.meta.env.VITE_APP_BASE_API,
    timeout: 36000 // request timeout
})

// request interceptor
service.interceptors.request.use(

    config => {
        //do something before request is sent
        let token = getToken()
        if (token != null) {
            // let each request carry token
            // ['X-Token'] is a custom headers key
            // please modify it according to the actual situation
            config.headers.Authorization = "Bearer "+token
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
        const res = response.data
        // if the custom code is not 20000, it is judged as an error.
        const userStore = useUserStore();
        if (res.code !== 200) {
            if (res.code == 401) {
                //removeToken()
                removeToken()
                sessionStorage.removeItem("user")
                userStore.setUserInfo(null)
                userStore.setLoginFlag(true)
            }
            //如果是校验微信登录是否授权的接口 则不进行错误输出
            if (response.config.url !== "/oauth/wechat/is_login") {
                ElMessage({ message: res.message, type: 'error' })
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
