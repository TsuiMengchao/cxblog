import request from '@/utils/request'

// 查询圈子话题列表
export function listForum(query) {
  return request({
    url: '/blog/forum/list',
    method: 'get',
    params: query
  })
}

// 查询圈子话题详细
export function getForum(id) {
  return request({
    url: '/blog/forum/' + id,
    method: 'get'
  })
}

// 新增圈子话题
export function addForum(data) {
  return request({
    url: '/blog/forum',
    method: 'post',
    data: data
  })
}

// 修改圈子话题
export function updateForum(data) {
  return request({
    url: '/blog/forum',
    method: 'put',
    data: data
  })
}

// 删除圈子话题
export function delForum(id) {
  return request({
    url: '/blog/forum/' + id,
    method: 'delete'
  })
}
