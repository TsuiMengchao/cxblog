import request from '@/utils/request'

export function init() {
  return request({
    url: '/api/home/init',
    method: 'get',
    params: {}
  })
}
export function lineCount() {
  return request({
    url: '/api/home/lineCount',
    method: 'get',
    params: {}
  })
}
export function apiInfo() {
  return request({
    url: '/api/home/apiInfo',
    method: 'get',
    params: {}
  })
}
export function cacheInfo() {
  return request({
    url: '/api/home/cache',
    method: 'get',
    params: {}
  })
}
export function report() {
  return request({
    url: '/v1/report',
    method: 'get',
    params: {}
  })
}
