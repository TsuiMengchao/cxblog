package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Article;
import me.mcx.modules.blog.domain.ArticleCollect;
import me.mcx.modules.blog.domain.Tags;
import me.mcx.modules.blog.web.handle.SystemNoticeHandle;
import me.mcx.modules.blog.web.im.MessageConstant;
import me.mcx.modules.blog.mapper.ArticleMapper;
import me.mcx.modules.blog.mapper.CollectMapper;
import me.mcx.modules.blog.mapper.TagsMapper;
import me.mcx.modules.blog.web.service.ApiCollectService;
import me.mcx.utils.PageUtils;
import me.mcx.modules.blog.domain.vo.ApiArticleListVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.utils.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ApiCollectServiceImpl implements ApiCollectService {

    private final CollectMapper collectMapper;

    private final ArticleMapper articleMapper;

    private final TagsMapper tagsMapper;

    /**
     * 我的收藏列表
     * @return
     */
    @Override
    public ResponseResult selectCollectList() {
        Page<ApiArticleListVO> list = collectMapper.selectCollectList(new Page<ApiArticleListVO>(PageUtils.getPageNo(),PageUtils.getPageSize()), String.valueOf(SecurityUtils.getCurrentUserId()));
        list.getRecords().forEach(item ->{
            List<Tags> tags = tagsMapper.selectTagByArticleId(item.getId());
            item.setTagList(tags);
        });
        return ResponseResult.success(list);
    }

    /**
     * 收藏文章
     * @param articleId 文章id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult collect(Integer articleId) {
        ArticleCollect articleCollect = ArticleCollect.builder().userId(String.valueOf(SecurityUtils.getCurrentUserId())).articleId(articleId).build();
        collectMapper.insert(articleCollect);
        // 发送系统通知
        Article article = articleMapper.selectById(articleId);
        SystemNoticeHandle.sendNotice(article.getUserId(), MessageConstant.MESSAGE_COLLECT_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE,articleId.toString(),null,null);
        return ResponseResult.success();
    }

    /**
     * 取消收藏
     * @param articleId 文章id
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult cancel(Integer articleId) {
        collectMapper.delete(new LambdaQueryWrapper<ArticleCollect>().eq(ArticleCollect::getUserId,SecurityUtils.getCurrentUserId()).eq(ArticleCollect::getArticleId,articleId));
        return ResponseResult.success();
    }
}
