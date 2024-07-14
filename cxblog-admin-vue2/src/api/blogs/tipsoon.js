import request from "@/utils/request";

export function getTipsoonList(params) {
  return request({
    url: '/api/tipsoon/list',
    method: 'get',
    params: params
  })
}

export function getTipsoonInfo(id) {
  return request({
    url: '/api/tipsoon/info',
    method: 'get',
    params: {
      id: id
    }
  })
}
export function updateTipsoon(data) {
  return request({
    url: '/api/tipsoon/update',
    method: 'put',
    data
  })
}
export function insertTipsoon(data) {
  return request({
    url: '/api/tipsoon/',
    method: 'post',
    data
  })
}
export function deleteTipsoon(data) {
  return request({
    url: '/api/tipsoon/delete',
    method: 'delete',
    data
  })
}
