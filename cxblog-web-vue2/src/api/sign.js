import request from '@/utils/request'

export function getSignRecords(params) {
    return request({
        url: '/v1/sign/getSignRecords',
        method: 'get',
        params: params
    })
}
export function validateTodayIsSign() {
    return request({
        url: '/v1/sign/validateTodayIsSign',
        method: 'get',
    })
}
export function sign(time) {
    return request({
        url: '/v1/sign/',
        method: 'get',
        params: {
            time: time
        }
    })
}