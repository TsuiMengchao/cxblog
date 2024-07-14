import request from '@/utils/request'

// 查询即时消息列表
export function listImMessage(query) {
  return request({
    url: '/blog/imMessage/list',
    method: 'get',
    params: query
  })
}

// 查询即时消息详细
export function getImMessage(id) {
  return request({
    url: '/blog/imMessage/' + id,
    method: 'get'
  })
}

// 新增即时消息
export function addImMessage(data) {
  return request({
    url: '/blog/imMessage',
    method: 'post',
    data: data
  })
}

// 修改即时消息
export function updateImMessage(data) {
  return request({
    url: '/blog/imMessage',
    method: 'put',
    data: data
  })
}

// 删除即时消息
export function delImMessage(id) {
  return request({
    url: '/blog/imMessage/' + id,
    method: 'delete'
  })
}
