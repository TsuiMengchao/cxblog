import request from '@/utils/request'

export function getSystemConfig() {
  return request({
    url: '/api/config/getConfig',
    method: 'get',
    params: {}
  })
}
export function updateSystemConfig(data) {
  return request({
    url: '/api/config/update',
    method: 'post',
    data
  })
}
