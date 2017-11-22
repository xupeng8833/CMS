package com.system.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;



/**
 * 提现结算申请表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-22 09:33:39
 */
public class PresentApplicationEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//主键
	private Long id;
	//提现流水单号
	private Long applicationNum;
	//提现用户ID
	private Long applyNameNum;
	//账号名称
	private String accountName;
	//手机号
	private String mobile;
	//运营商名称
	private String operatorName;
	//可提现金额
	private BigDecimal cashAvailable;
	//提现金额
	private BigDecimal withdrawalAmount;
	//处理状态 0代表未审核 1代表已审核
	private Long auditState;
	//申请时间
	private Date createTime;
	
	

	public Long getAuditState() {
		return auditState;
	}
	public void setAuditState(Long auditState) {
		this.auditState = auditState;
	}
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
	 * 设置：提现流水单号
	 */
	public void setApplicationNum(Long applicationNum) {
		this.applicationNum = applicationNum;
	}
	/**
	 * 获取：提现流水单号
	 */
	public Long getApplicationNum() {
		return applicationNum;
	}
	/**
	 * 设置：提现用户ID
	 */
	public void setApplyNameNum(Long applyNameNum) {
		this.applyNameNum = applyNameNum;
	}
	/**
	 * 获取：提现用户ID
	 */
	public Long getApplyNameNum() {
		return applyNameNum;
	}
	/**
	 * 设置：账号名称
	 */
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	/**
	 * 获取：账号名称
	 */
	public String getAccountName() {
		return accountName;
	}
	/**
	 * 设置：手机号
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 获取：手机号
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * 设置：运营商名称
	 */
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	/**
	 * 获取：运营商名称
	 */
	public String getOperatorName() {
		return operatorName;
	}
	/**
	 * 设置：可提现金额
	 */
	public void setCashAvailable(BigDecimal cashAvailable) {
		this.cashAvailable = cashAvailable;
	}
	/**
	 * 获取：可提现金额
	 */
	public BigDecimal getCashAvailable() {
		return cashAvailable;
	}
	/**
	 * 设置：提现金额
	 */
	public void setWithdrawalAmount(BigDecimal withdrawalAmount) {
		this.withdrawalAmount = withdrawalAmount;
	}
	/**
	 * 获取：提现金额
	 */
	public BigDecimal getWithdrawalAmount() {
		return withdrawalAmount;
	}
	/**
	 * 设置：申请时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：申请时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
}
