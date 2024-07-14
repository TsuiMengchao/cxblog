import request from '@/utils/request'

// 查询博客文章列表
export function getArticlePage(query) {
  return request({
    url: '/blog/article/list',
    method: 'get',
    params: query
  })
}

// 查询博客文章详细
export function getArticleInfo(id) {
  return request({
    url: '/blog/article/' + id,
    method: 'get'
  })
}

// 新增博客文章
export function addArticle(data) {
  return request({
    url: '/blog/article',
    method: 'post',
    data: data
  })
}

// 修改博客文章
export function updateArticle(data) {
  return request({
    url: '/blog/article',
    method: 'put',
    data: data
  })
}

// 删除博客文章
export function delArticle(id) {
  return request({
    url: '/blog/article/' + id,
    method: 'delete'
  })
}

/**
 * 随机一张封面图
 *
 */
export function randomAvatar() {
  return request({
    url: "/blog/article/randomImg",
    method: "get",
  });
}


/**
 * 置顶文章
 *
 */
export function topArticle(data) {
  return request({
    url: "/blog/article/top",
    method: "put",
    data
  });
}

/**
 * 发布或下架
 *
 */
export function pubOrShelfArticle(data) {
  return request({
    url: "/blog/article/pubOrShelf",
    method: "put",
    data
  });
}

/**
 * SEO
 *
 */
export function seoArticle(data) {
  return request({
    url: "/blog/article/seo",
    method: "post",
    data
  });
}


/**
 * CSDN文章抓取
 *
 */
export function reptile(url) {
  return request({
    url: "/blog/article/reptile",
    method: "get",
    params:{
      url:url
    }
  });
}
