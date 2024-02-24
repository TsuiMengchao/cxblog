import request from '@/utils/request'

export function getEmojiList() {
    return request({
        url: '/v1/emoji/list',
        method: 'get'
    })
}

export function addEmoji(data) {
    return request({
        url: '/v1/emoji/add',
        method: 'post',
        data
    })
}

export function deleteEmoji(id) {
    return request({
        url: '/v1/emoji/delete',
        method: 'delete',
        params: {
            id: id
        }
    })
}
export function stickEmoji(id) {
    return request({
        url: '/v1/emoji/stick',
        method: 'get',
        params: {
            id: id
        }
    })
}