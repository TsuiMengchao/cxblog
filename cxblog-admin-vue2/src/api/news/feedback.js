import request from '@/utils/request'

export function fetchFeedback(params) {
  return request({
    url: '/api/feedback/list',
    method: 'get',
    params: params
  })
}
export function deleteBatchFeedback(data) {
  return request({
    url: '/api/feedback/deleteBatch',
    method: 'delete',
    data
  })
}

export function updateFeedBack(data) {
  return request({
    url: '/api/feedback/update',
    method: 'put',
    data
  })
}

