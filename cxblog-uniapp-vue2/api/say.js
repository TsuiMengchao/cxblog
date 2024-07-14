import request from '@/common/request'

// 说说接口
export function getSayList(params) {
    return request({
        url: '/v1/say/getSayList',
        method: 'get',
        data: params
    })
}

export function sayLike(sayId) {
    return request({
        url: '/v1/say/like',
        method: 'get',
        data: {
            sayId: sayId
        }
    })
}

export function sayComment(data) {
    return request({
        url: '/v1/say/comment',
        method: 'post',
        data
    })
}

export function insertSay(data) {
    return request({
        url: '/v1/say/insertSay',
        method: 'post',
        data
    })
}
