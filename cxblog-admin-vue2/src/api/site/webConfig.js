import request from '@/utils/request'

export function getWebConfig() {
  return request({
    url: '/api/webConfig/list',
    method: 'get',
    params: {}
  })
}
export function update(data) {
  return request({
    url: '/api/webConfig/update',
    method: 'post',
    data
  })
}
