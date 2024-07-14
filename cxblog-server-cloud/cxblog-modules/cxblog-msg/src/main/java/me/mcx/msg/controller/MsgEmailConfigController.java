package me.mcx.msg.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import me.mcx.msg.domain.vo.MsgEmailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import me.mcx.common.log.annotation.Log;
import me.mcx.common.log.enums.BusinessType;
import me.mcx.common.security.annotation.RequiresPermissions;
import me.mcx.msg.domain.MsgEmailConfig;
import me.mcx.msg.service.IMsgEmailConfigService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 邮箱配置Controller
 * 
 * @author mcx
 * @date 2024-05-07
 */
@RestController
@RequestMapping("/email")
public class MsgEmailConfigController extends BaseController
{
    @Autowired
    private IMsgEmailConfigService msgEmailConfigService;

    /**
     * 获取邮箱配置详细信息
     */
    @RequiresPermissions("msg:emailConfig:query")
    @GetMapping
    public AjaxResult getInfo()
    {
        return success(msgEmailConfigService.selectMsgEmailConfigByConfigId());
    }

    /**
     * 发送邮箱
     */
    @Log(title = "邮箱配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult send(@Validated @RequestBody MsgEmailVo emailVo)
    {
        msgEmailConfigService.sendMsgEmail(emailVo,msgEmailConfigService.selectMsgEmailConfigByConfigId());
        return success();
    }

    /**
     * 修改邮箱配置
     */
    @RequiresPermissions("msg:emailConfig:edit")
    @Log(title = "邮箱配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MsgEmailConfig msgEmailConfig)
    {
        return toAjax(msgEmailConfigService.updateMsgEmailConfig(msgEmailConfig));
    }
}
