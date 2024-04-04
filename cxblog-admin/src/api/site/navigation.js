import request from '@/utils/request'

export function getNavigationList(params) {
    return request({
        url: '/api/navigation/list',
        method: 'get',
        params: params
    })
}
export function save(data) {
    return request({
        url: '/api/navigation/insert',
        method: 'post',
        data
    })
}
export function update(data) {
    return request({
        url: '/api/navigation/update',
        method: 'put',
        data
    })
}
export function deleteBatch(data) {
    return request({
        url: '/api/navigation/deleteBatch',
        method: 'delete',
        data
    })
}
