import request from '@/utils/request'

export function getCollect(params) {
    return request({
        url: '/v1/collect/',
        method: 'get',
        params: params
    })
}
export function collect(articleId) {
    return request({
        url: '/v1/collect/collect',
        method: 'get',
        params: {
            articleId: articleId
        }
    })
}
export function cancelCollect(articleId) {
    return request({
        url: '/v1/collect/',
        method: 'delete',
        params: {
            articleId: articleId
        }
    })
}
