import request from '@/utils/request'

// 查询网址分类列表
export function listSiteClass(query) {
  return request({
    url: '/blog/siteClass/list',
    method: 'get',
    params: query
  })
}

// 查询网址分类详细
export function getSiteClass(id) {
  return request({
    url: '/blog/siteClass/' + id,
    method: 'get'
  })
}

// 新增网址分类
export function addSiteClass(data) {
  return request({
    url: '/blog/siteClass',
    method: 'post',
    data: data
  })
}

// 修改网址分类
export function updateSiteClass(data) {
  return request({
    url: '/blog/siteClass',
    method: 'put',
    data: data
  })
}

// 删除网址分类
export function delSiteClass(id) {
  return request({
    url: '/blog/siteClass/' + id,
    method: 'delete'
  })
}
