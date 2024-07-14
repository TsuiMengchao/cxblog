import request from '@/utils/request'

// 查询文章标签列表
export function listArticleTag(query) {
  return request({
    url: '/blog/articleTag/list',
    method: 'get',
    params: query
  })
}

// 查询文章标签详细
export function getArticleTag(id) {
  return request({
    url: '/blog/articleTag/' + id,
    method: 'get'
  })
}

// 新增文章标签
export function addArticleTag(data) {
  return request({
    url: '/blog/articleTag',
    method: 'post',
    data: data
  })
}

// 修改文章标签
export function updateArticleTag(data) {
  return request({
    url: '/blog/articleTag',
    method: 'put',
    data: data
  })
}

// 删除文章标签
export function delArticleTag(id) {
  return request({
    url: '/blog/articleTag/' + id,
    method: 'delete'
  })
}
