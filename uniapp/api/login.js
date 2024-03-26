import request from "@/common/request"

export function appletLogin(data) {
    return new request({
        url: '/oauth/applet',
        method: 'post',
		data:data
    })
}
export function doLogin(data) {
    return new request({
        url: '/oauth/emailLogin',
        method: 'post',
		data:data
    })
}

export function sendEmailCode(email) {
    return new request({
        url: '/oauth/sendEmailCode',
        method: 'get',
        data: {
            email: email
        }
    })
}

export function emailRegister(data) {
    return new request({
        url: '/oauth/emailRegister',
        method: 'post',
        data: data
    })
}

export function forgetPassword(data) {
    return new request({
        url: '/oauth/forgetPassword',
        method: 'put',
        data:data
    })
}
