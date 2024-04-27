import request from "@/utils/request";

// 讨论评论管理
export function fetchComment(params) {
  return request({
    url: '/api/sayComment/list',
    method: 'get',
    params:params
  })
}
export function deleteBatch(data) {
  return request({
    url: '/api/sayComment/deleteBatch',
    method: 'delete',
    data
  })
}

