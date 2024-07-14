import request from '@/utils/request'

// 查询圈子评论列表
export function listForumComment(query) {
  return request({
    url: '/blog/forumComment/list',
    method: 'get',
    params: query
  })
}

// 查询圈子评论详细
export function getForumComment(id) {
  return request({
    url: '/blog/forumComment/' + id,
    method: 'get'
  })
}

// 新增圈子评论
export function addForumComment(data) {
  return request({
    url: '/blog/forumComment',
    method: 'post',
    data: data
  })
}

// 修改圈子评论
export function updateForumComment(data) {
  return request({
    url: '/blog/forumComment',
    method: 'put',
    data: data
  })
}

// 删除圈子评论
export function delForumComment(id) {
  return request({
    url: '/blog/forumComment/' + id,
    method: 'delete'
  })
}
