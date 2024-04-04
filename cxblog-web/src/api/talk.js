import request from '@/utils/request'

export function getTalkList(params) {
    return request({
        url: '/v1/talk/list',
        method: 'get',
        params: params
    })
}
export function analysis(url) {
    return request({
        url: '/v1/talk/analysis',
        method: 'get',
        params: {
            url: url
        }
    })
}

export function getForumList(params) {
    return request({
        url: '/v1/forum/list',
        method: 'get',
        params: params
    })
}
export function addForum(data) {
    return request({
        url: '/v1/forum/add',
        method: 'post',
        data
    })
}
export function getForumCommentList(params) {
    return request({
        url: '/v1/forum/commentList',
        method: 'get',
        params: params
    })
}
export function addForumComment(data) {
    return request({
        url: '/v1/forum/comment',
        method: 'post',
        data
    })
}
export function forumLike(forumId) {
    return request({
        url: '/v1/forum/like',
        method: 'get',
        params: {
            forumId: forumId
        }
    })
}
export function forumLikeList(params) {
    return request({
        url: '/v1/forum/likeList',
        method: 'get',
        params: params
    })
}
