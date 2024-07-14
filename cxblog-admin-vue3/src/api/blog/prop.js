import request from '@/utils/request'

// 查询道具列表
export function listProp(query) {
  return request({
    url: '/blog/prop/list',
    method: 'get',
    params: query
  })
}

// 查询道具详细
export function getProp(id) {
  return request({
    url: '/blog/prop/' + id,
    method: 'get'
  })
}

// 新增道具
export function addProp(data) {
  return request({
    url: '/blog/prop',
    method: 'post',
    data: data
  })
}

// 修改道具
export function updateProp(data) {
  return request({
    url: '/blog/prop',
    method: 'put',
    data: data
  })
}

// 删除道具
export function delProp(id) {
  return request({
    url: '/blog/prop/' + id,
    method: 'delete'
  })
}
