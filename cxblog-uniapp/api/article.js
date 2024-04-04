import request from "@/common/request"

//文章接口
export function getArticleList(params) {
    return new request({
        url: '/v1/article/',
        method: 'get',
        data: params
    })
}
export function getAuthorInfo(articleId) {
    return new request({
        url: '/v1/article/selectUserInfoByArticleId',
        method: 'get',
        data:{
			"id":articleId
		}
    })
}
export function getArticleInfo(params) {
    return new request({
        url: '/v1/article/info',
        method: 'get',
        data:params
    })
}

export function selectUserInfoByArticleId(id) {
    return new request({
        url: '/v1/article/selectUserInfoByArticleId',
        method: 'get',
        data: {
            "id": id
        }
    })
}

export function searchArticle(params) {
    return new request({
        url: '/v1/article/search',
        method: 'get',
        data:params
    })
}
export function like(articleId) {
    return new request({
        url: '/v1/article/like',
        method: 'get',
        data:{
			"articleId":articleId
		}
    })
}

export function selectArticleByUserId(params) {
    return new request({
        url: '/v1/article/selectArticleByUserId',
        method: 'get',
        data:params
    })
}
export function getCommentList(data) {
    return new request({
        url: '/v1/comment/',
        method: 'get',
        data:data
    })
}
export function addComment(data) {
    return new request({
        url: '/v1/comment/',
        method: 'post',
        data:data
    })
}