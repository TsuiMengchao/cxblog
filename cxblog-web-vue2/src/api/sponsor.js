import request from '@/utils/request'

export function addSponsor(payImage) {
    return request({
        url: '/v1/sponsor/add',
        method: 'get',
        params: {
            payImage: payImage
        }
    })
}
export function getSponsorList(params) {
    return request({
        url: '/v1/sponsor/list',
        method: 'get',
        params: params
    })
}
