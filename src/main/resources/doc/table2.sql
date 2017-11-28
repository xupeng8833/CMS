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
  `sp_id` varchar(50) NOT NULL COMMENT '商品编号',
  `sp_nm` varchar(50) NOT NULL COMMENT '商品名称',
  `sp_price` bigint(10) NOT NULL COMMENT '售价',
  `sp_type` varchar(100) DEFAULT NULL COMMENT '类别',
  `sp_guige` varchar(40) DEFAULT NULL COMMENT '规格',
  `sp_pinpai` varchar(80) DEFAULT NULL COMMENT '品牌',
  `sp_pn` varchar(50) DEFAULT NULL COMMENT 'PN码',
  `sp_status` tinyint(5)  DEFAULT NULL COMMENT '状态1:正常0:下架',
  `sp_jiqiid` varchar(50)  DEFAULT NULL COMMENT '机器编号',
  `sp_image` varchar(100)  DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

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
  `sp_price_shangquan` varchar(80)  DEFAULT NULL COMMENT '机器范围-商圈',
  `sp_price_changjing` varchar(50)  DEFAULT NULL COMMENT '场景',
  `sp_price_lowjifen` bigint(10)  DEFAULT NULL COMMENT '指定人员-最少积分',
  `sp_price_topjifen` bigint(10)  DEFAULT NULL COMMENT '指定人员-最多积分',
  `sp_price_price` double(10,3)  DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`sp_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='价格管理规则';

-- -----------