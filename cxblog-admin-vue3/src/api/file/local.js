import request from '@/utils/request'

// 查询本地存储列表
export function listLocalContent(query) {
  return request({
    url: '/file/local/list',
    method: 'get',
    params: query
  })
}

// 查询本地存储详细
export function getLocalContent(storageId) {
  return request({
    url: '/file/local/' + storageId,
    method: 'get'
  })
}

// 新增本地存储
export function addLocalContent(data) {
  return request({
    url: '/file/local',
    method: 'post',
    data: data
  })
}

// 修改本地存储
export function updateLocalContent(data) {
  return request({
    url: '/file/local',
    method: 'put',
    data: data
  })
}

// 删除本地存储
export function delLocalContent(storageId) {
  return request({
    url: '/file/local/' + storageId,
    method: 'delete'
  })
}


export function getConfig() {
  return request({
    url: 'file/local/config',
    method: 'get'
  })
}

export function updateConfig(data) {
  return request({
    url: 'file/local/config',
    data,
    method: 'put'
  })
}

