import request from '@/utils/request'

export function fetchCategory(params) {
  return request({
    url: '/api/category/list',
    method: 'GET',
    params:params
  })
}
export function deleteBatch(data) {
  return request({
    url: '/api/category/deleteBatch',
    method: 'delete',
    data
  })
}
export function remove(id) {
  return request({
    url: '/api/category/delete',
    method: 'delete',
    params:{
      id:id
    }
  })
}
export function add(data) {
  return request({
    url: '/api/category/add',
    method: 'POST',
    data
  })
}
export function info(id) {
  return request({
    url: '/api/category/info',
    method: 'get',
    params:{
      id:id
    }
  })
}
export function update(data) {
  return request({
    url: '/api/category/update',
    method: 'post',
    data
  })
}
export function top(id) {
  return request({
    url: '/api/category/top',
    method: 'get',
    params:{
      id:id
    }
  })
}
