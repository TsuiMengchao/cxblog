import request from '@/utils/request'

// 说说接口
export function listSay(params) {
    return request({
        url: '/api/v1/say/getSayList',
        method: 'get',
        params: params
    })
}

export function sayLike(sayId) {
    return request({
        url: '/api/v1/say/like',
        method: 'get',
        params: {
            sayId: sayId
        }
    })
}

export function sayComment(data) {
    return request({
        url: '/api/v1/say/comment',
        method: 'post',
        data
    })
}
