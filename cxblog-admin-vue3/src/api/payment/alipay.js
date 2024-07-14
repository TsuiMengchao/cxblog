import request from '@/utils/request'

export function get() {
  return request({
    url: 'payment/alipay',
    method: 'get'
  })
}

export function update(data) {
  return request({
    url: 'payment/alipay',
    data,
    method: 'put'
  })
}

// 支付
export function toAliPay(url, data) {
  return request({
    url: 'payment/' + url,
    data,
    method: 'post'
  })
}
