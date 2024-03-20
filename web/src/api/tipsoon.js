import request from '@/utils/request'

// 说说接口
export function getTipsoon() {
    return request({
        url: '/v1/tipsoon/getTipsoon',
        method: 'get'
    })
}

export function getTipsoonById(tipsoonId) {
    return request({
        url: '/v1/tipsoon/getTipsoonById',
        method: 'get',
        params: {
            tipsoonId: tipsoonId
        }
    })
}

export function tipsoonLike(tipsoonId) {
    return request({
        url: '/v1/tipsoon/like',
        method: 'get',
        params: {
            tipsoonId: tipsoonId
        }
    })
}

export function tipsoonComment(data) {
    return request({
        url: '/v1/tipsoon/comment',
        method: 'post',
        data
    })
}

export function insertTipsoon(data) {
    return request({
        url: '/v1/tipsoon/insertTipsoon',
        method: 'post',
        data
    })
}
