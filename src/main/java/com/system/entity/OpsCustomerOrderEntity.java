package com.system.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;



/**
 * 用户订单表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-28 14:42:45
 */
public class OpsCustomerOrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//订单id
	private Long opsCustomerOrderId;
	//商品名称
	private String opsProductName;
	//用户id
	private Long opsCustomerId;
	//商品金额
	private BigDecimal opsProductAmount;
	//商品类型
	private String opsProductStatus;
	//店名
	private String opsStoreName;
	//商店地址
	private String opsStoreAddress;
	//桌面机器编号
	private Long opsDesktopMachineId;
	//交易方式
	private String opsTransactionMode;
	//交易状态
	private String opsTransactionStatus;
	//场景
	private String opsScene;
	//功能区
	private String opsDomain;
	//类型
	private String opsType;
	//交易时间时间
	private Date createTime;

	/**
	 * 设置：订单id
	 */
	public void setOpsCustomerOrderId(Long opsCustomerOrderId) {
		this.opsCustomerOrderId = opsCustomerOrderId;
	}
	/**
	 * 获取：订单id
	 */
	public Long getOpsCustomerOrderId() {
		return opsCustomerOrderId;
	}
	/**
	 * 设置：商品名称
	 */
	public void setOpsProductName(String opsProductName) {
		this.opsProductName = opsProductName;
	}
	/**
	 * 获取：商品名称
	 */
	public String getOpsProductName() {
		return opsProductName;
	}
	/**
	 * 设置：用户id
	 */
	public void setOpsCustomerId(Long opsCustomerId) {
		this.opsCustomerId = opsCustomerId;
	}
	/**
	 * 获取：用户id
	 */
	public Long getOpsCustomerId() {
		return opsCustomerId;
	}
	/**
	 * 设置：商品金额
	 */
	public void setOpsProductAmount(BigDecimal opsProductAmount) {
		this.opsProductAmount = opsProductAmount;
	}
	/**
	 * 获取：商品金额
	 */
	public BigDecimal getOpsProductAmount() {
		return opsProductAmount;
	}
	/**
	 * 设置：商品类型
	 */
	public void setOpsProductStatus(String opsProductStatus) {
		this.opsProductStatus = opsProductStatus;
	}
	/**
	 * 获取：商品类型
	 */
	public String getOpsProductStatus() {
		return opsProductStatus;
	}
	/**
	 * 设置：店名
	 */
	public void setOpsStoreName(String opsStoreName) {
		this.opsStoreName = opsStoreName;
	}
	/**
	 * 获取：店名
	 */
	public String getOpsStoreName() {
		return opsStoreName;
	}
	/**
	 * 设置：商店地址
	 */
	public void setOpsStoreAddress(String opsStoreAddress) {
		this.opsStoreAddress = opsStoreAddress;
	}
	/**
	 * 获取：商店地址
	 */
	public String getOpsStoreAddress() {
		return opsStoreAddress;
	}
	/**
	 * 设置：桌面机器编号
	 */
	public void setOpsDesktopMachineId(Long opsDesktopMachineId) {
		this.opsDesktopMachineId = opsDesktopMachineId;
	}
	/**
	 * 获取：桌面机器编号
	 */
	public Long getOpsDesktopMachineId() {
		return opsDesktopMachineId;
	}
	/**
	 * 设置：交易方式
	 */
	public void setOpsTransactionMode(String opsTransactionMode) {
		this.opsTransactionMode = opsTransactionMode;
	}
	/**
	 * 获取：交易方式
	 */
	public String getOpsTransactionMode() {
		return opsTransactionMode;
	}
	/**
	 * 设置：交易状态
	 */
	public void setOpsTransactionStatus(String opsTransactionStatus) {
		this.opsTransactionStatus = opsTransactionStatus;
	}
	/**
	 * 获取：交易状态
	 */
	public String getOpsTransactionStatus() {
		return opsTransactionStatus;
	}
	/**
	 * 设置：场景
	 */
	public void setOpsScene(String opsScene) {
		this.opsScene = opsScene;
	}
	/**
	 * 获取：场景
	 */
	public String getOpsScene() {
		return opsScene;
	}
	/**
	 * 设置：功能区
	 */
	public void setOpsDomain(String opsDomain) {
		this.opsDomain = opsDomain;
	}
	/**
	 * 获取：功能区
	 */
	public String getOpsDomain() {
		return opsDomain;
	}
	/**
	 * 设置：类型
	 */
	public void setOpsType(String opsType) {
		this.opsType = opsType;
	}
	/**
	 * 获取：类型
	 */
	public String getOpsType() {
		return opsType;
	}
	/**
	 * 设置：交易时间时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：交易时间时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
}
