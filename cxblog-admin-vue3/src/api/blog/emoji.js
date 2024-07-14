import request from '@/utils/request'

// 查询情列表
export function listEmoji(query) {
  return request({
    url: '/blog/emoji/list',
    method: 'get',
    params: query
  })
}

// 查询情详细
export function getEmoji(id) {
  return request({
    url: '/blog/emoji/' + id,
    method: 'get'
  })
}

// 新增情
export function addEmoji(data) {
  return request({
    url: '/blog/emoji',
    method: 'post',
    data: data
  })
}

// 修改情
export function updateEmoji(data) {
  return request({
    url: '/blog/emoji',
    method: 'put',
    data: data
  })
}

// 删除情
export function delEmoji(id) {
  return request({
    url: '/blog/emoji/' + id,
    method: 'delete'
  })
}
