import request from '@/utils/request'

// 查询简讯点赞列表
export function listTipsoonLike(query) {
  return request({
    url: '/blog/tipsoonLike/list',
    method: 'get',
    params: query
  })
}

// 查询简讯点赞详细
export function getTipsoonLike(id) {
  return request({
    url: '/blog/tipsoonLike/' + id,
    method: 'get'
  })
}

// 新增简讯点赞
export function addTipsoonLike(data) {
  return request({
    url: '/blog/tipsoonLike',
    method: 'post',
    data: data
  })
}

// 修改简讯点赞
export function updateTipsoonLike(data) {
  return request({
    url: '/blog/tipsoonLike',
    method: 'put',
    data: data
  })
}

// 删除简讯点赞
export function delTipsoonLike(id) {
  return request({
    url: '/blog/tipsoonLike/' + id,
    method: 'delete'
  })
}
