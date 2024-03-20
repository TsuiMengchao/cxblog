package me.mcx.modules.blog.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.mapper.ForumMapper;
import me.mcx.modules.blog.admin.service.ForumService;
import me.mcx.modules.blog.domain.Forum;
import me.mcx.utils.PageUtils;
import me.mcx.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;


/**
 * <p>
 * 博客文章表 服务实现类
 * </p>
 *
 * @author MCX
 * @since 2021-08-18
 */
@Service
@Slf4j
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class ForumServiceImpl extends ServiceImpl<ForumMapper, Forum> implements ForumService {


    @Override
    public ResponseResult selectForumList(String keywords) {
        LambdaQueryWrapper<Forum> forumLambdaQueryWrapper = new LambdaQueryWrapper<>();
        forumLambdaQueryWrapper.orderByDesc(Forum::getCreateTime);
        Page<Forum> forumPage = baseMapper.selectPage(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()),forumLambdaQueryWrapper);
        return ResponseResult.success(forumPage);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult insertForum(Forum forum) {
        forum.setUserId(SecurityUtils.getCurrentUserId().toString());
        forum.setCreateTime(new Date());
        baseMapper.insert(forum);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteForum(List<String> ids) {
        baseMapper.deleteBatchIds(ids);
        return ResponseResult.success();
    }

    @Override
    public ResponseResult selectForumById(String id) {
        Forum forum = baseMapper.selectById(id);
        return ResponseResult.success(forum);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult updateForumById(Forum forum) {
        baseMapper.updateById(forum);
        return ResponseResult.success();
    }
}
