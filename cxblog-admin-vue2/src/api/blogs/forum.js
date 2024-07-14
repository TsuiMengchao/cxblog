import request from "@/utils/request";

export function getForumList(params) {
  return request({
    url: '/api/forum/list',
    method: 'get',
    params: params
  })
}

export function getForumInfo(id) {
  return request({
    url: '/api/forum/info',
    method: 'get',
    params: {
      id: id
    }
  })
}
export function updateForum(data) {
  return request({
    url: '/api/forum/update',
    method: 'put',
    data
  })
}
export function insertForum(data) {
  return request({
    url: '/api/forum/',
    method: 'post',
    data
  })
}
export function deleteForum(data) {
  return request({
    url: '/api/forum/delete',
    method: 'delete',
    data
  })
}
