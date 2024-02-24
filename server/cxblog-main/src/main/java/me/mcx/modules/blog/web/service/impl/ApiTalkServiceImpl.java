package me.mcx.modules.blog.web.service.impl;

import me.mcx.common.ResponseResult;
import me.mcx.modules.blog.admin.mapper.TalkMapper;
import me.mcx.modules.blog.web.service.ApiTalkService;
import me.mcx.modules.blog.domain.vo.talk.ApiTalkListVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

/**
 * @author: 辰雪
 * @date: 2023/10/16
 * @describe:
 */

@Slf4j
@Service
@RequiredArgsConstructor
public class ApiTalkServiceImpl implements ApiTalkService {

    private final TalkMapper talkMapper;

    @Override
    public ResponseResult selectList() {
        List<ApiTalkListVO> list = talkMapper.selectTalkListApi();
        return ResponseResult.success(list);
    }

    @Override
    public ResponseResult analysis(String url) {
        try {
            Document doc = Jsoup.connect(url).get();
            return ResponseResult.success(doc.title());
        } catch (IOException e) {
            log.info("网页地址解析失败，错误原因:{}",e.getMessage());
            return null;
        }
    }
}
