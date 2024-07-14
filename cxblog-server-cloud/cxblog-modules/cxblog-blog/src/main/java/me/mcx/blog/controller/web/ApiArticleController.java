package me.mcx.blog.controller.web;

import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import me.mcx.common.security.annotation.AccessLimit;
import me.mcx.blog.domain.dto.article.ArticlePostDTO;
import me.mcx.blog.service.web.ApiArticleService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.web.page.TableDataInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


/**
 * @author blue
 * @Description: 博客前台博客文章控制器
 * @Date 2021-07-25 19:04
 */
@RestController
@RequestMapping("/v1/article")
@Api(tags = "文章API-V1")
@RequiredArgsConstructor
public class ApiArticleController extends BaseController {

    private final ApiArticleService articleService;

    @GetMapping
    /**
     * 查询所有文章
     */
    public TableDataInfo selectArticleList(Integer categoryId, Integer tagId, String orderByDescColumn) {
        startPage();
        return getDataTable(articleService.selectArticleList(categoryId,tagId,orderByDescColumn));
    }

    /**
     * 查看文章详情
     * @param id
     * @return
     */
    @GetMapping(value = "/info/{id}")
    public AjaxResult selectArticleInfo(@PathVariable Integer id) {
        return articleService.selectArticleInfo(id);
    }

    /**
     * 用户搜索文章
     * @param keyword
     * @return
     */
    @GetMapping(value = "/search")
    public AjaxResult searchArticle(String keyword) {
        return articleService.searchArticle(keyword);
    }

    /**
     * 归档
     * @return
     */
    @GetMapping(value = "/archive")
    public AjaxResult archive() {
        return  articleService.archive();
    }


    /**
     * 文章点赞
     * @param articleId
     * @return
     */
    @AccessLimit
    @GetMapping(value = "/like")
    public AjaxResult articleLike(Integer articleId) {
        return articleService.articleLike(articleId);
    }

    /**
     * 校验公众号验证码
     * @param code
     * @return
     */
    @GetMapping(value = "/checkCode")
    public AjaxResult checkCode(String code) {
        return articleService.checkCode(code);
    }

    /**
     * 添加文章
     * @param dto
     * @return
     */
    @PostMapping
    public AjaxResult insertArticle(@RequestBody ArticlePostDTO dto) {
        return articleService.insertArticle(dto);
    }

    /**
     * 修改我的文章
     * @param dto
     * @return
     */
    @PutMapping
    public AjaxResult updateMyArticle(@RequestBody ArticlePostDTO dto) {
        return articleService.updateMyArticle(dto);
    }

    /**
     * 根据用户id获取文章
     * @param userId
     * @param type
     * @return
     */
    @GetMapping(value = "/selectArticleByUserId")
    public TableDataInfo selectArticleByUserId(String userId,Integer type) {
        startPage();
        return getDataTable(articleService.selectArticleByUserId(userId,type));
    }

    /**
     * 删除我的文章
     * @param id
     * @return
     */
    @DeleteMapping
    public AjaxResult deleteMyArticle(Long id) {
        return articleService.deleteMyArticle(id);
    }

    /**
     * 我的文章详情
     * @param id
     * @return
     */
    @GetMapping(value = "/selectMyArticleInfo")
    public AjaxResult selectMyArticleInfo(Long id) {
        return articleService.selectMyArticleInfo(id);
    }

    /**
     * md文件添加文章
     * @param file
     * @return
     */
    @PostMapping(value = "/readMarkdownFile")
    public AjaxResult readMdFile(MultipartFile file) {
        return articleService.readMarkdownFile(file);
    }

}
