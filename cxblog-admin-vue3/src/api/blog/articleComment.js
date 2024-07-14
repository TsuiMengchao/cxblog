import request from '@/utils/request'

// 查询评论列表
export function listArticleComment(query) {
  return request({
    url: '/blog/articleComment/list',
    method: 'get',
    params: query
  })
}

// 查询评论详细
export function getArticleComment(id) {
  return request({
    url: '/blog/articleComment/' + id,
    method: 'get'
  })
}

// 新增评论
export function addArticleComment(data) {
  return request({
    url: '/blog/articleComment',
    method: 'post',
    data: data
  })
}

// 修改评论
export function updateArticleComment(data) {
  return request({
    url: '/blog/articleComment',
    method: 'put',
    data: data
  })
}

// 删除评论
export function delArticleComment(id) {
  return request({
    url: '/blog/articleComment/' + id,
    method: 'delete'
  })
}
