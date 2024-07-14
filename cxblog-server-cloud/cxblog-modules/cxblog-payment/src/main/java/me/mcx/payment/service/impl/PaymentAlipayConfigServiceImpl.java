package me.mcx.payment.service.impl;

import java.util.List;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.DateUtils;
import me.mcx.payment.domain.vo.TradeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.payment.mapper.PaymentAlipayConfigMapper;
import me.mcx.payment.domain.PaymentAlipayConfig;
import me.mcx.payment.service.IPaymentAlipayConfigService;

/**
 * 支付宝配置类Service业务层处理
 * 
 * @author mcx
 * @date 2024-05-08
 */
@Service
public class PaymentAlipayConfigServiceImpl implements IPaymentAlipayConfigService 
{
    @Autowired
    private PaymentAlipayConfigMapper paymentAlipayConfigMapper;

    /**
     * 查询支付宝配置类
     * 
     * @param configId 支付宝配置类主键
     * @return 支付宝配置类
     */
    @Override
    public PaymentAlipayConfig selectPaymentAlipayConfigByConfigId(Long configId)
    {
        return paymentAlipayConfigMapper.selectPaymentAlipayConfigByConfigId(configId);
    }

    /**
     * 修改支付宝配置类
     * 
     * @param paymentAlipayConfig 支付宝配置类
     * @return 结果
     */
    @Override
    public int updatePaymentAlipayConfig(PaymentAlipayConfig paymentAlipayConfig)
    {
        paymentAlipayConfig.setUpdateTime(DateUtils.getNowDate());
        return paymentAlipayConfigMapper.updatePaymentAlipayConfig(paymentAlipayConfig);
    }


    @Override
    public String toPayAsPc(PaymentAlipayConfig alipay, TradeVo trade) throws Exception {

        if(alipay.getConfigId() == null){
            throw new ServiceException("请先添加相应配置，再操作");
        }
        AlipayClient alipayClient = new DefaultAlipayClient(alipay.getGatewayUrl(), alipay.getAppId(), alipay.getPrivateKey(), alipay.getFormat(), alipay.getCharset(), alipay.getPublicKey(), alipay.getSignType());

        // 创建API对应的request(电脑网页版)
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();

        // 订单完成后返回的页面和异步通知地址
        request.setReturnUrl(alipay.getReturnUrl());
        request.setNotifyUrl(alipay.getNotifyUrl());
        // 填充订单参数
        request.setBizContent("{" +
                "    \"out_trade_no\":\""+trade.getOutTradeNo()+"\"," +
                "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
                "    \"total_amount\":"+trade.getTotalAmount()+"," +
                "    \"subject\":\""+trade.getSubject()+"\"," +
                "    \"body\":\""+trade.getBody()+"\"," +
                "    \"extend_params\":{" +
                "    \"sys_service_provider_id\":\""+alipay.getSysServiceProviderId()+"\"" +
                "    }"+
                "  }");//填充业务参数
        // 调用SDK生成表单, 通过GET方式，口可以获取url
        return alipayClient.pageExecute(request, "GET").getBody();

    }

    @Override
    public String toPayAsWeb(PaymentAlipayConfig alipay, TradeVo trade) throws Exception {
        if(alipay.getConfigId() == null){
            throw new ServiceException("请先添加相应配置，再操作");
        }
        AlipayClient alipayClient = new DefaultAlipayClient(alipay.getGatewayUrl(), alipay.getAppId(), alipay.getPrivateKey(), alipay.getFormat(), alipay.getCharset(), alipay.getPublicKey(), alipay.getSignType());

        double money = Double.parseDouble(trade.getTotalAmount());
        double maxMoney = 5000;
        if(money <= 0 || money >= maxMoney){
            throw new ServiceException("测试金额过大");
        }
        // 创建API对应的request(手机网页版)
        AlipayTradeWapPayRequest request = new AlipayTradeWapPayRequest();
        request.setReturnUrl(alipay.getReturnUrl());
        request.setNotifyUrl(alipay.getNotifyUrl());
        request.setBizContent("{" +
                "    \"out_trade_no\":\""+trade.getOutTradeNo()+"\"," +
                "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
                "    \"total_amount\":"+trade.getTotalAmount()+"," +
                "    \"subject\":\""+trade.getSubject()+"\"," +
                "    \"body\":\""+trade.getBody()+"\"," +
                "    \"extend_params\":{" +
                "    \"sys_service_provider_id\":\""+alipay.getSysServiceProviderId()+"\"" +
                "    }"+
                "  }");
        return alipayClient.pageExecute(request, "GET").getBody();
    }
}
