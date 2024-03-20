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
