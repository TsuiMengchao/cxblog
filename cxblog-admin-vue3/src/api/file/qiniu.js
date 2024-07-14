import request from '@/utils/request'


export function listQiniuContent(data) {
  return request({
    url: 'file/qiNiuContent',
    method: 'get',
    params: data
  })
}

export function getQiniuCofig() {
  return request({
    url: 'file/qiNiuContent/config',
    method: 'get'
  })
}
export function updateQiniuContent(data) {
  return request({
    url: 'file/qiNiuContent',
    data,
    method: 'post'
  })
}
export function updateQiniuCofig(data) {
  return request({
    url: 'file/qiNiuContent/config',
    data,
    method: 'put'
  })
}

export function download(id) {
  return request({
    url: 'file/qiNiuContent/download/' + id,
    method: 'get'
  })
}

export function sync() {
  return request({
    url: 'file/qiNiuContent/synchronize',
    method: 'post'
  })
}

export function delQiniuContent(ids) {
  return request({
    url: 'file/qiNiuContent',
    method: 'delete',
    data: ids
  })
}

export default { delQiniuContent, download, sync }
