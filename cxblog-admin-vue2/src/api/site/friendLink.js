import request from '@/utils/request'

export function fetchList(params) {
  return request({
    url: '/api/friend/list',
    method: 'get',
    params:params
  })
}
export function update(data) {
  return request({
    url: '/api/friend/update',
    method: 'post',
    data
  })
}
export function create(data) {
  return request({
    url: '/api/friend/create',
    method: 'post',
    data
  })
}
export function remove(data) {
  return request({
    url: '/api/friend/remove',
    method: 'delete',
    data
  })
}
export function top(id) {
  return request({
    url: '/api/friend/top',
    method: 'get',
    params: {
      id:id
    }
  })
}
