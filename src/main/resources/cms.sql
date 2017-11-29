/*
Navicat MySQL Data Transfer

Source Server         : mysql1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-29 17:39:40
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='系统日志';

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
INSERT INTO `sys_log` VALUES ('24', 'admin', '保存用户', 'com.system.controller.SysUserController.save()', '{\"email\":\"962270789@qq.com\",\"mobile\":\"13800000\",\"roleIdList\":[2,1],\"status\":1,\"username\":\"xupeng\"}', '127.0.0.1', '2017-11-27 10:40:09');
INSERT INTO `sys_log` VALUES ('25', 'admin', '保存菜单', 'com.system.controller.SysMenuController.save()', '{\"name\":\"订单列表管理-new\",\"orderNum\":7,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"opscustomerorder:list\",\"type\":1,\"url\":\"sys/opscustomerorder.html\"}', '127.0.0.1', '2017-11-28 15:23:44');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-th-list\",\"menuId\":36,\"name\":\"订单列表管理-new\",\"orderNum\":8,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"opscustomerorder:list\",\"type\":1,\"url\":\"sys/opscustomerorder.html\"}', '127.0.0.1', '2017-11-28 15:24:07');
INSERT INTO `sys_log` VALUES ('27', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-th-list\",\"menuId\":36,\"name\":\"订单列表管理-new\",\"orderNum\":11,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"opscustomerorder:list\",\"type\":1,\"url\":\"sys/opscustomerorder.html\"}', '127.0.0.1', '2017-11-28 16:30:25');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存菜单', 'com.system.controller.SysMenuController.save()', '{\"name\":\"补货管理-new\",\"orderNum\":12,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"replenishmentmanage:list\",\"type\":1,\"url\":\"sys/replenishmentmanage.html\"}', '127.0.0.1', '2017-11-28 16:59:28');
INSERT INTO `sys_log` VALUES ('29', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"icon\":\"fa fa-file-text\",\"menuId\":37,\"name\":\"补货管理-new\",\"orderNum\":12,\"parentId\":0,\"parentName\":\"一级菜单\",\"perms\":\"replenishmentmanage:list\",\"type\":1,\"url\":\"sys/replenishmentmanage.html\"}', '127.0.0.1', '2017-11-28 16:59:44');
INSERT INTO `sys_log` VALUES ('30', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"menuId\":32,\"name\":\"数据导出\",\"orderNum\":0,\"parentId\":36,\"parentName\":\"订单列表管理-new\",\"perms\":\"opscustomerorder:exportExl\",\"type\":2}', '127.0.0.1', '2017-11-29 16:34:07');
INSERT INTO `sys_log` VALUES ('31', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"menuId\":32,\"name\":\"数据导出\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"订单管理\",\"perms\":\"sys:order:exportExl\",\"type\":2}', '127.0.0.1', '2017-11-29 16:48:00');
INSERT INTO `sys_log` VALUES ('32', 'admin', '修改菜单', 'com.system.controller.SysMenuController.update()', '{\"menuId\":32,\"name\":\"数据导出\",\"orderNum\":0,\"parentId\":36,\"parentName\":\"订单列表管理-new\",\"perms\":\"opscustomerorder:exportExl\",\"type\":2}', '127.0.0.1', '2017-11-29 17:38:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

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
INSERT INTO `sys_menu` VALUES ('32', '36', '数据导出', null, 'opscustomerorder:exportExl', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '0', '保修信息管理', 'sys/report.html', 'sys:report:list,sys:report:update,sys:report:info', '1', 'fa fa-cog', '8');
INSERT INTO `sys_menu` VALUES ('34', '0', '补货管理', 'sys/replenishment.html', 'sys:replenishment:list,sys:replenishment:update,sys:replenishment:info', '1', 'fa fa-file-text', '9');
INSERT INTO `sys_menu` VALUES ('35', '0', '提现结算申请', 'sys/presentapplication.html', 'sys:presentapplication:list,sys:presentapplication:info,sys:presentapplication:update', '1', 'fa fa-credit-card', '10');
INSERT INTO `sys_menu` VALUES ('36', '0', '订单列表管理-new', 'sys/opscustomerorder.html', 'opscustomerorder:list', '1', 'fa fa-th-list', '11');
INSERT INTO `sys_menu` VALUES ('37', '0', '补货管理-new', 'sys/replenishmentmanage.html', 'replenishmentmanage:list', '1', 'fa fa-file-text', '12');

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
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` bigint(5) DEFAULT '0' COMMENT '性别 0代表是男 1代表是女',
  `ops_leader_name` varchar(50) DEFAULT NULL COMMENT '所属上级',
  `ops_role_name` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `ops_management_area` varchar(100) DEFAULT NULL COMMENT '管理范围',
  `ops_link_man` varchar(50) DEFAULT NULL COMMENT '联系人',
  `ops_income_rule` varchar(50) DEFAULT NULL COMMENT '收益规则',
  `ops_cooperation_policy` varchar(1500) DEFAULT NULL COMMENT '合作政策',
  `ops_region` varchar(50) DEFAULT NULL COMMENT '大区',
  `ops_province` varchar(50) DEFAULT NULL COMMENT '省',
  `ops_city` varchar(50) DEFAULT NULL COMMENT '市',
  `ops_storehouse` varchar(50) DEFAULT NULL COMMENT '仓库',
  `ops_route` varchar(50) DEFAULT NULL COMMENT '路线',
  `ops_function` varchar(50) DEFAULT NULL COMMENT '职能',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '100@qq.com', '13666666666', '1', null, '2017-06-01 15:33:20', null, '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('2', 'xupeng', 'e4ec377250dc0f384a0aeef1a8c86d059516426ba1e858671b6fac2cc0aa21e5', '962270789@qq.com', '13800000', '1', '1', '2017-11-27 10:40:10', null, '0', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '2');
INSERT INTO `sys_user_role` VALUES ('2', '2', '1');

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
-- Table structure for tb_ops_balance_details
-- ----------------------------
DROP TABLE IF EXISTS `tb_ops_balance_details`;
CREATE TABLE `tb_ops_balance_details` (
  `ops_platform_manager_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '负责人编号',
  `ops_platform_manager_name` varchar(100) NOT NULL COMMENT '负责人姓名',
  `ops_available_balance` decimal(15,2) DEFAULT '0.00' COMMENT '可用余额',
  `ops_accumulated_income` decimal(15,2) DEFAULT '0.00' COMMENT '历史收益',
  `ops_cumulative_transaction` decimal(15,2) DEFAULT '0.00' COMMENT '累计交易额',
  `ops_other_amount` decimal(15,2) DEFAULT '0.00' COMMENT '其他金额',
  `ops_region` varchar(50) DEFAULT NULL COMMENT '区域',
  PRIMARY KEY (`ops_platform_manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额明细表';

-- ----------------------------
-- Records of tb_ops_balance_details
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ops_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_ops_customer`;
CREATE TABLE `tb_ops_customer` (
  `ops_customer_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '终端用户id',
  `ops_customer_name` varchar(100) NOT NULL COMMENT '用户姓名',
  `ops_customer_account` varchar(100) NOT NULL COMMENT '用户账号',
  `ops_mobile` varchar(20) NOT NULL COMMENT '手机号',
  `ops_customer_password` varchar(300) DEFAULT NULL COMMENT '用户密码',
  `ops_purchase_num` bigint(5) DEFAULT '0' COMMENT '购买次数',
  `ops_integration_total` bigint(5) DEFAULT '0' COMMENT '积分总数',
  `ops_free_packet_count` bigint(5) DEFAULT '0' COMMENT '剩余免费包数',
  `ops_membership_level` bigint(5) DEFAULT '0' COMMENT '会员级别',
  `ops_purchase_amount` decimal(15,2) DEFAULT '0.00' COMMENT '购买金额',
  `ops_member_points` bigint(50) DEFAULT '0' COMMENT '会员积分',
  `ops_customer_image` varchar(300) DEFAULT NULL COMMENT '用户头像',
  `ops_customer_status` bigint(5) DEFAULT '1' COMMENT '用户状态 0代表无效 1代表有效',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`ops_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端用户表';

-- ----------------------------
-- Records of tb_ops_customer
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ops_customer_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_ops_customer_order`;
CREATE TABLE `tb_ops_customer_order` (
  `ops_customer_order_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `ops_product_name` varchar(100) NOT NULL COMMENT '商品名称',
  `ops_customer_id` bigint(50) NOT NULL COMMENT '用户id',
  `ops_product_amount` decimal(15,2) DEFAULT NULL COMMENT '商品金额',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户订单表';

-- ----------------------------
-- Records of tb_ops_customer_order
-- ----------------------------
INSERT INTO `tb_ops_customer_order` VALUES ('1', '1', '1', '1.00', '1', '1', '1', '1212', '1', '1', '1', '1', '1', '2017-11-21 15:43:02');
INSERT INTO `tb_ops_customer_order` VALUES ('2', '2', '2', '2.00', '2', '2', '2', '2222', '2', '2', '2', '2', '2', '2017-11-29 15:43:40');

-- ----------------------------
-- Table structure for tb_ops_platform_revenue
-- ----------------------------
DROP TABLE IF EXISTS `tb_ops_platform_revenue`;
CREATE TABLE `tb_ops_platform_revenue` (
  `ops_platform_manager_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '负责人编号',
  `ops_platform_manager_name` varchar(100) NOT NULL COMMENT '负责人姓名',
  `ops_total_transaction_volume` decimal(15,2) DEFAULT '0.00' COMMENT '总交易金额',
  `ops_split_sum` decimal(15,2) DEFAULT '0.00' COMMENT '分成金额',
  `ops_subsidy_amount` decimal(15,2) DEFAULT '0.00' COMMENT '补贴金额',
  `ops_advertising_amount` decimal(15,2) DEFAULT '0.00' COMMENT '广告金额',
  `ops_other_amount` decimal(15,2) DEFAULT '0.00' COMMENT '其他金额',
  PRIMARY KEY (`ops_platform_manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台收益表';

-- ----------------------------
-- Records of tb_ops_platform_revenue
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ops_replenishment_clerk
-- ----------------------------
DROP TABLE IF EXISTS `tb_ops_replenishment_clerk`;
CREATE TABLE `tb_ops_replenishment_clerk` (
  `ops_replenishment_clerk_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '补货员id',
  `ops_replenishment_clerk_name` varchar(100) NOT NULL COMMENT '补货员用户名',
  `ops_replenishment_clerk_sex` bigint(5) DEFAULT '0' COMMENT '补货员性别 0代表男 1代表女',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `ops_storehouse_name` varchar(50) NOT NULL COMMENT '仓库名称',
  `ops_city_area` varchar(100) NOT NULL COMMENT '城市区域',
  `ops_leader_name` varchar(100) DEFAULT NULL COMMENT '上级领导',
  `ops_duties` varchar(50) NOT NULL COMMENT '工作职能',
  `ops_management_times` bigint(50) NOT NULL COMMENT '管理次数',
  `create_time` datetime DEFAULT NULL COMMENT '就职时间',
  PRIMARY KEY (`ops_replenishment_clerk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='补货员表';

-- ----------------------------
-- Records of tb_ops_replenishment_clerk
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ops_responsible_person
-- ----------------------------
DROP TABLE IF EXISTS `tb_ops_responsible_person`;
CREATE TABLE `tb_ops_responsible_person` (
  `ops_responsible_person_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '负责人id',
  `ops_store_manager_id` bigint(50) NOT NULL COMMENT '店长id',
  `ops_store_manager_name` varchar(100) NOT NULL COMMENT '店长姓名',
  `ops_responsible_person_name` varchar(100) NOT NULL COMMENT '负责人姓名',
  `ops_group_name` varchar(100) NOT NULL COMMENT '集团名称',
  `ops_responsible_person_mobile` varchar(100) NOT NULL COMMENT '负责人电话',
  `sex` bigint(5) DEFAULT '0' COMMENT '店长性别 0代表男 1代表女',
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
  `ops_product_price` decimal(15,2) DEFAULT NULL COMMENT '商品价格',
  `ops_adsense` bigint(5) DEFAULT '0' COMMENT '是否赠送广告位 0代表不赠送 1代表赠送',
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
  `ops_desktop_advertising_status` bigint(5) DEFAULT '0' COMMENT '是否允许桌面广告 0允许 1不允许',
  `ops_paper_advertising_status` bigint(5) DEFAULT '0' COMMENT '是否允许纸面广告 0允许 1不允许',
  `ops_first_paper_feed` bigint(50) DEFAULT '0' COMMENT '首次送纸量',
  `ops_ten_day_consumption` bigint(50) DEFAULT '0' COMMENT '10天耗质量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ops_responsible_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='负责人表';

-- ----------------------------
-- Records of tb_ops_responsible_person
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ops_store_manager
-- ----------------------------
DROP TABLE IF EXISTS `tb_ops_store_manager`;
CREATE TABLE `tb_ops_store_manager` (
  `ops_store_manager_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '经销商id',
  `ops_user_id` bigint(50) NOT NULL COMMENT '管理人id',
  `ops_store_manager_name` varchar(100) NOT NULL COMMENT '店长姓名',
  `sex` bigint(5) DEFAULT '0' COMMENT '店长性别 0代表男 1代表女',
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
  `ops_product_price` decimal(15,2) DEFAULT NULL COMMENT '商品价格',
  `ops_adsense` bigint(5) DEFAULT '0' COMMENT '是否赠送广告位 0代表不赠送 1代表赠送',
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
  `ops_desktop_advertising_status` bigint(5) DEFAULT '0' COMMENT '是否允许桌面广告 0允许 1不允许',
  `ops_paper_advertising_status` bigint(5) DEFAULT '0' COMMENT '是否允许纸面广告 0允许 1不允许',
  `ops_first_paper_feed` bigint(50) DEFAULT '0' COMMENT '首次送纸量',
  `ops_ten_day_consumption` bigint(50) DEFAULT '0' COMMENT '10天耗质量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ops_store_manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店长表';

-- ----------------------------
-- Records of tb_ops_store_manager
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ops_transaction_records
-- ----------------------------
DROP TABLE IF EXISTS `tb_ops_transaction_records`;
CREATE TABLE `tb_ops_transaction_records` (
  `ops_order_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `ops_product_name` varchar(100) NOT NULL COMMENT '商品名称',
  `ops_product_price` decimal(15,2) DEFAULT '0.00' COMMENT '商品价格',
  `ops_transaction_number` bigint(50) DEFAULT '0' COMMENT '交易单号',
  `ops_region` varchar(50) DEFAULT NULL COMMENT '售卖区域',
  `create_time` datetime DEFAULT NULL COMMENT '售卖时间',
  `ops_machine_number` varchar(50) DEFAULT NULL COMMENT '售卖机器编号',
  `ops_customer_account` varchar(50) DEFAULT NULL COMMENT '购买人账号',
  PRIMARY KEY (`ops_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易记录表';

-- ----------------------------
-- Records of tb_ops_transaction_records
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='补货申请';

-- ----------------------------
-- Records of tb_replenishment
-- ----------------------------
INSERT INTO `tb_replenishment` VALUES ('1', '1', '1', '11', '0', null, '0', null, null, null, '1', null, null);

-- ----------------------------
-- Table structure for tb_replenishment_manage
-- ----------------------------
DROP TABLE IF EXISTS `tb_replenishment_manage`;
CREATE TABLE `tb_replenishment_manage` (
  `ops_replenishment_num` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '补货单号',
  `ops_store_manager_id` bigint(50) NOT NULL COMMENT '店长编号',
  `ops_store_name` varchar(100) NOT NULL COMMENT '店名',
  `ops_linkman_name` varchar(100) DEFAULT '0' COMMENT '联系人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '上次补货时间',
  `ops_application_status` bigint(5) DEFAULT '0' COMMENT '是否有申请 0代表没有 1代表有',
  `ops_last_amount_paper` bigint(50) DEFAULT '0' COMMENT '上次补纸量',
  `ops_initial_paper_quantity` bigint(50) DEFAULT '0' COMMENT '期初纸量',
  `ops_paper_yield` bigint(50) DEFAULT '0' COMMENT '当前出纸率',
  `ops_paper_surplus` bigint(50) DEFAULT '0' COMMENT '剩余纸量',
  `ops_paper_output` bigint(50) DEFAULT '0' COMMENT '单日出纸量',
  `ops_replenishment_cycle` varchar(50) NOT NULL COMMENT '补货周期',
  `ops_product_name` varchar(100) NOT NULL COMMENT '商品名称',
  `ops_product_type` varchar(100) NOT NULL COMMENT '商品类型',
  `ops_error_state` varchar(100) NOT NULL COMMENT '异常状态',
  `ops_error_remark` varchar(100) NOT NULL COMMENT '异常备注',
  PRIMARY KEY (`ops_replenishment_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='补货管理';

-- ----------------------------
-- Records of tb_replenishment_manage
-- ----------------------------
INSERT INTO `tb_replenishment_manage` VALUES ('1', '1', '1', '0', '2017-11-21 17:02:06', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `tb_replenishment_manage` VALUES ('2', '2', '2', '0', '2017-11-29 17:02:34', '0', '0', '0', '0', '0', '0', '2', '2', '2', '2', '2');

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
-- Table structure for tb_sp
-- ----------------------------
DROP TABLE IF EXISTS `tb_sp`;
CREATE TABLE `tb_sp` (
  `sp_id` varchar(50) NOT NULL COMMENT '商品编号',
  `sp_nm` varchar(50) NOT NULL COMMENT '商品名称',
  `sp_price` bigint(10) NOT NULL COMMENT '售价',
  `sp_type` varchar(100) DEFAULT NULL COMMENT '类别',
  `sp_guige` varchar(40) DEFAULT NULL COMMENT '规格',
  `sp_pinpai` varchar(80) DEFAULT NULL COMMENT '品牌',
  `sp_pn` varchar(50) DEFAULT NULL COMMENT 'PN码',
  `sp_status` tinyint(5) DEFAULT NULL COMMENT '状态1:正常0:下架',
  `sp_jiqiid` varchar(50) DEFAULT NULL COMMENT '机器编号',
  `sp_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of tb_sp
-- ----------------------------

-- ----------------------------
-- Table structure for tb_sp_price
-- ----------------------------
DROP TABLE IF EXISTS `tb_sp_price`;
CREATE TABLE `tb_sp_price` (
  `sp_price_id` varchar(20) NOT NULL COMMENT '规则ID',
  `sp_price_nm` varchar(50) NOT NULL COMMENT '规则名称',
  `sp_price_starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `sp_price_endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `sp_price_sheng` varchar(80) DEFAULT NULL COMMENT '机器范围-省',
  `sp_price_shi` varchar(80) DEFAULT NULL COMMENT '机器范围-市',
  `sp_price_qu` varchar(80) DEFAULT NULL COMMENT '机器范围-区',
  `sp_price_shangquan` varchar(80) DEFAULT NULL COMMENT '机器范围-商圈',
  `sp_price_changjing` varchar(50) DEFAULT NULL COMMENT '场景',
  `sp_price_lowjifen` bigint(10) DEFAULT NULL COMMENT '指定人员-最少积分',
  `sp_price_topjifen` bigint(10) DEFAULT NULL COMMENT '指定人员-最多积分',
  `sp_price_price` double(10,3) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`sp_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='价格管理规则';

-- ----------------------------
-- Records of tb_sp_price
-- ----------------------------

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
