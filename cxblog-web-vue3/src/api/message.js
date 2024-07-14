
import request from '@/utils/request'
export function listMessage() {
    return request({
        url: '/api/v1/message',
        method: 'get',
    })
}
export function addMessage(data) {
    return request({
        url: '/api/v1/message',
        method: 'post',
        data
    })
}
