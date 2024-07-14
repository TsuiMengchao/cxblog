import request from '@/utils/request'

// 查询简讯收藏列表
export function listTipsoonCollect(query) {
  return request({
    url: '/blog/tipsoonCollect/list',
    method: 'get',
    params: query
  })
}

// 查询简讯收藏详细
export function getTipsoonCollect(id) {
  return request({
    url: '/blog/tipsoonCollect/' + id,
    method: 'get'
  })
}

// 新增简讯收藏
export function addTipsoonCollect(data) {
  return request({
    url: '/blog/tipsoonCollect',
    method: 'post',
    data: data
  })
}

// 修改简讯收藏
export function updateTipsoonCollect(data) {
  return request({
    url: '/blog/tipsoonCollect',
    method: 'put',
    data: data
  })
}

// 删除简讯收藏
export function delTipsoonCollect(id) {
  return request({
    url: '/blog/tipsoonCollect/' + id,
    method: 'delete'
  })
}
