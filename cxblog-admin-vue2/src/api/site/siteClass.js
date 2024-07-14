import request from '@/utils/request'

export function getSiteClassList(params) {
    return request({
        url: '/api/siteClass/list',
        method: 'get',
        params: params
    })
}
export function save(data) {
    return request({
        url: '/api/siteClass/insert',
        method: 'post',
        data
    })
}
export function update(data) {
    return request({
        url: '/api/siteClass/update',
        method: 'put',
        data
    })
}
export function deleteBatch(data) {
    return request({
        url: '/api/siteClass/deleteBatch',
        method: 'delete',
        data
    })
}
