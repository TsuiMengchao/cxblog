package me.mcx.modules.blog.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.domain.Emoji;
import me.mcx.exception.BusinessException;
import me.mcx.modules.blog.mapper.EmojiMapper;
import lombok.RequiredArgsConstructor;
import me.mcx.modules.blog.web.service.ApiEmojiService;
import me.mcx.utils.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApiEmojiServiceImpl implements ApiEmojiService {

    private final EmojiMapper emojiMapper;

    @Override
    public ResponseResult selectEmojiListByUserId() {
        List<Emoji> emojis = emojiMapper.selectList(new LambdaQueryWrapper<Emoji>()
                .eq(Emoji::getUserId, SecurityUtils.getCurrentUserId()).orderByDesc(Emoji::getIsStick).orderByDesc(Emoji::getCreateTime));
        return ResponseResult.success(emojis);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult addEmoji(Emoji emoji) {
        int count = Math.toIntExact(emojiMapper.selectCount(new LambdaQueryWrapper<Emoji>().eq(Emoji::getUserId, SecurityUtils.getCurrentUserId())
                .eq(Emoji::getUrl, emoji.getUrl())));
        if (count > 0) {
            throw new BusinessException("该表情已存在");
        }
        emoji.setUserId(String.valueOf(SecurityUtils.getCurrentUserId()));
        emojiMapper.insert(emoji);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult deleteEmoji(Integer id) {
        Emoji emoji = emojiMapper.selectById(id);
        if (!emoji.getUserId().equals(SecurityUtils.getCurrentUserId().toString())){
            throw new BusinessException("删除失败，非本人创建的emoji不能删除");
        }
        emojiMapper.deleteById(id);
        return ResponseResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResponseResult stickEmoji(Integer id) {
        Emoji emoji = emojiMapper.selectById(id);
        if (!emoji.getUserId().equals(SecurityUtils.getCurrentUserId().toString())){
            throw new BusinessException("置顶失败，非本人创建的emoji不能置顶");
        }
        emoji.setIsStick(1);
        emojiMapper.updateById(emoji);
        return ResponseResult.success();
    }
}
