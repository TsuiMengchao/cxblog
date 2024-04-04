import request from '@/utils/request'

export function getTalkList(params) {
    return request({
        url: '/api/talk/list',
        method: 'get',
        params: params
    })
}
export function deleteTalk(data) {
    return request({
        url: '/api/talk/delete',
        method: 'delete',
        data
    })
}

export function addTalk(data) {
    return request({
        url: '/api/talk/add',
        method: 'post',
        data
    })
}
export function infoTalk(id) {
    return request({
        url: '/api/talk/info',
        method: 'get',
        params: {
            id: id
        }
    })
}
export function updateTalk(data) {
    return request({
        url: '/api/talk/update',
        method: 'put',
        data
    })
}

