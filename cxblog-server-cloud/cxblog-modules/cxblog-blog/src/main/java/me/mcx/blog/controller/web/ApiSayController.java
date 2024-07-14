package me.mcx.blog.controller.web;

import me.mcx.blog.domain.BlogSay;
import me.mcx.blog.domain.BlogSayComment;
import me.mcx.blog.service.web.ApiSayService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.web.page.TableDataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("v1/say")
public class ApiSayController extends BaseController {

    @Autowired
    private ApiSayService apiSayService;

    /**
     * 说说列表
     * @return
     */
    @RequestMapping(value = "/getSayList",method = RequestMethod.GET)
    public TableDataInfo selectSayList(){
        startPage();
        return getDataTable(apiSayService.selectSayList());
    }

    /**
     * 点赞说说
     * @param sayId
     * @return
     */
    @RequestMapping(value = "/like",method = RequestMethod.GET)
    public AjaxResult like(String sayId){
        return apiSayService.like(sayId);
    }

    /**
     * 评论说说
     * @param sayComment
     * @return
     */
    @RequestMapping(value = "/comment",method = RequestMethod.POST)
    public AjaxResult comment(@RequestBody BlogSayComment sayComment){
        return apiSayService.comment(sayComment);
    }

    /**
     * 添加说说
     * @param say
     * @return
     */
    @RequestMapping(value = "/insertSay",method = RequestMethod.POST)
    public AjaxResult insertSay(@RequestBody BlogSay say){
        return apiSayService.insertSay(say);
    }

}
