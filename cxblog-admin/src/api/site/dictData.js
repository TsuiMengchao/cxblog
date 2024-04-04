import request from '@/utils/request'

export function fetchDataList(params) {
  return request({
    url: '/api/dictDetail/list',
    method: 'get',
    params: params
  })
}
export function addDictData(data) {
  return request({
    url: '/api/dictDetail/add',
    method: 'post',
    data
  })
}
export function updateDictData(data) {
  return request({
    url: '/api/dictDetail/update',
    method: 'post',
    data
  })
}
export function deleteDictData(id) {
  return request({
    url: '/api/dictDetail/delete',
    method: 'delete',
    params: {
      id: id
    }
  })
}
export function deleteBatchDictData(data) {
  return request({
    url: '/api/dictDetail/deleteBatch',
    method: 'delete',
    data
  })
}
export function getDataByDictType(data) {
  return request({
    url: '/api/dictDetail/getDataByDictType',
    method: 'post',
    data
  })
}
