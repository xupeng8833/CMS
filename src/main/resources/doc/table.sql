#建表语句

#终端用户的sql
CREATE TABLE `tb_ops_customer` (
  `ops_customer_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '终端用户id',
  `ops_customer_name` varchar(100) NOT NULL COMMENT '用户姓名',
  `ops_customer_account` varchar(100) NOT NULL COMMENT '用户账号',
  `ops_mobile` varchar(20) NOT NULL COMMENT '手机号',
  `ops_customer_password` varchar(300) DEFAULT NULL COMMENT '用户密码',
  `ops_purchase_num` bigint(5) DEFAULT 0 COMMENT '购买次数',
  `ops_integration_total` bigint(5) DEFAULT 0 COMMENT '积分总数',
  `ops_free_packet_count` bigint(5) DEFAULT 0 COMMENT '剩余免费包数',
  `ops_membership_level` bigint(5) DEFAULT 0 COMMENT '会员级别',
  `ops_purchase_amount` DECIMAL(15,2) DEFAULT 0 COMMENT '购买金额',
  `ops_member_points` bigint(50) DEFAULT 0 COMMENT '会员积分',
  `ops_customer_image` varchar(300) DEFAULT NULL COMMENT '用户头像',
  `ops_customer_status` bigint(5) DEFAULT 1 COMMENT '用户状态 0代表无效 1代表有效',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`ops_customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='终端用户表';

#用户订单表sql
CREATE TABLE `tb_ops_customer_order` (
  `ops_customer_order_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `ops_product_name` varchar(100) NOT NULL COMMENT '商品名称',
  `ops_customer_id` bigint(50) NOT NULL COMMENT '用户id',
  `ops_product_amount` DECIMAL(15,2) DEFAULT NULL COMMENT '商品金额',
  `ops_product_status` varchar(50) NOT NULL COMMENT '商品类型',
  `ops_store_name` varchar(50) NOT NULL COMMENT '店名',
  `ops_store_address` varchar(300) DEFAULT NULL COMMENT '商店地址',
  `ops_desktop_machine_id` bigint(50) NOT NULL COMMENT '桌面机器编号',
  `ops_transaction_mode` varchar(50) NOT NULL COMMENT '交易方式',
  `ops_transaction_status` varchar(50) NOT NULL COMMENT '交易状态',
  `ops_scene` varchar(50) NOT NULL COMMENT '场景',
  `ops_domain` varchar(50) NOT NULL COMMENT '功能区',
  `ops_type` varchar(50) NOT NULL COMMENT '类型',
  `create_time` datetime DEFAULT NULL COMMENT '交易时间时间',
  PRIMARY KEY (`ops_customer_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户订单表';

#补货员表sql
CREATE TABLE `tb_ops_replenishment_clerk` (
  `ops_replenishment_clerk_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '补货员id',
  `ops_replenishment_clerk_name` varchar(100) NOT NULL COMMENT '补货员用户名',
  `ops_replenishment_clerk_sex` bigint(5) DEFAULT 0 COMMENT '补货员性别 0代表男 1代表女',
	`mobile` varchar(20) NOT NULL COMMENT '手机号',
  `ops_storehouse_name` varchar(50) NOT NULL COMMENT '仓库名称',
  `ops_city_area` varchar(100) NOT NULL COMMENT '城市区域',
  `ops_leader_name` varchar(100) DEFAULT NULL COMMENT '上级领导',
	`ops_duties` varchar(50) NOT NULL COMMENT '工作职能',
	`ops_management_times` bigint(50) NOT NULL COMMENT '管理次数',
  `create_time` datetime DEFAULT NULL COMMENT '就职时间',
  PRIMARY KEY (`ops_replenishment_clerk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='补货员表';

#修改user表的sql
alter table sys_user add column name varchar(50) COMMENT '姓名';
alter table sys_user add column sex BIGINT(5) DEFAULT 0 COMMENT '性别 0代表是男 1代表是女';
alter table sys_user add column ops_leader_name varchar(50) COMMENT '所属上级';
alter table sys_user add column ops_role_name varchar(50) COMMENT '所属部门';
alter table sys_user add column ops_management_area varchar(100) COMMENT '管理范围';
alter table sys_user add column ops_link_man varchar(50) COMMENT '联系人';
alter table sys_user add column ops_income_rule varchar(50) COMMENT '收益规则';
alter table sys_user add column ops_cooperation_policy varchar(1500) COMMENT '合作政策';
alter table sys_user add column ops_region varchar(50) COMMENT '大区';
alter table sys_user add column ops_province varchar(50) COMMENT '省';
alter table sys_user add column ops_city varchar(50) COMMENT '市';
alter table sys_user add column ops_storehouse varchar(50) COMMENT '仓库';
alter table sys_user add column ops_route varchar(50) COMMENT '路线';
alter table sys_user add column ops_function varchar(50) COMMENT '职能';



#店长，店面负责人表sql
CREATE TABLE `tb_ops_store_manager` (
  `ops_store_manager_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '经销商id',
    `ops_user_id` bigint(50) NOT NULL  COMMENT '管理人id',
  `ops_store_manager_name` varchar(100) NOT NULL COMMENT '店长姓名',
  `sex` bigint(5) DEFAULT 0 COMMENT '店长性别 0代表男 1代表女',
	`mobile` varchar(20) NOT NULL COMMENT '店长手机号',
  `ops_store_manager_position` varchar(50) NOT NULL COMMENT '职位',
  `ops_longitude_and_latitude` varchar(100) NOT NULL COMMENT '经纬度',
  `ops_store_address` varchar(100) DEFAULT NULL COMMENT '地址',
	`ops_store_name` varchar(50) NOT NULL COMMENT '店名称',
	`ops_management_mode` varchar(50) NOT NULL COMMENT '经营方式',
	`ops_scene` varchar(50) NOT NULL COMMENT '场景',
	`ops_domain` varchar(50) NOT NULL COMMENT '功能区',
	`ops_type` varchar(50) NOT NULL COMMENT '类型',
	`ops_allowance` varchar(50) NOT NULL COMMENT '补贴',
	`ops_income_rule` varchar(50) NOT NULL COMMENT '收益规则',
  `ops_product_price` DECIMAL(15,2) DEFAULT NULL COMMENT '商品价格',
	`ops_adsense` bigint(5) DEFAULT 0 COMMENT '是否赠送广告位 0代表不赠送 1代表赠送',
	`ops_business_development` varchar(50) NOT NULL COMMENT 'DB名称',
	`ops_business_mobile` varchar(20) NOT NULL COMMENT 'DB电话',
  `ops_replenishment_clerk_id` bigint(50) NOT NULL COMMENT '补货员id',
  `ops_replenishment_clerk_name` varchar(100) NOT NULL COMMENT '补货员用户名',
  `ops_installation_personnel_name` varchar(100) NOT NULL COMMENT '安装人员姓名',
  `ops_installation_personnel_mobile` varchar(20) NOT NULL COMMENT '安装人员电话',
  `ops_linkman_name` varchar(100) NOT NULL COMMENT '联系人姓名',
  `ops_linkman_mobile` varchar(20) NOT NULL COMMENT '联系人员电话',
  `ops_warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `ops_point_route` varchar(100) NOT NULL COMMENT '点位路线',
  `contract_time` datetime DEFAULT NULL COMMENT '签约时间',
  `installation_time` datetime DEFAULT NULL COMMENT '安装时间',
  `ops_desktop_advertising_status` bigint(5) DEFAULT 0 COMMENT '是否允许桌面广告 0允许 1不允许',
  `ops_paper_advertising_status` bigint(5) DEFAULT 0 COMMENT '是否允许纸面广告 0允许 1不允许',
  `ops_first_paper_feed` bigint(50) DEFAULT 0 COMMENT '首次送纸量',
  `ops_ten_day_consumption` bigint(50) DEFAULT 0 COMMENT '10天耗质量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ops_store_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='店长表';

#店面负责人表sql
CREATE TABLE `tb_ops_responsible_person` (
  `ops_responsible_person_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '负责人id',
  `ops_store_manager_id` bigint(50) NOT NULL  COMMENT '店长id',
  `ops_store_manager_name` varchar(100) NOT NULL COMMENT '店长姓名',
  `ops_responsible_person_name` varchar(100) NOT NULL COMMENT '负责人姓名',
  `ops_group_name` varchar(100) NOT NULL COMMENT '集团名称',
  `ops_responsible_person_mobile` varchar(100) NOT NULL COMMENT '负责人电话',
  `sex` bigint(5) DEFAULT 0 COMMENT '店长性别 0代表男 1代表女',
	`mobile` varchar(20) NOT NULL COMMENT '店长手机号',
  `ops_store_manager_position` varchar(50) NOT NULL COMMENT '职位',
  `ops_longitude_and_latitude` varchar(100) NOT NULL COMMENT '经纬度',
  `ops_store_address` varchar(100) DEFAULT NULL COMMENT '地址',
	`ops_store_name` varchar(50) NOT NULL COMMENT '店名称',
	`ops_management_mode` varchar(50) NOT NULL COMMENT '经营方式',
	`ops_scene` varchar(50) NOT NULL COMMENT '场景',
	`ops_domain` varchar(50) NOT NULL COMMENT '功能区',
	`ops_type` varchar(50) NOT NULL COMMENT '类型',
	`ops_allowance` varchar(50) NOT NULL COMMENT '补贴',
	`ops_income_rule` varchar(50) NOT NULL COMMENT '收益规则',
  `ops_product_price` DECIMAL(15,2) DEFAULT NULL COMMENT '商品价格',
	`ops_adsense` bigint(5) DEFAULT 0 COMMENT '是否赠送广告位 0代表不赠送 1代表赠送',
	`ops_business_development` varchar(50) NOT NULL COMMENT 'DB名称',
	`ops_business_mobile` varchar(20) NOT NULL COMMENT 'DB电话',
  `ops_replenishment_clerk_id` bigint(50) NOT NULL COMMENT '补货员id',
  `ops_replenishment_clerk_name` varchar(100) NOT NULL COMMENT '补货员用户名',
  `ops_installation_personnel_name` varchar(100) NOT NULL COMMENT '安装人员姓名',
  `ops_installation_personnel_mobile` varchar(20) NOT NULL COMMENT '安装人员电话',
  `ops_linkman_name` varchar(100) NOT NULL COMMENT '联系人姓名',
  `ops_linkman_mobile` varchar(20) NOT NULL COMMENT '联系人员电话',
  `ops_warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `ops_point_route` varchar(100) NOT NULL COMMENT '点位路线',
  `contract_time` datetime DEFAULT NULL COMMENT '签约时间',
  `installation_time` datetime DEFAULT NULL COMMENT '安装时间',
  `ops_desktop_advertising_status` bigint(5) DEFAULT 0 COMMENT '是否允许桌面广告 0允许 1不允许',
  `ops_paper_advertising_status` bigint(5) DEFAULT 0 COMMENT '是否允许纸面广告 0允许 1不允许',
  `ops_first_paper_feed` bigint(50) DEFAULT 0 COMMENT '首次送纸量',
  `ops_ten_day_consumption` bigint(50) DEFAULT 0 COMMENT '10天耗质量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ops_responsible_person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='负责人表';

#平台收益表
CREATE TABLE `tb_ops_platform_revenue` (
  `ops_platform_manager_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '负责人编号',
  `ops_platform_manager_name` varchar(100) NOT NULL COMMENT '负责人姓名',
  `ops_total_transaction_volume` DECIMAL(15,2) DEFAULT 0 COMMENT '总交易金额',
  `ops_split_sum` DECIMAL(15,2) DEFAULT 0 COMMENT '分成金额',
  `ops_subsidy_amount` DECIMAL(15,2) DEFAULT 0 COMMENT '补贴金额',
  `ops_advertising_amount` DECIMAL(15,2) DEFAULT 0 COMMENT '广告金额',
  `ops_other_amount` DECIMAL(15,2) DEFAULT 0 COMMENT '其他金额',
  PRIMARY KEY (`ops_platform_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='平台收益表';

#余额明细表
CREATE TABLE `tb_ops_balance_details` (
  `ops_platform_manager_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '负责人编号',
  `ops_platform_manager_name` varchar(100) NOT NULL COMMENT '负责人姓名',
  `ops_available_balance` DECIMAL(15,2) DEFAULT 0 COMMENT '可用余额',
  `ops_accumulated_income` DECIMAL(15,2) DEFAULT 0 COMMENT '历史收益',
  `ops_cumulative_transaction` DECIMAL(15,2) DEFAULT 0 COMMENT '累计交易额',
  `ops_other_amount` DECIMAL(15,2) DEFAULT 0 COMMENT '其他金额',
  `ops_region` varchar(50) DEFAULT NULL COMMENT '区域',
  PRIMARY KEY (`ops_platform_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='余额明细表';


#交易记录表
CREATE TABLE `tb_ops_transaction_records` (
  `ops_order_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `ops_product_name` varchar(100) NOT NULL COMMENT '商品名称',
  `ops_product_price` DECIMAL(15,2) DEFAULT 0 COMMENT '商品价格',
  `ops_transaction_number` bigint(50) DEFAULT 0 COMMENT '交易单号',
  `ops_region` varchar(50) DEFAULT NULL COMMENT '售卖区域',
  `create_time` datetime DEFAULT NULL COMMENT '售卖时间',
  `ops_machine_number`varchar(50) DEFAULT NULL COMMENT '售卖机器编号',
  `ops_customer_account`varchar(50) DEFAULT NULL COMMENT '购买人账号',
  PRIMARY KEY (`ops_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='交易记录表';


#补货表
CREATE TABLE `tb_replenishment_manage` (
  `ops_replenishment_num` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '补货单号',
  `ops_store_manager_id` bigint(50) NOT NULL COMMENT '店长编号',
  `ops_store_name` varchar(100) NOT NULL COMMENT '店名',
  `ops_linkman_name` varchar(100) DEFAULT '0' COMMENT '联系人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '上次补货时间',
  `ops_application_status` bigint(5) DEFAULT 0 COMMENT '是否有申请 0代表没有 1代表有',
  `ops_last_amount_paper` bigint(50) DEFAULT 0 COMMENT '上次补纸量',
  `ops_initial_paper_quantity` bigint(50) DEFAULT 0 COMMENT '期初纸量',
  `ops_paper_yield` bigint(50) DEFAULT 0 COMMENT '当前出纸率',
  `ops_paper_surplus` bigint(50) DEFAULT 0 COMMENT '剩余纸量',
  `ops_paper_output` bigint(50) DEFAULT 0 COMMENT '单日出纸量',
  `ops_replenishment_cycle` varchar(50) NOT NULL COMMENT '补货周期',
  `ops_product_name` varchar(100) NOT NULL COMMENT '商品名称',
  `ops_product_type` varchar(100) NOT NULL COMMENT '商品类型',
  `ops_error_state` varchar(100) NOT NULL COMMENT '异常状态',
  `ops_error_remark` varchar(100) NOT NULL COMMENT '异常备注',
  PRIMARY KEY (`ops_replenishment_num`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='补货管理';


