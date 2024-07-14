import request from '@/common/request'

export function getTalkList(params) {
    return request({
        url: '/v1/talk/list',
        method: 'get',
        data: params
    })
}
export function analysis(url) {
    return request({
        url: '/v1/talk/analysis',
        method: 'get',
        data: {
            url: url
        }
    })
}

export function getForumList(params) {
    return request({
        url: '/v1/forum/list',
        method: 'get',
        data: params
    })
}

export function getForumById(forumId) {
    return request({
        url: '/v1/forum/getForumById',
        method: 'get',
        data: {
            forumId: forumId
        }
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
        data: params
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
        data: {
            forumId: forumId
        }
    })
}
export function forumLikeList(params) {
    return request({
        url: '/v1/forum/likeList',
        method: 'get',
        data: params
    })
}
