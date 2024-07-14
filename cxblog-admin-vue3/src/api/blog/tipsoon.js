import request from '@/utils/request'

// 查询简讯列表
export function listTipsoon(query) {
  return request({
    url: '/blog/tipsoon/list',
    method: 'get',
    params: query
  })
}

// 查询简讯详细
export function getTipsoon(id) {
  return request({
    url: '/blog/tipsoon/' + id,
    method: 'get'
  })
}

// 新增简讯
export function addTipsoon(data) {
  return request({
    url: '/blog/tipsoon',
    method: 'post',
    data: data
  })
}

// 修改简讯
export function updateTipsoon(data) {
  return request({
    url: '/blog/tipsoon',
    method: 'put',
    data: data
  })
}

// 删除简讯
export function delTipsoon(id) {
  return request({
    url: '/blog/tipsoon/' + id,
    method: 'delete'
  })
}
