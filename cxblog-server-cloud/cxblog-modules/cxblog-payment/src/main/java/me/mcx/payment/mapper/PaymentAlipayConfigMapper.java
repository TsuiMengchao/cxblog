package me.mcx.payment.mapper;

import java.util.List;
import me.mcx.payment.domain.PaymentAlipayConfig;

/**
 * 支付宝配置类Mapper接口
 * 
 * @author mcx
 * @date 2024-05-08
 */
public interface PaymentAlipayConfigMapper 
{
    /**
     * 查询支付宝配置类
     * 
     * @param configId 支付宝配置类主键
     * @return 支付宝配置类
     */
    public PaymentAlipayConfig selectPaymentAlipayConfigByConfigId(Long configId);

    /**
     * 查询支付宝配置类列表
     * 
     * @param paymentAlipayConfig 支付宝配置类
     * @return 支付宝配置类集合
     */
    public List<PaymentAlipayConfig> selectPaymentAlipayConfigList(PaymentAlipayConfig paymentAlipayConfig);

    /**
     * 新增支付宝配置类
     * 
     * @param paymentAlipayConfig 支付宝配置类
     * @return 结果
     */
    public int insertPaymentAlipayConfig(PaymentAlipayConfig paymentAlipayConfig);

    /**
     * 修改支付宝配置类
     * 
     * @param paymentAlipayConfig 支付宝配置类
     * @return 结果
     */
    public int updatePaymentAlipayConfig(PaymentAlipayConfig paymentAlipayConfig);

    /**
     * 删除支付宝配置类
     * 
     * @param configId 支付宝配置类主键
     * @return 结果
     */
    public int deletePaymentAlipayConfigByConfigId(Long configId);

    /**
     * 批量删除支付宝配置类
     * 
     * @param configIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePaymentAlipayConfigByConfigIds(Long[] configIds);
}
