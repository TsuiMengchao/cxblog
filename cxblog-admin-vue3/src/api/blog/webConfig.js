import request from '@/utils/request'
import {AxiosPromise} from "axios";

// 查询网站配置列表
export function listWebConfig(query) {
  return request({
    url: '/blog/webConfig/list',
    method: 'get',
    params: query
  })
}

// // 查询网站配置详细
// export function getWebConfig(id) {
//   return request({
//     url: '/blog/webConfig/' + id,
//     method: 'get'
//   })
// }

// 新增网站配置
export function addWebConfig(data) {
  return request({
    url: '/blog/webConfig',
    method: 'post',
    data: data
  })
}

// // 修改网站配置
// export function updateWebConfig(data) {
//   return request({
//     url: '/blog/webConfig',
//     method: 'put',
//     data: data
//   })
// }

// 删除网站配置
export function delWebConfig(id) {
  return request({
    url: '/blog/webConfig/' + id,
    method: 'delete'
  })
}


/**
 * 修改
 *
 * @param data
 */
export function updateWebConfig(data) {
  return request({
    url: "/blog/webConfig/update",
    method: "put",
    data
  });
}

/**
 * 网站信息
 *
 */
export function getWebConfig() {
  return request({
    url: "/blog/webConfig",
    method: "get"
  });
}

