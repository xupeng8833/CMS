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

#订单表
CREATE TABLE `tb_order` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(50) NOT NULL COMMENT '订单号',
  `user_id` bigint(50) NOT NULL COMMENT '购买人ID',
  `product_name` varchar(100) NOT NULL COMMENT '商品名称',
  `product_num` bigint(50) DEFAULT 0 COMMENT '商品数量',
	`order_price` bigint(50) DEFAULT 0 COMMENT '订单金额',
  `machine_num` bigint(50) DEFAULT NULL COMMENT '售卖机器编号',
  `pay_type` bigint(5) DEFAULT NULL COMMENT '支付方式 0微信支付、1支付宝支付',
  `create_time` datetime DEFAULT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单表';

#保修信息管理表
CREATE TABLE `tb_report` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `report_num` bigint(50) NOT NULL COMMENT '报修单号',
  `machine_num` bigint(50) NOT NULL COMMENT '报修机器编号',
  `reporter_name` varchar(100) NOT NULL COMMENT '报修人名称',
  `reporter_type` bigint(5) DEFAULT 0 COMMENT '报修人类型 0客户、1代理商、2补货员',
	`report_content` varchar(500) DEFAULT 0 COMMENT '报修备注',
  `create_time` datetime DEFAULT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='保修信息管理';