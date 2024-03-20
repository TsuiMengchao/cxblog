import request from "@/common/request"

export function getOptionsCountApplet(userId) {
    return request({
        url: '/v1/user/getOptionsCountApplet',
        method: 'get',
		data:{
			userId:userId
		}
    })
}

export function getUserInfoById(userId) {
    return request({
        url: '/v1/user/info',
        method: 'get',
		data:{
			userId:userId
		}
    })
}

export function updateUserInfo(data) {
    return request({
        url: '/v1/user/',
        method: 'put',
		data:data
    })
}
