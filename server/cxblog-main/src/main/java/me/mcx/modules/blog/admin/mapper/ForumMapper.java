package me.mcx.modules.blog.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.Followed;
import me.mcx.modules.blog.domain.Forum;
import me.mcx.modules.blog.domain.vo.talk.ApiForumLikeListVO;
import me.mcx.modules.blog.domain.vo.talk.ApiForumListVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Mapper
public interface ForumMapper extends BaseMapper<Forum> {

    Page<ApiForumListVO> selectForumListByTalkId(@Param("page") Page<Object> page, @Param("talkId") Integer talkId,@Param("followedList") List<Followed> followedList);

    void insertForumLike(@Param("forumId") Integer forumId, @Param("userId")String userId);

    int selectForumUserIsLike(@Param("forumId") Integer forumId, @Param("userId")String userId);

    void deleteForumLikeByUerIdAndForumId(@Param("forumId") Integer forumId, @Param("userId")String userId);

    int countForumLike(Integer forumId);

    Page<ApiForumLikeListVO> selectForumLikeList(@Param("page") Page<Object> page,@Param("forumId") Integer forumId);

    ApiForumListVO getForumById(Integer forumId);

}
