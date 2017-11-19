package com.system.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 意见反馈表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-19 10:11:09
 */
public class FeedbackEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//意见反馈id
	private Long feedbackId;
	//用户id
	private Long userId;
	//联系电话
	private String mobile;
	//身份:0客户、1代理商、2补货员
	private Long identity;
	//反馈内容
	private String feedbackContent;
	//回复状态 0未回复、1已回复
	private Long replyType;
	//回复内容
	private String replyContent;
	//反馈时间
	private Date createTime;

	/**
	 * 设置：意见反馈id
	 */
	public void setFeedbackId(Long feedbackId) {
		this.feedbackId = feedbackId;
	}
	/**
	 * 获取：意见反馈id
	 */
	public Long getFeedbackId() {
		return feedbackId;
	}
	/**
	 * 设置：用户id
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：用户id
	 */
	public Long getUserId() {
		return userId;
	}
	/**
	 * 设置：联系电话
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 获取：联系电话
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * 设置：身份:0客户、1代理商、2补货员
	 */
	public void setIdentity(Long identity) {
		this.identity = identity;
	}
	/**
	 * 获取：身份:0客户、1代理商、2补货员
	 */
	public Long getIdentity() {
		return identity;
	}
	/**
	 * 设置：反馈内容
	 */
	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}
	/**
	 * 获取：反馈内容
	 */
	public String getFeedbackContent() {
		return feedbackContent;
	}
	/**
	 * 设置：回复状态 0未回复、1已回复
	 */
	public void setReplyType(Long replyType) {
		this.replyType = replyType;
	}
	/**
	 * 获取：回复状态 0未回复、1已回复
	 */
	public Long getReplyType() {
		return replyType;
	}
	/**
	 * 设置：回复内容
	 */
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	/**
	 * 获取：回复内容
	 */
	public String getReplyContent() {
		return replyContent;
	}
	/**
	 * 设置：反馈时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：反馈时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
}
