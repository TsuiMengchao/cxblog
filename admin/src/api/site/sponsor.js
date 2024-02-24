import request from '@/utils/request'

export function getSponsorList(params) {
    return request({
        url: '/api/sponsor/list',
        method: 'get',
        params
    })
}
export function getSponsorInfo(id) {
    return request({
        url: '/api/sponsor/info',
        method: 'get',
        params: {
            id: id
        }
    })
}
export function deleteSponsor(data) {
    return request({
        url: '/api/sponsor/delete',
        method: 'delete',
        data
    })
}
export function updateSponsor(data) {
    return request({
        url: '/api/sponsor/update',
        method: 'put',
        data
    })
}
