import request from '@/utils/request'

// 查询系统配置列表
export function listSystemConfig(query) {
  return request({
    url: '/blog/systemConfig/list',
    method: 'get',
    params: query
  })
}

/**
 * 获取数据
 *
 */
export function getSystemConfig(){
  return request({
    url: "/blog/systemConfig/getConfig",
    method: "get",
  });
}

// 新增系统配置
export function addSystemConfig(data) {
  return request({
    url: '/blog/systemConfig',
    method: 'post',
    data: data
  })
}

/**
 * 修改
 *
 * @param data
 */
export function updateSystemConfig(data) {
  return request({
    url: "/blog/systemConfig/update",
    method: "put",
    data
  });
}

// 删除系统配置
export function delSystemConfig(id) {
  return request({
    url: '/blog/systemConfig/' + id,
    method: 'delete'
  })
}
