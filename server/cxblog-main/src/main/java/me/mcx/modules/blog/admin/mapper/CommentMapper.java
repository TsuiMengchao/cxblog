package me.mcx.modules.blog.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.Comment;
import me.mcx.modules.blog.domain.vo.ApiArticleListVO;
import me.mcx.modules.blog.domain.vo.ApiCommentListVO;
import me.mcx.modules.blog.domain.vo.SystemCommentVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 博客评论表 Mapper 接口
 * </p>
 *
 * @author MCX
 * @since 2021-07-19
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {


    Page<SystemCommentVO> selectPageList(@Param("page")Page<Object> objectPage, @Param("keywords")String keywords);

    Page<ApiCommentListVO> selectCommentPage(@Param("page") Page<ApiCommentListVO> commentListVOPage,
                                             @Param("articleId") Long articleId);

    /**
     * 获取我的文章
     * @param apiArticleListVOPage
     * @param loginIdAsString 登录用户id
     * @return
     */
    Page<ApiArticleListVO> selectMyComment(Page<ApiArticleListVO> apiArticleListVOPage, @Param("userId") String loginIdAsString);
}
