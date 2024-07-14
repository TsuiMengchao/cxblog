import request from '@/utils/request'

// 查询博客标签列表
export function listTags(query) {
  return request({
    url: '/blog/tags/list',
    method: 'get',
    params: query
  })
}

// 查询博客标签详细
export function getTags(id) {
  return request({
    url: '/blog/tags/' + id,
    method: 'get'
  })
}

// 新增博客标签
export function addTags(data) {
  return request({
    url: '/blog/tags',
    method: 'post',
    data: data
  })
}

// 修改博客标签
export function updateTags(data) {
  return request({
    url: '/blog/tags',
    method: 'put',
    data: data
  })
}

// 删除博客标签
export function delTags(id) {
  return request({
    url: '/blog/tags/' + id,
    method: 'delete'
  })
}
