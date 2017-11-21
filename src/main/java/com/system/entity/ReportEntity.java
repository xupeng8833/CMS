package com.system.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 保修信息管理
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-19 22:44:37
 */
public class ReportEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//主键
	private Long id;
	//报修单号
	private Long reportNum;
	//报修机器编号
	private Long machineNum;
	//报修人名称
	private String reporterName;
	//报修人类型 0客户、1代理商、2补货员
	private String reporterType;
	//报修备注
	private String reportContent;
	//维修反馈信息
	private String repairContent;
	
	//机器所属经销商
	private String machineDealer;
	
	//机器所属雇员
	private String machineClerk;
	
	//机器所在地址
	private String machineAddr;
	
	
	public String getMachineAddr() {
		return machineAddr;
	}
	public void setMachineAddr(String machineAddr) {
		this.machineAddr = machineAddr;
	}
	//购买时间
	private Date createTime;

	
	
	
	public String getMachineDealer() {
		return machineDealer;
	}
	public void setMachineDealer(String machineDealer) {
		this.machineDealer = machineDealer;
	}
	public String getMachineClerk() {
		return machineClerk;
	}
	public void setMachineClerk(String machineClerk) {
		this.machineClerk = machineClerk;
	}
	public String getReporterType() {
		return reporterType;
	}
	public void setReporterType(String reporterType) {
		this.reporterType = reporterType;
	}
	public String getRepairContent() {
		return repairContent;
	}
	public void setRepairContent(String repairContent) {
		this.repairContent = repairContent;
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
	 * 设置：报修单号
	 */
	public void setReportNum(Long reportNum) {
		this.reportNum = reportNum;
	}
	/**
	 * 获取：报修单号
	 */
	public Long getReportNum() {
		return reportNum;
	}
	/**
	 * 设置：报修机器编号
	 */
	public void setMachineNum(Long machineNum) {
		this.machineNum = machineNum;
	}
	/**
	 * 获取：报修机器编号
	 */
	public Long getMachineNum() {
		return machineNum;
	}
	/**
	 * 设置：报修人名称
	 */
	public void setReporterName(String reporterName) {
		this.reporterName = reporterName;
	}
	/**
	 * 获取：报修人名称
	 */
	public String getReporterName() {
		return reporterName;
	}
	/**
	 * 设置：报修备注
	 */
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	/**
	 * 获取：报修备注
	 */
	public String getReportContent() {
		return reportContent;
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
