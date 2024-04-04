import request from '@/utils/request'

export function featchComments(params) {
    return request({
        url: '/v1/comment/',
        method: 'get',
        params: params
    })
}
export function getMyComment(params) {
    return request({
        url: '/v1/comment/getMyComment',
        method: 'get',
        params: params
    })
}
export function newArticle() {
    return request({
        url: '/v1/upToDateArticle',
        method: 'get',
    })
}

export function postComment(data) {
    return request({
        url: '/v1/comment/',
        method: 'post',
        data
    })
}