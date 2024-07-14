package me.mcx.payment.service;

import java.util.List;
import me.mcx.payment.domain.PaymentAlipayConfig;
import me.mcx.payment.domain.vo.TradeVo;

/**
 * 支付宝配置类Service接口
 * 
 * @author mcx
 * @date 2024-05-08
 */
public interface IPaymentAlipayConfigService 
{
    /**
     * 查询支付宝配置类
     * 
     * @param configId 支付宝配置类主键
     * @return 支付宝配置类
     */
    public PaymentAlipayConfig selectPaymentAlipayConfigByConfigId(Long configId);

    /**
     * 修改支付宝配置类
     * 
     * @param paymentAlipayConfig 支付宝配置类
     * @return 结果
     */
    public int updatePaymentAlipayConfig(PaymentAlipayConfig paymentAlipayConfig);

    /**
     * 处理来自PC的交易请求
     * @param alipay 支付宝配置
     * @param trade 交易详情
     * @return String
     * @throws Exception 异常
     */
    String toPayAsPc(PaymentAlipayConfig alipay, TradeVo trade) throws Exception;

    /**
     * 处理来自手机网页的交易请求
     * @param alipay 支付宝配置
     * @param trade 交易详情
     * @return String
     * @throws Exception 异常
     */
    String toPayAsWeb(PaymentAlipayConfig alipay, TradeVo trade) throws Exception;
}
