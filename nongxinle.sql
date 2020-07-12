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

 Date: 08/07/2020 04:30:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nx_community
-- ----------------------------
DROP TABLE IF EXISTS `nx_community`;
CREATE TABLE `nx_community` (
  `nx_community_id` int(20) NOT NULL,
  `nx_community_name` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_lat` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_lng` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_route_id` int(20) DEFAULT NULL,
  `nx_community_dis_id` int(20) DEFAULT NULL,
  `nx_community_polygon` varchar(10000) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_community_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community
-- ----------------------------
BEGIN;
INSERT INTO `nx_community` VALUES (1, '美林湾', '39.97956', '116.774149', 1, 1, '{\"id\":1,\"data\":[{\"lng\":116.770772,\"lat\":39.98437},{\"lng\":116.763729,\"lat\":39.972372},{\"lng\":116.787516,\"lat\":39.971709},{\"lng\":116.787085,\"lat\":39.985476}]}');
INSERT INTO `nx_community` VALUES (2, '悦榕湾', NULL, NULL, 1, 1, NULL);
INSERT INTO `nx_community` VALUES (3, '纳丹堡', NULL, NULL, 1, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_adsense
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_adsense`;
CREATE TABLE `nx_community_adsense` (
  `nx_community_adsense_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `nx_CA_file_path` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '广告位图片',
  `nx_CA_click` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '广告位链接',
  `nx_CA_community_id` int(20) DEFAULT NULL COMMENT '社区id',
  `nx_CA_sort` int(4) DEFAULT NULL COMMENT '广告位排序',
  PRIMARY KEY (`nx_community_adsense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_adsense
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_adsense` VALUES (2, 'uploadImage/4.jpg', NULL, 1, NULL);
INSERT INTO `nx_community_adsense` VALUES (3, 'uploadImage/80.png', NULL, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_daytime
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_daytime`;
CREATE TABLE `nx_community_daytime` (
  `nx_week_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_day_name` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_day_open` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_day_close` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dis_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_week_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_community_father_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_father_goods`;
CREATE TABLE `nx_community_father_goods` (
  `nx_community_father_goods_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_father_goods_name` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_father_goods_img` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_father_goods_sort` int(4) DEFAULT NULL,
  `nx_father_goods_color` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_fathers_father_id` int(20) DEFAULT NULL,
  `nx_father_goods_level` tinyint(2) DEFAULT NULL,
  `nx_CFG_community_id` int(20) DEFAULT NULL,
  `nx_CFG_goods_amount` int(4) DEFAULT NULL,
  PRIMARY KEY (`nx_community_father_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_father_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_father_goods` VALUES (1, '生鲜', NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `nx_community_father_goods` VALUES (2, '新鲜蔬菜', NULL, NULL, NULL, 1, 1, 1, NULL);
INSERT INTO `nx_community_father_goods` VALUES (3, '根茎类', 'uploadImage/1.jpg', NULL, '#20afb8', 2, 2, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_goods`;
CREATE TABLE `nx_community_goods` (
  `nx_community_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '社区商品id',
  `nx_cg_distribute_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_cg_community_id` int(20) DEFAULT NULL COMMENT '社区id',
  `nx_cg_goods_status` tinyint(2) DEFAULT NULL COMMENT '商品状态',
  `nx_cg_goods_is_weight` tinyint(2) DEFAULT NULL COMMENT '是否称重',
  `nx_cg_goods_price` float(10,1) DEFAULT NULL COMMENT '价格',
  `nx_cg_goods_price_decimal` int(10) DEFAULT NULL COMMENT '价格小数点部分',
  `nx_cg_nx_goods_file_path` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品图片',
  `nx_cg_goods_sell_type` tinyint(2) DEFAULT NULL COMMENT '批发商商品销售规格模式0按standardname销售，1 按自己的规格销售',
  `nx_cg_goods_buy_type` tinyint(2) DEFAULT NULL COMMENT '自采购商品的状态',
  `nx_cg_cf_goods_father_id` int(20) DEFAULT NULL COMMENT '社区商品父类id',
  `nx_cg_nx_goods_id` int(10) DEFAULT NULL COMMENT '购买热度',
  `nx_cg_nx_goods_father_id` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购数量',
  `nx_cg_nx_goods_father_img` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '进货方式',
  `nx_cg_goods_total_hits` int(20) DEFAULT NULL COMMENT '自采购员工id',
  `nx_cg_purchase_quantity` int(20) DEFAULT NULL COMMENT 'App订货供货商appid',
  `nx_cg_buy_purchase_user_id` int(20) DEFAULT NULL COMMENT '供货商id',
  `nx_cg_buy_app_id` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '进价',
  `nx_cg_buy_status` int(20) DEFAULT NULL COMMENT '商品id',
  `nx_cg_supplier_id` int(20) DEFAULT NULL COMMENT '商品库父类id',
  `nx_cg_buying_price` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品库image',
  `nx_cg_goods_type` tinyint(2) DEFAULT NULL COMMENT '0 供货商，1 社区库存，2 自采购 4 加工',
  `nx_cg_goods_name` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品名称',
  `nx_cg_goods_detail` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品详细',
  `nx_cg_goods_standardname` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品规格',
  `nx_cg_goods_stock` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区库存商品库存量',
  `nx_cg_goods_pinyin` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区商品拼音',
  `nx_cg_goods_py` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区商品拼音简拼',
  PRIMARY KEY (`nx_community_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_goods` VALUES (1, 1, 1, 0, NULL, 1.0, 6, 'uploadImage/blb.jpg', 1, NULL, 3, 45096, '111', 'uploadImage/1.jpg', 0, 9, 1, NULL, 2, 1, '0.8', 1, '白萝卜', '山东,四川', '斤', NULL, 'bailuobu', 'blb');
INSERT INTO `nx_community_goods` VALUES (2, 1, 1, 0, NULL, 2.0, 2, 'uploadImage/logo.jpg', 0, NULL, 3, 45097, '111', 'uploadImage/1.jpg', 0, NULL, NULL, NULL, NULL, 1, '1.1', 1, '卞萝卜', '', '斤', NULL, 'bianluobu', 'blb');
COMMIT;

-- ----------------------------
-- Table structure for nx_community_orders
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_orders`;
CREATE TABLE `nx_community_orders` (
  `nx_community_orders_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `nx_CO_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_CO_community_id` int(20) DEFAULT NULL COMMENT '订单社区id',
  `nx_CO_customer_id` int(20) DEFAULT NULL COMMENT '订单客户id',
  `nx_CO_user_id` int(20) DEFAULT NULL COMMENT '订单用户id',
  `nx_CO_date` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单日期',
  `nx_CO_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `nx_CO_service` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送达时间',
  `nx_CO_amount` float(10,0) DEFAULT NULL COMMENT '订单总金额',
  `nx_CO_service_date` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送到日期',
  `nx_CO_service_time` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送到时间',
  `nx_CO_weigh_user_id` int(20) DEFAULT NULL COMMENT '订单称重用户id',
  `nx_CO_delivery_user_id` int(20) DEFAULT NULL COMMENT '订单配送员工id',
  `nx_CO_sub_amount` int(10) DEFAULT NULL COMMENT '订单子商品数量',
  `nx_CO_sub_finished` int(10) DEFAULT NULL COMMENT '订单子商品完成数量',
  `nx_CO_weigh_number` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单称重订单号',
  `nx_CO_payment_status` tinyint(2) DEFAULT NULL COMMENT '订单支付状态',
  `nx_CO_payment_send_time` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单支付发送时间',
  `nx_CO_payment_time` varchar(0) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单支付时间',
  `nx_CO_type` tinyint(2) DEFAULT NULL COMMENT '订单类型 0先付款1后付款',
  PRIMARY KEY (`nx_community_orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_orders
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_orders` VALUES (1, 1, 1, 1, 1, '06-12 10:18', 0, '06121600', 140, '06-12', '16:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (2, 1, 1, 2, 2, '06-12 10:53', 0, '06121600', 2, '06-12', '16:00', NULL, NULL, 1, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (3, 1, 1, 3, 3, '06-12 10:55', 0, '06121600', 8, '06-12', '16:00', NULL, NULL, 1, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (4, 1, 1, 3, 3, '06-18 16:05', 1, '06190900', 24, '06-19', '9:00', 1, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (5, 1, 1, 3, 3, '06-18 19:40', 1, '06190900', 24, '06-19', '9:00', 1, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (6, 1, 1, 3, 3, '06-18 19:47', 0, '06190900', 24, '06-19', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (7, 1, 1, 3, 3, '06-18 19:47', 0, '06190900', 24, '06-19', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (8, 1, 1, 3, 3, '06-19 14:35', 0, '06200900', 30, '06-20', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (9, 1, 1, 3, 3, '06-19 14:36', 0, '06200900', 45, '06-20', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (10, 1, 1, 1, 1, '06-20 13:33', 0, '06201600', 140, '06-21', '16:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_orders_sub
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_orders_sub`;
CREATE TABLE `nx_community_orders_sub` (
  `nx_community_orders_sub_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '子订单id',
  `nx_COS_orders_id` int(11) DEFAULT NULL COMMENT '订单id',
  `nx_COS_nx_goods_id` int(20) DEFAULT NULL COMMENT '子订单nx商品id',
  `nx_COS_community_goods_id` int(20) DEFAULT NULL COMMENT '子订单社区商品id',
  `nx_COS_community_goods_father_id` int(20) DEFAULT NULL COMMENT '子订单商品父id',
  `nx_COS_quantity` float(10,1) DEFAULT NULL COMMENT '子订单申请数量',
  `nx_COS_standard` varchar(4) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '子订单申请规格',
  `nx_COS_price` float(10,1) DEFAULT NULL COMMENT '子订单申请商品单价',
  `nx_COS_remark` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '子订单申请备注',
  `nx_COS_weight` float(10,1) DEFAULT NULL COMMENT '子订单申请商品称重',
  `nx_COS_subtotal` float(10,1) DEFAULT NULL COMMENT '子订单申请商品小计',
  `nx_COS_status` tinyint(2) DEFAULT NULL COMMENT '子订单申请商品状态',
  `nx_COS_weigh_user_id` int(20) DEFAULT NULL COMMENT '子订单商品称重用户id',
  `nx_COS_account_user_id` int(20) DEFAULT NULL COMMENT '子订单商品输入单价用户id',
  `nx_COS_purchase_user_id` int(20) DEFAULT NULL COMMENT '子商品采购元id',
  `nx_COS_distributer_id` int(20) DEFAULT NULL COMMENT '子订单批发商id',
  `nx_COS_buy_status` tinyint(2) DEFAULT NULL COMMENT '子订单商品进货状态',
  `nx_COS_order_user_id` int(20) DEFAULT NULL COMMENT '子订单订货用户id',
  `nx_COS_sub_weight` float(4,1) DEFAULT NULL COMMENT '子订单重量',
  `nx_COS_sub_supplier_id` int(20) DEFAULT NULL COMMENT '子订单商品供货商id',
  `nx_COS_community_id` int(20) DEFAULT NULL COMMENT '子订单社区id',
  `nx_COS_goods_type` tinyint(2) DEFAULT NULL COMMENT '子订单社区商品类型',
  PRIMARY KEY (`nx_community_orders_sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_orders_sub
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_orders_sub` VALUES (1, 1, 45096, 1, 3, 4.0, '根', 1.6, NULL, NULL, 8.4, 0, NULL, NULL, NULL, 1, 1, 1, 5.2, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (2, 1, 45097, 2, 3, 33.0, '斤', 4.0, NULL, NULL, 132.0, 0, NULL, NULL, NULL, 1, 0, 1, 33.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (4, 3, 45096, 1, 3, 1.0, '根', 1.6, NULL, NULL, 8.4, 0, NULL, NULL, NULL, 1, 1, 3, 5.2, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (5, 4, 45096, 1, 3, 2.0, '根', 1.6, NULL, NULL, 4.2, 0, NULL, NULL, NULL, 1, 0, 3, 2.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (6, 4, 45097, 2, 3, 5.0, '斤', 4.0, NULL, NULL, 20.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (7, 5, 45096, 1, 3, 2.0, '根', 1.6, NULL, NULL, 4.2, 0, NULL, NULL, NULL, 1, 0, 3, 2.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (8, 5, 45097, 2, 3, 5.0, '斤', 4.0, NULL, NULL, 20.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (9, 6, 45096, 1, 3, 2.0, '根', 1.6, NULL, NULL, 4.2, 0, NULL, NULL, NULL, 1, 0, 3, 2.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (10, 6, 45097, 2, 3, 5.0, '斤', 4.0, NULL, NULL, 20.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (11, 7, 45096, 1, 3, 2.0, '根', 1.6, NULL, NULL, 4.2, 0, NULL, NULL, NULL, 1, 0, 3, 2.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (12, 7, 45097, 2, 3, 5.0, '斤', 4.0, NULL, NULL, 20.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (13, 8, 45096, 1, 3, 4.0, '根', 1.6, NULL, NULL, 8.4, 0, NULL, NULL, NULL, 1, 0, 3, 5.2, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (14, 8, 45097, 2, 3, 5.5, '斤', 4.0, NULL, NULL, 22.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.5, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (15, 9, 45096, 1, 3, 9.0, '根', 1.6, NULL, NULL, 18.9, 0, NULL, NULL, NULL, 1, 0, 3, 11.7, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (16, 9, 45097, 2, 3, 6.6, '斤', 4.0, NULL, NULL, 26.4, 0, NULL, NULL, NULL, 1, 0, 3, 6.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (17, 10, 45096, 1, 3, 4.0, '根', 1.6, NULL, NULL, 8.4, 0, NULL, NULL, NULL, 1, 0, 1, 5.2, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (18, 10, 45097, 2, 3, 33.0, '斤', 4.0, NULL, NULL, 132.0, 0, NULL, NULL, NULL, 1, 0, 1, 33.0, 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_promote
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_promote`;
CREATE TABLE `nx_community_promote` (
  `nx_promote_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_promote_cg_id` int(20) DEFAULT NULL,
  `nx_orignal_price` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_price` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_standard` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_weight` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_expired` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_storage` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_words` varchar(1000) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_recommand_goods` varchar(1000) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_file_path` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_community_id` int(20) DEFAULT NULL,
  `nx_promote_cg_father_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_promote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_community_standard
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_standard`;
CREATE TABLE `nx_community_standard` (
  `nx_community_standard_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_CS_comm_goods_id` int(20) DEFAULT NULL,
  `nx_CS_standard_name` varchar(4) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CS_standard_file_path` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CS_standard_scale` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CS_standard_error` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CS_standard_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`nx_community_standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_standard
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_standard` VALUES (1, 1, '根', 'uploadImage/wxbc686226ccc443f1.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.0r30bxBpTNcFbabac3529edec5e2c86ba0c548932af5.jpg', '1.3', '0.2', NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_stock
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_stock`;
CREATE TABLE `nx_community_stock` (
  `nx_community_stock_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '社区库存id',
  `nx_cs_community_id` int(20) DEFAULT NULL COMMENT '社区库存社区id',
  `nx_stock_total` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区库存数量',
  `nx_stock_requier_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区库存请求入库时间',
  `nx_stock_requier_user_id` int(20) DEFAULT NULL COMMENT '社区库存请求入库用户',
  `nx_stock_status` tinyint(2) DEFAULT NULL COMMENT '社区库存状态',
  `nx_stock_in_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区库存入库时间',
  `nx_stock_in_user_id` int(20) DEFAULT NULL COMMENT '社区库存入库用户',
  PRIMARY KEY (`nx_community_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_stock
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_stock` VALUES (1, 1, '19.0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (2, 1, '19.0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (3, 1, '19.0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (4, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (5, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (6, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (7, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (8, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (9, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (10, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (11, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (12, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (13, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (14, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (15, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (16, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (17, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (18, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (19, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (20, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (21, 1, '8.0', '2020-06-09', NULL, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_stock_sub
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_stock_sub`;
CREATE TABLE `nx_community_stock_sub` (
  `nx_community_sub_stock_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '社区子库存id',
  `nx_cs_id` int(20) DEFAULT NULL COMMENT '社区子库存库存id',
  `nx_css_cg_id` int(20) DEFAULT NULL COMMENT '社区子社区商品id',
  `nx_css_entry_amount` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库数量',
  `nx_css_entry_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库单位',
  `nx_css_entry_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库单价',
  `nx_css_entry_sub_total` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库小计',
  `nx_css_entry_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库日期',
  `nx_css_stock_amount` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存库存数量',
  PRIMARY KEY (`nx_community_sub_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_stock_sub
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_stock_sub` VALUES (1, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (2, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (3, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (4, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (5, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (6, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (7, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (8, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (9, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (10, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (11, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (12, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (13, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (14, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (15, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (16, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (17, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (18, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (19, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (20, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (21, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (22, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (23, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (24, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (25, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (26, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (27, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (28, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (29, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (30, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (31, NULL, 12, '2', '斤', '4.0', '8.0', '2020-06-09', '2');
COMMIT;

-- ----------------------------
-- Table structure for nx_community_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_user`;
CREATE TABLE `nx_community_user` (
  `nx_agent_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '社区用户id',
  `AU_wx_nick_name` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户微信昵称',
  `AU_wx_avartra_url` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户微信头像',
  `AU_wx_agender` varchar(4) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户微信性别',
  `AU_name` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户姓名',
  `AU_phone` varchar(11) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户手机号码',
  PRIMARY KEY (`nx_agent_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_customer
-- ----------------------------
DROP TABLE IF EXISTS `nx_customer`;
CREATE TABLE `nx_customer` (
  `nx_customer_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `nx_customer_name` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户名称',
  `nx_customer_print_label` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户打印名称',
  `nx_customer_out_label` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户对外名称',
  `nx_customer_type` tinyint(2) DEFAULT NULL COMMENT '客户类型',
  `nx_customer_address` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户地址',
  `nx_customer_phone` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户手机',
  `nx_customer_call` int(10) DEFAULT NULL COMMENT '客户称呼',
  `nx_customer_lat` varchar(30) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_customer_lng` varchar(30) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_customer_dis_id` int(20) DEFAULT NULL COMMENT '客户批发商id',
  `nx_customer_community_id` int(20) DEFAULT NULL COMMENT '社区id',
  `nx_customer_join_date` date DEFAULT NULL COMMENT '客户加入日期',
  `nx_customer_order_amount` float(10,1) DEFAULT NULL COMMENT '客户订货金额',
  `nx_customer_order_times` int(10) DEFAULT NULL COMMENT '客户订货次数',
  `nx_customer_detail_address` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户详细地址',
  PRIMARY KEY (`nx_customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_customer
-- ----------------------------
BEGIN;
INSERT INTO `nx_customer` VALUES (1, 'lipeiyi', NULL, NULL, NULL, '美林湾-41号楼', '13000099999', 2, '39.985476', '116.787085', 1, 1, NULL, NULL, NULL, '1haolou');
INSERT INTO `nx_customer` VALUES (2, '李佩仪', NULL, NULL, NULL, '美林湾-41号楼', '13910825707', 2, '39.985476', '116.787085', 1, 1, NULL, NULL, NULL, '1单元');
INSERT INTO `nx_customer` VALUES (3, '吗', NULL, NULL, NULL, '美林湾-52号楼', '13969636963', 2, '39.985476', '116.787085', 1, 1, NULL, NULL, NULL, '的');
COMMIT;

-- ----------------------------
-- Table structure for nx_customer_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_customer_user`;
CREATE TABLE `nx_customer_user` (
  `nx_CU_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '客户用户id',
  `nx_CU_customer_id` int(20) DEFAULT NULL COMMENT '客户id',
  `nx_CU_wx_nick_name` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户用户微信昵称',
  `nx_CU_wx_avatar_url` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '微信头像',
  `nx_CU_wx_gender` int(2) DEFAULT NULL COMMENT '微信性别',
  `nx_CU_wx_open_id` varchar(40) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '微信openid',
  `nx_CU_wx_phone_number` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '微信手机号',
  `nx_CU_join_date` date DEFAULT NULL COMMENT '客户加入时间',
  `nx_CU_order_amount` float(10,1) DEFAULT NULL COMMENT '客户订货总金额',
  `nx_CU_order_times` int(10) DEFAULT NULL COMMENT '客户订货次数',
  PRIMARY KEY (`nx_CU_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_customer_user
-- ----------------------------
BEGIN;
INSERT INTO `nx_customer_user` VALUES (1, 1, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, NULL, NULL, NULL);
INSERT INTO `nx_customer_user` VALUES (2, 2, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, NULL, NULL, NULL);
INSERT INTO `nx_customer_user` VALUES (3, 3, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_customer_user_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_customer_user_goods`;
CREATE TABLE `nx_customer_user_goods` (
  `nx_CUG_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '客户用户商品id',
  `nx_CUG_user_id` int(20) DEFAULT NULL COMMENT '客户用户id',
  `nx_CUG_community_goods_id` int(20) DEFAULT NULL COMMENT '批发商商品id',
  `nx_CUG_first_order_time` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户用户第一次订货时间',
  `nx_CUG_last_order_time` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户用户最后一次订货时间',
  `nx_CUG_order_amount` float(10,1) DEFAULT NULL COMMENT '客户用户订货总量',
  `nx_CUG_order_times` int(10) DEFAULT NULL COMMENT '客户用户订货次数',
  `nx_CUG_is_love` tinyint(2) DEFAULT NULL COMMENT '客户用户最爱',
  `nx_CUG_order_rate` int(4) DEFAULT NULL COMMENT '客户订货频率',
  `nx_CUG_last_order_quantity` float(10,1) DEFAULT NULL COMMENT '客户最后一次订货数量',
  `nx_CUG_last_order_standard` varchar(4) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户最后一次订货规格',
  `nx_CUG_join_my_template` tinyint(2) DEFAULT NULL COMMENT '是否加入用户订货模版',
  `nx_CUG_order_quantity` float(4,1) DEFAULT NULL,
  `nx_CUG_order_standard` varchar(4) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CUG_goods_color` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_CUG_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_customer_user_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_customer_user_goods` VALUES (1, 1, 1, '2020-06-12', '2020-06-20', 8.0, 2, NULL, NULL, 4.0, '根', 0, NULL, NULL, NULL);
INSERT INTO `nx_customer_user_goods` VALUES (2, 1, 2, '2020-06-12', '2020-06-20', 66.0, 2, NULL, NULL, 33.0, '斤', 0, NULL, NULL, NULL);
INSERT INTO `nx_customer_user_goods` VALUES (3, 2, 1, '2020-06-12', '2020-06-12', 1.0, 1, NULL, NULL, 1.0, '根', 0, NULL, NULL, NULL);
INSERT INTO `nx_customer_user_goods` VALUES (4, 3, 1, '2020-06-12', '2020-06-19', 25.0, 7, NULL, NULL, 9.0, '根', 0, NULL, NULL, NULL);
INSERT INTO `nx_customer_user_goods` VALUES (5, 3, 2, '2020-06-18', '2020-06-19', 32.1, 6, NULL, NULL, 6.6, '斤', 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_department
-- ----------------------------
DROP TABLE IF EXISTS `nx_department`;
CREATE TABLE `nx_department` (
  `nx_department_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订货部门id',
  `nx_department_name` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门名称',
  `nx_department_father_id` int(20) DEFAULT NULL COMMENT '订货部门上级id',
  `nx_department_type` tinyint(2) DEFAULT NULL COMMENT '订货部门类型',
  `nx_department_sub_amount` int(2) DEFAULT NULL COMMENT '订货部门子部门数量',
  `nx_department_dis_id` int(20) DEFAULT NULL COMMENT '订货部门批发商id',
  `nx_department_file_path` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department
-- ----------------------------
BEGIN;
INSERT INTO `nx_department` VALUES (1, '江户前1店', 0, 1, NULL, 1, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132');
INSERT INTO `nx_department` VALUES (2, '前厅', 1, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department` VALUES (3, '后厨', 1, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_department_bill
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_bill`;
CREATE TABLE `nx_department_bill` (
  `nx_department_bill_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DB_dis_id` int(20) DEFAULT NULL,
  `nx_DB_dep_id` int(20) DEFAULT NULL,
  `nx_DB_total` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DB_status` tinyint(2) DEFAULT NULL,
  `nx_DB_time` varchar(30) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DB_issue_user_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_department_bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_bill
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_bill` VALUES (1, NULL, NULL, '300', NULL, NULL, NULL);
INSERT INTO `nx_department_bill` VALUES (2, NULL, NULL, '86', NULL, NULL, 1);
INSERT INTO `nx_department_bill` VALUES (3, 1, NULL, '62', NULL, NULL, 1);
INSERT INTO `nx_department_bill` VALUES (4, 1, NULL, '62', 0, '2020-06-29', 1);
INSERT INTO `nx_department_bill` VALUES (5, 1, NULL, '62', 0, '2020-06-29 18:01', 1);
INSERT INTO `nx_department_bill` VALUES (6, 1, NULL, '62', 0, '2020-06-29 18:02', 1);
INSERT INTO `nx_department_bill` VALUES (7, 1, NULL, '62', 0, '2020-06-29 18:05', 1);
INSERT INTO `nx_department_bill` VALUES (8, 1, NULL, '27', 0, '2020-06-29 22:14', 1);
INSERT INTO `nx_department_bill` VALUES (9, 1, NULL, '12', 0, '2020-06-29 22:17', 1);
INSERT INTO `nx_department_bill` VALUES (10, 1, NULL, '1338', 0, '2020-06-29 22:20', 1);
INSERT INTO `nx_department_bill` VALUES (11, 1, NULL, '66', 0, '2020-06-29 22:23', 1);
INSERT INTO `nx_department_bill` VALUES (12, 1, NULL, '1112', 0, '2020-06-29 22:24', 1);
INSERT INTO `nx_department_bill` VALUES (13, 1, NULL, '1112', 0, '2020-06-29 22:24', 1);
INSERT INTO `nx_department_bill` VALUES (14, 1, NULL, '1112', 0, '2020-06-29 22:24', 1);
INSERT INTO `nx_department_bill` VALUES (15, 1, NULL, '66', 0, '2020-06-29 22:26', 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_department_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_goods`;
CREATE TABLE `nx_department_goods` (
  `nx_department_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '部门商品id',
  `nx_dg_department_id` int(20) DEFAULT NULL COMMENT '部门id',
  `nx_dg_nx_goods_id` int(10) DEFAULT NULL COMMENT 'nx商品id',
  `nx_dg_nx_goods_father_id` int(20) DEFAULT NULL COMMENT 'nx商品父类id',
  `nx_dg_goods_is_weight` tinyint(2) DEFAULT NULL COMMENT '是否称重',
  `nx_dg_goods_status` tinyint(2) DEFAULT NULL COMMENT '商品状态',
  `nx_dg_goods_price` float(10,1) DEFAULT NULL COMMENT '部门商品价格',
  `nx_dg_price_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门商品价格更新日期',
  `nx_dg_distribute_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_dg_order_quantity` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_order_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_order_time` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_order_only_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_order_only_time` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_department_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_goods` VALUES (1, 2, 45096, 111, NULL, NULL, NULL, NULL, 1, '3', '根', '07-07 17:20', '07-05', '17:20');
INSERT INTO `nx_department_goods` VALUES (2, 2, 45114, 112, NULL, NULL, NULL, NULL, 1, '5', '斤', '07-07 22:18', '07-07', '22:18');
INSERT INTO `nx_department_goods` VALUES (3, 2, 45097, 111, NULL, NULL, NULL, NULL, 1, '2', '斤', '07-07 22:18', '07-06', '22:18');
INSERT INTO `nx_department_goods` VALUES (4, 2, 45410, 141, NULL, NULL, NULL, NULL, 1, '10', '斤', '07-07 23:06', '07-05', '23:06');
INSERT INTO `nx_department_goods` VALUES (5, 2, 45437, 142, NULL, NULL, NULL, NULL, 1, '5', '斤', '07-07 23:07', '07-06', '23:07');
INSERT INTO `nx_department_goods` VALUES (6, 2, 45226, 121, NULL, NULL, NULL, NULL, 1, '2', '斤', '07-07 23:07', '07-04', '23:07');
INSERT INTO `nx_department_goods` VALUES (7, 2, 45282, 121, NULL, NULL, NULL, NULL, 1, '3', '斤', '07-07 23:07', '07-07', '23:07');
INSERT INTO `nx_department_goods` VALUES (8, 2, 45320, 131, NULL, NULL, NULL, NULL, 1, '2', '斤', '07-07 23:07', '07-07', '23:07');
INSERT INTO `nx_department_goods` VALUES (9, 2, 45315, 131, NULL, NULL, NULL, NULL, 1, '10', '斤', '07-07 23:07', '07-07', '23:07');
COMMIT;

-- ----------------------------
-- Table structure for nx_department_orders
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_orders`;
CREATE TABLE `nx_department_orders` (
  `nx_department_orders_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '部门订单id',
  `nx_DO_nx_goods_id` int(20) DEFAULT NULL COMMENT '部门订单nx商品id',
  `nx_DO_nx_goods_father_id` int(20) DEFAULT NULL COMMENT '部门订单商品父id',
  `nx_DO_department_goods_id` int(20) DEFAULT NULL COMMENT '部门订单社区商品id',
  `nx_DO_quantity` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请数量',
  `nx_DO_standard` varchar(4) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请规格',
  `nx_DO_remark` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请备注',
  `nx_DO_weight` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单重量',
  `nx_DO_price` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单商品单价',
  `nx_DO_subtotal` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请商品小计',
  `nx_DO_department_id` int(20) DEFAULT NULL COMMENT '部门订单部门id',
  `nx_DO_department_father_id` int(20) DEFAULT NULL,
  `nx_DO_distributer_id` int(20) DEFAULT NULL COMMENT '部门订单批发商id',
  `nx_DO_bill_id` int(11) DEFAULT NULL COMMENT '部门订单账单id',
  `nx_DO_status` tinyint(2) DEFAULT NULL COMMENT '部门订单申请商品状态',
  `nx_DO_order_user_id` int(20) DEFAULT NULL COMMENT '部门订单订货用户id',
  `nx_DO_pick_user_id` int(20) DEFAULT NULL COMMENT '部门订单商品称重用户id',
  `nx_DO_account_user_id` int(20) DEFAULT NULL COMMENT '部门订单商品输入单价用户id',
  `nx_DO_purchase_user_id` int(20) DEFAULT NULL COMMENT '部门商品采购员id',
  `nx_DO_buy_status` tinyint(2) DEFAULT NULL COMMENT '部门订单商品进货状态',
  `nx_DO_apply_date` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请时间',
  `nx_DO_arrive_date` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单送达时间',
  `nx_DO_purchase_goods_id` int(20) DEFAULT NULL COMMENT '订单采购商品id',
  `nx_DO_apply_only_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DO_apply_only_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_department_orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_orders
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_orders` VALUES (1, 45114, 112, NULL, '3', '斤', NULL, '3.5', NULL, NULL, 2, 1, 1, NULL, 1, 3, 2, NULL, NULL, 0, '2020-07-08', '2020-07-09', NULL, '07-08', '04:03');
INSERT INTO `nx_department_orders` VALUES (2, 45315, 131, NULL, '9', '斤', NULL, '9.5', NULL, NULL, 2, 1, 1, NULL, 1, 3, 2, NULL, NULL, 0, '2020-07-08', '2020-07-09', NULL, '07-08', '04:03');
INSERT INTO `nx_department_orders` VALUES (3, 45320, 131, NULL, '2', '斤', NULL, '50', NULL, NULL, 2, 1, 1, NULL, 1, 3, 2, NULL, NULL, 0, '2020-07-08', '2020-07-09', NULL, '07-08', '04:03');
INSERT INTO `nx_department_orders` VALUES (4, 45097, 111, NULL, '2', '斤', NULL, '25', NULL, NULL, 2, 1, 1, NULL, 1, 3, 2, NULL, NULL, 0, '2020-07-08', '2020-07-09', NULL, '07-08', '04:03');
INSERT INTO `nx_department_orders` VALUES (5, 45437, 142, NULL, '5', '斤', NULL, '23', NULL, NULL, 2, 1, 1, NULL, 1, 3, 2, NULL, NULL, 0, '2020-07-08', '2020-07-09', NULL, '07-08', '04:03');
INSERT INTO `nx_department_orders` VALUES (6, 45226, 121, NULL, '2', '斤', NULL, '2', NULL, NULL, 2, 1, 1, NULL, 1, 3, 2, NULL, NULL, 0, '2020-07-08', '2020-07-09', NULL, '07-08', '04:03');
INSERT INTO `nx_department_orders` VALUES (7, 45096, 111, NULL, '2', '根', NULL, '2', NULL, NULL, 2, 1, 1, NULL, 1, 3, 2, NULL, NULL, 0, '2020-07-08', '2020-07-09', NULL, '07-08', '04:03');
INSERT INTO `nx_department_orders` VALUES (8, 45114, 112, NULL, '5', '斤', NULL, '3', NULL, NULL, 2, 1, 1, NULL, 1, 3, 2, NULL, NULL, 0, '2020-07-08', '2020-07-09', NULL, '07-08', '04:06');
COMMIT;

-- ----------------------------
-- Table structure for nx_department_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_user`;
CREATE TABLE `nx_department_user` (
  `nx_department_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订货部门用户id',
  `nx_DU_department_id` int(20) DEFAULT NULL COMMENT '订货部门id',
  `nx_DU_wx_avartra_url` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门用户微信头像',
  `nx_DU_wx_nick_name` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门用户微信昵称',
  `nx_DU_wx_open_id` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门用户微信openid',
  `nx_DU_wx_phone` varchar(15) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门用户微信手机号码',
  `nx_DU_admin` tinyint(2) DEFAULT NULL COMMENT '订货部门用户是否是管理员',
  `nx_DU_distributer_id` int(20) DEFAULT NULL COMMENT '订货部门批发商id',
  PRIMARY KEY (`nx_department_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_user
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_user` VALUES (1, 1, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', '李君', NULL, NULL, 1, 1);
INSERT INTO `nx_department_user` VALUES (2, 2, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', '李君', 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, 0, NULL);
INSERT INTO `nx_department_user` VALUES (3, 2, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', '李君', 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer`;
CREATE TABLE `nx_distributer` (
  `nx_distributer_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商id',
  `nx_distributer_name` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商名称',
  `nx_distributer_lan` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商位置经度',
  `nx_distributer_lun` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商位置纬度',
  `nx_distributer_business_type` tinyint(2) DEFAULT NULL COMMENT '批发商商业类型',
  PRIMARY KEY (`nx_distributer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer` VALUES (1, 'cccc', NULL, NULL, NULL);
INSERT INTO `nx_distributer` VALUES (2, 'cccc', NULL, NULL, NULL);
INSERT INTO `nx_distributer` VALUES (3, 'cccc', NULL, NULL, NULL);
INSERT INTO `nx_distributer` VALUES (4, 'cccc', NULL, NULL, NULL);
INSERT INTO `nx_distributer` VALUES (5, 'cccc', NULL, NULL, NULL);
INSERT INTO `nx_distributer` VALUES (6, 'aaaaabbcccc', NULL, NULL, NULL);
INSERT INTO `nx_distributer` VALUES (7, 'aaaaabbcccc', NULL, NULL, NULL);
INSERT INTO `nx_distributer` VALUES (8, 'aaaaabbcccc', NULL, NULL, NULL);
INSERT INTO `nx_distributer` VALUES (9, 'ccc', NULL, NULL, NULL);
INSERT INTO `nx_distributer` VALUES (10, 'vbc', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_department
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_department`;
CREATE TABLE `nx_distributer_department` (
  `nx_distributer_dep_id` int(20) NOT NULL,
  `nx_DD_distributer_id` int(20) DEFAULT NULL,
  `nx_DD_department_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_distributer_e_commerce
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_e_commerce`;
CREATE TABLE `nx_distributer_e_commerce` (
  `nx_DEC_id` int(20) NOT NULL COMMENT '批发商社区id',
  `nx_DEC_e_id` int(20) DEFAULT NULL,
  `nx_DEC_distributer_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_DEC_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_e_commerce
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_e_commerce` VALUES (1, 1, 1);
INSERT INTO `nx_distributer_e_commerce` VALUES (2, 2, 1);
INSERT INTO `nx_distributer_e_commerce` VALUES (3, 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_purchase_batch
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_purchase_batch`;
CREATE TABLE `nx_distributer_purchase_batch` (
  `nx_distributer_purchase_batch_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商进货批次id',
  `nx_DPB_status` tinyint(2) DEFAULT NULL COMMENT '批发商进货批次状态',
  `nx_DPB_type` tinyint(2) DEFAULT NULL COMMENT '批发商进货批次类型',
  `nx_DPB_time` varchar(12) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商进货批次时间',
  `nx_DPB_pur_user_id` int(20) DEFAULT NULL COMMENT '批发商进货采购员id',
  `nx_DPB_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_DPB_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DPB_hour` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DPB_minute` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_purchase_batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_purchase_batch
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_purchase_batch` VALUES (1, 1, 3, '07-08 04:18', 1, 1, '07-08', '04', '18');
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_purchase_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_purchase_goods`;
CREATE TABLE `nx_distributer_purchase_goods` (
  `nx_distributer_purchase_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商采购商品id',
  `nx_DPG_nx_goods_id` int(20) DEFAULT NULL COMMENT '采购商品id',
  `nx_DPG_nx_goods_father_id` int(20) DEFAULT NULL COMMENT '采购父级商品id',
  `nx_DPG_quantity` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购数量',
  `nx_DPG_standard` varchar(6) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购规格',
  `nx_DPG_status` tinyint(2) DEFAULT NULL COMMENT '采购状态',
  `nx_DPG_distributer_id` int(20) DEFAULT NULL COMMENT '采购批发商id',
  `nx_DPG_purchase_type` tinyint(2) DEFAULT NULL COMMENT '采购方式',
  `nx_DPG_time` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购时间',
  `nx_DPG_batch_id` int(20) DEFAULT NULL COMMENT '采购批次号',
  `nx_DPG_buy_user_id` int(20) DEFAULT NULL COMMENT '采购方式为“采购”的采购员id',
  `nx_DPG_buy_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购单价',
  PRIMARY KEY (`nx_distributer_purchase_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_purchase_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_purchase_goods` VALUES (1, 45096, 111, '5', '斤', 1, 1, 3, NULL, 1, 1, NULL);
INSERT INTO `nx_distributer_purchase_goods` VALUES (2, 45097, 111, '10', '斤', 2, 1, 3, NULL, 1, 1, '2.5');
INSERT INTO `nx_distributer_purchase_goods` VALUES (3, 45114, 112, '30', '斤', 0, 1, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_user`;
CREATE TABLE `nx_distributer_user` (
  `nx_distributer_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商用户id',
  `nx_DIU_wx_avartra_url` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '用户名',
  `nx_DIU_wx_nick_name` varchar(4) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '登陆密码',
  `nx_DIU_wx_open_id` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DIU_wx_phone` varchar(15) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DIU_distributer_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_user
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_user` VALUES (1, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君', NULL, NULL, 1);
INSERT INTO `nx_distributer_user` VALUES (2, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君拣货', NULL, NULL, 1);
INSERT INTO `nx_distributer_user` VALUES (3, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君', NULL, NULL, 3);
INSERT INTO `nx_distributer_user` VALUES (4, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君', NULL, NULL, 4);
INSERT INTO `nx_distributer_user` VALUES (5, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君', NULL, NULL, 5);
INSERT INTO `nx_distributer_user` VALUES (6, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君', NULL, NULL, 6);
INSERT INTO `nx_distributer_user` VALUES (7, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君', NULL, NULL, 7);
INSERT INTO `nx_distributer_user` VALUES (8, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君', NULL, NULL, 8);
INSERT INTO `nx_distributer_user` VALUES (9, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君', NULL, NULL, 9);
INSERT INTO `nx_distributer_user` VALUES (10, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', '李君', NULL, NULL, 10);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_user_role
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_user_role`;
CREATE TABLE `nx_distributer_user_role` (
  `nx_distributer_user_role_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DUR_user_id` int(20) DEFAULT NULL COMMENT '用户ID',
  `nx_DUR_role_id` int(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`nx_distributer_user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of nx_distributer_user_role
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_user_role` VALUES (1, 1, 5);
INSERT INTO `nx_distributer_user_role` VALUES (2, 2, 3);
INSERT INTO `nx_distributer_user_role` VALUES (3, 3, 0);
INSERT INTO `nx_distributer_user_role` VALUES (4, 4, 0);
INSERT INTO `nx_distributer_user_role` VALUES (5, 5, 0);
INSERT INTO `nx_distributer_user_role` VALUES (6, 6, 0);
INSERT INTO `nx_distributer_user_role` VALUES (7, 7, 0);
INSERT INTO `nx_distributer_user_role` VALUES (8, 8, 0);
INSERT INTO `nx_distributer_user_role` VALUES (9, 9, 0);
INSERT INTO `nx_distributer_user_role` VALUES (10, 10, 0);
COMMIT;

-- ----------------------------
-- Table structure for nx_e_commerce
-- ----------------------------
DROP TABLE IF EXISTS `nx_e_commerce`;
CREATE TABLE `nx_e_commerce` (
  `nx_e_commerce_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_e_commerce_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_e_commerce_img` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_e_commerce_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_e_commerce_community
-- ----------------------------
DROP TABLE IF EXISTS `nx_e_commerce_community`;
CREATE TABLE `nx_e_commerce_community` (
  `nx_ECC_id` int(20) NOT NULL COMMENT '批发商社区id',
  `nx_ECC_e_id` int(20) DEFAULT NULL,
  `nx_ECC_community_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_ECC_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_e_commerce_community
-- ----------------------------
BEGIN;
INSERT INTO `nx_e_commerce_community` VALUES (1, 1, 1);
INSERT INTO `nx_e_commerce_community` VALUES (2, 2, 1);
INSERT INTO `nx_e_commerce_community` VALUES (3, 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_e_commerce_supplier
-- ----------------------------
DROP TABLE IF EXISTS `nx_e_commerce_supplier`;
CREATE TABLE `nx_e_commerce_supplier` (
  `nx_distributer_supplier_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商供货商id',
  `nx_DS_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_DS_supplier_id` int(20) DEFAULT NULL COMMENT '供货商id',
  PRIMARY KEY (`nx_distributer_supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_e_commerce_supplier
-- ----------------------------
BEGIN;
INSERT INTO `nx_e_commerce_supplier` VALUES (1, 1, 1);
INSERT INTO `nx_e_commerce_supplier` VALUES (2, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for nx_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_goods`;
CREATE TABLE `nx_goods` (
  `nx_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `nx_goods_name` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品名称',
  `nx_goods_standardname` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品规格',
  `nx_goods_detail` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品描述',
  `nx_goods_brand` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品品牌',
  `nx_goods_place` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品产地',
  `nx_goods_pinyin` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '拼音',
  `nx_goods_py` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '简拼',
  `nx_goods_father_id` int(20) DEFAULT NULL COMMENT '父级id',
  `nx_goods_sort` int(10) DEFAULT NULL COMMENT '商品排序',
  `nx_goods_file` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '图片',
  `nx_goods_standard_amount` int(2) DEFAULT NULL COMMENT '销售规格数量',
  PRIMARY KEY (`nx_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45545 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_goods` VALUES (1, '生鲜', '', '', NULL, NULL, NULL, NULL, 0, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (2, '粮油调味', '', '', NULL, NULL, NULL, NULL, 0, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (3, '食品', '', '', NULL, NULL, NULL, NULL, 0, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (4, '冷饮冻食', '', '', NULL, NULL, NULL, NULL, 0, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (5, '酒类', '', '', NULL, NULL, NULL, NULL, 0, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (6, '服装厨具', '', '', NULL, NULL, NULL, NULL, -1, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (7, '一次性用品', '', '', NULL, NULL, NULL, NULL, -1, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (8, '会员美食吧', '', '', NULL, NULL, NULL, NULL, 0, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (11, '新鲜蔬菜', '', '', NULL, NULL, NULL, NULL, 1, 1, '', 0);
INSERT INTO `nx_goods` VALUES (12, '新鲜水果', '', '', NULL, NULL, NULL, NULL, 1, 2, '', 0);
INSERT INTO `nx_goods` VALUES (13, '海鲜水产', '', '', NULL, NULL, NULL, NULL, 1, 3, '', 0);
INSERT INTO `nx_goods` VALUES (14, '肉禽蛋', '', '', NULL, NULL, NULL, NULL, 1, 4, '', 0);
INSERT INTO `nx_goods` VALUES (21, '米', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (22, '食用油', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (23, '面', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (24, '杂粮', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (25, '调味品', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (26, '南北干货', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (27, '方便食品', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (28, '烘培原料', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (29, '有机食品', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (31, '豆制品', '', '', NULL, NULL, NULL, NULL, 3, 5, '', 0);
INSERT INTO `nx_goods` VALUES (32, '半加工食品', NULL, '', NULL, NULL, NULL, NULL, 3, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (33, '主食', '', '', NULL, NULL, NULL, NULL, 3, 6, '', 0);
INSERT INTO `nx_goods` VALUES (34, '干果食品', '', '', NULL, NULL, NULL, NULL, 3, 8, '8.jpg', 0);
INSERT INTO `nx_goods` VALUES (35, '进口食品', '', '', NULL, NULL, NULL, NULL, 3, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (36, '休闲食品', '', '', NULL, NULL, NULL, NULL, 3, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (41, '火锅丸串', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (42, '水饺/馄饨', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (43, '汤圆/元宵', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (44, '面点', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45, '烘培半成品', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (46, '奶酪/黄油', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (47, '方便速食', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (48, '冷藏饮料/低温奶', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (51, '白酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (52, '葡萄酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (53, '啤酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (54, '洋酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (55, '黄酒/养生酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (81, '火锅', '', '', NULL, NULL, NULL, NULL, 8, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (82, '水果拼箱', '', '', NULL, NULL, NULL, NULL, 8, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (83, '喝点小食', NULL, '', NULL, NULL, NULL, NULL, 8, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (111, '根茎类', '', '', NULL, NULL, NULL, NULL, 11, 1, 'uploadImage/1.jpg', 0);
INSERT INTO `nx_goods` VALUES (112, '葱姜蒜椒', '', '', NULL, NULL, NULL, NULL, 11, 2, 'uploadImage/2.jpg', 0);
INSERT INTO `nx_goods` VALUES (113, '茄果瓜类', '', '', NULL, NULL, NULL, NULL, 11, 3, 'uploadImage/3.jpg', 0);
INSERT INTO `nx_goods` VALUES (114, '叶菜类', '', '', NULL, NULL, NULL, NULL, 11, 4, 'uploadImage/4.jpg', 0);
INSERT INTO `nx_goods` VALUES (115, '鲜菌菇', '', '', NULL, NULL, NULL, NULL, 11, 5, 'uploadImage/5.jpg', 0);
INSERT INTO `nx_goods` VALUES (116, '产地直供', NULL, '', NULL, NULL, NULL, NULL, -1, 6, '', 0);
INSERT INTO `nx_goods` VALUES (121, '国产水果', NULL, '', NULL, NULL, NULL, NULL, 12, 1, '', 0);
INSERT INTO `nx_goods` VALUES (122, '进口水果', NULL, '', NULL, NULL, NULL, NULL, 12, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (123, '地方特产', NULL, '', NULL, NULL, NULL, NULL, 12, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (131, '虾类', NULL, '', NULL, NULL, NULL, NULL, 13, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (132, '鱼类', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/6.jpg', 0);
INSERT INTO `nx_goods` VALUES (133, '蟹类', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (134, '贝罗类', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (135, '海参', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (136, '鱿鱼', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (137, '三文鱼', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (138, '大闸蟹', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (139, '小龙虾', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (141, '猪肉', NULL, '', NULL, NULL, NULL, NULL, 14, 1, 'uploadImage/7.jpg', 0);
INSERT INTO `nx_goods` VALUES (142, '牛肉', '', '', NULL, NULL, NULL, NULL, 14, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (143, '羊肉', '', '', NULL, NULL, NULL, NULL, 14, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (144, '鸡鸭鸽', NULL, '', NULL, NULL, NULL, NULL, 14, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (145, '蛋', NULL, '', NULL, NULL, NULL, NULL, 14, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (311, '黄豆制品', NULL, NULL, NULL, NULL, NULL, NULL, 31, 1, 'uploadImage/8.jpg', 0);
INSERT INTO `nx_goods` VALUES (312, '绿豆制品', NULL, NULL, NULL, NULL, NULL, NULL, 31, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (1391, '海鲜加工品', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (1392, '海产干货', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (31111, '卤水豆腐', '斤', '', NULL, NULL, 'lushui', 'ls', 311, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (31112, '老豆腐', '斤', NULL, NULL, NULL, 'laofoufu', 'ldf', 311, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (31113, '嫩豆腐', '斤', NULL, NULL, NULL, 'nendoufu', 'ndf', 311, NULL, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (44678, '土豆', '斤', '小个头', '无', '冀', 'tudou', 'td', 111, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45092, '土豆', '斤', '大个头', '无', '冀', 'tudou', 'td', 111, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45093, '新土豆', '斤', '', '无', '粤惠州', 'xintudou', 'xtd', 111, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45094, '胡萝卜', '斤', '山东新鲜', '无', '', 'huluobu', 'hlb', 111, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45095, '心里美', '斤', '', '无', '普通', 'xinlimei', 'xlm', 111, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45096, '白萝卜', '斤', '山东,四川', '无', '冀|川', 'bailuobu', 'blb', 111, 6, 'uploadImage/blb.jpg', 0);
INSERT INTO `nx_goods` VALUES (45097, '卞萝卜', '斤', '', '无', '', 'bianluobu', 'blb', 111, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45098, '青萝卜', '斤', '', '无', '鲁|津', 'qingluobu', 'qlb', 111, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45099, '水萝卜', '斤', '', '无', '鲁', 'shuiluobu', 'slb', 111, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45100, '莴笋', '斤', '', '无', '闽|浙', 'wosun', 'ws', 111, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45101, '山药', '斤', '', '无', '脆|麻新', 'shanyao', 'sy', 111, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45102, '铁棍山药', '斤', '', '无', '普通', 'tiegunshanyao', 'tgsy', 111, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45103, '藕', '斤', '', '无', '苏|津', 'ou', 'o', 111, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45104, '红薯', '斤', '', '无', '冀', 'hongshu', 'hs', 111, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45105, '红薯', '斤', '', '无', '烟薯新粤', 'hongshu', 'hs', 111, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45106, '芋头', '斤', '山东', '无', '鲁', 'yutou', 'yt', 111, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45107, '凉薯', '斤', '广东', '无', '粤', 'liangshu', 'ls', 111, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45108, '水萝卜', '斤', '水菜', '无', '', 'shuiluobu', 'slb', 111, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45109, '樱桃萝卜', '斤', '水菜', '无', '', 'yingtaoluobu', 'ytlb', 111, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45110, '尖椒', '斤', '四川,广东', '无', '闽粤', 'jianjiao', 'jj', 112, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45111, '柿子椒', '斤', '', '无', '闵粤', 'shizijiao', 'szj', 112, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45112, '黄葱头', '斤', '', '无', '蒙甘', 'huangcongtou', 'hct', 112, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45113, '红葱头', '斤', '', '无', '云新|存', 'hongcongtou', 'hct', 112, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45114, '葱', '斤', '', '无', '浙闽沪', 'cong', 'c', 112, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45115, '小葱', '斤', '', '无', '普通', 'xiaocong', 'xc', 112, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45116, '姜', '斤', '', '无', '普通', 'jiang', 'j', 112, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45117, '大蒜', '斤', '', '无', '老蒜', 'dasuan', 'ds', 112, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45118, '新蒜', '斤', '', '无', '云', 'xinsuan', 'xs', 112, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45119, '蒜苗', '斤', '', '无', '存', 'suanmiao', 'sm', 112, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45120, '紫菜苔', '斤', '', '无', '普通', 'zicaitai', 'zct', 112, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45121, '蒜黄', '斤', '', '无', '冀', 'suanhuang', 'sh', 112, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45122, '蒜米', '斤', '', '无', '普通', 'suanmi', 'sm', 112, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45123, '线椒', '斤', '', '无', '普通', 'xianjiao', 'xj', 112, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45124, '杭椒', '斤', '', '无', '普通', 'hangjiao', 'hj', 112, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45125, '小米椒', '斤', '', '无', '普通', 'xiaomijiao', 'xmj', 112, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45126, '彩椒', '斤', '红,黄', '无', '红|黄', 'caijiao', 'cj', 112, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45127, '青蒜', '斤', '', '无', '川', 'qingsuan', 'qs', 112, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45128, '香葱', '斤', '水菜', '无', '', 'xiangcong', 'xc', 112, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45129, '青蒜', '斤', '水菜', '无', '', 'qingsuan', 'qs', 112, 20, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45130, '番茄', '斤', '', '无', '冀|甘川', 'fanqie', 'fq', 113, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45131, '番茄', '斤', '辽|箱辽', '无', '精品', 'fanqie', 'fq', 113, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45132, '黄瓜', '斤', '', '无', '辽|箱辽', 'huanggua', 'hg', 113, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45133, '黄瓜', '斤', '京鲜花', '无', '京鲜花', 'huanggua', 'hg', 113, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45134, '黄瓜', '斤', '旱|荷兰', '无', '旱|荷兰', 'huanggua', 'hg', 113, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45135, '茄子', '斤', '', '无', '蒙冀云', 'qiezi', 'qz', 113, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45136, '茄子', '斤', '云南精品', '', '云', 'qiezi', 'qz', 113, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45137, '架豆', '斤', '云南', '无', '云', 'jiadou', 'jd', 113, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45138, '吊冬瓜', '斤', '', '无', '琼桂', 'diaodonggua', 'ddg', 113, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45139, '地冬瓜', '斤', '', '无', '新', 'didonggua', 'ddg', 113, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45140, '西胡芦', '斤', '', '无', '云桂', 'xihulu', 'xhl', 113, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45141, '菜花', '斤', '', '无', '云沪川', 'caihua', 'ch', 113, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45142, '散菜花', '斤', '', '无', '浙闽', 'sancaihua', 'sch', 113, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45143, '绿菜花', '斤', '', '无', '云', 'lücaihua', 'lch', 113, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45144, '小毛冬瓜', '斤', '', '无', '储存长|圆新', 'xiaomaodonggua', 'xmdg', 113, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45145, '豆王', '斤', '', '无', '云|鲁', 'douwang', 'dw', 113, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45146, '扁豆', '斤', '', '无', '云|鲁新', 'biandou', 'bd', 113, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45147, '豇豆', '斤', '', '无', '云|琼', 'jiangdou', 'jd', 113, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45148, '白不老', '斤', '', '无', '云', 'baibulao', 'bbl', 113, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45149, '油豆', '斤', '', '无', '云箱', 'youdou', 'yd', 113, 20, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45150, '毛豆', '斤', '', '无', '越|闽', 'maodou', 'md', 113, 21, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45151, '苦瓜', '斤', '', '无', '鲁', 'kugua', 'kg', 113, 22, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45152, '丝瓜', '斤', '北京|山东', '无', '京|鲁', 'sigua', 'sg', 113, 23, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45153, '南北瓜', '斤', '', '无', '冀|琼', 'nanbeigua', 'nbg', 113, 24, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45154, '长茄', '斤', '', '无', '海城|绥中', 'zhangqie', 'zq', 113, 25, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45155, '广茄', '斤', '', '无', '冀|云', 'guangqie', 'gq', 113, 26, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45156, '线茄', '斤', '', '无', '粤云', 'xianqie', 'xq', 113, 27, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45157, '紫甘蓝', '斤', '', '无', '云闽', 'ziganlan', 'zgl', 113, 28, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45158, '金丝南瓜', '斤', '', '无', '琼|吊瓜', 'jinsinangua', 'jsng', 113, 29, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45159, '板栗南瓜', '斤', '', '无', '普通', 'banlinangua', 'blng', 113, 30, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45160, '荸荠', '斤', '', '无', '皖', 'biji', 'bj', 113, 31, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45161, '玉米', '斤', '', '无', '黄|花', 'yumi', 'ym', 113, 32, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45162, '豌豆', '斤', '', '无', '云', 'wandou', 'wd', 113, 33, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45163, '冬春笋', '斤', '', '无', '闽', 'dongchunsun', 'dcs', 113, 34, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45164, '花生', '斤', '', '无', '豫存', 'huasheng', 'hs', 113, 35, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45165, '大白菜', '斤', '', '无', '冀豫', 'dabaicai', 'dbc', 114, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45166, '娃娃菜', '斤', '', '无', '冀云豫鲁', 'wawacai', 'wwc', 114, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45167, '芹菜', '斤', '', '无', '津|鲁', 'qincai', 'qc', 114, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45168, '菠菜', '斤', '', '无', '鲁|冀', 'bocai', 'bc', 114, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45169, '团生菜', '斤', '', '无', '云|冀', 'tuanshengcai', 'tsc', 114, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45170, '圆白菜', '斤', '', '无', '扁|川', 'yuanbaicai', 'ybc', 114, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45171, '甘蓝', '斤', '', '无', '冀|鲁', 'ganlan', 'gl', 114, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45172, '油菜', '斤', '', '无', '冀鲁|云', 'youcai', 'yc', 114, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45173, '香菜', '斤', '', '无', '存|冀', 'xiangcai', 'xc', 114, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45174, '韭菜', '斤', '', '无', '冀', 'jiucai', 'jc', 114, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45175, '小白菜', '斤', '', '无', '普通', 'xiaobaicai', 'xbc', 114, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45176, '茴香', '斤', '', '无', '冀', 'huixiang', 'hx', 114, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45177, '散叶生菜', '斤', '', '无', '普通', 'sanyeshengcai', 'sysc', 114, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45178, '苦菊', '斤', '', '无', '辽', 'kuju', 'kj', 114, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45179, '樱西', '斤', '小红', '无', '小红', 'yingxi', 'yx', 114, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45180, '油麦菜', '斤', '', '无', '辽', 'youmaicai', 'ymc', 114, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45181, '黄心菜', '斤', '', '无', '皖', 'huangxincai', 'hxc', 114, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45182, '西芹', '斤', '', '无', '辽', 'xiqin', 'xq', 114, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45183, '香椿', '斤', '四川', '无', '川', 'xiangchun', 'xc', 114, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45184, '油菜', '斤', '水菜', '无', '', 'youcai', 'yc', 114, 20, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45185, '小白菜', '斤', '水菜', '无', '', 'xiaobaicai', 'xbc', 114, 21, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45186, '油麦菜', '斤', '水菜', '无', '', 'youmaicai', 'ymc', 114, 22, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45187, '奶白菜', '斤', '水菜', '无', '', 'naibaicai', 'nbc', 114, 23, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45188, '散生菜', '斤', '水菜', '无', '', 'sanshengcai', 'ssc', 114, 24, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45189, '茼蒿', '斤', '水菜', '无', '', 'tonghao', 'th', 114, 25, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45190, '蒿子秆', '斤', '水菜', '无', '', 'haozigan', 'hzg', 114, 26, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45191, '香芹', '斤', '水菜', '无', '', 'xiangqin', 'xq', 114, 27, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45192, '菠菜', '斤', '水菜', '无', '', 'bocai', 'bc', 114, 28, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45193, '苋菜', '斤', '水菜', '无', '', 'xiancai', 'xc', 114, 29, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45194, '菊花菜', '斤', '水菜', '无', '', 'juhuacai', 'jhc', 114, 30, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45195, '盖菜', '斤', '水菜', '无', '', 'gaicai', 'gc', 114, 31, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45196, '芥兰', '斤', '水菜', '无', '', 'jielan', 'jl', 114, 32, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45197, '菜心', '斤', '水菜', '无', '', 'caixin', 'cx', 114, 33, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45198, '空心菜', '斤', '水菜', '无', '', 'kongxincai', 'kxc', 114, 34, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45199, '鸡毛菜', '斤', '水菜', '无', '', 'jimaocai', 'jmc', 114, 35, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45200, '荠菜', '斤', '水菜', '无', '', 'jicai', 'jc', 114, 36, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45201, '豌豆苗', '斤', '水菜', '无', '', 'wandoumiao', 'wdm', 114, 37, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45202, '快菜', '斤', '水菜', '无', '', 'kuaicai', 'kc', 114, 38, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45203, '苦菊', '斤', '水菜', '无', '', 'kuju', 'kj', 114, 39, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45204, '穿心莲', '斤', '水菜', '无', '', 'chuanxinlian', 'cxl', 114, 40, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45205, '木耳菜', '斤', '水菜', '无', '', 'muercai', 'mec', 114, 41, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45206, '平菇', '斤', '水菜', '无', '', 'pinggu', 'pg', 115, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45207, '香菇', '斤', '水菜', '无', '', 'xianggu', 'xg', 115, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45208, '白玉菇', '斤', '水菜', '无', '', 'baiyugu', 'byg', 115, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45209, '口蘑', '斤', '水菜', '无', '', 'koumo', 'km', 115, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45210, '杏鲍菇', '斤', '水菜', '无', '', 'xingbaogu', 'xbg', 115, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45211, '鸡腿菇', '斤', '水菜', '无', '', 'jituigu', 'jtg', 115, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45212, '金针菇', '斤', '水菜', '无', '', 'jinzhengu', 'jzg', 115, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45213, '椰青|个', '斤', '', '无', '无', 'yeqing|ge', 'yq|g', 121, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45214, '箱装菠萝', '斤', '', '上六下六', '无', 'xiangzhuangboluo', 'xzbl', 121, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45215, '国产凤梨', '斤', '', '无', '无', 'guochanfengli', 'gcfl', 121, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45216, '圣女果', '斤', '千禧', '千禧', '无', 'shengnüguo', 'sng', 121, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45217, '百香果', '斤', '', '无', '无', 'baixiangguo', 'bxg', 121, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45218, '桑葚', '斤', '', '无', '无', 'sangshen', 'ss', 121, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45219, '白草莓', '斤', '日本淡雪', '日本淡雪', '无', 'baicaomei', 'bcm', 121, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45220, '红颜草莓', '斤', '', '无', '无', 'hongyancaomei', 'hycm', 121, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45221, '丹东九九草莓', '斤', '', '无', '无', 'dandongjiujiucaomei', 'ddjjcm', 121, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45222, '甜宝奶油草莓', '斤', '', '无', '无', 'tianbaonaiyoucaomei', 'tbnycm', 121, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45223, '巧克力草莓', '斤', '', '无', '无', 'qiaokelicaomei', 'qklcm', 121, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45224, '磨盘柿子', '斤', '', '无', '无', 'mopanshizi', 'mpsz', 121, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45225, '火龙果', '斤', '', '无', '无', 'huolongguo', 'hlg', 121, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45226, '板栗', '斤', '', '无', '无', 'banli', 'bl', 121, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45227, '木瓜', '斤', '', '无', '无', 'mugua', 'mg', 121, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45228, '柿饼', '斤', '', '无', '无', 'shibing', 'sb', 121, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45229, '甘蔗', '斤', '', '无', '无', 'ganzhe', 'gz', 121, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45230, '柠檬', '斤', '', '无', '无', 'ningmeng', 'nm', 121, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45231, '黑枣', '斤', '', '无', '无', 'heizao', 'hz', 121, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45232, '山楂', '斤', '', '无', '无', 'shanzha', 'sz', 121, 20, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45233, '灯笼果', '斤', '姑娘果', '姑娘果', '无', 'denglongguo', 'dlg', 121, 21, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45234, '鸭梨', '斤', '', '无', '无', 'yali', 'yl', 121, 22, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45235, '雪花梨', '斤', '', '无', '无', 'xuehuali', 'xhl', 121, 23, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45236, '皇冠梨', '斤', '', '', '无', 'huangguanli', 'hgl', 121, 24, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45237, '贡梨', '斤', '', '无', '无', 'gongli', 'gl', 121, 25, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45238, '南果梨', '斤', '', '无', '无', 'nanguoli', 'ngl', 121, 26, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45239, '丰水梨', '斤', '', '无', '无', 'fengshuili', 'fsl', 121, 27, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45240, '红霄梨', '斤', '', '无', '无', 'hongxiaoli', 'hxl', 121, 28, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45241, '库尔勒香梨', '斤', '', '无', '无', 'kuerlexiangli', 'kelxl', 121, 29, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45242, '红香酥梨系列', '斤', '', '无', '无', 'hongxiangsulixilie', 'hxslxl', 121, 30, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45243, '红皮梨', '斤', '', '无', '无', 'hongpili', 'hpl', 121, 31, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45244, '蜜梨', '斤', '', '无', '无', 'mili', 'ml', 121, 32, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45245, '贵妃梨', '斤', '', '无', '无', 'guifeili', 'gfl', 121, 33, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45246, '沙糖桔', '斤', '', '中果', '无', 'shatangjie', 'stj', 121, 34, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45247, '丑橘', '斤', '', '无', '无', 'chouju', 'cj', 121, 35, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45248, '脐橙', '斤', '', '无', '鄂|湘|川', 'qicheng', 'qc', 121, 36, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45249, '血橙', '斤', '二月红|中华红', '二月红|中华红', '无', 'xuecheng', 'xc', 121, 37, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45250, '沃柑', '斤', '', '无', '无', 'wogan', 'wg', 121, 38, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45251, '马水桔', '斤', '', '无', '无', 'mashuijie', 'msj', 121, 39, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45252, '芦柑', '斤', '', '无', '无', 'lugan', 'lg', 121, 40, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45253, '茂谷柑', '斤', '', '无', '无', 'maogugan', 'mgg', 121, 41, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45254, '金桔', '斤', '', '无', '无', 'jinjie', 'jj', 121, 42, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45255, '红心蜜柚', '斤', '', '无', '无', 'hongxinmiyou', 'hxmy', 121, 43, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45256, '黄果柑', '斤', '', '无', '无', 'huangguogan', 'hgg', 121, 44, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45257, '蜜柚', '斤', '', '无', '无', 'miyou', 'my', 121, 45, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45258, '伦晚', '斤', '', '无', '无', 'lunwan', 'lw', 121, 46, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45259, '油桃', '斤', '', '无', '无', 'youtao', 'yt', 121, 47, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45260, '黄油桃', '斤', '', '无', '无', 'huangyoutao', 'hyt', 121, 48, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45261, '水蜜桃', '斤', '', '无', '无', 'shuimitao', 'smt', 121, 49, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45262, '猕猴桃', '斤', '徐香', '徐香', '无', 'mihoutao', 'mht', 121, 50, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45263, '猕猴桃', '斤', '海沃德', '海沃德', '无', 'mihoutao', 'mht', 121, 51, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45264, '麒麟西瓜', '斤', '', '无', '无', 'qilinxigua', 'qlxg', 121, 52, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45265, '黑美人', '斤', '', '无', '无', 'heimeiren', 'hmr', 121, 53, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45266, '小兰.特小凤', '斤', '', '无', '无', 'xiaolan.texiaofeng', 'xl.txf', 121, 54, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45267, '甜王', '斤', '', '无', '无', 'tianwang', 'tw', 121, 55, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45268, '国产香蕉', '斤', '', '无', '无', 'guochanxiangjiao', 'gcxj', 121, 56, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45269, '香蕉', '斤', '南美菲律宾', '', '南美菲律宾', 'xiangjiao', 'xj', 121, 57, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45270, '泰国香蕉', '斤', '', '无', '无', 'taiguoxiangjiao', 'tgxj', 121, 58, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45271, '国产皇帝香蕉', '斤', '', '无', '无', 'guochanhuangdixiangjiao', 'gchdxj', 121, 59, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45272, '哈密瓜', '斤', '', '无', '无', 'hamigua', 'hmg', 121, 60, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45273, '晓蜜25号', '斤', '', '无', '无', 'xiaomi25hao', 'xm25h', 121, 61, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45274, '黄金瓜甜瓜', '斤', '金蜜', '金蜜', '无', 'huangjinguatiangua', 'hjgtg', 121, 62, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45275, '网纹甜瓜', '斤', '', '无', '无', 'wangwentiangua', 'wwtg', 121, 63, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45276, '长香玉甜瓜', '斤', '', '无', '无', 'zhangxiangyutiangua', 'zxytg', 121, 64, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45277, '玉姑甜瓜', '斤', '', '无', '无', 'yugutiangua', 'ygtg', 121, 65, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45278, '羊角蜜甜瓜', '斤', '', '无', '无', 'yangjiaomitiangua', 'yjmtg', 121, 66, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45279, '花蕾甜瓜', '斤', '', '无', '无', 'hualeitiangua', 'hltg', 121, 67, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45280, '西州密甜瓜', '斤', '', '无', '无', 'xizhoumitiangua', 'xzmtg', 121, 68, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45281, '绿宝甜瓜', '斤', '', '无', '无', 'lübaotiangua', 'lbtg', 121, 69, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45282, '博阳九号甜瓜', '斤', '', '无', '无', 'boyangjiuhaotiangua', 'byjhtg', 121, 70, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45283, '白糖罐甜瓜', '斤', '', '无', '无', 'baitangguantiangua', 'btgtg', 121, 71, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45284, '富士苹果', '斤', '纸袋Φ70-84', '', '无', 'fushipingguo', 'fspg', 121, 72, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45285, '富士苹果', '斤', '纸+膜袋', '', '无', 'fushipingguo', 'fspg', 121, 73, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45286, '富士苹果', '斤', '纸袋Φ85以上', '', '无', 'fushipingguo', 'fspg', 121, 74, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45287, '黄元帅苹果', '斤', '', '无', '无', 'huangyuanshuaipingguo', 'hyspg', 121, 75, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45288, '花牛苹果', '斤', 'Φ70-85', '', '无', 'huaniupingguo', 'hnpg', 121, 76, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45289, '新疆阿克苏', '斤', '冰糖心', '冰糖心', '无', 'xinjiangakesu', 'xjaks', 121, 77, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45290, '国光苹果', '斤', '', '无', '无', 'guoguangpingguo', 'ggpg', 121, 78, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45291, '辽宁寒富苹果', '斤', '', '无', '无', 'liaoninghanfupingguo', 'lnhfpg', 121, 79, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45292, '红提葡萄', '斤', '', '无', '无', 'hongtiputao', 'htpt', 121, 80, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45293, '阳光玫瑰葡萄', '斤', '', '无', '无', 'yangguangmeiguiputao', 'ygmgpt', 121, 81, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45294, '克伦生葡萄', '斤', '', '无', '无', 'kelunshengputao', 'klspt', 121, 82, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45295, '黑提葡萄', '斤', '夏黑', '夏黑', '无', 'heitiputao', 'htpt', 121, 83, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45296, '玫瑰香葡萄', '斤', '', '无', '无', 'meiguixiangputao', 'mgxpt', 121, 84, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45297, '红宝石葡萄', '斤', '', '无', '无', 'hongbaoshiputao', 'hbspt', 121, 85, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45298, '贵妃青葡萄', '斤', '', '无', '无', 'guifeiqingputao', 'gfqpt', 121, 86, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45299, '生台农小芒果', '斤', '', '无', '无', 'shengtainongxiaomangguo', 'stnxmg', 121, 87, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45300, '生台农大芒果', '斤', '', '无', '无', 'shengtainongdamangguo', 'stndmg', 121, 88, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45301, '红金龙芒果', '斤', '', '无', '无', 'hongjinlongmangguo', 'hjlmg', 121, 89, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45302, '高乐密芒果', '斤', '', '无', '无', 'gaolemimangguo', 'glmmg', 121, 90, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45303, '青皮芒果', '斤', '', '无', '无', 'qingpimangguo', 'qpmg', 121, 91, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45304, '新世纪', '斤', '澳芒', '澳芒', '无', 'xinshiji', 'xsj', 121, 92, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45305, '水仙芒果', '斤', '', '无', '无', 'shuixianmangguo', 'sxmg', 121, 93, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45306, '美早樱桃', '斤', '', '无', '无', 'meizaoyingtao', 'mzyt', 121, 94, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45307, '活白虾', '斤', '45-60头', '无', '', 'huobaixia', 'hbx', 131, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45308, '冰鲜白虾', '斤', '30-45头', '无', '', 'bingxianbaixia', 'bxbx', 131, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45309, '冰鲜白虾', '斤', '45-60头', '无', '', 'bingxianbaixia', 'bxbx', 131, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45310, '琵琶虾', '斤', '活', '无', '', 'pipaxia', 'ppx', 131, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45311, '基围虾', '斤', '20-40头', '无', '', 'jiweixia', 'jwx', 131, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45312, '基围虾', '斤', '40-60头', '无', '', 'jiweixia', 'jwx', 131, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45313, '波士顿青龙虾', '斤', '活', '无', '', 'boshidunqinglongxia', 'bsdqlx', 131, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45314, '小青龙虾', '斤', '活', '无', '', 'xiaoqinglongxia', 'xqlx', 131, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45315, '北极虾', '斤', '>100头|风冷', '无', '', 'beijixia', 'bjx', 131, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45316, '北极虾', '斤', '<100头|风冷', '无', '', 'beijixia', 'bjx', 131, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45317, '斑节虾', '斤', '冻', '无', '', 'banjiexia', 'bjx', 131, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45318, '草虾', '斤', '6头左右|冻', '无', '', 'caoxia', 'cx', 131, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45319, '明对虾', '斤', '6头|冻', '无', '', 'mingduixia', 'mdx', 131, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45320, '澳洲龙虾', '斤', '<750g', '无', '', 'aozhoulongxia', 'azlx', 131, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45321, '澳洲龙虾', '斤', '750g-1250g', '无', '', 'aozhoulongxia', 'azlx', 131, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45322, '鲤鱼', '斤', '<750g', '无', '', 'liyu', 'ly', 132, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45323, '鲤鱼', '斤', '1.5-2斤/条', '无', '', 'liyu', 'ly', 132, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45324, '鲤鱼', '斤', '2斤以上/条', '无', '', 'liyu', 'ly', 132, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45325, '草鱼', '斤', '1.5斤/条以下', '无', '', 'caoyu', 'cy', 132, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45326, '草鱼', '斤', '1.5-2斤/条', '无', '', 'caoyu', 'cy', 132, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45327, '草鱼', '斤', '2斤以上/条', '无', '', 'caoyu', 'cy', 132, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45328, '鲫鱼', '斤', '100g-150g', '无', '', 'jiyu', 'jy', 132, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45329, '鲫鱼', '斤', '200g-250g', '无', '', 'jiyu', 'jy', 132, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45330, '鲫鱼', '斤', '350g-400g', '无', '', 'jiyu', 'jy', 132, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45331, '胖头鱼', '斤', '>2000g', '无', '', 'pangtouyu', 'pty', 132, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45332, '胖头鱼', '斤', '<2000g', '无', '', 'pangtouyu', 'pty', 132, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45333, '武昌鱼', '斤', '700g左右', '无', '', 'wuchangyu', 'wcy', 132, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45334, '鲢鱼', '斤', '>1500g', '无', '', 'lianyu', 'ly', 132, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45335, '鲢鱼', '斤', '1000-1500g', '无', '', 'lianyu', 'ly', 132, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45336, '罗非鱼', '斤', '活', '无', '', 'luofeiyu', 'lfy', 132, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45337, '黑鱼', '斤', '活', '无', '', 'heiyu', 'hy', 132, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45338, '桂鱼', '斤', '标桂', '无', '', 'guiyu', 'gy', 132, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45339, '嘎鱼', '斤', '>100g', '无', '', 'gayu', 'gy', 132, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45340, '嘎鱼', '斤', '<100g', '无', '', 'gayu', 'gy', 132, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45341, '淡水鲈鱼', '斤', '活', '无', '', 'danshuiluyu', 'dsly', 132, 20, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45342, '鲟鱼', '斤', '活', '无', '', 'xunyu', 'xy', 132, 21, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45343, '国产白鲴鱼', '斤', '>250g|冻', '无', '', 'guochanbaiguyu', 'gcbgy', 132, 22, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45344, '国产白鲴鱼', '斤', '<250g|冻', '无', '', 'guochanbaiguyu', 'gcbgy', 132, 23, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45345, '燕鲅', '斤', '>300g|冻', '无', '', 'yanba', 'yb', 132, 24, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45346, '鲐鲅', '斤', '<300g|冻', '无', '', 'taiba', 'tb', 132, 25, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45347, '左偏口鱼', '斤', '<600g|冻', '无', '', 'zuopiankouyu', 'zpky', 132, 26, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45348, '鳎目鱼', '斤', '<500g|冻', '无', '', 'tamuyu', 'tmy', 132, 27, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45349, '八爪鱼', '斤', '活', '无', '', 'bazhuayu', 'bzy', 132, 28, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45350, '八爪鱼', '斤', '鲜', '无', '', 'bazhuayu', 'bzy', 132, 29, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45351, '多宝鱼', '斤', '活', '无', '', 'duobaoyu', 'dby', 132, 30, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45352, '青石斑鱼', '斤', '活', '无', '', 'qingshibanyu', 'qsby', 132, 31, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45353, '国产带鱼', '斤', '100-200g|冻', '无', '100-200g|冻', 'guochandaiyu', 'gcdy', 132, 32, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45354, '国产带鱼', '斤', '200-300g|冻', '无', '200-300g|冻', 'guochandaiyu', 'gcdy', 132, 33, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45355, '进口带鱼', '斤', '>300g|冻', '无', '>300g|冻', 'jinkoudaiyu', 'jkdy', 132, 34, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45356, '进口带鱼', '斤', '<300g|冻', '无', '<300g|冻', 'jinkoudaiyu', 'jkdy', 132, 35, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45357, '国产黄鱼', '斤', '>300g|鲜', '无', '>300g|鲜', 'guochanhuangyu', 'gchy', 132, 36, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45358, '国产黄鱼', '斤', '<300g|鲜', '无', '<300g|鲜', 'guochanhuangyu', 'gchy', 132, 37, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45359, '进口黄鱼', '斤', '>300g', '无', '>300g', 'jinkouhuangyu', 'jkhy', 132, 38, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45360, '进口黄鱼', '斤', '<300g', '无', '<300g', 'jinkouhuangyu', 'jkhy', 132, 39, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45361, '国产平鱼', '斤', '100-200g|冻', '无', '100-200g|冻', 'guochanpingyu', 'gcpy', 132, 40, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45362, '国产平鱼', '斤', '200-300g|冻', '无', '200-300g|冻', 'guochanpingyu', 'gcpy', 132, 41, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45363, '国产平鱼', '斤', '100-200g|鲜', '无', '100-200g|鲜', 'guochanpingyu', 'gcpy', 132, 42, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45364, '国产平鱼', '斤', '200-300g|鲜', '无', '200-300g|鲜', 'guochanpingyu', 'gcpy', 132, 43, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45365, '公河蟹', '斤', '100g左右', '无', '100g左右', 'gonghexie', 'ghx', 133, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45366, '公河蟹', '斤', '150g左右', '无', '150g左右', 'gonghexie', 'ghx', 133, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45367, '母河蟹', '斤', '75g左右', '无', '75g左右', 'muhexie', 'mhx', 133, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45368, '母河蟹', '斤', '125g左右', '无', '125g左右', 'muhexie', 'mhx', 133, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45369, '梭子蟹', '斤', '活', '无', '活', 'suozixie', 'szx', 133, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45370, '皇帝蟹', '斤', '活', '无', '活', 'huangdixie', 'hdx', 133, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45371, '面包蟹', '斤', '活', '无', '活', 'mianbaoxie', 'mbx', 133, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45372, '扇贝', '斤', '14-16cm|活', '地播', '14-16cm|活', 'shanbei', 'sb', 134, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45373, '扇贝', '斤', '10-14cm|活', '地播', '10-14cm|活', 'shanbei', 'sb', 134, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45374, '大香螺', '斤', '活', '无', '活', 'daxiangluo', 'dxl', 134, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45375, '角螺', '斤', '活', '无', '活', 'jiaoluo', 'jl', 134, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45376, '钉螺', '斤', '活', '无', '活', 'dingluo', 'dl', 134, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45377, '海螺丝', '斤', '活', '无', '活', 'hailuosi', 'hls', 134, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45378, '大海螺', '斤', '活', '无', '活', 'dahailuo', 'dhl', 134, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45379, '大蛏子', '斤', '>6cm|活', '无', '>6cm|活', 'dachengzi', 'dcz', 134, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45380, '大蛏子', '斤', '<6cm|活', '无', '<6cm|活', 'dachengzi', 'dcz', 134, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45381, '海虹', '斤', '活', '无', '活', 'haihong', 'hh', 134, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45382, '文蛤', '斤', '>5cm|活', '无', '', 'wenha', 'wh', 134, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45383, '文蛤', '斤', '<5cm|活', '无', '', 'wenha', 'wh', 134, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45384, '青蛤', '斤', '活', '无', '', 'qingha', 'qh', 134, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45385, '花蛤', '斤', '活', '无', '', 'huaha', 'hh', 134, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45386, '毛蚶', '斤', '活', '无', '南方', 'maohan', 'mh', 134, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45387, '毛蚶', '斤', '活', '无', '北方', 'maohan', 'mh', 134, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45388, '仿野生甲鱼', '斤', '活', '无', '', 'fangyeshengjiayu', 'fysjy', 134, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45389, '养殖甲鱼', '斤', '活', '无', '', 'yangzhijiayu', 'yzjy', 134, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45390, '蚕蛹', '斤', '活', '无', '', 'canyong', 'cy', 134, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45391, '国产鱿鱼', '斤', '带头', '无', '', 'guochanyouyu', 'gcyy', 136, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45392, '国产鱿鱼', '斤', '去头', '无', '', 'guochanyouyu', 'gcyy', 136, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45393, '进口墨鱼', '斤', '1000-1500g', '无', '', 'jinkoumoyu', 'jkmy', 136, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45394, '进口墨鱼', '斤', '50g-100g', '无', '', 'jinkoumoyu', 'jkmy', 136, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45395, '白条猪', '斤', '瘦', '', '无', 'baitiaozhu', 'btz', 141, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45396, '白条猪', '斤', '肥', '', '无', 'baitiaozhu', 'btz', 141, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45397, '前臀尖', '斤', '瘦', '', '无', 'qiantunjian', 'qtj', 141, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45398, '前臀尖', '斤', '肥', '', '无', 'qiantunjian', 'qtj', 141, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45399, '后臀尖', '斤', '瘦', '', '无', 'houtunjian', 'htj', 141, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45400, '后臀尖', '斤', '肥', '', '无', 'houtunjian', 'htj', 141, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45401, '五花肉', '斤', '瘦', '', '无', 'wuhuarou', 'whr', 141, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45402, '五花肉', '斤', '肥', '', '无', 'wuhuarou', 'whr', 141, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45403, '纯通脊', '斤', '', '无', '无', 'chuntongji', 'ctj', 141, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45404, '通脊', '斤', '', '无', '无', 'tongji', 'tj', 141, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45405, '纯瘦肉', '斤', '', '无', '无', 'chunshourou', 'csr', 141, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45406, '前肘', '斤', '', '无', '无', 'qianzhou', 'qz', 141, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45407, '后肘', '斤', '', '无', '无', 'houzhou', 'hz', 141, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45408, '猪尾巴', '斤', '', '无', '无', 'zhuweiba', 'zwb', 141, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45409, '猪蹄', '斤', '', '无', '无', 'zhuti', 'zt', 141, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45410, '纯排骨', '斤', '', '无', '无', 'chunpaigu', 'cpg', 141, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45411, '纯腔骨', '斤', '', '无', '无', 'chunqianggu', 'cqg', 141, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45412, '腔排骨', '斤', '', '无', '无', 'qiangpaigu', 'qpg', 141, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45413, '棒骨', '斤', '', '无', '无', 'banggu', 'bg', 141, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45414, '猪头', '斤', '', '无', '无', 'zhutou', 'zt', 141, 20, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45415, '猪口条', '斤', '', '无', '无', 'zhukoutiao', 'zkt', 141, 21, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45416, '猪耳', '斤', '', '无', '无', 'zhuer', 'ze', 141, 22, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45417, '猪脑', '斤', '', '无', '无', 'zhunao', 'zn', 141, 23, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45418, '猪肚', '斤', '', '无', '无', 'zhudu', 'zd', 141, 24, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45419, '猪板油', '斤', '', '无', '无', 'zhubanyou', 'zby', 141, 25, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45420, '肥膘肉', '斤', '', '无', '无', 'feibiaorou', 'fbr', 141, 26, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45421, '猪腰子', '斤', '', '无', '无', 'zhuyaozi', 'zyz', 141, 27, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45422, '护心肉', '斤', '', '无', '无', 'huxinrou', 'hxr', 141, 28, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45423, '猪心', '斤', '', '无', '无', 'zhuxin', 'zx', 141, 29, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45424, '猪肝', '斤', '', '无', '无', 'zhugan', 'zg', 141, 30, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45425, '猪肺', '个', '', '无', '无', 'zhufei', 'zf', 141, 31, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45426, '猪皮', '斤', '', '无', '无', 'zhupi', 'zp', 141, 32, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45427, '猪肠头', '斤', '', '无', '无', 'zhuchangtou', 'zct', 141, 33, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45428, '猪肠', '斤', '', '无', '无', 'zhuchang', 'zc', 141, 34, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45429, '整牛', '斤', '', '无', '无', 'zhengniu', 'zn', 142, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45430, '牛前腱', '斤', '', '无', '无', 'niuqianjian', 'nqj', 142, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45431, '牛后腱', '斤', '', '无', '无', 'niuhoujian', 'nhj', 142, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45432, '牛前腿', '斤', '', '无', '无', 'niuqiantui', 'nqt', 142, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45433, '牛后腿', '斤', '', '无', '无', 'niuhoutui', 'nht', 142, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45434, '肥牛', '斤', '', '无', '无', 'feiniu', 'fn', 142, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45435, '精肥牛', '斤', '', '无', '无', 'jingfeiniu', 'jfn', 142, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45436, '牛柳', '斤', '里脊', '', '无', 'niuliu', 'nl', 142, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45437, '精牛柳', '斤', '', '无', '无', 'jingniuliu', 'jnl', 142, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45438, '牛腩', '斤', '', '无', '无', 'niunan', 'nn', 142, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45439, '牛林', '斤', '', '无', '无', 'niulin', 'nl', 142, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45440, '牛腰子', '斤', '', '无', '无', 'niuyaozi', 'nyz', 142, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45441, '牛肚', '斤', '', '无', '无', 'niudu', 'nd', 142, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45442, '牛百叶', '斤', '', '无', '无', 'niubaiye', 'nby', 142, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45443, '牛心', '斤', '', '无', '无', 'niuxin', 'nx', 142, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45444, '牛舌', '斤', '', '无', '无', 'niushe', 'ns', 142, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45445, '牛骨', '斤', '', '无', '无', 'niugu', 'ng', 142, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45446, '牛排骨', '斤', '', '无', '无', 'niupaigu', 'npg', 142, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45447, '牛板筋', '斤', '', '无', '无', 'niubanjin', 'nbj', 142, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45448, '牛蹄筋', '斤', '', '无', '无', 'niutijin', 'ntj', 142, 20, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45449, '牛鞭', '斤', '', '无', '无', 'niubian', 'nb', 142, 21, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45450, '牛尾', '斤', '', '无', '无', 'niuwei', 'nw', 142, 22, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45451, '牛黄喉', '斤', '', '无', '无', 'niuhuanghou', 'nhh', 142, 23, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45452, '牛上脑', '斤', '', '无', '无', 'niushangnao', 'nsn', 142, 24, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45453, '整羊', '斤', '', '无', '无', 'zhengyang', 'zy', 143, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45454, '去骨羊前腿', '斤', '', '无', '无', 'quguyangqiantui', 'qgyqt', 143, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45455, '去骨羊后腿', '斤', '', '无', '无', 'quguyanghoutui', 'qgyht', 143, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45456, '羊腰窝', '斤', '', '无', '无', 'yangyaowo', 'yyw', 143, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45457, '羊肉片', '斤', '', '无', '无', 'yangroupian', 'yrp', 143, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45458, '羊腰子', '个', '挂油', '', '无', 'yangyaozi', 'yyz', 143, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45459, '羊蝎子', '斤', '', '无', '无', 'yangxiezi', 'yxz', 143, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45460, '羊蝎子', '斤', '精品', '', '无', 'yangxiezi', 'yxz', 143, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45461, '羊排骨', '斤', '', '无', '无', 'yangpaigu', 'ypg', 143, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45462, '羊尾巴油', '斤', '', '无', '无', 'yangweibayou', 'ywby', 143, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45463, '羊小腿', '斤', '羊棒', '', '无', 'yangxiaotui', 'yxt', 143, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45464, '羊肠', '斤', '', '无', '无', 'yangchang', 'yc', 143, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45465, '羊肝', '斤', '', '无', '无', 'yanggan', 'yg', 143, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45466, '羊鞭', '斤', '', '无', '无', 'yangbian', 'yb', 143, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45467, '羊肺', '斤', '', '无', '无', 'yangfei', 'yf', 143, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45468, '羊宝', '斤', '', '无', '无', 'yangbao', 'yb', 143, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45469, '羊骨头', '斤', '', '无', '无', 'yanggutou', 'ygt', 143, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45470, '羊腩', '斤', '', '无', '无', 'yangnan', 'yn', 143, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45471, '羊肚', '斤', '', '无', '无', 'yangdu', 'yd', 143, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45472, '羊里脊', '斤', '', '无', '无', 'yangliji', 'ylj', 143, 20, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45473, '淘汰鸡', '斤', '净膛', '', '无', 'taotaiji', 'ttj', 144, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45474, '淘汰鸡', '斤', '干净膛', '', '无', 'taotaiji', 'ttj', 144, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45475, '仔鸡', '斤', '净膛', '', '无', 'ziji', 'zj', 144, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45476, '肉鸡', '斤', '', '无', '无', 'rouji', 'rj', 144, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45477, '鸡胸', '斤', '', '无', '无', 'jixiong', 'jx', 144, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45478, '鸡翅', '斤', '', '无', '无', 'jichi', 'jc', 144, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45479, '鸡翅中', '斤', '', '无', '无', 'jichizhong', 'jcz', 144, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45480, '鸡边腿', '斤', '', '无', '无', 'jibiantui', 'jbt', 144, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45481, '鸡排腿', '斤', '', '无', '无', 'jipaitui', 'jpt', 144, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45482, '冻琵琶腿', '斤', '', '无', '无', 'dongpipatui', 'dppt', 144, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45483, '鸡胗', '斤', '', '无', '无', 'jizhen', 'jz', 144, 11, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45484, '鸡爪', '斤', '', '无', '无', 'jizhua', 'jz', 144, 12, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45485, '鸡心', '斤', '', '无', '无', 'jixin', 'jx', 144, 13, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45486, '鸡肝', '斤', '', '无', '无', 'jigan', 'jg', 144, 14, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45487, '鸡脖子', '斤', '带皮', '', '无', 'jibozi', 'jbz', 144, 15, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45488, '鸡脖子', '斤', '去皮', '', '无', 'jibozi', 'jbz', 144, 16, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45489, '鸡头', '斤', '', '无', '无', 'jitou', 'jt', 144, 17, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45490, '鸡架子', '斤', '', '无', '无', 'jijiazi', 'jjz', 144, 18, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45491, '鸡油', '斤', '', '无', '无', 'jiyou', 'jy', 144, 19, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45492, '鸡翅根', '斤', '', '无', '无', 'jichigen', 'jcg', 144, 20, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45493, '鸭肠', '斤', '', '无', '无', 'yachang', 'yc', 144, 21, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45494, '鸭肝', '斤', '', '无', '无', 'yagan', 'yg', 144, 22, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45495, '鸭头', '斤', '', '无', '无', 'yatou', 'yt', 144, 23, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45496, '鸭心', '斤', '', '无', '无', 'yaxin', 'yx', 144, 24, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45497, '鸭腿', '斤', '', '无', '无', 'yatui', 'yt', 144, 25, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45498, '三黄鸡', '斤', '净膛', '', '无', 'sanhuangji', 'shj', 144, 26, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45499, '白条乌鸡', '斤', '净膛', '', '无', 'baitiaowuji', 'btwj', 144, 27, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45500, '白条北京填鸭', '斤', '', '无', '无', 'baitiaobeijingtianya', 'btbjty', 144, 28, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45501, '白条湖鸭', '斤', '', '无', '无', 'baitiaohuya', 'bthy', 144, 29, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45502, '白条净膛鹅', '斤', '', '无', '无', 'baitiaojingtange', 'btjte', 144, 30, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45503, '白条大乳鸽', '只', '', '无', '无', 'baitiaodaruge', 'btdrg', 144, 31, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45504, '白条小乳鸽', '只', '', '无', '无', 'baitiaoxiaoruge', 'btxrg', 144, 32, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45505, '白条鹌鹑', '只', '', '无', '无', 'baitiaoanchun', 'btac', 144, 33, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45506, '箱鸡蛋', '斤', '', '无', '无', 'xiangjidan', 'xjd', 145, 1, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45507, '散鸡蛋', '斤', '', '无', '无', 'sanjidan', 'sjd', 145, 2, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45508, '生鸭蛋', '斤', '', '无', '无', 'shengyadan', 'syd', 145, 3, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45509, '熟鸭蛋', '斤', '', '无', '无', 'shuyadan', 'syd', 145, 4, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45510, '松花蛋', '斤', '', '无', '无', 'songhuadan', 'shd', 145, 5, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45511, '鹅蛋', '斤', '', '无', '无', 'edan', 'ed', 145, 6, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45512, '鹌鹑蛋', '斤', '', '无', '无', 'anchundan', 'acd', 145, 7, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45513, '柴鸡蛋', '斤', '', '无', '无', 'chaijidan', 'cjd', 145, 8, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45514, '乌鸡蛋', '斤', '', '无', '无', 'wujidan', 'wjd', 145, 9, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45515, '鸵鸟蛋', '个', '', '无', '无', 'tuoniaodan', 'tnd', 145, 10, 'uploadImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45516, '鸽子蛋', '个', '', '无', '无', 'gezidan', 'gzd', 145, 11, 'uploadImage/logo.jpg', 0);
COMMIT;

-- ----------------------------
-- Table structure for nx_label
-- ----------------------------
DROP TABLE IF EXISTS `nx_label`;
CREATE TABLE `nx_label` (
  `nx_label_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_label_name` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_label_hot` int(10) DEFAULT NULL,
  `nx_label_type_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_label
-- ----------------------------
BEGIN;
INSERT INTO `nx_label` VALUES (1, '麻辣', 10, 1);
INSERT INTO `nx_label` VALUES (2, '酸辣', 9, 1);
INSERT INTO `nx_label` VALUES (3, '香辣', 8, 1);
INSERT INTO `nx_label` VALUES (4, '五香', 7, 1);
INSERT INTO `nx_label` VALUES (5, '海鲜', 6, 1);
INSERT INTO `nx_label` VALUES (6, '香甜', 5, 1);
INSERT INTO `nx_label` VALUES (7, '节假日', 2, 3);
INSERT INTO `nx_label` VALUES (8, '日常', 1, 3);
INSERT INTO `nx_label` VALUES (9, '减肥', 2, 5);
INSERT INTO `nx_label` VALUES (10, '解馋', 3, 5);
INSERT INTO `nx_label` VALUES (11, '尝鲜', 6, 5);
INSERT INTO `nx_label` VALUES (12, '聚餐', 3, 5);
INSERT INTO `nx_label` VALUES (13, '宵夜', 3, 3);
INSERT INTO `nx_label` VALUES (14, '高蛋白', 1, 2);
INSERT INTO `nx_label` VALUES (15, '维生素', 2, 2);
INSERT INTO `nx_label` VALUES (16, '高热量', 3, 2);
INSERT INTO `nx_label` VALUES (17, '塑形', 4, 5);
INSERT INTO `nx_label` VALUES (18, '长个子', 5, 5);
COMMIT;

-- ----------------------------
-- Table structure for nx_label_type
-- ----------------------------
DROP TABLE IF EXISTS `nx_label_type`;
CREATE TABLE `nx_label_type` (
  `nx_label_type_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_label_type_name` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_label_amount` int(20) DEFAULT NULL,
  `nx_label_type_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`nx_label_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_label_type
-- ----------------------------
BEGIN;
INSERT INTO `nx_label_type` VALUES (1, '味道', NULL, 1);
INSERT INTO `nx_label_type` VALUES (2, '营养', NULL, 2);
INSERT INTO `nx_label_type` VALUES (3, '时间', NULL, 5);
INSERT INTO `nx_label_type` VALUES (5, '目的', NULL, 3);
COMMIT;

-- ----------------------------
-- Table structure for nx_order_template
-- ----------------------------
DROP TABLE IF EXISTS `nx_order_template`;
CREATE TABLE `nx_order_template` (
  `nx_order_template_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_OD_file_path` varchar(300) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_OD_name` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_OD_customer_user_id` int(20) DEFAULT NULL,
  `nx_OD_item_amount` int(6) DEFAULT NULL,
  PRIMARY KEY (`nx_order_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_order_template
-- ----------------------------
BEGIN;
INSERT INTO `nx_order_template` VALUES (1, 'uploadImage/jia.jpg', '家庭', 1, 0);
INSERT INTO `nx_order_template` VALUES (2, 'uploadImage/pengyou.jpg', '朋友', 1, 0);
INSERT INTO `nx_order_template` VALUES (3, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.b5Oq18tooORK153295726607118a6686f1da322cdfb2.jpg', '健身', 76, 2);
INSERT INTO `nx_order_template` VALUES (4, 'uploadImage/tmp_d699a76d4e0ffd27171a574ae1bf947e.jpg', '维生素', 94, 0);
INSERT INTO `nx_order_template` VALUES (5, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.z04ThuxEOBe374a54b647239227c46f0d1cf6f25fa05.jpg', 'd', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for nx_order_template_item
-- ----------------------------
DROP TABLE IF EXISTS `nx_order_template_item`;
CREATE TABLE `nx_order_template_item` (
  `nx_OT_item_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_OT_dis_goods_id` int(20) DEFAULT NULL,
  `nx_OT_amount` float(4,1) DEFAULT NULL,
  `nx_OT_order_template_id` int(20) DEFAULT NULL,
  `nx_OT_customer_user_id` int(20) DEFAULT NULL,
  `nx_OT_dis_goods_color` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_OT_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_order_template_item
-- ----------------------------
BEGIN;
INSERT INTO `nx_order_template_item` VALUES (1, 285, NULL, 3, 76, '#20afb8');
INSERT INTO `nx_order_template_item` VALUES (2, 73, NULL, 3, 76, '#20afb8');
INSERT INTO `nx_order_template_item` VALUES (3, 76, NULL, 3, 76, '#3cc36e');
INSERT INTO `nx_order_template_item` VALUES (4, 77, NULL, 3, 76, '#3cc36e');
COMMIT;

-- ----------------------------
-- Table structure for nx_purchase_standard
-- ----------------------------
DROP TABLE IF EXISTS `nx_purchase_standard`;
CREATE TABLE `nx_purchase_standard` (
  `nx_purchase_standard_id` int(20) NOT NULL,
  `nx_PS_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_PS_nx_goods_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_purchase_standard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_route
-- ----------------------------
DROP TABLE IF EXISTS `nx_route`;
CREATE TABLE `nx_route` (
  `nx_route_id` int(20) NOT NULL COMMENT '线路id',
  `nx_route_name` varchar(100) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '线路名称',
  PRIMARY KEY (`nx_route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_route
-- ----------------------------
BEGIN;
INSERT INTO `nx_route` VALUES (1, '燕郊南线');
INSERT INTO `nx_route` VALUES (2, '测试线');
COMMIT;

-- ----------------------------
-- Table structure for nx_standard
-- ----------------------------
DROP TABLE IF EXISTS `nx_standard`;
CREATE TABLE `nx_standard` (
  `nx_standard_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_standard_name` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_s_goods_id` int(20) DEFAULT NULL,
  `nx_standard_file_path` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_standard_scale` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_standard_error` varchar(10) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_standard_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`nx_standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_standard
-- ----------------------------
BEGIN;
INSERT INTO `nx_standard` VALUES (1, '根', 45096, 'uploadImage/wxbc686226ccc443f1.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.0r30bxBpTNcFbabac3529edec5e2c86ba0c548932af5.jpg', '1.3', '0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_wx_orders
-- ----------------------------
DROP TABLE IF EXISTS `nx_wx_orders`;
CREATE TABLE `nx_wx_orders` (
  `nx_wx_orders_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '微信支付订单id',
  `nx_wx_orders_out_trade_no` varchar(32) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '随机字符串32位',
  `nx_wx_orders_body` varchar(128) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单主体',
  `nx_wx_orders_detail` varchar(6000) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单详细',
  `nx_wx_orders_attach` varchar(127) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '附加数据，如“深圳分店”',
  `nx_wx_orders_total_fee` int(88) DEFAULT NULL COMMENT '支付金额单位“分”',
  `nx_wx_orders_spbill_create_ip` varchar(64) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '支付api的机器ip',
  PRIMARY KEY (`nx_wx_orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 9);
INSERT INTO `sys_menu` VALUES (2, 1, '员工列表', 'sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu.html', 'sys:menu:list', 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'sys/schedule.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO `sys_menu` VALUES (28, 1, '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', 1, 'fa fa-rocket', 7);
INSERT INTO `sys_menu` VALUES (29, -1, '今日出货', NULL, NULL, 0, 'fa fa-cog', 3);
INSERT INTO `sys_menu` VALUES (30, 29, '订货申请', 'orderApplication', 'ckapplys:list, ckapplys:info, ckapplys:save, ckapplys:update, ckapplys:delete', 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (31, 29, '出货单', 'deliveryOrder', 'ckapplys:list, ckapplys:info, ckapplys:save, ckapplys:update, ckapplys:delete', 1, NULL, 3);
INSERT INTO `sys_menu` VALUES (32, 29, '送货', 'so_deliver', NULL, 1, NULL, 3);
INSERT INTO `sys_menu` VALUES (38, 37, '店铺销售', '/point', NULL, 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (39, 37, '产品销售', '/sellProducts', NULL, 1, NULL, 30);
INSERT INTO `sys_menu` VALUES (40, 0, '系统数据', NULL, NULL, 0, 'fa fa-cog', 7);
INSERT INTO `sys_menu` VALUES (41, 40, '员工', 'ckUser', 'ckuser:list, ckuser:info, ckuser:save, ckuser:update, ckuser:delete', 1, 'fa fa-user', 7);
INSERT INTO `sys_menu` VALUES (42, 40, '硬件设备', '/printer', NULL, 1, 'fa fa-user', 8);
INSERT INTO `sys_menu` VALUES (51, 37, '集团销售', '/groupSales', NULL, 1, 'fa fa-user', 0);
INSERT INTO `sys_menu` VALUES (52, 0, '次日达社区', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (53, 0, '供货商', NULL, NULL, 0, 'fa fa-cog', 6);
INSERT INTO `sys_menu` VALUES (56, 52, '商品管理', 'communityGoodsData', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (57, 52, '订单', 'costControl', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (62, 53, '供应商品', 'supplier', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (63, 40, '订单', 'storeList', 'ckstore:list, ckstore:info, ckstore:save, ckstore:update, ckstore:delete', 1, 'fa fa-cog', 3);
INSERT INTO `sys_menu` VALUES (64, 40, '送货路线', 'ckLine', 'ckline:list, ckline:info, ckline:save, ckline:update, ckline:delete', 1, 'fa fa-cog', 6);
INSERT INTO `sys_menu` VALUES (65, 40, '商品', 'goods', 'ckgoods:list, ckgoods:info, ckgoods:save, ckgoods:update, ckgoods:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (66, 40, '部门', 'ckDep', 'ckdep:list, ckdep:info, ckdep:save, ckdep:update, ckdep:delete', 1, 'fa fa-user', 5);
INSERT INTO `sys_menu` VALUES (67, 65, 'btn1', NULL, 'ckgoods:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (69, 0, '今日订单', NULL, '', 0, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (71, 69, '库存商品', 'inventory', 'ckinbill:list, ckinbill:info, ckinbill:save, ckinbill:update, ckinbill:delete', 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (72, -1, '采购分析', 'anlysise', NULL, 1, 'fa fa-user', 4);
INSERT INTO `sys_menu` VALUES (73, 52, '销售分析', 'ckStore', NULL, 1, 'fa fa-user', 3);
INSERT INTO `sys_menu` VALUES (74, 69, '加工商品', 'handling', 'ckinbill:list, ckinbill:info, ckinbill:save, ckinbill:update, ckinbill:delete', 1, 'fa fa-user', 3);
INSERT INTO `sys_menu` VALUES (75, 69, '日采商品', 'daily', 'ckinbill:list, ckinbill:info, ckinbill:save, ckinbill:update, ckinbill:delete', 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (76, 29, '拣货单录入', 'enterOutStock', 'ckstockrecord:list, ckstockrecord:info, ckstockrecord:save, ckstockrecord:update, ckapplys:delete', 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (77, -1, '出货', 'outGoods', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (78, 69, '订货', 'todayOrder', NULL, 1, 'fa fa-user', 0);
INSERT INTO `sys_menu` VALUES (79, 53, '未付货款', 'supplier', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (80, 53, '已付货款', 'supplier', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (81, 52, '配送', 'communityDelivery', NULL, 1, 'fa fa-user', 3);
INSERT INTO `sys_menu` VALUES (82, 69, '供货商商品', 'outGoods', 'ckinbill:list, ckinbill:info, ckinbill:save, ckinbill:update, ckinbill:delete', 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (83, 52, '库存商品', 'communityStock', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (84, 0, '超市社区', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (85, 84, '商品管理', 'communityGoodsData', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (86, 84, '订单', 'costControl', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (87, 84, '销售分析', 'ckStore', NULL, 1, 'fa fa-user', 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '司机', '', '2019-09-20 21:12:18');
INSERT INTO `sys_role` VALUES (2, '售货员', NULL, '2019-09-20 21:13:00');
INSERT INTO `sys_role` VALUES (3, '分拣员', NULL, '2019-09-20 21:13:58');
INSERT INTO `sys_role` VALUES (4, '文员', NULL, '2019-09-20 21:15:08');
INSERT INTO `sys_role` VALUES (5, '采购员', NULL, '2019-09-20 21:15:21');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1, 29);
INSERT INTO `sys_role_menu` VALUES (2, 1, 32);
COMMIT;

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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, NULL, 1, '2020-02-10 18:48:37');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for zzz_nx_supplier
-- ----------------------------
DROP TABLE IF EXISTS `zzz_nx_supplier`;
CREATE TABLE `zzz_nx_supplier` (
  `nx_supplier_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '供货商id',
  `nx_supplier_name` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '供货商名称',
  `nx_supplier_father_goods_id` int(20) DEFAULT NULL COMMENT '供货商商品类别id',
  `nx_supplier_payment_type` tinyint(2) DEFAULT NULL COMMENT '供货商结算类别1现金，2记账',
  `nx_supplier_date` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '供货商加入时间',
  PRIMARY KEY (`nx_supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of zzz_nx_supplier
-- ----------------------------
BEGIN;
INSERT INTO `zzz_nx_supplier` VALUES (1, '蔬菜李国树', NULL, NULL, NULL);
INSERT INTO `zzz_nx_supplier` VALUES (2, '牛肉张', NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
