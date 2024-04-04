
import request from '@/utils/request'


export function getNavigations() {
    return request({
        url: '/v1/site/getNavigations',
        method: 'get',
    })
}
