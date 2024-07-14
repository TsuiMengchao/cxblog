import request from '@/utils/request'

// 查询说说列表
export function listSay(query) {
  return request({
    url: '/blog/say/list',
    method: 'get',
    params: query
  })
}

// 查询说说详细
export function getSay(id) {
  return request({
    url: '/blog/say/' + id,
    method: 'get'
  })
}

// 新增说说
export function addSay(data) {
  return request({
    url: '/blog/say',
    method: 'post',
    data: data
  })
}

// 修改说说
export function updateSay(data) {
  return request({
    url: '/blog/say',
    method: 'put',
    data: data
  })
}

// 删除说说
export function delSay(id) {
  return request({
    url: '/blog/say/' + id,
    method: 'delete'
  })
}
