import request from '@/utils/request'

export function listArticle(params) {
    return request({
        url: '/api/v1/article',
        method: 'get',
        params: params
    })
}
export function getArticleByUserId(params) {
    return request({
        url: '/api/v1/article/selectArticleByUserId',
        method: 'get',
        params: params
    })
}
export function deleteMyArticle(id) {
    return request({
        url: '/api/v1/article',
        method: 'delete',
        params: {
            id: id
        }
    })
}
export function getMyArticleInfo(id) {
    return request({
        url: '/api/v1/article/selectMyArticleInfo',
        method: 'get',
        params: {
            id: id
        }
    })
}
export function readMarkdownFile(data) {
    return request({
        url: '/api/v1/article/readMarkdownFile',
        method: 'post',
        data
    })
}
export function insertArticle(data) {
    return request({
        url: '/api/v1/article',
        method: 'post',
        data
    })
}
export function updateArticle(data) {
    return request({
        url: '/api/v1/article',
        method: 'put',
        data
    })
}
export function searchArticle(params) {
    return request({
        url: '/api/v1/article/search',
        method: 'get',
        params: params
    })
}

export function articleInfo(id) {
    return request({
        url: '/api/v1/article/info/' + id,
        method: 'get',
    })
}

export function checkCode(data) {
    return request({
        url: '/api/v1/article/checkCode',
        method: 'get',
        params: {
            code: data
        }
    })
}
export function articleLike(id) {
    return request({
        url: '/api/v1/article/like',
        method: 'get',
        params: {
            articleId: id
        }
    })
}
export function archiveArticle() {
    return request({
        url: '/api/v1/article/archive',
        method: 'get',
    })
}

export function listTagAll() {
    return request({
        url: '/api/v1/tag',
        method: 'get',

    })
}

export function featchHomeData() {
    return request({
        url: '/api/v1',
        method: 'get',
    })
}
export function getHot(type) {
    return request({
        url: '/api/v1/hot',
        method: 'get',
        params: {
            type: type
        }
    })
}
export function report() {
    return request({
        url: '/api/v1/report',
        method: 'get',
    })
}
export function getWebSiteInfo() {
    return request({
        url: '/api/v1/webSiteInfo',
        method: 'get',
    })
}

export function emailLogin(data) {
    return request({
        url: '/auth/login',
        method: 'post',
        data
    })
}
export function forgetPassword(data) {
    return request({
        url: '/oauth/forgetPassword',
        method: 'put',
        data
    })
}
export function logout() {
    return request({
        url: '/auth/logout',
        method: 'delete'
    })
}
export function openAuthUrl(source) {
    return request({
        url: '/oauth/render/' + source,
        method: 'get'
    })
}
export function wxIsLogin(loginCode) {
    return request({
        url: '/oauth/wechat/is_login',
        method: 'get',
        params: {
            loginCode: loginCode
        }
    })
}
export function getWechatLoginCode() {
    return request({
        url: '/oauth/wechatLoginCode',
        method: 'get',

    })
}
export function sendEmailCode(email) {
    return request({
        url: '/auth/sendEmailCode',
        method: 'get',
        params: {
            email: email
        }
    })
}
export function emailRegister(data) {
    return request({
        url: '/auth/register',
        method: 'post',
        data
    })
}
export function updateUserInfo(data) {
    return request({
        url: '/api/v1/user',
        method: 'put',
        data
    })
}
export function getUserInfo(userId) {
    return request({
        url: '/api/v1/user/info',
        method: 'get',
        params: {
            userId: userId
        }
    })
}
export function selectUserInfoByToken(token) {
    return request({
        url: '/api/v1/user/selectUserInfoByToken',
        method: 'get',
        params: {
            token: token
        }
    })
}
export function getUserCount(id) {
    return request({
        url: '/api/v1/user/getUserCount',
        method: 'get',
        params: {
            id: id
        }
    })
}
export function upload(data) {
    return request({
        url: '/file/upload',
        method: 'POST',
        headers: { 'Content-Type': 'multipart/articles-data' },
        data
    })
}
export function listCategory() {
    return request({
        url: '/api/v1/category',
        method: 'get'
    })
}

export function addFeedback(data) {
    return request({
        url: '/api/v1/feedback',
        method: 'post',
        data
    })
}
export function getCollect() {
    return request({
        url: '/api/v1/collect',
        method: 'get'
    })
}
export function collect(id) {
    return request({
        url: '/api/v1/collect/collect',
        method: 'get',
        params: {
            articleId: id
        }
    })
}
export function cancelCollect(id) {
    return request({
        url: '/api/v1/collect',
        method: 'delete',
        params: {
            articleId: id
        }
    })
}

export function followedUser(userId) {
    return request({
        url: '/api/v1/followed/insertFollowed',
        method: 'post',
        params: {
            userId: userId
        }
    })
}
export function deleteFollowedUser(userId) {
    return request({
        url: '/api/v1/followed/deleteFollowed',
        method: 'delete',
        params: {
            userId: userId
        }
    })
}

