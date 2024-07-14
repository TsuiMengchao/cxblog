import request from '@/utils/request'

// 查询用户消息房间列表
export function listImRoom(query) {
  return request({
    url: '/blog/imRoom/list',
    method: 'get',
    params: query
  })
}

// 查询用户消息房间详细
export function getImRoom(id) {
  return request({
    url: '/blog/imRoom/' + id,
    method: 'get'
  })
}

// 新增用户消息房间
export function addImRoom(data) {
  return request({
    url: '/blog/imRoom',
    method: 'post',
    data: data
  })
}

// 修改用户消息房间
export function updateImRoom(data) {
  return request({
    url: '/blog/imRoom',
    method: 'put',
    data: data
  })
}

// 删除用户消息房间
export function delImRoom(id) {
  return request({
    url: '/blog/imRoom/' + id,
    method: 'delete'
  })
}
