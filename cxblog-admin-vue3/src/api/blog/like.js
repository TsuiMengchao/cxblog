import request from '@/utils/request'

// 查询简讯点赞列表
export function listLike(query) {
  return request({
    url: '/blog/like/list',
    method: 'get',
    params: query
  })
}

// 查询简讯点赞详细
export function getLike(id) {
  return request({
    url: '/blog/like/' + id,
    method: 'get'
  })
}

// 新增简讯点赞
export function addLike(data) {
  return request({
    url: '/blog/like',
    method: 'post',
    data: data
  })
}

// 修改简讯点赞
export function updateLike(data) {
  return request({
    url: '/blog/like',
    method: 'put',
    data: data
  })
}

// 删除简讯点赞
export function delLike(id) {
  return request({
    url: '/blog/like/' + id,
    method: 'delete'
  })
}
