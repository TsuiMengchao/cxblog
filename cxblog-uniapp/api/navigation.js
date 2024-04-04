
import request from '@/common/request'


export function getNavigations() {
    return request({
        url: '/v1/site/getNavigations',
        method: 'get',
    })
}
