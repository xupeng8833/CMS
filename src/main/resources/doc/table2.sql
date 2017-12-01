/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-11-19 08:59:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_sp
-- ----------------------------
DROP TABLE IF EXISTS `tb_sp`;
CREATE TABLE `tb_sp` (
  `sp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sp_nm` varchar(50) NOT NULL COMMENT '商品名称',
  `sp_price` bigint(10) NOT NULL COMMENT '售价',
  `sp_type` varchar(100) DEFAULT NULL COMMENT '类别',
  `sp_guige` varchar(40) DEFAULT NULL COMMENT '规格',
  `sp_pinpai` varchar(80) DEFAULT NULL COMMENT '品牌',
  `sp_pn` varchar(50) DEFAULT NULL COMMENT 'PN码',
  `sp_status` varchar(50)  DEFAULT NULL COMMENT '状态:正常,下架',
  `sp_jiqiid` varchar(50)  DEFAULT NULL COMMENT '机器编号',
  `sp_image` varchar(100)  DEFAULT NULL COMMENT '商品图片',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Table structure for tb_sp_price
-- ----------------------------
DROP TABLE IF EXISTS `tb_sp_price`;
CREATE TABLE `tb_sp_price` (
  `sp_price_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sp_price_nm` varchar(50) NOT NULL COMMENT '规则名称',
  `sp_price_starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `sp_price_endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `sp_price_sheng` varchar(80) DEFAULT NULL COMMENT '机器范围-省',
  `sp_price_shi` varchar(80) DEFAULT NULL COMMENT '机器范围-市',
  `sp_price_qu` varchar(80) DEFAULT NULL COMMENT '机器范围-区',
  `sp_price_shangquan` varchar(80)  DEFAULT NULL COMMENT '机器范围-商圈',
  `sp_price_changjing` varchar(50)  DEFAULT NULL COMMENT '场景',
  `sp_price_lowjifen` bigint(10)  DEFAULT NULL COMMENT '指定人员-最少积分',
  `sp_price_topjifen` bigint(10)  DEFAULT NULL COMMENT '指定人员-最多积分',
  `sp_price_price` double(10,3)  DEFAULT NULL COMMENT '价格',
  `sp_price_free_first` varchar(50)  DEFAULT NULL COMMENT '免费设定首次免费',
  `sp_price_free_rate` varchar(50)  DEFAULT NULL COMMENT '免费设定免费频率',
  `sp_price_free_times` varchar(50)  DEFAULT NULL COMMENT '免费设定免费次数',
  `sp_price_time` datetime  DEFAULT NOW() COMMENT '添加时间',
  PRIMARY KEY (`sp_price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='价格管理规则';

-- ----------------------------
-- Table structure for tb_master_scope
-- ----------------------------
DROP TABLE IF EXISTS `tb_master_scope`;
CREATE TABLE `tb_master_scope` (
  `sp_sheng` varchar(50) NOT NULL COMMENT '省',
  `sp_shi` varchar(50) NOT NULL COMMENT '市',
  `sp_qu` bigint(10) NOT NULL COMMENT '区',
  `sp_area` varchar(100) NOT NULL COMMENT '商圈',
  PRIMARY KEY (`sp_sheng`,`sp_shi`,`sp_qu`,`sp_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基本表范围';

-- ----------------------------
-- Table structure for tb_master_free
-- ----------------------------
DROP TABLE IF EXISTS `tb_master_free`;
CREATE TABLE `tb_master_free` (
  `master_free_first` varchar(50) NOT NULL COMMENT '首次免费',
  `master_free_frequency` varchar(50) NOT NULL COMMENT '免费频率',
  PRIMARY KEY (`master_free_first`,`master_free_frequency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基本表免费设定';

-- ----------------------------
-- Table structure for tb_master_sp
-- ----------------------------
DROP TABLE IF EXISTS `tb_master_sp`;
CREATE TABLE `tb_master_sp` (
  `master_sp_id` bigint(20) NOT NULL COMMENT '商品ID',
  `master_sp_nm` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `master_sp_type` varchar(50) DEFAULT NULL COMMENT '商品类别',
  PRIMARY KEY (`master_sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基本表商品';

-- -----------
