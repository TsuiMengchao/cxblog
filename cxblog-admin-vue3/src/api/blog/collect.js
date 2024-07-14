import request from '@/utils/request'

// 查询简讯收藏列表
export function listCollect(query) {
  return request({
    url: '/blog/collect/list',
    method: 'get',
    params: query
  })
}

// 查询简讯收藏详细
export function getCollect(id) {
  return request({
    url: '/blog/collect/' + id,
    method: 'get'
  })
}

// 新增简讯收藏
export function addCollect(data) {
  return request({
    url: '/blog/collect',
    method: 'post',
    data: data
  })
}

// 修改简讯收藏
export function updateCollect(data) {
  return request({
    url: '/blog/collect',
    method: 'put',
    data: data
  })
}

// 删除简讯收藏
export function delCollect(id) {
  return request({
    url: '/blog/collect/' + id,
    method: 'delete'
  })
}
