package com.system.entity;

import java.io.Serializable;



/**
 * 商品
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-29 19:56:50
 */
public class SpEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//商品编号
	private String spId;
	//商品名称
	private String spNm;
	//售价
	private Long spPrice;
	//类别
	private String spType;
	//规格
	private String spGuige;
	//品牌
	private String spPinpai;
	//PN码
	private String spPn;
	//状态:正常,下架
	private String spStatus;
	//机器编号
	private String spJiqiid;
	//商品图片
	private String spImage;
	//状态   0：隐藏   1：显示
	private Integer status;

	/**
	 * 设置：商品编号
	 */
	public void setSpId(String spId) {
		this.spId = spId;
	}
	/**
	 * 获取：商品编号
	 */
	public String getSpId() {
		return spId;
	}
	/**
	 * 设置：商品名称
	 */
	public void setSpNm(String spNm) {
		this.spNm = spNm;
	}
	/**
	 * 获取：商品名称
	 */
	public String getSpNm() {
		return spNm;
	}
	/**
	 * 设置：售价
	 */
	public void setSpPrice(Long spPrice) {
		this.spPrice = spPrice;
	}
	/**
	 * 获取：售价
	 */
	public Long getSpPrice() {
		return spPrice;
	}
	/**
	 * 设置：类别
	 */
	public void setSpType(String spType) {
		this.spType = spType;
	}
	/**
	 * 获取：类别
	 */
	public String getSpType() {
		return spType;
	}
	/**
	 * 设置：规格
	 */
	public void setSpGuige(String spGuige) {
		this.spGuige = spGuige;
	}
	/**
	 * 获取：规格
	 */
	public String getSpGuige() {
		return spGuige;
	}
	/**
	 * 设置：品牌
	 */
	public void setSpPinpai(String spPinpai) {
		this.spPinpai = spPinpai;
	}
	/**
	 * 获取：品牌
	 */
	public String getSpPinpai() {
		return spPinpai;
	}
	/**
	 * 设置：PN码
	 */
	public void setSpPn(String spPn) {
		this.spPn = spPn;
	}
	/**
	 * 获取：PN码
	 */
	public String getSpPn() {
		return spPn;
	}
	/**
	 * 设置：状态:正常,下架
	 */
	public void setSpStatus(String spStatus) {
		this.spStatus = spStatus;
	}
	/**
	 * 获取：状态:正常,下架
	 */
	public String getSpStatus() {
		return spStatus;
	}
	/**
	 * 设置：机器编号
	 */
	public void setSpJiqiid(String spJiqiid) {
		this.spJiqiid = spJiqiid;
	}
	/**
	 * 获取：机器编号
	 */
	public String getSpJiqiid() {
		return spJiqiid;
	}
	/**
	 * 设置：商品图片
	 */
	public void setSpImage(String spImage) {
		this.spImage = spImage;
	}
	/**
	 * 获取：商品图片
	 */
	public String getSpImage() {
		return spImage;
	}
	/**
	 * 设置：状态   0：隐藏   1：显示
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：状态   0：隐藏   1：显示
	 */
	public Integer getStatus() {
		return status;
	}
}
