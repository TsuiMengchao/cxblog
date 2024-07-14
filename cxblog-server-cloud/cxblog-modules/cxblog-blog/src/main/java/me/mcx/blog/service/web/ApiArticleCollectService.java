package me.mcx.blog.service.web;

import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import me.mcx.common.core.web.domain.AjaxResult;

import java.util.List;


public interface ApiArticleCollectService {

    /**
     * 我的收藏列表
     * @return
     */
    public List<ApiArticleListVO> selectCollectList();

    /**
     * 收藏文章
     * @param articleId 文章id
     * @return
     */
    public AjaxResult collect(Integer articleId);

    /**
     * 取消收藏
     * @param articleId 文章id
     * @return
     */
    public AjaxResult cancel(Integer articleId);



}
