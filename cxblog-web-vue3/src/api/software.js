import request from '@/utils/request'

export function listSoftware() {
    return request({
        url: '/api/v1/software',
        method: 'get',
    })
}
