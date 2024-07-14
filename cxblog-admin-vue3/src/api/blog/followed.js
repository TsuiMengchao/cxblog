import request from '@/utils/request'

// 查询用户关注列表
export function listFollowed(query) {
  return request({
    url: '/blog/followed/list',
    method: 'get',
    params: query
  })
}

// 查询用户关注详细
export function getFollowed(id) {
  return request({
    url: '/blog/followed/' + id,
    method: 'get'
  })
}

// 新增用户关注
export function addFollowed(data) {
  return request({
    url: '/blog/followed',
    method: 'post',
    data: data
  })
}

// 修改用户关注
export function updateFollowed(data) {
  return request({
    url: '/blog/followed',
    method: 'put',
    data: data
  })
}

// 删除用户关注
export function delFollowed(id) {
  return request({
    url: '/blog/followed/' + id,
    method: 'delete'
  })
}
