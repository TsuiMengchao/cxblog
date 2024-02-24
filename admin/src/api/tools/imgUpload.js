import request from '@/utils/request'

export function upload(data) {
  return request({
    url: '/api/file/upload',
    method: 'POST',
    headers:{'Content-Type': 'multipart/blogs-data'},
    data
  })
}
export function delBatchFile(key) {
  return request({
    url: '/api/file/delBatchFile',
    method: 'POST',
    params:{
      key:key
    }
  })
}
