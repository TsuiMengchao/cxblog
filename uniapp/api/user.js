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

export function getUserCount(id) {
    return request({
        url: '/v1/user/getUserCount',
        method: 'get',
        data: {
            id: id
        }
    })
}

export function selectUserInfoByToken(token) {
    return request({
        url: '/v1/user/selectUserInfoByToken',
        method: 'get',
        data: {
            token: token
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
