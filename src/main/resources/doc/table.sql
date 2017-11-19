#建表语句

#意见反馈表sql
CREATE TABLE `tb_feedback` (
  `feedback_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '意见反馈id',
  `user_id` bigint(50) NOT NULL COMMENT '用户id',
  `mobile` varchar(20) NOT NULL COMMENT '联系电话',
  `identity` bigint(5) DEFAULT NULL COMMENT '身份:0客户、1代理商、2补货员',
	`feedback_content` varchar(1500) DEFAULT NULL COMMENT '反馈内容',
  `reply_type` bigint(5) DEFAULT NULL COMMENT '回复状态 0未回复、1已回复',
  `reply_content` varchar(1500) DEFAULT NULL COMMENT '回复内容',
  `create_time` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='意见反馈表';