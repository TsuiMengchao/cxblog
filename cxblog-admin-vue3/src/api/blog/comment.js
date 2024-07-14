import request from '@/utils/request'

// 查询说说评论列表
export function listComment(query) {
  return request({
    url: '/blog/comment/list',
    method: 'get',
    params: query
  })
}

// 查询说说评论详细
export function getComment(id) {
  return request({
    url: '/blog/comment/' + id,
    method: 'get'
  })
}

// 新增说说评论
export function addComment(data) {
  return request({
    url: '/blog/comment',
    method: 'post',
    data: data
  })
}

// 修改说说评论
export function updateComment(data) {
  return request({
    url: '/blog/comment',
    method: 'put',
    data: data
  })
}

// 删除说说评论
export function delComment(id) {
  return request({
    url: '/blog/comment/' + id,
    method: 'delete'
  })
}
