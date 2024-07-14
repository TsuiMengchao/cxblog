import request from '@/utils/request'

// 查询说说评论列表
export function listSayComment(query) {
  return request({
    url: '/blog/sayComment/list',
    method: 'get',
    params: query
  })
}

// 查询说说评论详细
export function getSayComment(id) {
  return request({
    url: '/blog/sayComment/' + id,
    method: 'get'
  })
}

// 新增说说评论
export function addSayComment(data) {
  return request({
    url: '/blog/sayComment',
    method: 'post',
    data: data
  })
}

// 修改说说评论
export function updateSayComment(data) {
  return request({
    url: '/blog/sayComment',
    method: 'put',
    data: data
  })
}

// 删除说说评论
export function delSayComment(id) {
  return request({
    url: '/blog/sayComment/' + id,
    method: 'delete'
  })
}
