import request from '@/utils/request'

// 查询简讯评论列表
export function listTipsoonComment(query) {
  return request({
    url: '/blog/tipsoonComment/list',
    method: 'get',
    params: query
  })
}

// 查询简讯评论详细
export function getTipsoonComment(id) {
  return request({
    url: '/blog/tipsoonComment/' + id,
    method: 'get'
  })
}

// 新增简讯评论
export function addTipsoonComment(data) {
  return request({
    url: '/blog/tipsoonComment',
    method: 'post',
    data: data
  })
}

// 修改简讯评论
export function updateTipsoonComment(data) {
  return request({
    url: '/blog/tipsoonComment',
    method: 'put',
    data: data
  })
}

// 删除简讯评论
export function delTipsoonComment(id) {
  return request({
    url: '/blog/tipsoonComment/' + id,
    method: 'delete'
  })
}
