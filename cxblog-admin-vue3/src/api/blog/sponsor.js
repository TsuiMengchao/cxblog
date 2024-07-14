import request from '@/utils/request'

// 查询打赏记录列表
export function listSponsor(query) {
  return request({
    url: '/blog/sponsor/list',
    method: 'get',
    params: query
  })
}

// 查询打赏记录详细
export function getSponsor(id) {
  return request({
    url: '/blog/sponsor/' + id,
    method: 'get'
  })
}

// 新增打赏记录
export function addSponsor(data) {
  return request({
    url: '/blog/sponsor',
    method: 'post',
    data: data
  })
}

// 修改打赏记录
export function updateSponsor(data) {
  return request({
    url: '/blog/sponsor',
    method: 'put',
    data: data
  })
}

// 删除打赏记录
export function delSponsor(id) {
  return request({
    url: '/blog/sponsor/' + id,
    method: 'delete'
  })
}
