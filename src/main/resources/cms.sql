/*
Navicat MySQL Data Transfer

Source Server         : mysql1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-22 16:45:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '修改密码', 'com.cf.controller.SysUserController.password()', '\"\"', '127.0.0.1', '2017-09-28 10:59:06');
INSERT INTO `sys_log` VALUES ('2', 'admin', '删除定时任务', 'com.cf.controller.ScheduleJobController.delete()', '[1,2]', '127.0.0.1', '2017-11-19 07:59:43');
INSERT INTO `sys_log` VALUES ('3', 'admin', '删除菜单', 'com.cf.controller.SysMenuController.delete()', '[7,8,9,10,11,12,13,14]', '127.0.0.1', '2017-11-19 08:06:03');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存角色', 'com.system.controller.SysRoleController.save()', '{\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,28],\"remark\":\"x\",\"roleName\":\"xp\"}', '127.0.0.1', '2017-11-19 08:50:34');
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-cog\",\"menuId\":1,\"name\":\"权限管理\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '127.0.0.1', '2017-11-19 08:51:21');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存菜单', 'com.system.controller.SysMenuController.save()', '{\"icon\":\"fa fa-pencil-square\",\"name\":\"意见反馈管理\",\"orderNum\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}', '127.0.0.1', '2017-11-19 10:24:57');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-pencil-square\",\"menuId\":30,\"name\":\"意见反馈管理\",\"orderNum\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"sys/feedback.html\"}', '127.0.0.1', '2017-11-19 10:26:51');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-pencil-square\",\"menuId\":30,\"name\":\"意见反馈管理\",\"orderNum\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:feedback:list,sys:feedback:info,sys:feedback:save,sys:feedback:update,sys:feedback:delete\",\"type\":1,\"url\":\"sys/feedback.html\"}', '127.0.0.1', '2017-11-19 10:28:22');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存菜单', 'com.system.controller.SysMenuController.save()', '{\"icon\":\"fa fa-list\",\"name\":\"订单管理\",\"orderNum\":7,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"\"}', '127.0.0.1', '2017-11-19 16:34:02');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存菜单', 'com.system.controller.SysMenuController.save()', '{\"icon\":\"fa fa-list\",\"name\":\"订单管理\",\"orderNum\":7,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":1,\"url\":\"/sys/order/list\"}', '127.0.0.1', '2017-11-19 16:34:19');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-list\",\"menuId\":31,\"name\":\"订单管理\",\"orderNum\":7,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:order:list,sys:order:info,sys:order:save,sys:order:update,sys:order:delete\",\"type\":1,\"url\":\"/sys/order/list\"}', '127.0.0.1', '2017-11-19 17:07:13');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-list\",\"menuId\":31,\"name\":\"订单管理\",\"orderNum\":7,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:order:list\",\"type\":1,\"url\":\"/sys/order/list\"}', '127.0.0.1', '2017-11-19 17:14:19');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-list\",\"menuId\":31,\"name\":\"订单管理\",\"orderNum\":7,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:order:list\",\"type\":1,\"url\":\"sys/order.html\"}', '127.0.0.1', '2017-11-19 17:19:02');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存菜单', 'com.system.controller.SysMenuController.save()', '{\"name\":\"数据导出\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"订单管理\",\"perms\":\"sys:order:export\",\"type\":2}', '127.0.0.1', '2017-11-19 17:35:39');
INSERT INTO `sys_log` VALUES ('15', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"menuId\":32,\"name\":\"数据导出\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"订单管理\",\"perms\":\"sys:order:exportExl\",\"type\":2}', '127.0.0.1', '2017-11-19 20:16:10');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-th-list\",\"menuId\":31,\"name\":\"订单管理\",\"orderNum\":7,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:order:list\",\"type\":1,\"url\":\"sys/order.html\"}', '127.0.0.1', '2017-11-19 22:49:36');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'com.system.controller.SysMenuController.save()', '{\"icon\":\"fa fa-cog\",\"name\":\"保修信息管理\",\"orderNum\":8,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:report:list,sys:report:info\",\"type\":1,\"url\":\"sys/report.html\"}', '127.0.0.1', '2017-11-19 22:52:42');
INSERT INTO `sys_log` VALUES ('18', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-cog\",\"menuId\":33,\"name\":\"保修信息管理\",\"orderNum\":8,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:report:list,sys:report:update\",\"type\":1,\"url\":\"sys/report.html\"}', '127.0.0.1', '2017-11-19 22:55:58');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-cog\",\"menuId\":33,\"name\":\"保修信息管理\",\"orderNum\":8,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:report:list,sys:report:update,sys:report:info\",\"type\":1,\"url\":\"sys/report.html\"}', '127.0.0.1', '2017-11-20 20:06:08');
INSERT INTO `sys_log` VALUES ('20', 'admin', '保存菜单', 'com.system.controller.SysMenuController.save()', '{\"name\":\"补货管理\",\"orderNum\":9,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:replenishment:list,sys:replenishment:update,sys:replenishment:info\",\"type\":1,\"url\":\"sys/replenishment.html\"}', '127.0.0.1', '2017-11-20 23:25:10');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-file-text\",\"menuId\":34,\"name\":\"补货管理\",\"orderNum\":9,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:replenishment:list,sys:replenishment:update,sys:replenishment:info\",\"type\":1,\"url\":\"sys/replenishment.html\"}', '127.0.0.1', '2017-11-20 23:27:59');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存菜单', 'com.system.controller.SysMenuController.save()', '{\"icon\":\"fa fa-credit-card\",\"name\":\"提现结算申请\",\"orderNum\":10,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"sys:presentapplication:list,sys:presentapplication:info,sys:presentapplication:update\",\"type\":1,\"url\":\"sys/presentapplication.html\"}', '127.0.0.1', '2017-11-22 09:42:57');
INSERT INTO `sys_log` VALUES ('23', 'admin', '保存角色', 'com.system.controller.SysRoleController.save()', '{\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,28,30,31,32],\"remark\":\"xxx\",\"roleName\":\"2\"}', '127.0.0.1', '2017-11-22 14:29:03');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '权限管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '用户管理', 'sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '1', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '8');
INSERT INTO `sys_menu` VALUES ('30', '0', '意见反馈管理', 'sys/feedback.html', 'sys:feedback:list,sys:feedback:info,sys:feedback:save,sys:feedback:update,sys:feedback:delete', '1', 'fa fa-pencil-square', '1');
INSERT INTO `sys_menu` VALUES ('31', '0', '订单管理', 'sys/order.html', 'sys:order:list', '1', 'fa fa-th-list', '7');
INSERT INTO `sys_menu` VALUES ('32', '31', '数据导出', null, 'sys:order:exportExl', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '0', '保修信息管理', 'sys/report.html', 'sys:report:list,sys:report:update,sys:report:info', '1', 'fa fa-cog', '8');
INSERT INTO `sys_menu` VALUES ('34', '0', '补货管理', 'sys/replenishment.html', 'sys:replenishment:list,sys:replenishment:update,sys:replenishment:info', '1', 'fa fa-file-text', '9');
INSERT INTO `sys_menu` VALUES ('35', '0', '提现结算申请', 'sys/presentapplication.html', 'sys:presentapplication:list,sys:presentapplication:info,sys:presentapplication:update', '1', 'fa fa-credit-card', '10');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'xp', 'x', '1', '2017-11-19 08:50:35');
INSERT INTO `sys_role` VALUES ('2', '2', 'xxx', '1', '2017-11-22 14:29:03');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('10', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('11', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('12', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('13', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('14', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('15', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('16', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('17', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('18', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('19', '2', '2');
INSERT INTO `sys_role_menu` VALUES ('20', '2', '15');
INSERT INTO `sys_role_menu` VALUES ('21', '2', '16');
INSERT INTO `sys_role_menu` VALUES ('22', '2', '17');
INSERT INTO `sys_role_menu` VALUES ('23', '2', '18');
INSERT INTO `sys_role_menu` VALUES ('24', '2', '3');
INSERT INTO `sys_role_menu` VALUES ('25', '2', '19');
INSERT INTO `sys_role_menu` VALUES ('26', '2', '20');
INSERT INTO `sys_role_menu` VALUES ('27', '2', '21');
INSERT INTO `sys_role_menu` VALUES ('28', '2', '22');
INSERT INTO `sys_role_menu` VALUES ('29', '2', '4');
INSERT INTO `sys_role_menu` VALUES ('30', '2', '23');
INSERT INTO `sys_role_menu` VALUES ('31', '2', '24');
INSERT INTO `sys_role_menu` VALUES ('32', '2', '25');
INSERT INTO `sys_role_menu` VALUES ('33', '2', '26');
INSERT INTO `sys_role_menu` VALUES ('34', '2', '28');
INSERT INTO `sys_role_menu` VALUES ('35', '2', '30');
INSERT INTO `sys_role_menu` VALUES ('36', '2', '31');
INSERT INTO `sys_role_menu` VALUES ('37', '2', '32');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '100@qq.com', '13666666666', '1', null, '2017-06-01 15:33:20');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for tb_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedback`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of tb_feedback
-- ----------------------------
INSERT INTO `tb_feedback` VALUES ('2', '1', '138111111', '0', '你好', '1', 'ss', '2017-11-19 10:33:47');
INSERT INTO `tb_feedback` VALUES ('3', '2', '132', '1', '你好', '1', '你你wwwwww', '2017-11-29 14:02:55');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(50) NOT NULL COMMENT '订单号',
  `user_id` bigint(50) NOT NULL COMMENT '购买人ID',
  `product_name` varchar(100) NOT NULL COMMENT '商品名称',
  `product_num` bigint(50) DEFAULT '0' COMMENT '商品数量',
  `order_price` bigint(50) DEFAULT '0' COMMENT '订单金额',
  `machine_num` bigint(50) DEFAULT NULL COMMENT '售卖机器编号',
  `pay_type` bigint(5) DEFAULT NULL COMMENT '支付方式 0微信支付、1支付宝支付',
  `create_time` datetime DEFAULT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', '11', '111', '111', '2', '2', '2', '0', '2017-11-21 17:23:31');
INSERT INTO `tb_order` VALUES ('2', '22', '222', '222', '1', '34', '3', '0', '2017-11-07 17:23:49');

-- ----------------------------
-- Table structure for tb_present_application
-- ----------------------------
DROP TABLE IF EXISTS `tb_present_application`;
CREATE TABLE `tb_present_application` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `application_num` bigint(50) NOT NULL COMMENT '提现流水单号',
  `apply_name_num` bigint(50) NOT NULL COMMENT '提现用户ID',
  `account_name` varchar(100) NOT NULL COMMENT '账号名称',
  `mobile` varchar(50) DEFAULT '0' COMMENT '手机号',
  `operator_name` varchar(100) DEFAULT NULL COMMENT '运营商名称',
  `cash_available` decimal(15,2) DEFAULT '0.00' COMMENT '可提现金额',
  `withdrawal_amount` decimal(15,2) DEFAULT '0.00' COMMENT '提现金额',
  `audit_state` bigint(10) DEFAULT '0' COMMENT '处理状态 0代表未审核 1代表已审核',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='提现结算申请表';

-- ----------------------------
-- Records of tb_present_application
-- ----------------------------
INSERT INTO `tb_present_application` VALUES ('1', '111', '222', '小王', '13811111', '北京市商贸', '1500.00', '1000.00', '0', '2017-11-28 09:50:10');
INSERT INTO `tb_present_application` VALUES ('2', '222', '333', '小李', '135', '大兴', '1700.00', '1100.00', '1', '2017-11-29 11:00:04');

-- ----------------------------
-- Table structure for tb_replenishment
-- ----------------------------
DROP TABLE IF EXISTS `tb_replenishment`;
CREATE TABLE `tb_replenishment` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `replenishment_num` bigint(50) NOT NULL COMMENT '补货单号',
  `machine_num` bigint(50) NOT NULL COMMENT '补货机器编号',
  `product_name` varchar(100) NOT NULL COMMENT '补货商品',
  `product_num` varchar(100) DEFAULT '0' COMMENT '补充数量',
  `apply_name` varchar(100) DEFAULT NULL COMMENT '申请人',
  `reporter_identity` varchar(100) DEFAULT '0' COMMENT '申请人身份',
  `apply_type` varchar(100) DEFAULT NULL COMMENT '补充状态',
  `machine_dealer` varchar(100) DEFAULT NULL,
  `machine_addr` varchar(500) DEFAULT NULL,
  `replenishment_name` varchar(100) NOT NULL COMMENT '补货商品',
  `machine_clerk` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='补货申请';

-- ----------------------------
-- Records of tb_replenishment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_report`;
CREATE TABLE `tb_report` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `report_num` bigint(50) NOT NULL COMMENT '报修单号',
  `machine_num` bigint(50) NOT NULL COMMENT '报修机器编号',
  `reporter_name` varchar(100) NOT NULL COMMENT '报修人名称',
  `reporter_type` varchar(100) DEFAULT '0' COMMENT '报修人类型 0客户、1代理商、2补货员',
  `repair_content` varchar(500) DEFAULT NULL,
  `report_content` varchar(500) DEFAULT '0' COMMENT '报修备注',
  `create_time` datetime DEFAULT NULL COMMENT '购买时间',
  `machine_dealer` varchar(100) DEFAULT NULL,
  `machine_addr` varchar(500) DEFAULT NULL,
  `machine_clerk` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='保修信息管理';

-- ----------------------------
-- Records of tb_report
-- ----------------------------
INSERT INTO `tb_report` VALUES ('1', '2', '2', '你', '经销商', null, '坏了', '2017-11-19 23:27:57', '小王', '大兴区西红门', '小李');

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Records of tb_token
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'test', '13888888888', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
