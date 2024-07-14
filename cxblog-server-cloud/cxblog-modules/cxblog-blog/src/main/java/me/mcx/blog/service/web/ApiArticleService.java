package me.mcx.blog.service.web;

import me.mcx.blog.domain.dto.article.ArticlePostDTO;
import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ApiArticleService {

    /**
     * 首页分页获取文章
     * @return
     */
    public List<ApiArticleListVO> selectArticleList(Integer categoryId, Integer tagId, String orderByDescColumn);

    /**
     * 首页获取文章详情
     * @param id 文章id
     * @return
     */
    public AjaxResult selectArticleInfo(Integer id);


    /**
     * 搜索文章
     * @param keywords 搜索关键词
     * @return
     */
    public AjaxResult searchArticle(String keywords);


    /**
     * 文章归档
     * @return
     */
    public AjaxResult archive();

    /**
     * 文章点赞
     * @param articleId 文章id
     * @return
     */
    public AjaxResult articleLike(Integer articleId);

    /**
     * 校验秘钥
     * @param code 验证码
     * @return
     */
    public AjaxResult checkCode(String code);

    /**
     * 用户添加文章
     * @param dto
     * @return
     */
    public AjaxResult insertArticle(ArticlePostDTO dto);

    /**
     * 查询我的文章
     * @return
     */
    List<ApiArticleListVO> selectArticleByUserId(String userId, Integer type);


    /**
     * 删除我的文章
     * @param id
     * @return
     */
    public AjaxResult deleteMyArticle(Long id);

    /**
     * 获取我的文章详情
     * @param id
     * @return
     */
    public AjaxResult selectMyArticleInfo(Long id);

    /**
     * 修改我的文章
     * @param dto
     * @return
     */
    public AjaxResult updateMyArticle(ArticlePostDTO dto);

    /**
     * 读取md文件添加文章
     * @param file
     * @return
     */
    AjaxResult readMarkdownFile(MultipartFile file);
}
