import request from "@/utils/request";

export function getSayList(params) {
  return request({
    url: '/api/say/list',
    method: 'get',
    params: params
  })
}

export function getSayInfo(id) {
  return request({
    url: '/api/say/info',
    method: 'get',
    params: {
      id: id
    }
  })
}
export function updateSay(data) {
  return request({
    url: '/api/say/update',
    method: 'put',
    data
  })
}
export function insertSay(data) {
  return request({
    url: '/api/say/',
    method: 'post',
    data
  })
}
export function deleteSay(data) {
  return request({
    url: '/api/say/delete',
    method: 'delete',
    data
  })
}
