package me.mcx.modules.blog.web.service;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.dto.ArticleInsertDTO;
import org.springframework.web.multipart.MultipartFile;

public interface ApiArticleService {

    /**
     * 首页分页获取文章
     * @return
     */
    public ResponseResult selectArticleList(Integer categoryId, Integer tagId,String orderByDescColumn);

    /**
     * 根据点赞分页获取文章
     * @return
     */
    public ResponseResult selectLikeList();

    /**
     * 首页获取文章详情
     * @param id 文章id
     * @return
     */
    public ResponseResult selectArticleInfo(Integer id);


    /**
     * 搜索文章
     * @param keywords 搜索关键词
     * @return
     */
    public ResponseResult searchArticle(String keywords);


    /**
     * 文章归档
     * @return
     */
    public ResponseResult archive();

    /**
     * 文章点赞
     * @param articleId 文章id
     * @return
     */
    public ResponseResult articleLike(Integer articleId);

    /**
     * 校验秘钥
     * @param code 验证码
     * @return
     */
    public ResponseResult checkCode(String code);

    /**
     * 用户添加文章
     * @param dto
     * @return
     */
    public ResponseResult insertArticle(ArticleInsertDTO dto);

    /**
     * 查询我的文章
     * @return
     */
    ResponseResult selectArticleByUserId(String userId, Integer type);


    /**
     * 删除我的文章
     * @param id
     * @return
     */
    public ResponseResult deleteMyArticle(Long id);

    /**
     * 获取我的文章详情
     * @param id
     * @return
     */
    public ResponseResult selectMyArticleInfo(Long id);

    /**
     * 根据文章id获取作者信息
     * @param id 文章id
     * @return
     */
    public ResponseResult selectUserInfoByArticleId(Integer id);

    /**
     * 修改我的文章
     * @param dto
     * @return
     */
    public ResponseResult updateMyArticle(ArticleInsertDTO dto);

    /**
     * 读取md文件添加文章
     * @param file
     * @return
     */
    ResponseResult readMarkdownFile(MultipartFile file);
}
