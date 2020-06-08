/*
 Navicat Premium Data Transfer

 Source Server         : mac
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : nongxinle

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 07/04/2020 12:50:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nx_applys
-- ----------------------------
DROP TABLE IF EXISTS `nx_applys`;
CREATE TABLE `nx_applys` (
  `nx_applys_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `nx_apply_customer_id` int(20) DEFAULT NULL COMMENT '申请客户id',
  `nx_apply_user_id` int(20) DEFAULT NULL COMMENT '申请用户id',
  `nx_apply_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_apply_goods_id` int(20) DEFAULT NULL COMMENT '申请商品id',
  `nx_apply_quantity` float(10,1) DEFAULT NULL COMMENT '申请数量',
  `nx_apply_date` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '申请日期',
  `nx_apply_status` tinyint(2) DEFAULT NULL COMMENT '申请状态',
  `nx_apply_remark` tinyint(200) DEFAULT NULL COMMENT '申请备注',
  `nx_apply_weight` float(10,1) DEFAULT NULL COMMENT '申请数量',
  `nx_apply_price` float(10,1) DEFAULT NULL COMMENT '商品单价',
  `nx_apply_subtotal` float(10,1) DEFAULT NULL COMMENT '小计',
  `nx_weigh_user_id` int(20) DEFAULT NULL COMMENT '称重用户id',
  `nx_account_user_id` int(20) DEFAULT NULL COMMENT '输入单价用户id',
  `nx_bill_id` int(20) DEFAULT NULL COMMENT '账单id',
  PRIMARY KEY (`nx_applys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

SET FOREIGN_KEY_CHECKS = 1;
