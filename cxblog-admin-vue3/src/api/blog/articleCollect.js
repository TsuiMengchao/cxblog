import request from '@/utils/request'

// 查询文章收藏列表
export function listArticleCollect(query) {
  return request({
    url: '/blog/articleCollect/list',
    method: 'get',
    params: query
  })
}

// 查询文章收藏详细
export function getArticleCollect(id) {
  return request({
    url: '/blog/articleCollect/' + id,
    method: 'get'
  })
}

// 新增文章收藏
export function addArticleCollect(data) {
  return request({
    url: '/blog/articleCollect',
    method: 'post',
    data: data
  })
}

// 修改文章收藏
export function updateArticleCollect(data) {
  return request({
    url: '/blog/articleCollect',
    method: 'put',
    data: data
  })
}

// 删除文章收藏
export function delArticleCollect(id) {
  return request({
    url: '/blog/articleCollect/' + id,
    method: 'delete'
  })
}
