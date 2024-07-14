import request from "@/utils/request";

//留言管理
export function fetchMessage(params) {
  return request({
    url: '/api/message/list',
    method: 'get',
    params:params
  })
}
export function passBatch(data) {
  return request({
    url: '/api/message/passBatch',
    method: 'post',
    data
  })
}
export function deleteBatch(data) {
  return request({
    url: '/api/message/deleteBatch',
    method: 'delete',
    data
  })
}
export function remove(id) {
  return request({
    url: '/api/message/remove',
    method: 'delete',
    params: {id:id}
  })
}
