import request from '@/utils/request'

// 查询网站导航列表
export function listNavigation(query) {
  return request({
    url: '/blog/navigation/list',
    method: 'get',
    params: query
  })
}

// 查询网站导航详细
export function getNavigation(id) {
  return request({
    url: '/blog/navigation/' + id,
    method: 'get'
  })
}

// 新增网站导航
export function addNavigation(data) {
  return request({
    url: '/blog/navigation',
    method: 'post',
    data: data
  })
}

// 修改网站导航
export function updateNavigation(data) {
  return request({
    url: '/blog/navigation',
    method: 'put',
    data: data
  })
}

// 删除网站导航
export function delNavigation(id) {
  return request({
    url: '/blog/navigation/' + id,
    method: 'delete'
  })
}
