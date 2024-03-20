package me.mcx.modules.blog.admin.rest;

import cn.dev33.satoken.annotation.SaCheckPermission;
import me.mcx.annotation.Log;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.dto.ArticleDTO;
import me.mcx.modules.blog.admin.service.ArticleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/article")
@RequiredArgsConstructor
@Api(tags = "后台文章管理")
public class ArticlesController {

    private final ArticleService articleService;


    @PreAuthorize("@cx.check('article:list')")
    @PostMapping(value = "/list")
    @ApiOperation(value = "文章列表", httpMethod = "POST", response = ResponseResult.class, notes = "文章列表")
    public ResponseResult selectArticleList(@RequestBody Map<String,Object> map) {
        return articleService.selectArticleList(map);
    }

    @GetMapping(value = "/info")
    @PreAuthorize("@cx.check('article:info')")
    @ApiOperation(value = "文章详情", httpMethod = "GET", response = ResponseResult.class, notes = "文章详情")
    public ResponseResult selectArticleById(Long id) {
        return articleService.selectArticleById(id);
    }

    @PostMapping(value = "/add")
    @PreAuthorize("@cx.check('article:add')")
    @ApiOperation(value = "保存文章", httpMethod = "POST", response = ResponseResult.class, notes = "保存文章")
    @Log(value = "保存文章")
    public ResponseResult insertArticle(@RequestBody ArticleDTO article) {
        return  articleService.insertArticle(article);
    }

    @PostMapping(value = "/update")
    @PreAuthorize("@cx.check('article:edit')")
    @ApiOperation(value = "修改文章", httpMethod = "POST", response = ResponseResult.class, notes = "修改文章")
    @Log(value = "修改文章")
    public ResponseResult updateArticle(@RequestBody ArticleDTO article) {
        return articleService.updateArticle(article);
    }


    @DeleteMapping(value = "/deleteBatch")
    @PreAuthorize("@cx.check('article:deleteBatch')")
    @ApiOperation(value = "批量删除文章", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除文章")
    @Log(value = "批量删除文章")
    public ResponseResult deleteBatchArticle(@RequestBody List<Long> ids) {
        return articleService.deleteBatchArticle(ids);
    }

    @PostMapping(value = "/top")
    @PreAuthorize("@cx.check('article:top')")
    @ApiOperation(value = "置顶文章", httpMethod = "POST", response = ResponseResult.class, notes = "置顶文章")
    @Log(value = "置顶文章")
    public ResponseResult topArticle(@RequestBody ArticleDTO article) {
        return articleService.topArticle(article);
    }

    @PostMapping(value = "/pubOrShelf")
    @PreAuthorize("@cx.check('article:pubOrShelf')")
    @ApiOperation(value = "发布或下架文章", httpMethod = "POST", response = ResponseResult.class, notes = "发布或下架文章")
    @Log(value = "发布或下架文章")
    public ResponseResult psArticle(@RequestBody ArticleDTO article) {
        return articleService.psArticle(article);
    }

    @PostMapping(value = "/baiduSeo")
    @PreAuthorize("@cx.check('article:baiduSeo')")
    @ApiOperation(value = "批量文章SEO", httpMethod = "POST", response = ResponseResult.class, notes = "文章SEO")
    @Log(value = "批量文章SEO")
    public ResponseResult seoBatch(@RequestBody List<Long> ids) {
        return articleService.seoBatch(ids);
    }

    @GetMapping(value = "/reptile")
    @PreAuthorize("@cx.check('article:reptile')")
    @ApiOperation(value = "文章爬虫", httpMethod = "GET", response = ResponseResult.class, notes = "文章爬虫")
    @Log(value = "文章爬虫")
    public ResponseResult reptile(String url) {
        return articleService.reptile(url);
    }

    @GetMapping(value = "/randomImg")
    @ApiOperation(value = "随机获取一张图片", httpMethod = "GET", response = ResponseResult.class, notes = "随机获取一张图片")
    public ResponseResult randomImg() {
        return articleService.randomImg();
    }

}
