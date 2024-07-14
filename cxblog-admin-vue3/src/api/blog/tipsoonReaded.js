import request from '@/utils/request'

// 查询简讯已读列表
export function listTipsoonReaded(query) {
  return request({
    url: '/blog/tipsoonReaded/list',
    method: 'get',
    params: query
  })
}

// 查询简讯已读详细
export function getTipsoonReaded(id) {
  return request({
    url: '/blog/tipsoonReaded/' + id,
    method: 'get'
  })
}

// 新增简讯已读
export function addTipsoonReaded(data) {
  return request({
    url: '/blog/tipsoonReaded',
    method: 'post',
    data: data
  })
}

// 修改简讯已读
export function updateTipsoonReaded(data) {
  return request({
    url: '/blog/tipsoonReaded',
    method: 'put',
    data: data
  })
}

// 删除简讯已读
export function delTipsoonReaded(id) {
  return request({
    url: '/blog/tipsoonReaded/' + id,
    method: 'delete'
  })
}
