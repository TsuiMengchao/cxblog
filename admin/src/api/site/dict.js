import request from '@/utils/request'

export function fetchDictList(params) {
  return request({
    url: '/api/dict/list',
    method: 'get',
    params:params
  })
}
export function addDict(data) {
  return request({
    url: '/api/dict/add',
    method: 'post',
    data
  })
}
export function updateDict(data) {
  return request({
    url: '/api/dict/update',
    method: 'post',
    data
  })
}
export function deleteDict(id) {
  return request({
    url: '/api/dict/delete',
    method: 'delete',
    params:{
      id:id
    }
  })
}
export function deleteBatchDict(data) {
  return request({
    url: '/api/dict/deleteBatch',
    method: 'delete',
    data
  })
}

