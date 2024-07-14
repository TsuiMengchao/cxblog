import request from "@/utils/request";

// 讨论评论管理
export function fetchComment(params) {
  return request({
    url: '/api/forumComment/list',
    method: 'get',
    params:params
  })
}
export function deleteBatch(data) {
  return request({
    url: '/api/forumComment/deleteBatch',
    method: 'delete',
    data
  })
}

