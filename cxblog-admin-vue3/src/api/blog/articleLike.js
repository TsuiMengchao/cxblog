import request from '@/utils/request'

// 查询文章收藏列表
export function listArticleLike(query) {
  return request({
    url: '/blog/articleLike/list',
    method: 'get',
    params: query
  })
}

// 查询文章收藏详细
export function getArticleLike(id) {
  return request({
    url: '/blog/articleLike/' + id,
    method: 'get'
  })
}

// 新增文章收藏
export function addArticleLike(data) {
  return request({
    url: '/blog/articleLike',
    method: 'post',
    data: data
  })
}

// 修改文章收藏
export function updateArticleLike(data) {
  return request({
    url: '/blog/articleLike',
    method: 'put',
    data: data
  })
}

// 删除文章收藏
export function delArticleLike(id) {
  return request({
    url: '/blog/articleLike/' + id,
    method: 'delete'
  })
}
