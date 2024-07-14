import request from '@/utils/request'

// 查询话题圈子列表
export function listTalk(query) {
  return request({
    url: '/blog/talk/list',
    method: 'get',
    params: query
  })
}

// 查询话题圈子详细
export function getTalk(id) {
  return request({
    url: '/blog/talk/' + id,
    method: 'get'
  })
}

// 新增话题圈子
export function addTalk(data) {
  return request({
    url: '/blog/talk',
    method: 'post',
    data: data
  })
}

// 修改话题圈子
export function updateTalk(data) {
  return request({
    url: '/blog/talk',
    method: 'put',
    data: data
  })
}

// 删除话题圈子
export function delTalk(id) {
  return request({
    url: '/blog/talk/' + id,
    method: 'delete'
  })
}
