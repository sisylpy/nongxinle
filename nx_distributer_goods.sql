/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 140.143.186.94:3306
 Source Schema         : nongxinle

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 17/04/2020 08:29:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nx_distributer_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_goods`;
CREATE TABLE `nx_distributer_goods` (
  `dis_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商商品id',
  `dg_distribute_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `dg_goods_id` int(20) DEFAULT NULL COMMENT '商品id',
  `dg_goods_status` tinyint(2) DEFAULT NULL COMMENT '商品状态',
  `dg_goods_is_weight` tinyint(2) DEFAULT NULL COMMENT '是否称重',
  `dg_goods_price` float(10,1) DEFAULT NULL COMMENT '价格',
  `dg_goods_price_decimal` int(10) DEFAULT NULL,
  `dg_goods_father_id` int(20) DEFAULT NULL COMMENT '父类id',
  `dg_goods_father_img` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT 'image',
  `dg_goods_buy_type` tinyint(2) DEFAULT NULL COMMENT '进货方式',
  `dg_purchase_quantity` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购数量',
  `dg_buy_purchase_user_id` int(20) DEFAULT NULL,
  `dg_buy_app_id` int(20) DEFAULT NULL COMMENT 'App订货供货商appid',
  `dg_buy_status` tinyint(2) DEFAULT NULL,
  `dg_goods_min_weight` float(4,1) DEFAULT NULL,
  `dg_goods_discount_price` float(10,1) unsigned DEFAULT NULL,
  `dg_goods_is_discount` tinyint(2) DEFAULT NULL,
  `dg_goods_order_amount` float(4,1) DEFAULT NULL,
  `dg_goods_total_hits` int(10) DEFAULT NULL,
  `dg_goods_sell_type` tinyint(2) DEFAULT NULL COMMENT '批发商商品销售规格模式0按standardname销售，1 按自己的规格销售',
  `dg_goods_sell_standard_name` varchar(2) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '销售单位',
  `dg_goods_sell_standard_scale` float(4,1) DEFAULT NULL COMMENT '销售比例',
  PRIMARY KEY (`dis_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_goods` VALUES (72, 1, 45096, 1, NULL, 2.0, 0, 111, '../../images/1.jpg', NULL, '1袋', 1, NULL, 2, 1.0, 2.1, 1, 1.1, 1, 1, '颗', 0.3);
INSERT INTO `nx_distributer_goods` VALUES (73, 1, 45097, 0, NULL, 5.0, 0, 111, '../../images/1.jpg', NULL, '3', 2, NULL, 2, 1.0, 1.0, 0, NULL, 3, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (74, 1, 45094, 0, NULL, 2.0, 0, 111, '../../images/1.jpg', NULL, '9', 1, NULL, 2, 1.0, 1.1, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (75, 1, 45104, 0, NULL, 3.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, 1.0, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (76, 1, 45105, 0, NULL, 2.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, 1.0, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (77, 1, 45107, 0, NULL, 3.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (78, 1, 45103, 0, NULL, 5.0, 0, 111, '../../images/1.jpg', NULL, '3', 1, NULL, 2, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (79, 1, 45098, 0, NULL, 2.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (80, 1, 45099, 0, NULL, 3.0, 0, 111, '../../images/1.jpg', NULL, '5dag', NULL, NULL, 1, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (81, 1, 45108, 0, NULL, 2.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (83, 1, 45101, 0, NULL, 12.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (84, 1, 44678, 0, NULL, 1.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (85, 1, 45092, 0, NULL, 2.0, 0, 111, '../../images/1.jpg', NULL, '3', 2, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (86, 1, 45102, 0, NULL, 13.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (87, 1, 45095, 0, NULL, 3.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (88, 1, 45100, 0, NULL, 3.0, 0, 111, '../../images/1.jpg', NULL, '3斤', NULL, NULL, 1, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (89, 1, 45093, 0, NULL, 3.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (90, 1, 45106, 0, NULL, 3.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (91, 1, 45109, 0, NULL, 5.0, 0, 111, '../../images/1.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (93, 1, 45114, 0, NULL, 1.0, 0, 112, '../../images/2.jpg', NULL, '1', 1, NULL, 0, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (94, 1, 45126, 0, NULL, 9.0, 0, 112, '../../images/2.jpg', NULL, '5', 1, NULL, 2, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (95, 1, 45117, 0, NULL, 6.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (96, 1, 45112, 0, NULL, 1.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (97, 1, 45113, 0, NULL, 1.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (98, 1, 45124, 0, NULL, 5.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (99, 1, 45116, 0, NULL, 6.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (100, 1, 45110, 0, NULL, 3.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (101, 1, 45127, 0, NULL, 5.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (102, 1, 45129, 0, NULL, 4.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (103, 1, 45121, 0, NULL, 7.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (104, 1, 45119, 0, NULL, 8.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (105, 1, 45122, 0, NULL, 6.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (106, 1, 45111, 0, NULL, 3.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (107, 1, 45115, 0, NULL, 1.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (108, 1, 45128, 0, NULL, 2.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (109, 1, 45123, 0, NULL, 3.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (110, 1, 45125, 0, NULL, 9.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (111, 1, 45118, 0, NULL, 5.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (112, 1, 45120, 0, NULL, 3.0, 0, 112, '../../images/2.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (113, 1, 45146, 0, NULL, 6.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (114, 1, 45160, 0, NULL, 4.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (115, 1, 45159, 0, NULL, 3.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (116, 1, 45148, 0, NULL, 6.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (117, 1, 45163, 0, NULL, 8.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (118, 1, 45138, 0, NULL, 1.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (119, 1, 45139, 0, NULL, 0.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (120, 1, 45145, 0, NULL, 5.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (121, 1, 45130, 0, NULL, 3.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (122, 1, 45131, 0, NULL, 6.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (123, 1, 45155, 0, NULL, 1.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (124, 1, 45132, 0, NULL, 1.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (125, 1, 45133, 0, NULL, 2.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (126, 1, 45134, 0, NULL, 5.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (127, 1, 45164, 0, NULL, 3.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (128, 1, 45141, 0, NULL, 3.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (129, 1, 45137, 0, NULL, 1.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (130, 1, 45147, 0, NULL, 5.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (131, 1, 45158, 0, NULL, 1.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (132, 1, 45151, 0, NULL, 6.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (133, 1, 45143, 0, NULL, 3.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (134, 1, 45150, 0, NULL, 8.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (135, 1, 45153, 0, NULL, 1.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (136, 1, 45135, 0, NULL, 3.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (137, 1, 45136, 0, NULL, 5.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (138, 1, 45152, 0, NULL, 4.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (139, 1, 45142, 0, NULL, 1.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (140, 1, 45162, 0, NULL, 6.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (141, 1, 45140, 0, NULL, 1.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (142, 1, 45156, 0, NULL, 3.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (143, 1, 45144, 0, NULL, 3.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (144, 1, 45149, 0, NULL, 11.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (145, 1, 45161, 0, NULL, 2.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (146, 1, 45157, 0, NULL, 2.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (147, 1, 45154, 0, NULL, 4.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (148, 1, 45192, 0, NULL, 1.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (149, 1, 45168, 0, NULL, 1.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (150, 1, 45197, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (151, 1, 45204, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (152, 1, 45165, 0, NULL, 1.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (153, 1, 45195, 0, NULL, 1.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (154, 1, 45171, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (155, 1, 45176, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (156, 1, 45181, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (157, 1, 45190, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (158, 1, 45174, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (159, 1, 45200, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (160, 1, 45194, 0, NULL, 4.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (161, 1, 45196, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (162, 1, 45199, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (163, 1, 45202, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (164, 1, 45203, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (165, 1, 45178, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (166, 1, 45198, 0, NULL, 11.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (167, 1, 45205, 0, NULL, 10.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (168, 1, 45187, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (169, 1, 45167, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (170, 1, 45188, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (171, 1, 45177, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (172, 1, 45189, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (173, 1, 45169, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (174, 1, 45201, 0, NULL, 9.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (175, 1, 45166, 0, NULL, 4.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (176, 1, 45175, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (177, 1, 45185, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (178, 1, 45173, 0, NULL, 4.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (179, 1, 45193, 0, NULL, 11.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (180, 1, 45183, 0, NULL, 18.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (181, 1, 45182, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (182, 1, 45191, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (183, 1, 45170, 0, NULL, 0.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (184, 1, 45184, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (185, 1, 45172, 0, NULL, 3.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (186, 1, 45186, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (187, 1, 45180, 0, NULL, 2.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (188, 1, 45179, 0, NULL, 4.0, 0, 114, '../../images/4.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (189, 1, 45208, 0, NULL, 5.0, 0, 115, '../../images/5.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (190, 1, 45211, 0, NULL, 12.0, 0, 115, '../../images/5.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (191, 1, 45212, 0, NULL, 5.0, 0, 115, '../../images/5.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (192, 1, 45209, 0, NULL, 12.0, 0, 115, '../../images/5.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (193, 1, 45206, 0, NULL, 6.0, 0, 115, '../../images/5.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (194, 1, 45210, 0, NULL, 6.0, 0, 115, '../../images/5.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (195, 1, 45207, 0, NULL, 5.0, 0, 115, '../../images/5.jpg', NULL, '8', NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (196, 1, 45326, 0, NULL, 7.0, 0, 132, 'null', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (197, 1, 45327, 0, NULL, 8.0, 0, 132, 'null', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (198, 1, 45325, 0, NULL, 6.0, 0, 132, 'null', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (199, 1, 45349, 0, NULL, 12.0, 0, 132, 'null', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (200, 1, 45350, 0, NULL, 10.0, 0, 132, 'null', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (201, 1, 45413, 0, NULL, 30.0, 0, 141, 'null', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (202, 1, 45396, 0, NULL, 25.0, 0, 141, 'null', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (203, 1, 45411, 0, NULL, 19.0, 0, 141, 'null', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (204, 1, 45160, 0, NULL, 5.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (205, 1, 45148, 0, NULL, 9.0, 0, 113, '../../images/3.jpg', NULL, NULL, NULL, NULL, NULL, 1.0, NULL, 0, NULL, 0, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
