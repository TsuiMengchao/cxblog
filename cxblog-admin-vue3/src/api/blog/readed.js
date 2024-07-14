import request from '@/utils/request'

// 查询简讯已读列表
export function listReaded(query) {
  return request({
    url: '/blog/readed/list',
    method: 'get',
    params: query
  })
}

// 查询简讯已读详细
export function getReaded(id) {
  return request({
    url: '/blog/readed/' + id,
    method: 'get'
  })
}

// 新增简讯已读
export function addReaded(data) {
  return request({
    url: '/blog/readed',
    method: 'post',
    data: data
  })
}

// 修改简讯已读
export function updateReaded(data) {
  return request({
    url: '/blog/readed',
    method: 'put',
    data: data
  })
}

// 删除简讯已读
export function delReaded(id) {
  return request({
    url: '/blog/readed/' + id,
    method: 'delete'
  })
}
