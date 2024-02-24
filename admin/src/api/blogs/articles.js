import request from '@/utils/request'

export function fetchArticle(data) {
  return request({
    url: '/api/article/list',
    method: 'post',
    data
  })
}
export function info(id) {
  return request({
    url: '/api/article/info',
    method: 'get',
    params: {
      id: id
    }
  })
}
export function save(data) {
  return request({
    url: '/api/article/add',
    method: 'post',
    data
  })
}
export function update(data) {
  return request({
    url: '/api/article/update',
    method: 'post',
    data
  })
}
export function top(data) {
  return request({
    url: '/api/article/top',
    method: 'post',
    data
  })
}
export function pubOrShelf(data) {
  return request({
    url: '/api/article/pubOrShelf',
    method: 'post',
    data
  })
}
export function deleteBatch(data) {
  return request({
    url: '/api/article/deleteBatch',
    method: 'delete',
    data
  })
}
export function baiduSeo(data) {
  return request({
    url: '/api/article/baiduSeo',
    method: 'post',
    data
  })
}
export function reptile(url) {
  return request({
    url: '/api/article/reptile',
    method: 'get',
    params: {
      url: url
    }
  })
}
export function randomImg() {
  return request({
    url: '/api/article/randomImg',
    method: 'get',
    params: {}
  })
}
