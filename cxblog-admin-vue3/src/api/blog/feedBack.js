import request from '@/utils/request'

// 查询问题反馈列表
export function listFeedBack(query) {
  return request({
    url: '/blog/feedBack/list',
    method: 'get',
    params: query
  })
}

// 查询问题反馈详细
export function getFeedBack(id) {
  return request({
    url: '/blog/feedBack/' + id,
    method: 'get'
  })
}

// 新增问题反馈
export function addFeedBack(data) {
  return request({
    url: '/blog/feedBack',
    method: 'post',
    data: data
  })
}

// 修改问题反馈
export function updateFeedBack(data) {
  return request({
    url: '/blog/feedBack',
    method: 'put',
    data: data
  })
}

// 删除问题反馈
export function delFeedBack(id) {
  return request({
    url: '/blog/feedBack/' + id,
    method: 'delete'
  })
}
