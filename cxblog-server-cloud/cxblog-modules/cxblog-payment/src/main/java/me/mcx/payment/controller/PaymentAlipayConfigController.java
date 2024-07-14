package me.mcx.payment.controller;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.swagger.annotations.ApiOperation;
import me.mcx.payment.domain.vo.TradeVo;
import me.mcx.payment.utils.AliPayStatusEnum;
import me.mcx.payment.utils.AlipayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import me.mcx.payment.domain.PaymentAlipayConfig;
import me.mcx.payment.service.IPaymentAlipayConfigService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;
import springfox.documentation.annotations.ApiIgnore;

/**
 * 支付宝配置类Controller
 * 
 * @author mcx
 * @date 2024-05-08
 */
@RestController
@RequestMapping("/alipay")
public class PaymentAlipayConfigController extends BaseController
{
    @Autowired
    private IPaymentAlipayConfigService alipayConfigService;

    @Autowired
    private AlipayUtils alipayUtils;

    /**
     * 获取支付宝配置类详细信息
     */
    @RequiresPermissions("payment:alipayConfig:query")
    @GetMapping
    public AjaxResult getInfo()
    {
        return success(alipayConfigService.selectPaymentAlipayConfigByConfigId(1L));
    }

    /**
     * 修改支付宝配置类
     */
    @RequiresPermissions("payment:alipayConfig:edit")
    @Log(title = "支付宝配置类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PaymentAlipayConfig paymentAlipayConfig)
    {
        return toAjax(alipayConfigService.updatePaymentAlipayConfig(paymentAlipayConfig));
    }

    /**
     * 支付宝PC网页支付
     * @param trade
     * @return
     * @throws Exception
     */
    @Log(title = "支付宝PC网页支付")
    @ApiOperation("PC网页支付")
    @PostMapping(value = "/toPayAsPC")
    public AjaxResult toPayAsPc(@Validated @RequestBody TradeVo trade) throws Exception {
        PaymentAlipayConfig aliPay = alipayConfigService.selectPaymentAlipayConfigByConfigId(1L);
        trade.setOutTradeNo(alipayUtils.getOrderCode());
        String payUrl = alipayConfigService.toPayAsPc(aliPay, trade);
        return AjaxResult.success(payUrl);
    }

    @Log(title = "支付宝手机网页支付")
    @ApiOperation("手机网页支付")
    @PostMapping(value = "/toPayAsWeb")
    public ResponseEntity<String> toPayAsWeb(@Validated @RequestBody TradeVo trade) throws Exception {
        PaymentAlipayConfig alipay = alipayConfigService.selectPaymentAlipayConfigByConfigId(1L);
        trade.setOutTradeNo(alipayUtils.getOrderCode());
        String payUrl = alipayConfigService.toPayAsWeb(alipay, trade);
        return ResponseEntity.ok(payUrl);
    }

    @ApiIgnore
    @GetMapping("/return")
    @ApiOperation("支付之后跳转的链接")
    public ResponseEntity<String> returnPage(HttpServletRequest request, HttpServletResponse response) {
        PaymentAlipayConfig alipay = alipayConfigService.selectPaymentAlipayConfigByConfigId(1L);
        response.setContentType("text/html;charset=" + alipay.getCharset());
        //内容验签，防止黑客篡改参数
        if (alipayUtils.rsaCheck(request, alipay)) {
            //商户订单号
            String outTradeNo = new String(request.getParameter("out_trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            //支付宝交易号
            String tradeNo = new String(request.getParameter("trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            System.out.println("商户订单号" + outTradeNo + "  " + "第三方交易号" + tradeNo);

            // 根据业务需要返回数据，这里统一返回OK
            return new ResponseEntity<>("payment successful", HttpStatus.OK);
        } else {
            // 根据业务需要返回数据
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @ApiIgnore
    @RequestMapping("/notify")
    @ApiOperation("支付异步通知(要公网访问)，接收异步通知，检查通知内容app_id、out_trade_no、total_amount是否与请求中的一致，根据trade_status进行后续业务处理")
    public ResponseEntity<Object> notify(HttpServletRequest request) {
        PaymentAlipayConfig alipay = alipayConfigService.selectPaymentAlipayConfigByConfigId(1L);
        Map<String, String[]> parameterMap = request.getParameterMap();
        //内容验签，防止黑客篡改参数
        if (alipayUtils.rsaCheck(request, alipay)) {
            //交易状态
            String tradeStatus = new String(request.getParameter("trade_status").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            // 商户订单号
            String outTradeNo = new String(request.getParameter("out_trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            //支付宝交易号
            String tradeNo = new String(request.getParameter("trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            //付款金额
            String totalAmount = new String(request.getParameter("total_amount").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            //验证
            if (tradeStatus.equals(AliPayStatusEnum.SUCCESS.getValue()) || tradeStatus.equals(AliPayStatusEnum.FINISHED.getValue())) {
                // 验证通过后应该根据业务需要处理订单
            }
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
