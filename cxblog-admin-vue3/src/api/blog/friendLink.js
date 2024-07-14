import request from '@/utils/request'

// 查询友情链接列表
export function listFriendLink(query) {
  return request({
    url: '/blog/friendLink/list',
    method: 'get',
    params: query
  })
}

// 查询友情链接详细
export function getFriendLink(id) {
  return request({
    url: '/blog/friendLink/' + id,
    method: 'get'
  })
}

// 新增友情链接
export function addFriendLink(data) {
  return request({
    url: '/blog/friendLink',
    method: 'post',
    data: data
  })
}

// 修改友情链接
export function updateFriendLink(data) {
  return request({
    url: '/blog/friendLink',
    method: 'put',
    data: data
  })
}

// 删除友情链接
export function delFriendLink(id) {
  return request({
    url: '/blog/friendLink/' + id,
    method: 'delete'
  })
}
