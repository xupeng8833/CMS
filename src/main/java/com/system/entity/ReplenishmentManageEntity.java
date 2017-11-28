package com.system.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 补货管理
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-28 16:51:24
 */
public class ReplenishmentManageEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//补货单号
	private Long opsReplenishmentNum;
	//店长编号
	private Long opsStoreManagerId;
	//店名
	private String opsStoreName;
	//联系人姓名
	private String opsLinkmanName;
	//上次补货时间
	private Date createTime;
	//是否有申请 0代表没有 1代表有
	private Long opsApplicationStatus;
	//上次补纸量
	private Long opsLastAmountPaper;
	//期初纸量
	private Long opsInitialPaperQuantity;
	//当前出纸率
	private Long opsPaperYield;
	//剩余纸量
	private Long opsPaperSurplus;
	//单日出纸量
	private Long opsPaperOutput;
	//补货周期
	private String opsReplenishmentCycle;
	//商品名称
	private String opsProductName;
	//商品类型
	private String opsProductType;
	//异常状态
	private String opsErrorState;
	//异常备注
	private String opsErrorRemark;

	/**
	 * 设置：补货单号
	 */
	public void setOpsReplenishmentNum(Long opsReplenishmentNum) {
		this.opsReplenishmentNum = opsReplenishmentNum;
	}
	/**
	 * 获取：补货单号
	 */
	public Long getOpsReplenishmentNum() {
		return opsReplenishmentNum;
	}
	/**
	 * 设置：店长编号
	 */
	public void setOpsStoreManagerId(Long opsStoreManagerId) {
		this.opsStoreManagerId = opsStoreManagerId;
	}
	/**
	 * 获取：店长编号
	 */
	public Long getOpsStoreManagerId() {
		return opsStoreManagerId;
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
	 * 设置：联系人姓名
	 */
	public void setOpsLinkmanName(String opsLinkmanName) {
		this.opsLinkmanName = opsLinkmanName;
	}
	/**
	 * 获取：联系人姓名
	 */
	public String getOpsLinkmanName() {
		return opsLinkmanName;
	}
	/**
	 * 设置：上次补货时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：上次补货时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * 设置：是否有申请 0代表没有 1代表有
	 */
	public void setOpsApplicationStatus(Long opsApplicationStatus) {
		this.opsApplicationStatus = opsApplicationStatus;
	}
	/**
	 * 获取：是否有申请 0代表没有 1代表有
	 */
	public Long getOpsApplicationStatus() {
		return opsApplicationStatus;
	}
	/**
	 * 设置：上次补纸量
	 */
	public void setOpsLastAmountPaper(Long opsLastAmountPaper) {
		this.opsLastAmountPaper = opsLastAmountPaper;
	}
	/**
	 * 获取：上次补纸量
	 */
	public Long getOpsLastAmountPaper() {
		return opsLastAmountPaper;
	}
	/**
	 * 设置：期初纸量
	 */
	public void setOpsInitialPaperQuantity(Long opsInitialPaperQuantity) {
		this.opsInitialPaperQuantity = opsInitialPaperQuantity;
	}
	/**
	 * 获取：期初纸量
	 */
	public Long getOpsInitialPaperQuantity() {
		return opsInitialPaperQuantity;
	}
	/**
	 * 设置：当前出纸率
	 */
	public void setOpsPaperYield(Long opsPaperYield) {
		this.opsPaperYield = opsPaperYield;
	}
	/**
	 * 获取：当前出纸率
	 */
	public Long getOpsPaperYield() {
		return opsPaperYield;
	}
	/**
	 * 设置：剩余纸量
	 */
	public void setOpsPaperSurplus(Long opsPaperSurplus) {
		this.opsPaperSurplus = opsPaperSurplus;
	}
	/**
	 * 获取：剩余纸量
	 */
	public Long getOpsPaperSurplus() {
		return opsPaperSurplus;
	}
	/**
	 * 设置：单日出纸量
	 */
	public void setOpsPaperOutput(Long opsPaperOutput) {
		this.opsPaperOutput = opsPaperOutput;
	}
	/**
	 * 获取：单日出纸量
	 */
	public Long getOpsPaperOutput() {
		return opsPaperOutput;
	}
	/**
	 * 设置：补货周期
	 */
	public void setOpsReplenishmentCycle(String opsReplenishmentCycle) {
		this.opsReplenishmentCycle = opsReplenishmentCycle;
	}
	/**
	 * 获取：补货周期
	 */
	public String getOpsReplenishmentCycle() {
		return opsReplenishmentCycle;
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
	 * 设置：商品类型
	 */
	public void setOpsProductType(String opsProductType) {
		this.opsProductType = opsProductType;
	}
	/**
	 * 获取：商品类型
	 */
	public String getOpsProductType() {
		return opsProductType;
	}
	/**
	 * 设置：异常状态
	 */
	public void setOpsErrorState(String opsErrorState) {
		this.opsErrorState = opsErrorState;
	}
	/**
	 * 获取：异常状态
	 */
	public String getOpsErrorState() {
		return opsErrorState;
	}
	/**
	 * 设置：异常备注
	 */
	public void setOpsErrorRemark(String opsErrorRemark) {
		this.opsErrorRemark = opsErrorRemark;
	}
	/**
	 * 获取：异常备注
	 */
	public String getOpsErrorRemark() {
		return opsErrorRemark;
	}
}
