import request from '@/utils/request'

export function get() {
  return request({
    url: 'msg/email',
    method: 'get'
  })
}

export function update(data) {
  return request({
    url: 'msg/email',
    data,
    method: 'put'
  })
}

export function send(data) {
  return request({
    url: 'msg/email',
    data,
    method: 'post'
  })
}
