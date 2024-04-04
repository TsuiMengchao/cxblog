package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.ForumComment;
import me.mcx.modules.blog.domain.vo.talk.ApiForumCommentListVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ForumCommentMapper extends BaseMapper<ForumComment> {

    Page<ApiForumCommentListVO> selectListByForumId(@Param("page")Page<Object> page,@Param("forumId") Integer forumId);
}
