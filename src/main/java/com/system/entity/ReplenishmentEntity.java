package com.system.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 保修信息管理
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-20 23:19:43
 */
public class ReplenishmentEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//主键
	private Long id;
	//补货单号
	private Long replenishmentNum;
	//补货机器编号
	private Long machineNum;
	//补货商品
	private String productName;
	//补充数量
	private String productNum;
	//申请人
	private String applyName;
	//申请人身份
	private String reporterIdentity;
	//补充状态
	private String applyType;
	//补货商品
	private String replenishmentName;
	//申请时间
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
	 * 设置：补货单号
	 */
	public void setReplenishmentNum(Long replenishmentNum) {
		this.replenishmentNum = replenishmentNum;
	}
	/**
	 * 获取：补货单号
	 */
	public Long getReplenishmentNum() {
		return replenishmentNum;
	}
	/**
	 * 设置：补货机器编号
	 */
	public void setMachineNum(Long machineNum) {
		this.machineNum = machineNum;
	}
	/**
	 * 获取：补货机器编号
	 */
	public Long getMachineNum() {
		return machineNum;
	}
	/**
	 * 设置：补货商品
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
	/**
	 * 获取：补货商品
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * 设置：补充数量
	 */
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	/**
	 * 获取：补充数量
	 */
	public String getProductNum() {
		return productNum;
	}
	/**
	 * 设置：申请人
	 */
	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}
	/**
	 * 获取：申请人
	 */
	public String getApplyName() {
		return applyName;
	}
	/**
	 * 设置：申请人身份
	 */
	public void setReporterIdentity(String reporterIdentity) {
		this.reporterIdentity = reporterIdentity;
	}
	/**
	 * 获取：申请人身份
	 */
	public String getReporterIdentity() {
		return reporterIdentity;
	}
	/**
	 * 设置：补充状态
	 */
	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}
	/**
	 * 获取：补充状态
	 */
	public String getApplyType() {
		return applyType;
	}
	/**
	 * 设置：补货商品
	 */
	public void setReplenishmentName(String replenishmentName) {
		this.replenishmentName = replenishmentName;
	}
	/**
	 * 获取：补货商品
	 */
	public String getReplenishmentName() {
		return replenishmentName;
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
