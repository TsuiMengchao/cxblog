import request from '@/common/request'

// 说说接口
export function get10Tipsoon() {
    return request({
        url: '/v1/tipsoon/get10Tipsoon',
        method: 'get'
    })
}

export function getTipsoonById(tipsoonId) {
    return request({
        url: '/v1/tipsoon/getTipsoonById',
        method: 'get',
        data: {
            tipsoonId: tipsoonId
        }
    })
}

export function tipsoonLike(tipsoonId) {
    return request({
        url: '/v1/tipsoon/like',
        method: 'get',
        data: {
            tipsoonId: tipsoonId
        }
    })
}

export function tipsoonCollect(tipsoonId) {
    return request({
        url: '/v1/tipsoon/collect',
        method: 'get',
        data: {
            tipsoonId: tipsoonId
        }
    })
}

export function tipsoonRead(tipsoonId) {
    return request({
        url: '/v1/tipsoon/read',
        method: 'get',
        data: {
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

export function getCommentList(tipsoonId) {
    return new request({
        url: '/v1/tipsoon/commentList/',
        method: 'get',
        data:{
            tipsoonId: tipsoonId
        }
    })
}

export function insertTipsoon(data) {
    return request({
        url: '/v1/tipsoon/insertTipsoon',
        method: 'post',
        data
    })
}
