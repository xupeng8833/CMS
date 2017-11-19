package com.system.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 订单表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-19 17:01:01
 */
public class OrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//主键
	private Long id;
	//订单号
	private Long orderId;
	//购买人ID
	private Long userId;
	//商品名称
	private String productName;
	//商品数量
	private Long productNum;
	//订单金额
	private Long orderPrice;
	//售卖机器编号
	private Long machineNum;
	//支付方式 0微信支付、1支付宝支付
	private Long payType;
	//购买时间
	private Date createTime;

	/**
	 * 设置：主键
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：主键
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：订单号
	 */
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	/**
	 * 获取：订单号
	 */
	public Long getOrderId() {
		return orderId;
	}
	/**
	 * 设置：购买人ID
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：购买人ID
	 */
	public Long getUserId() {
		return userId;
	}
	/**
	 * 设置：商品名称
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
	/**
	 * 获取：商品名称
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * 设置：商品数量
	 */
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	/**
	 * 获取：商品数量
	 */
	public Long getProductNum() {
		return productNum;
	}
	/**
	 * 设置：订单金额
	 */
	public void setOrderPrice(Long orderPrice) {
		this.orderPrice = orderPrice;
	}
	/**
	 * 获取：订单金额
	 */
	public Long getOrderPrice() {
		return orderPrice;
	}
	/**
	 * 设置：售卖机器编号
	 */
	public void setMachineNum(Long machineNum) {
		this.machineNum = machineNum;
	}
	/**
	 * 获取：售卖机器编号
	 */
	public Long getMachineNum() {
		return machineNum;
	}
	/**
	 * 设置：支付方式 0微信支付、1支付宝支付
	 */
	public void setPayType(Long payType) {
		this.payType = payType;
	}
	/**
	 * 获取：支付方式 0微信支付、1支付宝支付
	 */
	public Long getPayType() {
		return payType;
	}
	/**
	 * 设置：购买时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：购买时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
}
