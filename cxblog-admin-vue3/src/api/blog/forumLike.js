import request from '@/utils/request'

// 查询圈子内容点赞列表
export function listForumLike(query) {
  return request({
    url: '/blog/forumLike/list',
    method: 'get',
    params: query
  })
}

// 查询圈子内容点赞详细
export function getForumLike(id) {
  return request({
    url: '/blog/forumLike/' + id,
    method: 'get'
  })
}

// 新增圈子内容点赞
export function addForumLike(data) {
  return request({
    url: '/blog/forumLike',
    method: 'post',
    data: data
  })
}

// 修改圈子内容点赞
export function updateForumLike(data) {
  return request({
    url: '/blog/forumLike',
    method: 'put',
    data: data
  })
}

// 删除圈子内容点赞
export function delForumLike(id) {
  return request({
    url: '/blog/forumLike/' + id,
    method: 'delete'
  })
}
