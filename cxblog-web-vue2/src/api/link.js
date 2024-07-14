import request from '@/utils/request'

export function featchLinks() {
    return request({
        url: '/v1/link/',
        method: 'get',
    })
}
export function addLink(data) {
    return request({
        url: '/v1/link/',
        method: 'post',
        data
    })
}