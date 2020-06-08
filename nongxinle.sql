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

 Date: 05/05/2020 08:56:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nx_community
-- ----------------------------
DROP TABLE IF EXISTS `nx_community`;
CREATE TABLE `nx_community` (
  `nx_community_id` int(20) NOT NULL,
  `nx_community_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_lan` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_lng` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_route_id` int(20) DEFAULT NULL,
  `nx_community_dis_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_community_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community
-- ----------------------------
BEGIN;
INSERT INTO `nx_community` VALUES (1, '美林湾', NULL, NULL, 1, 1);
INSERT INTO `nx_community` VALUES (2, '悦榕湾', NULL, NULL, 1, 1);
INSERT INTO `nx_community` VALUES (3, '纳丹堡', NULL, NULL, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_daytime
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_daytime`;
CREATE TABLE `nx_community_daytime` (
  `nx_week_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_day_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_day_open` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_day_close` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dis_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_week_id`)
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
  `nx_customer_dis_id` int(20) DEFAULT NULL,
  `nx_customer_community_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_customer
-- ----------------------------
BEGIN;
INSERT INTO `nx_customer` VALUES (1, '李', NULL, NULL, NULL, '41-1.802', '13910825707', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (2, '2', NULL, NULL, NULL, '日', '2', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (3, '1', NULL, NULL, NULL, '222', '1222', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (4, '额', NULL, NULL, NULL, '2', '2', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (5, '3', NULL, NULL, NULL, '2', '1', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (6, 'Jk', NULL, NULL, NULL, 'Hj', '136', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (7, 'dd', NULL, NULL, NULL, '33', '13910833333', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (8, 's', NULL, NULL, NULL, 'd', '13900000000', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (9, '4', NULL, NULL, NULL, '22', '13910833442', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (10, 'd', NULL, NULL, NULL, '3', '13910835555', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (11, '4', NULL, NULL, NULL, '2', '13334445566', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (12, '555', NULL, NULL, NULL, '555', '13555555555', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (13, '22222', NULL, NULL, NULL, '444', '13900000000', 2, NULL, NULL, 1, 2);
INSERT INTO `nx_customer` VALUES (14, '1111', NULL, NULL, NULL, '1111', '13900000000', 2, NULL, NULL, 1, 2);
INSERT INTO `nx_customer` VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL);
INSERT INTO `nx_customer` VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (17, 'lipeiyi3', NULL, NULL, NULL, '41-1-8023', '13910899090', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (18, NULL, NULL, NULL, NULL, NULL, '13910890902', 2, NULL, NULL, 1, 2);
INSERT INTO `nx_customer` VALUES (19, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (20, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (21, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 2);
INSERT INTO `nx_customer` VALUES (22, 'lipeiyi1', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (23, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (24, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (25, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (26, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (27, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (28, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (29, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (30, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (31, 'lipeiyi3', NULL, NULL, NULL, '41-1-803', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (32, 'lipeiyi2', NULL, NULL, NULL, '41-1-2', '13910890999', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (33, 'lipeiyi8', NULL, NULL, NULL, '41-1-808', '13908939090', 2, NULL, NULL, 1, 2);
INSERT INTO `nx_customer` VALUES (34, 'lipeiyi4', NULL, NULL, NULL, '41-1-804', '13910890904', 1, NULL, NULL, 1, 3);
INSERT INTO `nx_customer` VALUES (35, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (36, 'lipeiyi2', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (37, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (38, 'lipeiyi3', NULL, NULL, NULL, '41-1-803', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (39, 'lipeiyiq', NULL, NULL, NULL, '41-1-80q', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (40, '1lipeiyi', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (41, 'lipeiyi吧', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (42, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (43, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (44, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', NULL, 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (45, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (46, 'lipeiyi吧', NULL, NULL, NULL, '41-1-802', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (47, 'lipeiy', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (48, 'lipeiyi', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (49, 'lipeiyim', NULL, NULL, NULL, '41-1-80d', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (50, NULL, NULL, NULL, NULL, '41-1-801', NULL, 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (51, NULL, NULL, NULL, NULL, '41-1-801', NULL, 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (52, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL);
INSERT INTO `nx_customer` VALUES (53, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (54, 'lipeiyi1', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (55, '1lipeiyi', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (56, NULL, NULL, NULL, NULL, '41-1-801', NULL, 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (57, 'lipeiyi', NULL, NULL, NULL, '41-1-801', '13910890902', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (58, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (59, '曹建卿', NULL, NULL, NULL, '33号楼802', '13693697423', 2, NULL, NULL, 1, 2);
INSERT INTO `nx_customer` VALUES (60, '1', NULL, NULL, NULL, '1', '13910823999', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (61, '2', NULL, NULL, NULL, '2', '13333333333', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (62, '2', NULL, NULL, NULL, '2', '13333333333', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (63, '1', NULL, NULL, NULL, '1', '13333333333', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (64, '2', NULL, NULL, NULL, '2', '13333333333', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (65, '李', NULL, NULL, NULL, 'lkk', '13910825707', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (66, '我', NULL, NULL, NULL, '我', '13696369636', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (67, '1', NULL, NULL, NULL, '1', '13445555555', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (68, '1', NULL, NULL, NULL, '1', '13433333333', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (69, '1', NULL, NULL, NULL, '1', '13533333333', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (70, '你', NULL, NULL, NULL, '我', '13969856363', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (71, '李', NULL, NULL, NULL, '我', '13918855252', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (72, '你', NULL, NULL, NULL, '我', '13696336963', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (73, '在', NULL, NULL, NULL, '我', '13696369636', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (74, '你', NULL, NULL, NULL, '我', '13696369685', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (75, '2', NULL, NULL, NULL, '2', '13555555555', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (76, 'sss', NULL, NULL, NULL, '222', '13566676777', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (77, '哎', NULL, NULL, NULL, '在', '13696358525', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (78, '好', NULL, NULL, NULL, '我', '13698525852', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (79, '在', NULL, NULL, NULL, '我的', '13696358525', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (80, '好', NULL, NULL, NULL, '我的', '13698525780', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (81, '2', NULL, NULL, NULL, '22', '13566656555', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (82, '你', NULL, NULL, NULL, '你', '13698525707', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (83, '1', NULL, NULL, NULL, '1', '13444444444', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (84, '1', NULL, NULL, NULL, '1', '13444444444', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (85, '我', NULL, NULL, NULL, '你', '13985687525', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (86, '1', NULL, NULL, NULL, '1', '13444444444', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (87, '2', NULL, NULL, NULL, '2', '13444444444', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (88, '1', NULL, NULL, NULL, '1', '13455555555', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (89, '在', NULL, NULL, NULL, '你', '13685258785', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (90, '8', NULL, NULL, NULL, '7', '13444444444', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (91, '在', NULL, NULL, NULL, '我的', '13698525896', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (92, '2', NULL, NULL, NULL, 'w', '13444455555', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (93, '李明', NULL, NULL, NULL, '41222', '13910828707', 2, NULL, NULL, 1, 1);
INSERT INTO `nx_customer` VALUES (94, 'b', NULL, NULL, NULL, '41', '13910825707', 2, NULL, NULL, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_customer_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_customer_user`;
CREATE TABLE `nx_customer_user` (
  `nx_CU_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '客户用户id',
  `nx_CU_wx_nick_name` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户用户微信昵称',
  `nx_CU_wx_avatar_url` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '微信头像',
  `nx_CU_wx_gender` int(2) DEFAULT NULL COMMENT '微信性别',
  `nx_CU_customer_id` int(20) DEFAULT NULL COMMENT '客户id',
  `nx_CU_wx_open_id` varchar(40) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '微信openid',
  `nx_CU_wx_phone_number` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '微信手机号',
  PRIMARY KEY (`nx_CU_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_customer_user
-- ----------------------------
BEGIN;
INSERT INTO `nx_customer_user` VALUES (1, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 1, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (2, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 2, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (3, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 3, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (4, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 4, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (5, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 5, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (6, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 6, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (7, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 7, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (8, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 8, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (9, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 9, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (10, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 10, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (11, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 11, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (12, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 12, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (13, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 13, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (14, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 14, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (15, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 15, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (16, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 16, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (17, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 17, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (18, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 18, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (19, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 19, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (20, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 20, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (21, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 21, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (22, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 22, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (23, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 23, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (24, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 24, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (25, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 25, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (26, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 26, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (27, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 27, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (28, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 28, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (29, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 29, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (30, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 30, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (31, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 31, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (32, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 32, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (33, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 33, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (34, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 34, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (35, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 35, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (36, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 36, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (37, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 37, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (38, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 38, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (39, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 39, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (40, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 40, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (41, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 41, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (42, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 42, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (43, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 43, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (44, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 44, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (45, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 45, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (46, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 46, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (47, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 47, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (48, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 48, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (49, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 49, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (50, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 50, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (51, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 51, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (52, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 52, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (53, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 53, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (54, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 54, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (55, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 55, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (56, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 56, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (57, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 57, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (58, 'Fangfang', 'https://wx.qlogo.cn/mmopen/vi_32/3T3I4NXkxtjA27xp35ZIKe15O0QlCL7M9CFuR3ic0sSzpVg1XtzibKibXjygSTE6uMcOPaJYPvfSUUPaTYKSia4aiaQ/132', 2, 58, 'oX2485MI4LIv6BZecHp7zXBNKlA0', NULL);
INSERT INTO `nx_customer_user` VALUES (59, 'Fangfang', 'https://wx.qlogo.cn/mmopen/vi_32/3T3I4NXkxtjA27xp35ZIKe15O0QlCL7M9CFuR3ic0sSzpVg1XtzibKibXjygSTE6uMcOPaJYPvfSUUPaTYKSia4aiaQ/132', 2, 59, 'oX2485MI4LIv6BZecHp7zXBNKlA0', NULL);
INSERT INTO `nx_customer_user` VALUES (60, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 60, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (61, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 61, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (62, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 62, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (63, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 63, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (64, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 64, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (65, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 65, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (66, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 66, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (67, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 67, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (68, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 68, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (69, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 69, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (70, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 70, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (71, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 71, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (72, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 72, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (73, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 73, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (74, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 74, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (75, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 75, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (76, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 76, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (77, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 77, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (78, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 78, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (79, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 79, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (80, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 80, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (81, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 81, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (82, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 82, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (83, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 83, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (84, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 84, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (85, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 85, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (86, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 86, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (87, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 87, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (88, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 88, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (89, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 89, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (90, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 90, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (91, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 91, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (92, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 92, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (93, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 93, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
INSERT INTO `nx_customer_user` VALUES (94, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 94, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_customer_user_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_customer_user_goods`;
CREATE TABLE `nx_customer_user_goods` (
  `nx_CUG_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '客户用户商品id',
  `nx_CUG_user_id` int(20) DEFAULT NULL COMMENT '客户用户id',
  `nx_CUG_dis_goods_id` int(20) DEFAULT NULL COMMENT '批发商商品id',
  `nx_CUG_first_order_time` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户用户第一次订货时间',
  `nx_CUG_last_order_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户用户最后一次订货时间',
  `nx_CUG_order_amount` float(10,1) DEFAULT NULL COMMENT '客户用户订货总量',
  `nx_CUG_order_times` int(10) DEFAULT NULL COMMENT '客户用户订货次数',
  `nx_CUG_is_love` tinyint(2) DEFAULT NULL COMMENT '客户用户最爱',
  `nx_CUG_order_rate` int(4) DEFAULT NULL COMMENT '客户订货频率',
  `nx_CUG_last_order_quantity` float(10,1) DEFAULT NULL COMMENT '客户最后一次订货数量',
  `nx_CUG_last_order_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户最后一次订货规格',
  `nx_CUG_join_my_template` tinyint(2) DEFAULT NULL COMMENT '是否加入用户订货模版',
  `nx_CUG_order_quantity` float(4,1) DEFAULT NULL,
  `nx_CUG_order_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CUG_goods_color` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_CUG_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_customer_user_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_customer_user_goods` VALUES (1, 91, 84, '2020-04-26', '2020-04-26', 4.0, 2, NULL, NULL, 1.0, '颗', 0, 1.0, '颗', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (2, 91, 73, '2020-04-26', '2020-04-26', 5.0, 2, NULL, NULL, 2.0, '斤', 0, 2.0, '斤', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (3, 91, 72, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '斤', 0, 3.0, '斤', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (4, 79, 148, '2020-04-26', '2020-04-26', 5.3, 1, NULL, NULL, 5.3, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (5, 79, 158, '2020-04-26', '2020-04-26', 3.3, 1, NULL, NULL, 3.3, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (6, 80, 73, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (7, 80, 72, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (8, 80, 78, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (9, 80, 99, '2020-04-26', '2020-04-26', 1.0, 1, NULL, NULL, 1.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (10, 80, 106, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (11, 82, 73, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (12, 82, 72, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (13, 82, 78, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (14, 82, 83, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (15, 82, 91, '2020-04-26', '2020-04-26', 1.0, 1, NULL, NULL, 1.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (16, 82, 95, '2020-04-26', '2020-04-26', 1.0, 1, NULL, NULL, 1.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (17, 84, 77, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (18, 84, 79, '2020-04-26', '2020-04-26', 1.0, 1, NULL, NULL, 1.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (19, 84, 84, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (20, 84, 88, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (21, 84, 91, '2020-04-26', '2020-04-26', 1.0, 1, NULL, NULL, 1.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (22, 84, 73, '2020-04-26', '2020-04-26', 1.0, 1, NULL, NULL, 1.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (23, 84, 72, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (24, 85, 73, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (25, 85, 78, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (26, 85, 72, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (27, 85, 84, '2020-04-26', '2020-04-26', 1.0, 1, NULL, NULL, 1.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (28, 85, 85, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (29, 85, 86, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (30, 85, 88, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (31, 86, 76, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (32, 86, 73, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (33, 87, 72, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '颗', 1, 2.0, '颗', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (34, 87, 73, '2020-04-26', '2020-04-26', 1.0, 1, NULL, NULL, 1.0, '颗', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (35, 87, 78, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (36, 88, 73, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '颗', 1, 2.0, '颗', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (37, 88, 72, '2020-04-26', '2020-04-26', 4.0, 1, NULL, NULL, 4.0, '颗', 1, 4.0, '颗', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (38, 88, 81, '2020-04-26', '2020-04-26', 3.0, 1, NULL, NULL, 3.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (39, 89, 73, '2020-04-26', '2020-04-27', 6.0, 2, NULL, NULL, 4.0, '颗', 0, 2.0, '颗', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (40, 89, 75, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '斤', 1, 2.0, '斤', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (41, 89, 72, '2020-04-26', '2020-04-27', 5.0, 2, NULL, NULL, 3.0, '颗', 1, 3.0, '颗', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (42, 89, 96, '2020-04-26', '2020-04-26', 2.0, 1, NULL, NULL, 2.0, '斤', 0, 2.0, '斤', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (43, 89, 98, '2020-04-26', '2020-04-26', 1.0, 1, NULL, NULL, 1.0, '斤', 0, 1.0, '斤', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (44, 90, 72, '2020-04-27', '2020-04-27', 2.0, 1, NULL, NULL, 2.0, '颗', 0, 2.0, '颗', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (45, 90, 80, '2020-04-27', '2020-04-27', 9.0, 1, NULL, NULL, 9.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (46, 89, 148, '2020-04-27', '2020-04-27', 1.0, 1, NULL, NULL, 1.0, '斤', 0, 1.0, '斤', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (47, 89, 169, '2020-04-27', '2020-04-27', 2.0, 1, NULL, NULL, 2.0, '斤', 0, 2.0, '斤', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (48, 89, 184, '2020-04-27', '2020-04-27', 1.0, 1, NULL, NULL, 1.0, '斤', 0, 1.0, '斤', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (49, 89, 197, '2020-04-27', '2020-04-27', 2.0, 1, NULL, NULL, 2.0, '斤', 0, 2.0, '斤', '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (50, 89, 86, '2020-04-27', '2020-04-27', 2.0, 1, NULL, NULL, 2.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (51, 91, 90, '2020-04-27', '2020-04-27', 2.0, 1, NULL, NULL, 2.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (52, 91, 113, '2020-04-27', '2020-04-27', 2.5, 1, NULL, NULL, 2.5, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (53, 91, 124, '2020-04-27', '2020-04-27', 2.0, 1, NULL, NULL, 2.0, '斤', 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_customer_user_goods` VALUES (54, 91, 136, '2020-04-27', '2020-04-27', 1.0, 1, NULL, NULL, 1.0, '斤', 0, NULL, NULL, '#3cc36e');
INSERT INTO `nx_customer_user_goods` VALUES (55, 89, 112, '2020-04-27', '2020-04-27', 333.0, 1, NULL, NULL, 333.0, '斤', 0, NULL, NULL, '#3cc36e');
COMMIT;

-- ----------------------------
-- Table structure for nx_department
-- ----------------------------
DROP TABLE IF EXISTS `nx_department`;
CREATE TABLE `nx_department` (
  `nx_department_id` int(20) NOT NULL,
  `nx_department_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_father_id` int(20) DEFAULT NULL,
  `nx_department_type` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`nx_department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_department_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_user`;
CREATE TABLE `nx_department_user` (
  `nx_DU_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DU_department_id` int(20) DEFAULT NULL,
  `nx_DU_wx_avartra_url` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DU_wx_nick_name` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_DU_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_distributer
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer`;
CREATE TABLE `nx_distributer` (
  `distributer_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商id',
  `distributer_name` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商名称',
  `distributer_lan` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商位置经度',
  `distributer_lun` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商位置纬度',
  `distributer_business_type` tinyint(2) DEFAULT NULL COMMENT '批发商商业类型',
  PRIMARY KEY (`distributer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer` VALUES (1, '粒子公司', NULL, NULL, 1);
INSERT INTO `nx_distributer` VALUES (2, '王芳', NULL, NULL, 2);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_community
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_community`;
CREATE TABLE `nx_distributer_community` (
  `nx_DC_id` int(20) NOT NULL COMMENT '批发商社区id',
  `nx_DC_community_id` int(20) DEFAULT NULL,
  `nx_DC_distributer_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_DC_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

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
-- Table structure for nx_distributer_father_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_father_goods`;
CREATE TABLE `nx_distributer_father_goods` (
  `nx_dfg_id` int(20) NOT NULL AUTO_INCREMENT,
  `DFG_goods_father_id` int(20) DEFAULT NULL,
  `DFG_distributer_id` int(20) DEFAULT NULL,
  `DFG_goods_father_img` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `DFG_goods_amount` int(10) DEFAULT NULL,
  `DFG_goods_father_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `DFG_goods_sort` int(10) DEFAULT NULL,
  `DFG_goods_father_color` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_dfg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_father_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_father_goods` VALUES (6, 111, 1, 'uploadImage/1.jpg', 21, '根茎类', 1, '#20afb8');
INSERT INTO `nx_distributer_father_goods` VALUES (7, 112, 1, 'uploadImage/2.jpg', 20, '葱姜蒜椒', 2, '#20afb8');
INSERT INTO `nx_distributer_father_goods` VALUES (8, 113, 1, 'uploadImage/3.jpg', 37, '茄果瓜类', 3, '#20afb8');
INSERT INTO `nx_distributer_father_goods` VALUES (9, 114, 1, 'uploadImage/4.jpg', 41, '叶菜类', 4, '#20afb8');
INSERT INTO `nx_distributer_father_goods` VALUES (10, 115, 1, 'uploadImage/5.jpg', 7, '鲜菌菇', 5, '#20afb8');
INSERT INTO `nx_distributer_father_goods` VALUES (11, 132, 1, 'uploadImage/6.jpg', 5, '鱼类', 6, '#20afb8');
INSERT INTO `nx_distributer_father_goods` VALUES (12, 141, 1, 'uploadImage/7.jpg', 4, '猪肉', 7, '#20afb8');
INSERT INTO `nx_distributer_father_goods` VALUES (13, 311, 1, 'uploadImage/8.jpg', 9, '黄豆制品', 8, '#3cc36e');
COMMIT;

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
  `dg_goods_file_path` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品图片',
  `dg_goods_sell_type` tinyint(2) DEFAULT NULL COMMENT '批发商商品销售规格模式0按standardname销售，1 按自己的规格销售',
  `dg_goods_father_id` int(20) DEFAULT NULL COMMENT '父类id',
  `dg_goods_father_img` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT 'image',
  `dg_goods_total_hits` int(10) DEFAULT NULL,
  `dg_purchase_quantity` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购数量',
  `dg_goods_buy_type` tinyint(2) DEFAULT NULL COMMENT '进货方式',
  `dg_buy_purchase_user_id` int(20) DEFAULT NULL,
  `dg_buy_app_id` int(20) DEFAULT NULL COMMENT 'App订货供货商appid',
  `dg_buy_status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`dis_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_goods` VALUES (72, 1, 45096, 1, NULL, 2.0, 0, 'uploadImage/blb.jpg', 1, 111, '../../images/1.jpg', 1, '10', NULL, 1, NULL, 1);
INSERT INTO `nx_distributer_goods` VALUES (73, 1, 45097, 0, NULL, 5.0, 0, 'uploadImage/bbb.jpg', 1, 111, '../../images/1.jpg', 3, '3', NULL, 2, NULL, 2);
INSERT INTO `nx_distributer_goods` VALUES (74, 1, 45094, 0, NULL, 2.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, '9', NULL, 1, NULL, 2);
INSERT INTO `nx_distributer_goods` VALUES (75, 1, 45104, 0, NULL, 3.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (76, 1, 45105, 0, NULL, 2.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (77, 1, 45107, 0, NULL, 3.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, '5', NULL, NULL, NULL, 1);
INSERT INTO `nx_distributer_goods` VALUES (78, 1, 45103, 0, NULL, 5.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, '3', NULL, 1, NULL, 2);
INSERT INTO `nx_distributer_goods` VALUES (79, 1, 45098, 0, NULL, 2.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (80, 1, 45099, 0, NULL, 3.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, '5dag', NULL, NULL, NULL, 1);
INSERT INTO `nx_distributer_goods` VALUES (81, 1, 45108, 0, NULL, 2.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (83, 1, 45101, 0, NULL, 12.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (84, 1, 44678, 0, NULL, 1.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, '20', NULL, NULL, NULL, 1);
INSERT INTO `nx_distributer_goods` VALUES (85, 1, 45092, 0, NULL, 2.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, '3', NULL, 2, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (86, 1, 45102, 0, NULL, 13.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (87, 1, 45095, 0, NULL, 3.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (88, 1, 45100, 0, NULL, 3.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, '3斤', NULL, NULL, NULL, 1);
INSERT INTO `nx_distributer_goods` VALUES (89, 1, 45093, 0, NULL, 3.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (90, 1, 45106, 0, NULL, 3.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (91, 1, 45109, 0, NULL, 5.0, 0, NULL, 0, 111, '../../images/1.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (93, 1, 45114, 0, NULL, 1.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, '1', NULL, 1, NULL, 0);
INSERT INTO `nx_distributer_goods` VALUES (94, 1, 45126, 0, NULL, 9.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, '5', NULL, 1, NULL, 2);
INSERT INTO `nx_distributer_goods` VALUES (95, 1, 45117, 0, NULL, 6.0, 0, 'uploadImage/dasuan.jpg', 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (96, 1, 45112, 0, NULL, 1.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (97, 1, 45113, 0, NULL, 1.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (98, 1, 45124, 0, NULL, 5.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (99, 1, 45116, 0, NULL, 6.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (100, 1, 45110, 0, NULL, 3.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (101, 1, 45127, 0, NULL, 5.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (102, 1, 45129, 0, NULL, 4.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (103, 1, 45121, 0, NULL, 7.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (104, 1, 45119, 0, NULL, 8.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (105, 1, 45122, 0, NULL, 6.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (106, 1, 45111, 0, NULL, 3.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (107, 1, 45115, 0, NULL, 1.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (108, 1, 45128, 0, NULL, 2.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (109, 1, 45123, 0, NULL, 3.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (110, 1, 45125, 0, NULL, 9.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (111, 1, 45118, 0, NULL, 5.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (112, 1, 45120, 0, NULL, 3.0, 0, NULL, 0, 112, '../../images/2.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (113, 1, 45146, 0, NULL, 6.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (114, 1, 45160, 0, NULL, 4.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (115, 1, 45159, 0, NULL, 3.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (116, 1, 45148, 0, NULL, 6.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (117, 1, 45163, 0, NULL, 8.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (118, 1, 45138, 0, NULL, 1.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (119, 1, 45139, 0, NULL, 0.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (120, 1, 45145, 0, NULL, 5.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (121, 1, 45130, 0, NULL, 3.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (122, 1, 45131, 0, NULL, 6.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (123, 1, 45155, 0, NULL, 1.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (124, 1, 45132, 0, NULL, 1.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (125, 1, 45133, 0, NULL, 2.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (126, 1, 45134, 0, NULL, 5.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (127, 1, 45164, 0, NULL, 3.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (128, 1, 45141, 0, NULL, 3.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (129, 1, 45137, 0, NULL, 1.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (130, 1, 45147, 0, NULL, 5.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (131, 1, 45158, 0, NULL, 1.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (132, 1, 45151, 0, NULL, 6.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (133, 1, 45143, 0, NULL, 3.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (134, 1, 45150, 0, NULL, 8.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (135, 1, 45153, 0, NULL, 1.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (136, 1, 45135, 0, NULL, 3.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (137, 1, 45136, 0, NULL, 5.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (138, 1, 45152, 0, NULL, 4.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (139, 1, 45142, 0, NULL, 1.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (140, 1, 45162, 0, NULL, 6.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (141, 1, 45140, 0, NULL, 1.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (142, 1, 45156, 0, NULL, 3.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (143, 1, 45144, 0, NULL, 3.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (144, 1, 45149, 0, NULL, 11.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (145, 1, 45161, 0, NULL, 2.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (146, 1, 45157, 0, NULL, 2.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (147, 1, 45154, 0, NULL, 4.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (148, 1, 45192, 0, NULL, 1.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (149, 1, 45168, 0, NULL, 1.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (150, 1, 45197, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (151, 1, 45204, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (152, 1, 45165, 0, NULL, 1.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (153, 1, 45195, 0, NULL, 1.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (154, 1, 45171, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (155, 1, 45176, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (156, 1, 45181, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (157, 1, 45190, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (158, 1, 45174, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (159, 1, 45200, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (160, 1, 45194, 0, NULL, 4.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (161, 1, 45196, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (162, 1, 45199, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (163, 1, 45202, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (164, 1, 45203, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (165, 1, 45178, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (166, 1, 45198, 0, NULL, 11.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (167, 1, 45205, 0, NULL, 10.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (168, 1, 45187, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (169, 1, 45167, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (170, 1, 45188, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (171, 1, 45177, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (172, 1, 45189, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (173, 1, 45169, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (174, 1, 45201, 0, NULL, 9.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (175, 1, 45166, 0, NULL, 4.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (176, 1, 45175, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (177, 1, 45185, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (178, 1, 45173, 0, NULL, 4.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (179, 1, 45193, 0, NULL, 11.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (180, 1, 45183, 0, NULL, 18.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (181, 1, 45182, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (182, 1, 45191, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (183, 1, 45170, 0, NULL, 0.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (184, 1, 45184, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (185, 1, 45172, 0, NULL, 3.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (186, 1, 45186, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (187, 1, 45180, 0, NULL, 2.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (188, 1, 45179, 0, NULL, 4.0, 0, NULL, 0, 114, '../../images/4.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (189, 1, 45208, 0, NULL, 5.0, 0, NULL, 0, 115, '../../images/5.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (190, 1, 45211, 0, NULL, 12.0, 0, NULL, 0, 115, '../../images/5.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (191, 1, 45212, 0, NULL, 5.0, 0, NULL, 0, 115, '../../images/5.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (192, 1, 45209, 0, NULL, 12.0, 0, NULL, 0, 115, '../../images/5.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (193, 1, 45206, 0, NULL, 6.0, 0, NULL, 0, 115, '../../images/5.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (194, 1, 45210, 0, NULL, 6.0, 0, NULL, 0, 115, '../../images/5.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (195, 1, 45207, 0, NULL, 5.0, 0, NULL, 0, 115, '../../images/5.jpg', 0, '8', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (196, 1, 45326, 0, NULL, 7.0, 0, NULL, 0, 132, 'null', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (197, 1, 45327, 0, NULL, 8.0, 0, NULL, 0, 132, 'null', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (198, 1, 45325, 0, NULL, 6.0, 0, NULL, 0, 132, 'null', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (199, 1, 45349, 0, NULL, 12.0, 0, NULL, 0, 132, 'null', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (200, 1, 45350, 0, NULL, 10.0, 0, NULL, 0, 132, 'null', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (201, 1, 45413, 0, NULL, 30.0, 0, NULL, 0, 141, 'null', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (202, 1, 45396, 0, NULL, 25.0, 0, NULL, 0, 141, 'null', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (203, 1, 45411, 0, NULL, 19.0, 0, NULL, 0, 141, 'null', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (204, 1, 45160, 0, NULL, 5.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (205, 1, 45148, 0, NULL, 9.0, 0, NULL, 0, 113, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (206, 1, 31111, 0, NULL, 3.0, 5, NULL, 0, 311, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (207, 1, 31112, 0, NULL, 4.0, 0, NULL, 0, 311, '../../images/3.jpg', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (208, 1, 31112, 0, NULL, 3.0, 3, NULL, NULL, 311, 'null', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (209, 1, 31111, 0, NULL, 4.0, 0, NULL, NULL, 311, 'null', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (210, 1, 31111, 0, NULL, 3.0, 0, NULL, NULL, 311, 'null', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (211, 1, 31111, 0, NULL, 34.0, 0, NULL, NULL, 311, 'null', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (212, 1, 31111, 0, NULL, 4.0, 0, NULL, NULL, 311, 'null', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_goods` VALUES (213, 1, 45395, 0, NULL, NULL, 0, NULL, NULL, 141, 'uploadImage/7.jpg', NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_standard
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_standard`;
CREATE TABLE `nx_distributer_standard` (
  `nx_distributer_standard_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DS_dis_goods_id` int(20) DEFAULT NULL,
  `nx_DS_standard_name` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DS_standard_file_path` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DS_standard_scale` float(4,1) DEFAULT NULL,
  `nx_DS_standard_error` float(4,1) DEFAULT NULL,
  `nx_DS_standard_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_standard
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_standard` VALUES (1, 72, '根', 'uploadImage/1gen.jpg', 1.3, 0.2, 1);
INSERT INTO `nx_distributer_standard` VALUES (2, 72, '箱', 'uploadImage/1gen.jpg', 20.0, 0.5, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_user`;
CREATE TABLE `nx_distributer_user` (
  `dis_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商用户id',
  `DU_wx_nick_name` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商用户微信昵称',
  `DU_wx_avatar_url` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `DU_wx_gender` int(2) DEFAULT NULL,
  `DU_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `DU_open_id` varchar(40) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `DU_user_short_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '拣货员工简称',
  PRIMARY KEY (`dis_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_user
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_user` VALUES (1, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', 2, 1, 'obVuH5Dll_F4Okq8YT5zs9UMz-Ug', NULL);
INSERT INTO `nx_distributer_user` VALUES (2, '李君2', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH9Tibwka8Z2xH4tU8xhW0f6hXs7ib8aAswStBUoiaPibVVq5icnNBJzbaSMgzbNGcwQe1ib2uVW7d8Byw/132', 2, 1, 'obVuH5Dll_F4Okq8YT5zs9UMz-Ug', NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_user_role
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_user_role`;
CREATE TABLE `nx_distributer_user_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` int(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of nx_distributer_user_role
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_user_role` VALUES (2, 1, 3);
INSERT INTO `nx_distributer_user_role` VALUES (3, 2, 3);
INSERT INTO `nx_distributer_user_role` VALUES (4, 1, 1);
INSERT INTO `nx_distributer_user_role` VALUES (5, 1, 5);
INSERT INTO `nx_distributer_user_role` VALUES (6, 2, 5);
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
  PRIMARY KEY (`nx_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45517 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_goods` VALUES (1, '生鲜', '', '', NULL, NULL, NULL, NULL, 0, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (2, '粮油调味', '', '', NULL, NULL, NULL, NULL, 0, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (3, '食品', '', '', NULL, NULL, NULL, NULL, 0, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (4, '冷饮冻食', '', '', NULL, NULL, NULL, NULL, 0, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (5, '酒类', '', '', NULL, NULL, NULL, NULL, 0, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (6, '服装厨具', '', '', NULL, NULL, NULL, NULL, -1, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (7, '一次性用品', '', '', NULL, NULL, NULL, NULL, -1, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (8, '会员美食吧', '', '', NULL, NULL, NULL, NULL, 0, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (11, '新鲜蔬菜', '', '', NULL, NULL, NULL, NULL, 1, 1, '');
INSERT INTO `nx_goods` VALUES (12, '新鲜水果', '', '', NULL, NULL, NULL, NULL, 1, 2, '');
INSERT INTO `nx_goods` VALUES (13, '海鲜水产', '', '', NULL, NULL, NULL, NULL, 1, 3, '');
INSERT INTO `nx_goods` VALUES (14, '肉禽蛋', '', '', NULL, NULL, NULL, NULL, 1, 4, '');
INSERT INTO `nx_goods` VALUES (21, '米', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (22, '食用油', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (23, '面', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (24, '杂粮', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (25, '调味品', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (26, '南北干货', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (27, '方便食品', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (28, '烘培原料', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (29, '有机食品', '', '', NULL, NULL, NULL, NULL, 2, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (31, '豆制品', '', '', NULL, NULL, NULL, NULL, 3, 5, '');
INSERT INTO `nx_goods` VALUES (32, '半加工食品', NULL, '', NULL, NULL, NULL, NULL, 3, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (33, '主食', '', '', NULL, NULL, NULL, NULL, 3, 6, '');
INSERT INTO `nx_goods` VALUES (34, '干果食品', '', '', NULL, NULL, NULL, NULL, 3, 8, '8.jpg');
INSERT INTO `nx_goods` VALUES (35, '进口食品', '', '', NULL, NULL, NULL, NULL, 3, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (36, '休闲食品', '', '', NULL, NULL, NULL, NULL, 3, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (41, '火锅丸串', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (42, '水饺/馄饨', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (43, '汤圆/元宵', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (44, '面点', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45, '烘培半成品', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (46, '奶酪/黄油', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (47, '方便速食', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (48, '冷藏饮料/低温奶', NULL, '', NULL, NULL, NULL, NULL, 4, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (51, '白酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (52, '葡萄酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (53, '啤酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (54, '洋酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (55, '黄酒/养生酒', NULL, '', NULL, NULL, NULL, NULL, 5, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (81, '火锅', '', '', NULL, NULL, NULL, NULL, 8, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (82, '水果拼箱', '', '', NULL, NULL, NULL, NULL, 8, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (83, '喝点小食', NULL, '', NULL, NULL, NULL, NULL, 8, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (111, '根茎类', '', '', NULL, NULL, NULL, NULL, 11, 1, 'uploadImage/1.jpg');
INSERT INTO `nx_goods` VALUES (112, '葱姜蒜椒', '', '', NULL, NULL, NULL, NULL, 11, 2, 'uploadImage/2.jpg');
INSERT INTO `nx_goods` VALUES (113, '茄果瓜类', '', '', NULL, NULL, NULL, NULL, 11, 3, 'uploadImage/3.jpg');
INSERT INTO `nx_goods` VALUES (114, '叶菜类', '', '', NULL, NULL, NULL, NULL, 11, 4, 'uploadImage/4.jpg');
INSERT INTO `nx_goods` VALUES (115, '鲜菌菇', '', '', NULL, NULL, NULL, NULL, 11, 5, 'uploadImage/5.jpg');
INSERT INTO `nx_goods` VALUES (116, '产地直供', NULL, '', NULL, NULL, NULL, NULL, 11, 6, '');
INSERT INTO `nx_goods` VALUES (121, '国产水果', NULL, '', NULL, NULL, NULL, NULL, 12, 1, '');
INSERT INTO `nx_goods` VALUES (122, '进口水果', NULL, '', NULL, NULL, NULL, NULL, 12, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (123, '地方特产', NULL, '', NULL, NULL, NULL, NULL, 12, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (131, '虾类', NULL, '', NULL, NULL, NULL, NULL, 13, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (132, '鱼类', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/6.jpg');
INSERT INTO `nx_goods` VALUES (133, '蟹类', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (134, '贝罗类', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (135, '海参', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (136, '鱿鱼', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (137, '三文鱼', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (138, '大闸蟹', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (139, '小龙虾', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (141, '猪肉', NULL, '', NULL, NULL, NULL, NULL, 14, 1, 'uploadImage/7.jpg');
INSERT INTO `nx_goods` VALUES (142, '牛肉', '', '', NULL, NULL, NULL, NULL, 14, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (143, '羊肉', '', '', NULL, NULL, NULL, NULL, 14, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (144, '鸡鸭鸽', NULL, '', NULL, NULL, NULL, NULL, 14, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (145, '蛋', NULL, '', NULL, NULL, NULL, NULL, 14, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (311, '黄豆制品', NULL, NULL, NULL, NULL, NULL, NULL, 31, 1, 'uploadImage/8.jpg');
INSERT INTO `nx_goods` VALUES (312, '绿豆制品', NULL, NULL, NULL, NULL, NULL, NULL, 31, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (1391, '海鲜加工品', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (1392, '海产干货', NULL, '', NULL, NULL, NULL, NULL, 13, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (31111, '卤水豆腐', '斤', '', NULL, NULL, 'lushui', 'ls', 311, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (31112, '老豆腐', '斤', NULL, NULL, NULL, 'laofoufu', 'ldf', 311, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (31113, '嫩豆腐', '斤', NULL, NULL, NULL, 'nendoufu', 'ndf', 311, NULL, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (44678, '土豆', '斤', '小个头', '无', '冀', 'tudou', 'td', 111, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45092, '土豆', '斤', '大个头', '无', '冀', 'tudou', 'td', 111, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45093, '新土豆', '斤', '', '无', '粤惠州', 'xintudou', 'xtd', 111, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45094, '胡萝卜', '斤', '山东新鲜', '无', '', 'huluobu', 'hlb', 111, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45095, '心里美', '斤', '', '无', '普通', 'xinlimei', 'xlm', 111, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45096, '白萝卜', '斤', '山东,四川', '无', '冀|川', 'bailuobu', 'blb', 111, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45097, '卞萝卜', '斤', '', '无', '', 'bianluobu', 'blb', 111, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45098, '青萝卜', '斤', '', '无', '鲁|津', 'qingluobu', 'qlb', 111, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45099, '水萝卜', '斤', '', '无', '鲁', 'shuiluobu', 'slb', 111, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45100, '莴笋', '斤', '', '无', '闽|浙', 'wosun', 'ws', 111, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45101, '山药', '斤', '', '无', '脆|麻新', 'shanyao', 'sy', 111, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45102, '铁棍山药', '斤', '', '无', '普通', 'tiegunshanyao', 'tgsy', 111, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45103, '藕', '斤', '', '无', '苏|津', 'ou', 'o', 111, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45104, '红薯', '斤', '', '无', '冀', 'hongshu', 'hs', 111, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45105, '红薯', '斤', '', '无', '烟薯新粤', 'hongshu', 'hs', 111, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45106, '芋头', '斤', '山东', '无', '鲁', 'yutou', 'yt', 111, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45107, '凉薯', '斤', '广东', '无', '粤', 'liangshu', 'ls', 111, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45108, '水萝卜', '斤', '水菜', '无', '', 'shuiluobu', 'slb', 111, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45109, '樱桃萝卜', '斤', '水菜', '无', '', 'yingtaoluobu', 'ytlb', 111, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45110, '尖椒', '斤', '四川,广东', '无', '闽粤', 'jianjiao', 'jj', 112, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45111, '柿子椒', '斤', '', '无', '闵粤', 'shizijiao', 'szj', 112, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45112, '黄葱头', '斤', '', '无', '蒙甘', 'huangcongtou', 'hct', 112, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45113, '红葱头', '斤', '', '无', '云新|存', 'hongcongtou', 'hct', 112, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45114, '葱', '斤', '', '无', '浙闽沪', 'cong', 'c', 112, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45115, '小葱', '斤', '', '无', '普通', 'xiaocong', 'xc', 112, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45116, '姜', '斤', '', '无', '普通', 'jiang', 'j', 112, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45117, '大蒜', '斤', '', '无', '老蒜', 'dasuan', 'ds', 112, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45118, '新蒜', '斤', '', '无', '云', 'xinsuan', 'xs', 112, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45119, '蒜苗', '斤', '', '无', '存', 'suanmiao', 'sm', 112, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45120, '紫菜苔', '斤', '', '无', '普通', 'zicaitai', 'zct', 112, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45121, '蒜黄', '斤', '', '无', '冀', 'suanhuang', 'sh', 112, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45122, '蒜米', '斤', '', '无', '普通', 'suanmi', 'sm', 112, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45123, '线椒', '斤', '', '无', '普通', 'xianjiao', 'xj', 112, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45124, '杭椒', '斤', '', '无', '普通', 'hangjiao', 'hj', 112, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45125, '小米椒', '斤', '', '无', '普通', 'xiaomijiao', 'xmj', 112, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45126, '彩椒', '斤', '红,黄', '无', '红|黄', 'caijiao', 'cj', 112, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45127, '青蒜', '斤', '', '无', '川', 'qingsuan', 'qs', 112, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45128, '香葱', '斤', '水菜', '无', '', 'xiangcong', 'xc', 112, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45129, '青蒜', '斤', '水菜', '无', '', 'qingsuan', 'qs', 112, 20, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45130, '番茄', '斤', '', '无', '冀|甘川', 'fanqie', 'fq', 113, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45131, '番茄', '斤', '辽|箱辽', '无', '精品', 'fanqie', 'fq', 113, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45132, '黄瓜', '斤', '', '无', '辽|箱辽', 'huanggua', 'hg', 113, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45133, '黄瓜', '斤', '京鲜花', '无', '京鲜花', 'huanggua', 'hg', 113, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45134, '黄瓜', '斤', '旱|荷兰', '无', '旱|荷兰', 'huanggua', 'hg', 113, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45135, '茄子', '斤', '', '无', '蒙冀云', 'qiezi', 'qz', 113, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45136, '茄子', '斤', '云南精品', '', '云', 'qiezi', 'qz', 113, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45137, '架豆', '斤', '云南', '无', '云', 'jiadou', 'jd', 113, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45138, '吊冬瓜', '斤', '', '无', '琼桂', 'diaodonggua', 'ddg', 113, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45139, '地冬瓜', '斤', '', '无', '新', 'didonggua', 'ddg', 113, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45140, '西胡芦', '斤', '', '无', '云桂', 'xihulu', 'xhl', 113, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45141, '菜花', '斤', '', '无', '云沪川', 'caihua', 'ch', 113, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45142, '散菜花', '斤', '', '无', '浙闽', 'sancaihua', 'sch', 113, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45143, '绿菜花', '斤', '', '无', '云', 'lücaihua', 'lch', 113, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45144, '小毛冬瓜', '斤', '', '无', '储存长|圆新', 'xiaomaodonggua', 'xmdg', 113, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45145, '豆王', '斤', '', '无', '云|鲁', 'douwang', 'dw', 113, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45146, '扁豆', '斤', '', '无', '云|鲁新', 'biandou', 'bd', 113, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45147, '豇豆', '斤', '', '无', '云|琼', 'jiangdou', 'jd', 113, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45148, '白不老', '斤', '', '无', '云', 'baibulao', 'bbl', 113, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45149, '油豆', '斤', '', '无', '云箱', 'youdou', 'yd', 113, 20, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45150, '毛豆', '斤', '', '无', '越|闽', 'maodou', 'md', 113, 21, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45151, '苦瓜', '斤', '', '无', '鲁', 'kugua', 'kg', 113, 22, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45152, '丝瓜', '斤', '北京|山东', '无', '京|鲁', 'sigua', 'sg', 113, 23, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45153, '南北瓜', '斤', '', '无', '冀|琼', 'nanbeigua', 'nbg', 113, 24, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45154, '长茄', '斤', '', '无', '海城|绥中', 'zhangqie', 'zq', 113, 25, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45155, '广茄', '斤', '', '无', '冀|云', 'guangqie', 'gq', 113, 26, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45156, '线茄', '斤', '', '无', '粤云', 'xianqie', 'xq', 113, 27, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45157, '紫甘蓝', '斤', '', '无', '云闽', 'ziganlan', 'zgl', 113, 28, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45158, '金丝南瓜', '斤', '', '无', '琼|吊瓜', 'jinsinangua', 'jsng', 113, 29, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45159, '板栗南瓜', '斤', '', '无', '普通', 'banlinangua', 'blng', 113, 30, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45160, '荸荠', '斤', '', '无', '皖', 'biji', 'bj', 113, 31, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45161, '玉米', '斤', '', '无', '黄|花', 'yumi', 'ym', 113, 32, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45162, '豌豆', '斤', '', '无', '云', 'wandou', 'wd', 113, 33, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45163, '冬春笋', '斤', '', '无', '闽', 'dongchunsun', 'dcs', 113, 34, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45164, '花生', '斤', '', '无', '豫存', 'huasheng', 'hs', 113, 35, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45165, '大白菜', '斤', '', '无', '冀豫', 'dabaicai', 'dbc', 114, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45166, '娃娃菜', '斤', '', '无', '冀云豫鲁', 'wawacai', 'wwc', 114, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45167, '芹菜', '斤', '', '无', '津|鲁', 'qincai', 'qc', 114, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45168, '菠菜', '斤', '', '无', '鲁|冀', 'bocai', 'bc', 114, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45169, '团生菜', '斤', '', '无', '云|冀', 'tuanshengcai', 'tsc', 114, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45170, '圆白菜', '斤', '', '无', '扁|川', 'yuanbaicai', 'ybc', 114, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45171, '甘蓝', '斤', '', '无', '冀|鲁', 'ganlan', 'gl', 114, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45172, '油菜', '斤', '', '无', '冀鲁|云', 'youcai', 'yc', 114, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45173, '香菜', '斤', '', '无', '存|冀', 'xiangcai', 'xc', 114, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45174, '韭菜', '斤', '', '无', '冀', 'jiucai', 'jc', 114, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45175, '小白菜', '斤', '', '无', '普通', 'xiaobaicai', 'xbc', 114, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45176, '茴香', '斤', '', '无', '冀', 'huixiang', 'hx', 114, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45177, '散叶生菜', '斤', '', '无', '普通', 'sanyeshengcai', 'sysc', 114, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45178, '苦菊', '斤', '', '无', '辽', 'kuju', 'kj', 114, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45179, '樱西', '斤', '小红', '无', '小红', 'yingxi', 'yx', 114, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45180, '油麦菜', '斤', '', '无', '辽', 'youmaicai', 'ymc', 114, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45181, '黄心菜', '斤', '', '无', '皖', 'huangxincai', 'hxc', 114, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45182, '西芹', '斤', '', '无', '辽', 'xiqin', 'xq', 114, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45183, '香椿', '斤', '四川', '无', '川', 'xiangchun', 'xc', 114, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45184, '油菜', '斤', '水菜', '无', '', 'youcai', 'yc', 114, 20, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45185, '小白菜', '斤', '水菜', '无', '', 'xiaobaicai', 'xbc', 114, 21, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45186, '油麦菜', '斤', '水菜', '无', '', 'youmaicai', 'ymc', 114, 22, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45187, '奶白菜', '斤', '水菜', '无', '', 'naibaicai', 'nbc', 114, 23, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45188, '散生菜', '斤', '水菜', '无', '', 'sanshengcai', 'ssc', 114, 24, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45189, '茼蒿', '斤', '水菜', '无', '', 'tonghao', 'th', 114, 25, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45190, '蒿子秆', '斤', '水菜', '无', '', 'haozigan', 'hzg', 114, 26, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45191, '香芹', '斤', '水菜', '无', '', 'xiangqin', 'xq', 114, 27, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45192, '菠菜', '斤', '水菜', '无', '', 'bocai', 'bc', 114, 28, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45193, '苋菜', '斤', '水菜', '无', '', 'xiancai', 'xc', 114, 29, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45194, '菊花菜', '斤', '水菜', '无', '', 'juhuacai', 'jhc', 114, 30, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45195, '盖菜', '斤', '水菜', '无', '', 'gaicai', 'gc', 114, 31, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45196, '芥兰', '斤', '水菜', '无', '', 'jielan', 'jl', 114, 32, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45197, '菜心', '斤', '水菜', '无', '', 'caixin', 'cx', 114, 33, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45198, '空心菜', '斤', '水菜', '无', '', 'kongxincai', 'kxc', 114, 34, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45199, '鸡毛菜', '斤', '水菜', '无', '', 'jimaocai', 'jmc', 114, 35, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45200, '荠菜', '斤', '水菜', '无', '', 'jicai', 'jc', 114, 36, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45201, '豌豆苗', '斤', '水菜', '无', '', 'wandoumiao', 'wdm', 114, 37, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45202, '快菜', '斤', '水菜', '无', '', 'kuaicai', 'kc', 114, 38, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45203, '苦菊', '斤', '水菜', '无', '', 'kuju', 'kj', 114, 39, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45204, '穿心莲', '斤', '水菜', '无', '', 'chuanxinlian', 'cxl', 114, 40, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45205, '木耳菜', '斤', '水菜', '无', '', 'muercai', 'mec', 114, 41, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45206, '平菇', '斤', '水菜', '无', '', 'pinggu', 'pg', 115, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45207, '香菇', '斤', '水菜', '无', '', 'xianggu', 'xg', 115, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45208, '白玉菇', '斤', '水菜', '无', '', 'baiyugu', 'byg', 115, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45209, '口蘑', '斤', '水菜', '无', '', 'koumo', 'km', 115, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45210, '杏鲍菇', '斤', '水菜', '无', '', 'xingbaogu', 'xbg', 115, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45211, '鸡腿菇', '斤', '水菜', '无', '', 'jituigu', 'jtg', 115, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45212, '金针菇', '斤', '水菜', '无', '', 'jinzhengu', 'jzg', 115, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45213, '椰青|个', '斤', '', '无', '无', 'yeqing|ge', 'yq|g', 121, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45214, '箱装菠萝', '斤', '', '上六下六', '无', 'xiangzhuangboluo', 'xzbl', 121, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45215, '国产凤梨', '斤', '', '无', '无', 'guochanfengli', 'gcfl', 121, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45216, '圣女果', '斤', '千禧', '千禧', '无', 'shengnüguo', 'sng', 121, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45217, '百香果', '斤', '', '无', '无', 'baixiangguo', 'bxg', 121, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45218, '桑葚', '斤', '', '无', '无', 'sangshen', 'ss', 121, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45219, '白草莓', '斤', '日本淡雪', '日本淡雪', '无', 'baicaomei', 'bcm', 121, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45220, '红颜草莓', '斤', '', '无', '无', 'hongyancaomei', 'hycm', 121, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45221, '丹东九九草莓', '斤', '', '无', '无', 'dandongjiujiucaomei', 'ddjjcm', 121, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45222, '甜宝奶油草莓', '斤', '', '无', '无', 'tianbaonaiyoucaomei', 'tbnycm', 121, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45223, '巧克力草莓', '斤', '', '无', '无', 'qiaokelicaomei', 'qklcm', 121, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45224, '磨盘柿子', '斤', '', '无', '无', 'mopanshizi', 'mpsz', 121, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45225, '火龙果', '斤', '', '无', '无', 'huolongguo', 'hlg', 121, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45226, '板栗', '斤', '', '无', '无', 'banli', 'bl', 121, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45227, '木瓜', '斤', '', '无', '无', 'mugua', 'mg', 121, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45228, '柿饼', '斤', '', '无', '无', 'shibing', 'sb', 121, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45229, '甘蔗', '斤', '', '无', '无', 'ganzhe', 'gz', 121, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45230, '柠檬', '斤', '', '无', '无', 'ningmeng', 'nm', 121, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45231, '黑枣', '斤', '', '无', '无', 'heizao', 'hz', 121, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45232, '山楂', '斤', '', '无', '无', 'shanzha', 'sz', 121, 20, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45233, '灯笼果', '斤', '姑娘果', '姑娘果', '无', 'denglongguo', 'dlg', 121, 21, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45234, '鸭梨', '斤', '', '无', '无', 'yali', 'yl', 121, 22, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45235, '雪花梨', '斤', '', '无', '无', 'xuehuali', 'xhl', 121, 23, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45236, '皇冠梨', '斤', '', '', '无', 'huangguanli', 'hgl', 121, 24, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45237, '贡梨', '斤', '', '无', '无', 'gongli', 'gl', 121, 25, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45238, '南果梨', '斤', '', '无', '无', 'nanguoli', 'ngl', 121, 26, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45239, '丰水梨', '斤', '', '无', '无', 'fengshuili', 'fsl', 121, 27, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45240, '红霄梨', '斤', '', '无', '无', 'hongxiaoli', 'hxl', 121, 28, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45241, '库尔勒香梨', '斤', '', '无', '无', 'kuerlexiangli', 'kelxl', 121, 29, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45242, '红香酥梨系列', '斤', '', '无', '无', 'hongxiangsulixilie', 'hxslxl', 121, 30, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45243, '红皮梨', '斤', '', '无', '无', 'hongpili', 'hpl', 121, 31, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45244, '蜜梨', '斤', '', '无', '无', 'mili', 'ml', 121, 32, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45245, '贵妃梨', '斤', '', '无', '无', 'guifeili', 'gfl', 121, 33, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45246, '沙糖桔', '斤', '', '中果', '无', 'shatangjie', 'stj', 121, 34, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45247, '丑橘', '斤', '', '无', '无', 'chouju', 'cj', 121, 35, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45248, '脐橙', '斤', '', '无', '鄂|湘|川', 'qicheng', 'qc', 121, 36, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45249, '血橙', '斤', '二月红|中华红', '二月红|中华红', '无', 'xuecheng', 'xc', 121, 37, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45250, '沃柑', '斤', '', '无', '无', 'wogan', 'wg', 121, 38, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45251, '马水桔', '斤', '', '无', '无', 'mashuijie', 'msj', 121, 39, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45252, '芦柑', '斤', '', '无', '无', 'lugan', 'lg', 121, 40, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45253, '茂谷柑', '斤', '', '无', '无', 'maogugan', 'mgg', 121, 41, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45254, '金桔', '斤', '', '无', '无', 'jinjie', 'jj', 121, 42, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45255, '红心蜜柚', '斤', '', '无', '无', 'hongxinmiyou', 'hxmy', 121, 43, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45256, '黄果柑', '斤', '', '无', '无', 'huangguogan', 'hgg', 121, 44, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45257, '蜜柚', '斤', '', '无', '无', 'miyou', 'my', 121, 45, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45258, '伦晚', '斤', '', '无', '无', 'lunwan', 'lw', 121, 46, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45259, '油桃', '斤', '', '无', '无', 'youtao', 'yt', 121, 47, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45260, '黄油桃', '斤', '', '无', '无', 'huangyoutao', 'hyt', 121, 48, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45261, '水蜜桃', '斤', '', '无', '无', 'shuimitao', 'smt', 121, 49, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45262, '猕猴桃', '斤', '徐香', '徐香', '无', 'mihoutao', 'mht', 121, 50, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45263, '猕猴桃', '斤', '海沃德', '海沃德', '无', 'mihoutao', 'mht', 121, 51, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45264, '麒麟西瓜', '斤', '', '无', '无', 'qilinxigua', 'qlxg', 121, 52, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45265, '黑美人', '斤', '', '无', '无', 'heimeiren', 'hmr', 121, 53, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45266, '小兰.特小凤', '斤', '', '无', '无', 'xiaolan.texiaofeng', 'xl.txf', 121, 54, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45267, '甜王', '斤', '', '无', '无', 'tianwang', 'tw', 121, 55, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45268, '国产香蕉', '斤', '', '无', '无', 'guochanxiangjiao', 'gcxj', 121, 56, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45269, '香蕉', '斤', '南美菲律宾', '', '南美菲律宾', 'xiangjiao', 'xj', 121, 57, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45270, '泰国香蕉', '斤', '', '无', '无', 'taiguoxiangjiao', 'tgxj', 121, 58, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45271, '国产皇帝香蕉', '斤', '', '无', '无', 'guochanhuangdixiangjiao', 'gchdxj', 121, 59, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45272, '哈密瓜', '斤', '', '无', '无', 'hamigua', 'hmg', 121, 60, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45273, '晓蜜25号', '斤', '', '无', '无', 'xiaomi25hao', 'xm25h', 121, 61, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45274, '黄金瓜甜瓜', '斤', '金蜜', '金蜜', '无', 'huangjinguatiangua', 'hjgtg', 121, 62, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45275, '网纹甜瓜', '斤', '', '无', '无', 'wangwentiangua', 'wwtg', 121, 63, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45276, '长香玉甜瓜', '斤', '', '无', '无', 'zhangxiangyutiangua', 'zxytg', 121, 64, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45277, '玉姑甜瓜', '斤', '', '无', '无', 'yugutiangua', 'ygtg', 121, 65, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45278, '羊角蜜甜瓜', '斤', '', '无', '无', 'yangjiaomitiangua', 'yjmtg', 121, 66, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45279, '花蕾甜瓜', '斤', '', '无', '无', 'hualeitiangua', 'hltg', 121, 67, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45280, '西州密甜瓜', '斤', '', '无', '无', 'xizhoumitiangua', 'xzmtg', 121, 68, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45281, '绿宝甜瓜', '斤', '', '无', '无', 'lübaotiangua', 'lbtg', 121, 69, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45282, '博阳九号甜瓜', '斤', '', '无', '无', 'boyangjiuhaotiangua', 'byjhtg', 121, 70, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45283, '白糖罐甜瓜', '斤', '', '无', '无', 'baitangguantiangua', 'btgtg', 121, 71, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45284, '富士苹果', '斤', '纸袋Φ70-84', '', '无', 'fushipingguo', 'fspg', 121, 72, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45285, '富士苹果', '斤', '纸+膜袋', '', '无', 'fushipingguo', 'fspg', 121, 73, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45286, '富士苹果', '斤', '纸袋Φ85以上', '', '无', 'fushipingguo', 'fspg', 121, 74, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45287, '黄元帅苹果', '斤', '', '无', '无', 'huangyuanshuaipingguo', 'hyspg', 121, 75, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45288, '花牛苹果', '斤', 'Φ70-85', '', '无', 'huaniupingguo', 'hnpg', 121, 76, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45289, '新疆阿克苏', '斤', '冰糖心', '冰糖心', '无', 'xinjiangakesu', 'xjaks', 121, 77, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45290, '国光苹果', '斤', '', '无', '无', 'guoguangpingguo', 'ggpg', 121, 78, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45291, '辽宁寒富苹果', '斤', '', '无', '无', 'liaoninghanfupingguo', 'lnhfpg', 121, 79, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45292, '红提葡萄', '斤', '', '无', '无', 'hongtiputao', 'htpt', 121, 80, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45293, '阳光玫瑰葡萄', '斤', '', '无', '无', 'yangguangmeiguiputao', 'ygmgpt', 121, 81, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45294, '克伦生葡萄', '斤', '', '无', '无', 'kelunshengputao', 'klspt', 121, 82, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45295, '黑提葡萄', '斤', '夏黑', '夏黑', '无', 'heitiputao', 'htpt', 121, 83, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45296, '玫瑰香葡萄', '斤', '', '无', '无', 'meiguixiangputao', 'mgxpt', 121, 84, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45297, '红宝石葡萄', '斤', '', '无', '无', 'hongbaoshiputao', 'hbspt', 121, 85, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45298, '贵妃青葡萄', '斤', '', '无', '无', 'guifeiqingputao', 'gfqpt', 121, 86, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45299, '生台农小芒果', '斤', '', '无', '无', 'shengtainongxiaomangguo', 'stnxmg', 121, 87, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45300, '生台农大芒果', '斤', '', '无', '无', 'shengtainongdamangguo', 'stndmg', 121, 88, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45301, '红金龙芒果', '斤', '', '无', '无', 'hongjinlongmangguo', 'hjlmg', 121, 89, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45302, '高乐密芒果', '斤', '', '无', '无', 'gaolemimangguo', 'glmmg', 121, 90, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45303, '青皮芒果', '斤', '', '无', '无', 'qingpimangguo', 'qpmg', 121, 91, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45304, '新世纪', '斤', '澳芒', '澳芒', '无', 'xinshiji', 'xsj', 121, 92, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45305, '水仙芒果', '斤', '', '无', '无', 'shuixianmangguo', 'sxmg', 121, 93, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45306, '美早樱桃', '斤', '', '无', '无', 'meizaoyingtao', 'mzyt', 121, 94, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45307, '活白虾', '斤', '45-60头', '无', '', 'huobaixia', 'hbx', 131, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45308, '冰鲜白虾', '斤', '30-45头', '无', '', 'bingxianbaixia', 'bxbx', 131, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45309, '冰鲜白虾', '斤', '45-60头', '无', '', 'bingxianbaixia', 'bxbx', 131, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45310, '琵琶虾', '斤', '活', '无', '', 'pipaxia', 'ppx', 131, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45311, '基围虾', '斤', '20-40头', '无', '', 'jiweixia', 'jwx', 131, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45312, '基围虾', '斤', '40-60头', '无', '', 'jiweixia', 'jwx', 131, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45313, '波士顿青龙虾', '斤', '活', '无', '', 'boshidunqinglongxia', 'bsdqlx', 131, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45314, '小青龙虾', '斤', '活', '无', '', 'xiaoqinglongxia', 'xqlx', 131, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45315, '北极虾', '斤', '>100头|风冷', '无', '', 'beijixia', 'bjx', 131, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45316, '北极虾', '斤', '<100头|风冷', '无', '', 'beijixia', 'bjx', 131, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45317, '斑节虾', '斤', '冻', '无', '', 'banjiexia', 'bjx', 131, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45318, '草虾', '斤', '6头左右|冻', '无', '', 'caoxia', 'cx', 131, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45319, '明对虾', '斤', '6头|冻', '无', '', 'mingduixia', 'mdx', 131, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45320, '澳洲龙虾', '斤', '<750g', '无', '', 'aozhoulongxia', 'azlx', 131, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45321, '澳洲龙虾', '斤', '750g-1250g', '无', '', 'aozhoulongxia', 'azlx', 131, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45322, '鲤鱼', '斤', '<750g', '无', '', 'liyu', 'ly', 132, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45323, '鲤鱼', '斤', '1.5-2斤/条', '无', '', 'liyu', 'ly', 132, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45324, '鲤鱼', '斤', '2斤以上/条', '无', '', 'liyu', 'ly', 132, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45325, '草鱼', '斤', '1.5斤/条以下', '无', '', 'caoyu', 'cy', 132, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45326, '草鱼', '斤', '1.5-2斤/条', '无', '', 'caoyu', 'cy', 132, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45327, '草鱼', '斤', '2斤以上/条', '无', '', 'caoyu', 'cy', 132, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45328, '鲫鱼', '斤', '100g-150g', '无', '', 'jiyu', 'jy', 132, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45329, '鲫鱼', '斤', '200g-250g', '无', '', 'jiyu', 'jy', 132, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45330, '鲫鱼', '斤', '350g-400g', '无', '', 'jiyu', 'jy', 132, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45331, '胖头鱼', '斤', '>2000g', '无', '', 'pangtouyu', 'pty', 132, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45332, '胖头鱼', '斤', '<2000g', '无', '', 'pangtouyu', 'pty', 132, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45333, '武昌鱼', '斤', '700g左右', '无', '', 'wuchangyu', 'wcy', 132, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45334, '鲢鱼', '斤', '>1500g', '无', '', 'lianyu', 'ly', 132, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45335, '鲢鱼', '斤', '1000-1500g', '无', '', 'lianyu', 'ly', 132, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45336, '罗非鱼', '斤', '活', '无', '', 'luofeiyu', 'lfy', 132, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45337, '黑鱼', '斤', '活', '无', '', 'heiyu', 'hy', 132, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45338, '桂鱼', '斤', '标桂', '无', '', 'guiyu', 'gy', 132, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45339, '嘎鱼', '斤', '>100g', '无', '', 'gayu', 'gy', 132, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45340, '嘎鱼', '斤', '<100g', '无', '', 'gayu', 'gy', 132, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45341, '淡水鲈鱼', '斤', '活', '无', '', 'danshuiluyu', 'dsly', 132, 20, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45342, '鲟鱼', '斤', '活', '无', '', 'xunyu', 'xy', 132, 21, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45343, '国产白鲴鱼', '斤', '>250g|冻', '无', '', 'guochanbaiguyu', 'gcbgy', 132, 22, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45344, '国产白鲴鱼', '斤', '<250g|冻', '无', '', 'guochanbaiguyu', 'gcbgy', 132, 23, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45345, '燕鲅', '斤', '>300g|冻', '无', '', 'yanba', 'yb', 132, 24, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45346, '鲐鲅', '斤', '<300g|冻', '无', '', 'taiba', 'tb', 132, 25, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45347, '左偏口鱼', '斤', '<600g|冻', '无', '', 'zuopiankouyu', 'zpky', 132, 26, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45348, '鳎目鱼', '斤', '<500g|冻', '无', '', 'tamuyu', 'tmy', 132, 27, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45349, '八爪鱼', '斤', '活', '无', '', 'bazhuayu', 'bzy', 132, 28, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45350, '八爪鱼', '斤', '鲜', '无', '', 'bazhuayu', 'bzy', 132, 29, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45351, '多宝鱼', '斤', '活', '无', '', 'duobaoyu', 'dby', 132, 30, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45352, '青石斑鱼', '斤', '活', '无', '', 'qingshibanyu', 'qsby', 132, 31, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45353, '国产带鱼', '斤', '100-200g|冻', '无', '100-200g|冻', 'guochandaiyu', 'gcdy', 132, 32, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45354, '国产带鱼', '斤', '200-300g|冻', '无', '200-300g|冻', 'guochandaiyu', 'gcdy', 132, 33, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45355, '进口带鱼', '斤', '>300g|冻', '无', '>300g|冻', 'jinkoudaiyu', 'jkdy', 132, 34, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45356, '进口带鱼', '斤', '<300g|冻', '无', '<300g|冻', 'jinkoudaiyu', 'jkdy', 132, 35, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45357, '国产黄鱼', '斤', '>300g|鲜', '无', '>300g|鲜', 'guochanhuangyu', 'gchy', 132, 36, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45358, '国产黄鱼', '斤', '<300g|鲜', '无', '<300g|鲜', 'guochanhuangyu', 'gchy', 132, 37, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45359, '进口黄鱼', '斤', '>300g', '无', '>300g', 'jinkouhuangyu', 'jkhy', 132, 38, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45360, '进口黄鱼', '斤', '<300g', '无', '<300g', 'jinkouhuangyu', 'jkhy', 132, 39, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45361, '国产平鱼', '斤', '100-200g|冻', '无', '100-200g|冻', 'guochanpingyu', 'gcpy', 132, 40, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45362, '国产平鱼', '斤', '200-300g|冻', '无', '200-300g|冻', 'guochanpingyu', 'gcpy', 132, 41, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45363, '国产平鱼', '斤', '100-200g|鲜', '无', '100-200g|鲜', 'guochanpingyu', 'gcpy', 132, 42, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45364, '国产平鱼', '斤', '200-300g|鲜', '无', '200-300g|鲜', 'guochanpingyu', 'gcpy', 132, 43, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45365, '公河蟹', '斤', '100g左右', '无', '100g左右', 'gonghexie', 'ghx', 133, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45366, '公河蟹', '斤', '150g左右', '无', '150g左右', 'gonghexie', 'ghx', 133, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45367, '母河蟹', '斤', '75g左右', '无', '75g左右', 'muhexie', 'mhx', 133, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45368, '母河蟹', '斤', '125g左右', '无', '125g左右', 'muhexie', 'mhx', 133, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45369, '梭子蟹', '斤', '活', '无', '活', 'suozixie', 'szx', 133, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45370, '皇帝蟹', '斤', '活', '无', '活', 'huangdixie', 'hdx', 133, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45371, '面包蟹', '斤', '活', '无', '活', 'mianbaoxie', 'mbx', 133, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45372, '扇贝', '斤', '14-16cm|活', '地播', '14-16cm|活', 'shanbei', 'sb', 134, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45373, '扇贝', '斤', '10-14cm|活', '地播', '10-14cm|活', 'shanbei', 'sb', 134, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45374, '大香螺', '斤', '活', '无', '活', 'daxiangluo', 'dxl', 134, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45375, '角螺', '斤', '活', '无', '活', 'jiaoluo', 'jl', 134, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45376, '钉螺', '斤', '活', '无', '活', 'dingluo', 'dl', 134, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45377, '海螺丝', '斤', '活', '无', '活', 'hailuosi', 'hls', 134, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45378, '大海螺', '斤', '活', '无', '活', 'dahailuo', 'dhl', 134, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45379, '大蛏子', '斤', '>6cm|活', '无', '>6cm|活', 'dachengzi', 'dcz', 134, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45380, '大蛏子', '斤', '<6cm|活', '无', '<6cm|活', 'dachengzi', 'dcz', 134, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45381, '海虹', '斤', '活', '无', '活', 'haihong', 'hh', 134, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45382, '文蛤', '斤', '>5cm|活', '无', '', 'wenha', 'wh', 134, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45383, '文蛤', '斤', '<5cm|活', '无', '', 'wenha', 'wh', 134, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45384, '青蛤', '斤', '活', '无', '', 'qingha', 'qh', 134, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45385, '花蛤', '斤', '活', '无', '', 'huaha', 'hh', 134, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45386, '毛蚶', '斤', '活', '无', '南方', 'maohan', 'mh', 134, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45387, '毛蚶', '斤', '活', '无', '北方', 'maohan', 'mh', 134, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45388, '仿野生甲鱼', '斤', '活', '无', '', 'fangyeshengjiayu', 'fysjy', 134, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45389, '养殖甲鱼', '斤', '活', '无', '', 'yangzhijiayu', 'yzjy', 134, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45390, '蚕蛹', '斤', '活', '无', '', 'canyong', 'cy', 134, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45391, '国产鱿鱼', '斤', '带头', '无', '', 'guochanyouyu', 'gcyy', 136, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45392, '国产鱿鱼', '斤', '去头', '无', '', 'guochanyouyu', 'gcyy', 136, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45393, '进口墨鱼', '斤', '1000-1500g', '无', '', 'jinkoumoyu', 'jkmy', 136, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45394, '进口墨鱼', '斤', '50g-100g', '无', '', 'jinkoumoyu', 'jkmy', 136, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45395, '白条猪', '斤', '瘦', '', '无', 'baitiaozhu', 'btz', 141, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45396, '白条猪', '斤', '肥', '', '无', 'baitiaozhu', 'btz', 141, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45397, '前臀尖', '斤', '瘦', '', '无', 'qiantunjian', 'qtj', 141, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45398, '前臀尖', '斤', '肥', '', '无', 'qiantunjian', 'qtj', 141, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45399, '后臀尖', '斤', '瘦', '', '无', 'houtunjian', 'htj', 141, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45400, '后臀尖', '斤', '肥', '', '无', 'houtunjian', 'htj', 141, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45401, '五花肉', '斤', '瘦', '', '无', 'wuhuarou', 'whr', 141, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45402, '五花肉', '斤', '肥', '', '无', 'wuhuarou', 'whr', 141, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45403, '纯通脊', '斤', '', '无', '无', 'chuntongji', 'ctj', 141, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45404, '通脊', '斤', '', '无', '无', 'tongji', 'tj', 141, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45405, '纯瘦肉', '斤', '', '无', '无', 'chunshourou', 'csr', 141, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45406, '前肘', '斤', '', '无', '无', 'qianzhou', 'qz', 141, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45407, '后肘', '斤', '', '无', '无', 'houzhou', 'hz', 141, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45408, '猪尾巴', '斤', '', '无', '无', 'zhuweiba', 'zwb', 141, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45409, '猪蹄', '斤', '', '无', '无', 'zhuti', 'zt', 141, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45410, '纯排骨', '斤', '', '无', '无', 'chunpaigu', 'cpg', 141, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45411, '纯腔骨', '斤', '', '无', '无', 'chunqianggu', 'cqg', 141, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45412, '腔排骨', '斤', '', '无', '无', 'qiangpaigu', 'qpg', 141, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45413, '棒骨', '斤', '', '无', '无', 'banggu', 'bg', 141, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45414, '猪头', '斤', '', '无', '无', 'zhutou', 'zt', 141, 20, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45415, '猪口条', '斤', '', '无', '无', 'zhukoutiao', 'zkt', 141, 21, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45416, '猪耳', '斤', '', '无', '无', 'zhuer', 'ze', 141, 22, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45417, '猪脑', '斤', '', '无', '无', 'zhunao', 'zn', 141, 23, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45418, '猪肚', '斤', '', '无', '无', 'zhudu', 'zd', 141, 24, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45419, '猪板油', '斤', '', '无', '无', 'zhubanyou', 'zby', 141, 25, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45420, '肥膘肉', '斤', '', '无', '无', 'feibiaorou', 'fbr', 141, 26, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45421, '猪腰子', '斤', '', '无', '无', 'zhuyaozi', 'zyz', 141, 27, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45422, '护心肉', '斤', '', '无', '无', 'huxinrou', 'hxr', 141, 28, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45423, '猪心', '斤', '', '无', '无', 'zhuxin', 'zx', 141, 29, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45424, '猪肝', '斤', '', '无', '无', 'zhugan', 'zg', 141, 30, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45425, '猪肺', '个', '', '无', '无', 'zhufei', 'zf', 141, 31, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45426, '猪皮', '斤', '', '无', '无', 'zhupi', 'zp', 141, 32, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45427, '猪肠头', '斤', '', '无', '无', 'zhuchangtou', 'zct', 141, 33, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45428, '猪肠', '斤', '', '无', '无', 'zhuchang', 'zc', 141, 34, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45429, '整牛', '斤', '', '无', '无', 'zhengniu', 'zn', 142, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45430, '牛前腱', '斤', '', '无', '无', 'niuqianjian', 'nqj', 142, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45431, '牛后腱', '斤', '', '无', '无', 'niuhoujian', 'nhj', 142, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45432, '牛前腿', '斤', '', '无', '无', 'niuqiantui', 'nqt', 142, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45433, '牛后腿', '斤', '', '无', '无', 'niuhoutui', 'nht', 142, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45434, '肥牛', '斤', '', '无', '无', 'feiniu', 'fn', 142, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45435, '精肥牛', '斤', '', '无', '无', 'jingfeiniu', 'jfn', 142, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45436, '牛柳', '斤', '里脊', '', '无', 'niuliu', 'nl', 142, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45437, '精牛柳', '斤', '', '无', '无', 'jingniuliu', 'jnl', 142, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45438, '牛腩', '斤', '', '无', '无', 'niunan', 'nn', 142, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45439, '牛林', '斤', '', '无', '无', 'niulin', 'nl', 142, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45440, '牛腰子', '斤', '', '无', '无', 'niuyaozi', 'nyz', 142, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45441, '牛肚', '斤', '', '无', '无', 'niudu', 'nd', 142, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45442, '牛百叶', '斤', '', '无', '无', 'niubaiye', 'nby', 142, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45443, '牛心', '斤', '', '无', '无', 'niuxin', 'nx', 142, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45444, '牛舌', '斤', '', '无', '无', 'niushe', 'ns', 142, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45445, '牛骨', '斤', '', '无', '无', 'niugu', 'ng', 142, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45446, '牛排骨', '斤', '', '无', '无', 'niupaigu', 'npg', 142, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45447, '牛板筋', '斤', '', '无', '无', 'niubanjin', 'nbj', 142, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45448, '牛蹄筋', '斤', '', '无', '无', 'niutijin', 'ntj', 142, 20, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45449, '牛鞭', '斤', '', '无', '无', 'niubian', 'nb', 142, 21, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45450, '牛尾', '斤', '', '无', '无', 'niuwei', 'nw', 142, 22, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45451, '牛黄喉', '斤', '', '无', '无', 'niuhuanghou', 'nhh', 142, 23, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45452, '牛上脑', '斤', '', '无', '无', 'niushangnao', 'nsn', 142, 24, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45453, '整羊', '斤', '', '无', '无', 'zhengyang', 'zy', 143, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45454, '去骨羊前腿', '斤', '', '无', '无', 'quguyangqiantui', 'qgyqt', 143, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45455, '去骨羊后腿', '斤', '', '无', '无', 'quguyanghoutui', 'qgyht', 143, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45456, '羊腰窝', '斤', '', '无', '无', 'yangyaowo', 'yyw', 143, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45457, '羊肉片', '斤', '', '无', '无', 'yangroupian', 'yrp', 143, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45458, '羊腰子', '个', '挂油', '', '无', 'yangyaozi', 'yyz', 143, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45459, '羊蝎子', '斤', '', '无', '无', 'yangxiezi', 'yxz', 143, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45460, '羊蝎子', '斤', '精品', '', '无', 'yangxiezi', 'yxz', 143, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45461, '羊排骨', '斤', '', '无', '无', 'yangpaigu', 'ypg', 143, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45462, '羊尾巴油', '斤', '', '无', '无', 'yangweibayou', 'ywby', 143, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45463, '羊小腿', '斤', '羊棒', '', '无', 'yangxiaotui', 'yxt', 143, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45464, '羊肠', '斤', '', '无', '无', 'yangchang', 'yc', 143, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45465, '羊肝', '斤', '', '无', '无', 'yanggan', 'yg', 143, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45466, '羊鞭', '斤', '', '无', '无', 'yangbian', 'yb', 143, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45467, '羊肺', '斤', '', '无', '无', 'yangfei', 'yf', 143, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45468, '羊宝', '斤', '', '无', '无', 'yangbao', 'yb', 143, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45469, '羊骨头', '斤', '', '无', '无', 'yanggutou', 'ygt', 143, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45470, '羊腩', '斤', '', '无', '无', 'yangnan', 'yn', 143, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45471, '羊肚', '斤', '', '无', '无', 'yangdu', 'yd', 143, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45472, '羊里脊', '斤', '', '无', '无', 'yangliji', 'ylj', 143, 20, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45473, '淘汰鸡', '斤', '净膛', '', '无', 'taotaiji', 'ttj', 144, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45474, '淘汰鸡', '斤', '干净膛', '', '无', 'taotaiji', 'ttj', 144, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45475, '仔鸡', '斤', '净膛', '', '无', 'ziji', 'zj', 144, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45476, '肉鸡', '斤', '', '无', '无', 'rouji', 'rj', 144, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45477, '鸡胸', '斤', '', '无', '无', 'jixiong', 'jx', 144, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45478, '鸡翅', '斤', '', '无', '无', 'jichi', 'jc', 144, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45479, '鸡翅中', '斤', '', '无', '无', 'jichizhong', 'jcz', 144, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45480, '鸡边腿', '斤', '', '无', '无', 'jibiantui', 'jbt', 144, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45481, '鸡排腿', '斤', '', '无', '无', 'jipaitui', 'jpt', 144, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45482, '冻琵琶腿', '斤', '', '无', '无', 'dongpipatui', 'dppt', 144, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45483, '鸡胗', '斤', '', '无', '无', 'jizhen', 'jz', 144, 11, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45484, '鸡爪', '斤', '', '无', '无', 'jizhua', 'jz', 144, 12, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45485, '鸡心', '斤', '', '无', '无', 'jixin', 'jx', 144, 13, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45486, '鸡肝', '斤', '', '无', '无', 'jigan', 'jg', 144, 14, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45487, '鸡脖子', '斤', '带皮', '', '无', 'jibozi', 'jbz', 144, 15, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45488, '鸡脖子', '斤', '去皮', '', '无', 'jibozi', 'jbz', 144, 16, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45489, '鸡头', '斤', '', '无', '无', 'jitou', 'jt', 144, 17, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45490, '鸡架子', '斤', '', '无', '无', 'jijiazi', 'jjz', 144, 18, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45491, '鸡油', '斤', '', '无', '无', 'jiyou', 'jy', 144, 19, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45492, '鸡翅根', '斤', '', '无', '无', 'jichigen', 'jcg', 144, 20, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45493, '鸭肠', '斤', '', '无', '无', 'yachang', 'yc', 144, 21, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45494, '鸭肝', '斤', '', '无', '无', 'yagan', 'yg', 144, 22, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45495, '鸭头', '斤', '', '无', '无', 'yatou', 'yt', 144, 23, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45496, '鸭心', '斤', '', '无', '无', 'yaxin', 'yx', 144, 24, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45497, '鸭腿', '斤', '', '无', '无', 'yatui', 'yt', 144, 25, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45498, '三黄鸡', '斤', '净膛', '', '无', 'sanhuangji', 'shj', 144, 26, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45499, '白条乌鸡', '斤', '净膛', '', '无', 'baitiaowuji', 'btwj', 144, 27, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45500, '白条北京填鸭', '斤', '', '无', '无', 'baitiaobeijingtianya', 'btbjty', 144, 28, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45501, '白条湖鸭', '斤', '', '无', '无', 'baitiaohuya', 'bthy', 144, 29, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45502, '白条净膛鹅', '斤', '', '无', '无', 'baitiaojingtange', 'btjte', 144, 30, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45503, '白条大乳鸽', '只', '', '无', '无', 'baitiaodaruge', 'btdrg', 144, 31, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45504, '白条小乳鸽', '只', '', '无', '无', 'baitiaoxiaoruge', 'btxrg', 144, 32, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45505, '白条鹌鹑', '只', '', '无', '无', 'baitiaoanchun', 'btac', 144, 33, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45506, '箱鸡蛋', '斤', '', '无', '无', 'xiangjidan', 'xjd', 145, 1, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45507, '散鸡蛋', '斤', '', '无', '无', 'sanjidan', 'sjd', 145, 2, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45508, '生鸭蛋', '斤', '', '无', '无', 'shengyadan', 'syd', 145, 3, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45509, '熟鸭蛋', '斤', '', '无', '无', 'shuyadan', 'syd', 145, 4, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45510, '松花蛋', '斤', '', '无', '无', 'songhuadan', 'shd', 145, 5, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45511, '鹅蛋', '斤', '', '无', '无', 'edan', 'ed', 145, 6, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45512, '鹌鹑蛋', '斤', '', '无', '无', 'anchundan', 'acd', 145, 7, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45513, '柴鸡蛋', '斤', '', '无', '无', 'chaijidan', 'cjd', 145, 8, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45514, '乌鸡蛋', '斤', '', '无', '无', 'wujidan', 'wjd', 145, 9, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45515, '鸵鸟蛋', '个', '', '无', '无', 'tuoniaodan', 'tnd', 145, 10, 'uploadImage/logo.jpg');
INSERT INTO `nx_goods` VALUES (45516, '鸽子蛋', '个', '', '无', '无', 'gezidan', 'gzd', 145, 11, 'uploadImage/logo.jpg');
COMMIT;

-- ----------------------------
-- Table structure for nx_label
-- ----------------------------
DROP TABLE IF EXISTS `nx_label`;
CREATE TABLE `nx_label` (
  `nx_label_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_label_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
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
  `nx_label_type_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
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
  `nx_OD_file_path` varchar(300) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_OD_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_OD_customer_user_id` int(20) DEFAULT NULL,
  `nx_OD_item_amount` int(6) DEFAULT NULL,
  PRIMARY KEY (`nx_order_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_order_template
-- ----------------------------
BEGIN;
INSERT INTO `nx_order_template` VALUES (1, 'uploadImage/jia.jpg', '家庭', 1, 0);
INSERT INTO `nx_order_template` VALUES (2, 'uploadImage/pengyou.jpg', '朋友', 1, 0);
INSERT INTO `nx_order_template` VALUES (3, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.b5Oq18tooORK153295726607118a6686f1da322cdfb2.jpg', '健身', 76, 2);
INSERT INTO `nx_order_template` VALUES (4, 'uploadImage/tmp_d699a76d4e0ffd27171a574ae1bf947e.jpg', '维生素', 94, 0);
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
  `nx_OT_dis_goods_color` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_OT_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_order_template_item
-- ----------------------------
BEGIN;
INSERT INTO `nx_order_template_item` VALUES (1, 72, NULL, 3, 76, '#20afb8');
INSERT INTO `nx_order_template_item` VALUES (2, 73, NULL, 3, 76, '#20afb8');
INSERT INTO `nx_order_template_item` VALUES (3, 206, NULL, 3, 76, '#3cc36e');
INSERT INTO `nx_order_template_item` VALUES (4, 207, NULL, 3, 76, '#3cc36e');
COMMIT;

-- ----------------------------
-- Table structure for nx_orders
-- ----------------------------
DROP TABLE IF EXISTS `nx_orders`;
CREATE TABLE `nx_orders` (
  `nx_orders_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `nx_orders_department_id` int(20) DEFAULT NULL COMMENT '订单餐馆id',
  `nx_orders_customer_id` int(20) DEFAULT NULL COMMENT '订单客户id',
  `nx_orders_user_id` int(20) DEFAULT NULL COMMENT '订单用户id',
  `nx_orders_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_orders_date` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单日期',
  `nx_orders_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `nx_orders_service` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送达时间',
  `nx_orders_amount` float(10,1) DEFAULT NULL COMMENT '订单总金额',
  `nx_orders_service_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送到日期',
  `nx_orders_service_time` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送到时间',
  `nx_orders_weigh_user_id` int(20) DEFAULT NULL COMMENT '订单称重用户id',
  `nx_orders_delivery_user_id` int(20) DEFAULT NULL COMMENT '订单配送员工id',
  `nx_orders_sub_amount` int(10) DEFAULT NULL COMMENT '订单子商品数量',
  `nx_orders_sub_finished` int(10) DEFAULT NULL COMMENT '订单子商品完成数量',
  `nx_orders_weigh_number` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单称重订单号',
  `nx_orders_payment_status` tinyint(2) DEFAULT NULL COMMENT '订单支付状态',
  `nx_orders_payment_send_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单支付发送时间',
  `nx_orders_payment_time` varchar(0) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单支付时间',
  `nx_orders_type` tinyint(2) DEFAULT NULL COMMENT '订单类型 0社区1餐馆',
  PRIMARY KEY (`nx_orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_orders
-- ----------------------------
BEGIN;
INSERT INTO `nx_orders` VALUES (1, NULL, 76, 76, 1, '04-26 12:10', 0, '04261600', 22.8, '04-26', '16:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (2, NULL, 76, 76, 1, '04-26 12:17', 0, '04261600', 15.6, '04-26', '16:00', NULL, NULL, 3, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (3, NULL, 79, 79, 1, '04-26 21:53', 0, '04270900', 5.2, '04-27', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (4, NULL, 80, 80, 1, '04-26 21:56', 0, '04270900', 36.7, '04-27', '9:00', NULL, NULL, 5, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (5, NULL, 82, 82, 1, '04-26 21:59', 0, '04270900', 60.8, '04-27', '9:00', NULL, NULL, 6, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (6, NULL, 84, 84, 1, '04-26 22:02', 0, '04270900', 25.0, '04-27', '9:00', NULL, NULL, 5, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (7, NULL, 84, 84, 1, '04-26 22:02', 0, '04270900', 6.7, '04-27', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (8, NULL, 85, 85, 1, '04-26 22:04', 0, '04270900', 59.8, '04-27', '9:00', NULL, NULL, 7, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (9, NULL, 86, 86, 1, '04-26 22:24', 0, '04270900', 9.0, '04-27', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (10, NULL, 87, 87, 1, '04-26 23:19', 0, '04270900', 21.7, '04-27', '9:00', NULL, NULL, 3, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (11, NULL, 88, 88, 1, '04-26 23:21', 0, '04270900', 19.4, '04-27', '9:00', NULL, NULL, 3, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (12, NULL, 89, 89, 1, '04-26 23:26', 0, '04270900', 21.2, '04-27', '9:00', NULL, NULL, 5, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (13, NULL, 90, 90, 1, '04-27 07:57', 0, '04271600', 32.2, '04-27', '16:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (14, NULL, 89, 89, 1, '04-27 08:06', 0, '04271600', 23.0, '04-27', '16:00', NULL, NULL, 4, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (15, NULL, 89, 89, 1, '04-27 08:08', 0, '04271600', 32.0, '04-27', '16:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (16, NULL, 89, 89, 1, '04-27 08:09', 0, '04271600', 20.0, '04-27', '16:00', NULL, NULL, 3, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (17, NULL, 89, 89, 1, '04-27 08:10', 0, '04271600', 7.8, '04-27', '16:00', NULL, NULL, 1, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (18, NULL, 89, 89, 1, '04-27 08:22', 0, '04271600', 6.0, '04-27', '16:00', NULL, NULL, 1, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `nx_orders` VALUES (19, NULL, 89, 89, 1, '04-27 08:22', 0, '04271600', 999.0, '04-27', '16:00', NULL, NULL, 1, 0, NULL, 1, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_orders_sub
-- ----------------------------
DROP TABLE IF EXISTS `nx_orders_sub`;
CREATE TABLE `nx_orders_sub` (
  `nx_orders_sub_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '子订单id',
  `nx_OS_orders_id` int(11) DEFAULT NULL COMMENT '订单id',
  `nx_OS_goods_id` int(20) DEFAULT NULL COMMENT '子订单商品id',
  `nx_OS_quantity` float(10,1) DEFAULT NULL COMMENT '子订单申请数量',
  `nx_OS_standard` varchar(4) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '子订单申请规格',
  `nx_OS_price` float(10,1) DEFAULT NULL COMMENT '子订单申请商品单价',
  `nx_OS_remark` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '子订单申请备注',
  `nx_OS_weight` float(10,1) DEFAULT NULL COMMENT '子订单申请商品称重',
  `nx_OS_subtotal` float(10,1) DEFAULT NULL COMMENT '子订单申请商品小计',
  `nx_OS_status` tinyint(2) DEFAULT NULL COMMENT '子订单申请商品状态',
  `nx_OS_weigh_user_id` int(20) DEFAULT NULL COMMENT '子订单商品称重用户id',
  `nx_OS_account_user_id` int(20) DEFAULT NULL COMMENT '子订单商品输入单价用户id',
  `nx_OS_purchase_user_id` int(20) DEFAULT NULL COMMENT '子商品采购元id',
  `nx_OS_goods_father_id` int(20) DEFAULT NULL COMMENT '子订单商品父id',
  `nx_OS_distributer_id` int(20) DEFAULT NULL COMMENT '子订单批发商id',
  `nx_OS_dis_goods_id` int(20) DEFAULT NULL COMMENT '子订单批发商商品id',
  `nx_OS_buy_status` tinyint(2) DEFAULT NULL COMMENT '子订单商品进货状态',
  `nx_OS_order_user_id` int(20) DEFAULT NULL COMMENT '子订单订货用户id',
  `nx_OS_goods_sell_type` tinyint(2) DEFAULT NULL COMMENT '子订单商品销售模式0按斤1按最小规格',
  `nx_OS_goods_sell_standard_scale` float(4,1) DEFAULT NULL COMMENT '子订单商品1销售模式的比例',
  `nx_OS_sub_weight` float(4,1) DEFAULT NULL,
  PRIMARY KEY (`nx_orders_sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_orders_sub
-- ----------------------------
BEGIN;
INSERT INTO `nx_orders_sub` VALUES (1, 1, 45096, 3.0, '颗', 2.0, NULL, NULL, 7.8, 0, NULL, NULL, NULL, 111, 1, 72, 0, 76, 1, 1.3, 3.9);
INSERT INTO `nx_orders_sub` VALUES (2, 1, 45103, 3.0, '斤', 5.0, NULL, NULL, 15.0, 0, NULL, NULL, NULL, 111, 1, 78, 0, 76, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (3, 2, 45096, 1.0, '颗', 2.0, NULL, NULL, 2.6, 0, NULL, NULL, NULL, 111, 1, 72, 0, 76, 1, 1.3, 1.3);
INSERT INTO `nx_orders_sub` VALUES (4, 2, 45103, 2.0, '斤', 5.0, NULL, NULL, 10.0, 0, NULL, NULL, NULL, 111, 1, 78, 0, 76, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (5, 2, 44678, 3.0, '斤', 1.0, NULL, NULL, 3.0, 0, NULL, NULL, NULL, 111, 1, 84, 0, 76, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (6, 3, 45192, 5.3, '斤', 1.0, NULL, NULL, 1.3, 0, NULL, NULL, NULL, 114, 1, 148, 0, 79, 0, NULL, 1.3);
INSERT INTO `nx_orders_sub` VALUES (7, 3, 45174, 3.3, '斤', 3.0, NULL, NULL, 3.9, 0, NULL, NULL, NULL, 114, 1, 158, 0, 79, 0, NULL, 1.3);
INSERT INTO `nx_orders_sub` VALUES (8, 4, 45097, 3.0, '颗', 5.0, NULL, NULL, 4.5, 0, NULL, NULL, NULL, 111, 1, 73, 0, 80, 1, 0.3, 0.9);
INSERT INTO `nx_orders_sub` VALUES (9, 4, 45096, 2.0, '颗', 2.0, NULL, NULL, 5.2, 0, NULL, NULL, NULL, 111, 1, 72, 0, 80, 1, 1.3, 2.6);
INSERT INTO `nx_orders_sub` VALUES (10, 4, 45103, 3.0, '斤', 5.0, NULL, NULL, 15.0, 0, NULL, NULL, NULL, 111, 1, 78, 0, 80, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (11, 4, 45116, 1.0, '斤', 6.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 112, 1, 99, 0, 80, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (12, 4, 45111, 2.0, '斤', 3.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 112, 1, 106, 0, 80, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (13, 5, 45097, 2.0, '颗', 5.0, NULL, NULL, 3.0, 0, NULL, NULL, NULL, 111, 1, 73, 0, 82, 1, 0.3, 0.6);
INSERT INTO `nx_orders_sub` VALUES (14, 5, 45096, 3.0, '颗', 2.0, NULL, NULL, 7.8, 0, NULL, NULL, NULL, 111, 1, 72, 0, 82, 1, 1.3, 3.9);
INSERT INTO `nx_orders_sub` VALUES (15, 5, 45103, 3.0, '斤', 5.0, NULL, NULL, 15.0, 0, NULL, NULL, NULL, 111, 1, 78, 0, 82, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (16, 5, 45101, 2.0, '斤', 12.0, NULL, NULL, 24.0, 0, NULL, NULL, NULL, 111, 1, 83, 0, 82, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (17, 5, 45109, 1.0, '斤', 5.0, NULL, NULL, 5.0, 0, NULL, NULL, NULL, 111, 1, 91, 0, 82, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (18, 5, 45117, 1.0, '斤', 6.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 112, 1, 95, 0, 82, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (19, 6, 45107, 2.0, '斤', 3.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 111, 1, 77, 1, 84, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (20, 6, 45098, 1.0, '斤', 2.0, NULL, NULL, 2.0, 0, NULL, NULL, NULL, 111, 1, 79, 0, 84, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (21, 6, 44678, 3.0, '斤', 1.0, NULL, NULL, 3.0, 0, NULL, NULL, NULL, 111, 1, 84, 0, 84, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (22, 6, 45100, 3.0, '斤', 3.0, NULL, NULL, 9.0, 0, NULL, NULL, NULL, 111, 1, 88, 0, 84, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (23, 6, 45109, 1.0, '斤', 5.0, NULL, NULL, 5.0, 0, NULL, NULL, NULL, 111, 1, 91, 0, 84, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (24, 7, 45097, 1.0, '颗', 5.0, NULL, NULL, 1.5, 0, NULL, NULL, NULL, 111, 1, 73, 0, 84, 1, 0.3, 0.3);
INSERT INTO `nx_orders_sub` VALUES (25, 7, 45096, 2.0, '颗', 2.0, NULL, NULL, 5.2, 0, NULL, NULL, NULL, 111, 1, 72, 0, 84, 1, 1.3, 2.6);
INSERT INTO `nx_orders_sub` VALUES (26, 8, 45097, 2.0, '颗', 5.0, NULL, NULL, 3.0, 0, NULL, NULL, NULL, 111, 1, 73, 0, 85, 1, 0.3, 0.6);
INSERT INTO `nx_orders_sub` VALUES (27, 8, 45103, 2.0, '斤', 5.0, NULL, NULL, 10.0, 0, NULL, NULL, NULL, 111, 1, 78, 0, 85, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (28, 8, 45096, 3.0, '颗', 2.0, NULL, NULL, 7.8, 0, NULL, NULL, NULL, 111, 1, 72, 0, 85, 1, 1.3, 3.9);
INSERT INTO `nx_orders_sub` VALUES (29, 8, 44678, 1.0, '斤', 1.0, NULL, NULL, 1.0, 0, NULL, NULL, NULL, 111, 1, 84, 0, 85, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (30, 8, 45092, 3.0, '斤', 2.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 111, 1, 85, 0, 85, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (31, 8, 45102, 2.0, '斤', 13.0, NULL, NULL, 26.0, 0, NULL, NULL, NULL, 111, 1, 86, 0, 85, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (32, 8, 45100, 2.0, '斤', 3.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 111, 1, 88, 0, 85, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (33, 9, 45105, 3.0, '斤', 2.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 111, 1, 76, 0, 86, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (34, 9, 45097, 2.0, '颗', 5.0, NULL, NULL, 3.0, 0, NULL, NULL, NULL, 111, 1, 73, 0, 86, 1, 0.3, 0.6);
INSERT INTO `nx_orders_sub` VALUES (35, 10, 45096, 2.0, '颗', 2.0, NULL, NULL, 5.2, 0, NULL, NULL, NULL, 111, 1, 72, 0, 87, 1, 1.3, 2.6);
INSERT INTO `nx_orders_sub` VALUES (36, 10, 45097, 1.0, '颗', 5.0, NULL, NULL, 1.5, 0, NULL, NULL, NULL, 111, 1, 73, 0, 87, 1, 0.3, 0.3);
INSERT INTO `nx_orders_sub` VALUES (37, 10, 45103, 3.0, '斤', 5.0, NULL, NULL, 15.0, 0, NULL, NULL, NULL, 111, 1, 78, 0, 87, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (38, 11, 45097, 2.0, '颗', 5.0, NULL, NULL, 3.0, 0, NULL, NULL, NULL, 111, 1, 73, 0, 88, 1, 0.3, 0.6);
INSERT INTO `nx_orders_sub` VALUES (39, 11, 45096, 4.0, '颗', 2.0, NULL, NULL, 10.4, 0, NULL, NULL, NULL, 111, 1, 72, 0, 88, 1, 1.3, 5.2);
INSERT INTO `nx_orders_sub` VALUES (40, 11, 45108, 3.0, '斤', 2.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 111, 1, 81, 0, 88, 0, NULL, 3.0);
INSERT INTO `nx_orders_sub` VALUES (41, 12, 45097, 2.0, '颗', 5.0, NULL, NULL, 3.0, 0, NULL, NULL, NULL, 111, 1, 73, 0, 89, 1, 0.3, 0.6);
INSERT INTO `nx_orders_sub` VALUES (42, 12, 45104, 2.0, '斤', 3.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 111, 1, 75, 0, 89, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (43, 12, 45096, 2.0, '颗', 2.0, NULL, NULL, 5.2, 0, NULL, NULL, NULL, 111, 1, 72, 0, 89, 1, 1.3, 2.6);
INSERT INTO `nx_orders_sub` VALUES (44, 12, 45112, 2.0, '斤', 1.0, NULL, NULL, 2.0, 0, NULL, NULL, NULL, 112, 1, 96, 0, 89, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (45, 12, 45124, 1.0, '斤', 5.0, NULL, NULL, 5.0, 0, NULL, NULL, NULL, 112, 1, 98, 0, 89, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (46, 13, 45096, 2.0, '颗', 2.0, NULL, NULL, 5.2, 0, NULL, NULL, NULL, 111, 1, 72, 0, 90, 1, 1.3, 2.6);
INSERT INTO `nx_orders_sub` VALUES (47, 13, 45099, 9.0, '斤', 3.0, NULL, NULL, 27.0, 0, NULL, NULL, NULL, 111, 1, 80, 0, 90, 0, NULL, 9.0);
INSERT INTO `nx_orders_sub` VALUES (48, 14, 45192, 1.0, '斤', 1.0, NULL, NULL, 1.0, 0, NULL, NULL, NULL, 114, 1, 148, 0, 89, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (49, 14, 45167, 2.0, '斤', 2.0, NULL, NULL, 4.0, 0, NULL, NULL, NULL, 114, 1, 169, 0, 89, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (50, 14, 45184, 1.0, '斤', 2.0, NULL, NULL, 2.0, 0, NULL, NULL, NULL, 114, 1, 184, 0, 89, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (51, 14, 45327, 2.0, '斤', 8.0, NULL, NULL, 16.0, 0, NULL, NULL, NULL, 132, 1, 197, 0, 89, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (52, 15, 45102, 2.0, '斤', 13.0, NULL, NULL, 26.0, 0, NULL, NULL, NULL, 111, 1, 86, 0, 89, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (53, 15, 45106, 2.0, '斤', 3.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 111, 1, 90, 0, 89, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (54, 16, 45146, 2.5, '斤', 6.0, NULL, NULL, 15.0, 0, NULL, NULL, NULL, 113, 1, 113, 0, 89, 0, NULL, 2.5);
INSERT INTO `nx_orders_sub` VALUES (55, 16, 45132, 2.0, '斤', 1.0, NULL, NULL, 2.0, 0, NULL, NULL, NULL, 113, 1, 124, 0, 89, 0, NULL, 2.0);
INSERT INTO `nx_orders_sub` VALUES (56, 16, 45135, 1.0, '斤', 3.0, NULL, NULL, 3.0, 0, NULL, NULL, NULL, 113, 1, 136, 0, 89, 0, NULL, 1.0);
INSERT INTO `nx_orders_sub` VALUES (57, 17, 45096, 3.0, '颗', 2.0, NULL, NULL, 7.8, 0, NULL, NULL, NULL, 111, 1, 72, 0, 89, 1, 1.3, 3.9);
INSERT INTO `nx_orders_sub` VALUES (58, 18, 45097, 4.0, '颗', 5.0, NULL, NULL, 6.0, 0, NULL, NULL, NULL, 111, 1, 73, 0, 89, 1, 0.3, 1.2);
INSERT INTO `nx_orders_sub` VALUES (59, 19, 45120, 333.0, '斤', 3.0, NULL, NULL, 999.0, 0, NULL, NULL, NULL, 112, 1, 112, 0, 89, 0, NULL, 333.0);
COMMIT;

-- ----------------------------
-- Table structure for nx_route
-- ----------------------------
DROP TABLE IF EXISTS `nx_route`;
CREATE TABLE `nx_route` (
  `nx_route_id` int(20) NOT NULL COMMENT '线路id',
  `nx_route_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '线路名称',
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
  `nx_standard_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_s_goods_id` int(20) DEFAULT NULL,
  `nx_standard_file_path` varchar(200) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_standard_scale` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_standard_error` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_standard_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`nx_standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_standard
-- ----------------------------
BEGIN;
INSERT INTO `nx_standard` VALUES (58, '根', 45097, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (59, '根', 45096, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (60, '根', 45103, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (61, '个', 45103, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (62, '个', 45094, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (63, '根', 45098, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (64, '根', 45099, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (65, '根', 45101, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (66, '个', 44678, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (67, '个', 45092, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (68, '根', 45102, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (69, '个', 45095, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (70, '个', 45093, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (71, '捆', 45109, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (72, '根', 45114, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (73, '个', 45126, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (74, '头', 45117, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (75, '个', 45112, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (76, '个', 45113, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (77, '块', 45116, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (78, '个', 45111, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (79, '根', 45151, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (80, '捆', 45192, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (81, '捆', 45168, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (82, '把', 45197, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (83, '颗', 45165, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (84, '把', 45190, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (85, '颗', 45194, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (86, 'kk', 45097, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (87, 'ff', NULL, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.VfACQoD4L27Hb3e0b6a0588ccb32159eb31eb722375c.jpg', NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (88, '盒', NULL, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.VfACQoD4L27Hb3e0b6a0588ccb32159eb31eb722375c.jpg', NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (89, '河', NULL, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.wuB3aqsFyXhT898583766d0a948533ee256af40be5fd.jpg', '2', '', NULL);
INSERT INTO `nx_standard` VALUES (90, '河223', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.wuB3aqsFyXhT898583766d0a948533ee256af40be5fd.jpg', '2', '', NULL);
INSERT INTO `nx_standard` VALUES (91, 'vvv', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.ffc9K3OZf8Qga40984e0cd57c586c63f36818f7502af.jpeg', '1.3', '', NULL);
INSERT INTO `nx_standard` VALUES (92, 'd', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.6CRVRNdFFwweb3e0b6a0588ccb32159eb31eb722375c.jpg', '2', '', NULL);
INSERT INTO `nx_standard` VALUES (93, 'bbddfafas', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.i9vdOwdGJqv6898583766d0a948533ee256af40be5fd.jpg', '2', '0', NULL);
INSERT INTO `nx_standard` VALUES (94, 'bbddfafas', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.i9vdOwdGJqv6898583766d0a948533ee256af40be5fd.jpg', '2', '0.2', NULL);
INSERT INTO `nx_standard` VALUES (95, '盒', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.ugSqylAzpmgO898583766d0a948533ee256af40be5fd.jpg', '30', '', NULL);
INSERT INTO `nx_standard` VALUES (96, 'ddd', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.124u36PV11lba40984e0cd57c586c63f36818f7502af.jpeg', '2', '', NULL);
INSERT INTO `nx_standard` VALUES (97, 'wert', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.ahN9fJY6E70ra40984e0cd57c586c63f36818f7502af.jpeg', '2', '0', NULL);
INSERT INTO `nx_standard` VALUES (98, 'ffff', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.DWIu1gK5zKRja40984e0cd57c586c63f36818f7502af.jpeg', '2', '0', NULL);
INSERT INTO `nx_standard` VALUES (99, 'rrr', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.ZbKochC9yv81a40984e0cd57c586c63f36818f7502af.jpeg', '3', '', NULL);
INSERT INTO `nx_standard` VALUES (100, 'ert', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.NherxShOIHiZ898583766d0a948533ee256af40be5fd.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (101, 'ddd', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.tSbpuFFI7knga40984e0cd57c586c63f36818f7502af.jpeg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (102, 'dddd', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.2GM3VrVsIlg7b3e0b6a0588ccb32159eb31eb722375c.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (103, 'wer', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.70zZzqHoXckQb3e0b6a0588ccb32159eb31eb722375c.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (104, 'iii', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.sGIpMhLA5YXBb3e0b6a0588ccb32159eb31eb722375c.jpg', '4', '0', NULL);
INSERT INTO `nx_standard` VALUES (105, 'rr', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.zIYDPkaeGF9Eb3e0b6a0588ccb32159eb31eb722375c.jpg', '2', '0', NULL);
INSERT INTO `nx_standard` VALUES (106, '333', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.u9FwsdoAOMuEb3e0b6a0588ccb32159eb31eb722375c.jpg', '1', '0', NULL);
INSERT INTO `nx_standard` VALUES (107, 'ddd', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.FdHP69HxdS28898583766d0a948533ee256af40be5fd.jpg', '2', '0', NULL);
INSERT INTO `nx_standard` VALUES (108, 'ddd', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.FdHP69HxdS28898583766d0a948533ee256af40be5fd.jpg', '2', '0', NULL);
INSERT INTO `nx_standard` VALUES (109, 'ggg', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.HckNsgXhhSkjb3e0b6a0588ccb32159eb31eb722375c.jpg', '3', '2', NULL);
INSERT INTO `nx_standard` VALUES (110, '333', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.3EjLYZeBzHQFb3e0b6a0588ccb32159eb31eb722375c.jpg', '2', '0', NULL);
INSERT INTO `nx_standard` VALUES (111, 'dff', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.ZozGMwgEdX5Ob3e0b6a0588ccb32159eb31eb722375c.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (112, 'fff', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.eIULmW6hiRuZb3e0b6a0588ccb32159eb31eb722375c.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (113, 'vvv', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.OMOQ7pXEP3isb3e0b6a0588ccb32159eb31eb722375c.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (114, 'ddd', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.JONwgHY6jFDMb3e0b6a0588ccb32159eb31eb722375c.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (115, '333tt', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.mCN1QAjaLv8Yb3e0b6a0588ccb32159eb31eb722375c.jpg', '2', '0', NULL);
INSERT INTO `nx_standard` VALUES (116, 'kkk', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.FULHUNfFSfpdb3e0b6a0588ccb32159eb31eb722375c.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (117, 'ccc', 72, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.VWP73WuCtwM7898583766d0a948533ee256af40be5fd.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (118, 'ddd', 45219, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.QEAkkv1MlKLda40984e0cd57c586c63f36818f7502af.jpeg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (119, 'mmm', 45219, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.84OElm96C7hs898583766d0a948533ee256af40be5fd.jpg', '4', '0', NULL);
INSERT INTO `nx_standard` VALUES (120, 'vvv', 45219, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.m0PRbYcAbRbt153295726607118a6686f1da322cdfb2.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (121, 'bll', 45226, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.d4TJ2tCPmSMB898583766d0a948533ee256af40be5fd.jpg', '3', '0', NULL);
INSERT INTO `nx_standard` VALUES (122, 'vvv', 45226, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.pOA1TDLNOFEV153295726607118a6686f1da322cdfb2.jpg', '56', '0.2', NULL);
INSERT INTO `nx_standard` VALUES (123, '这种', 45283, 'uploadImage/tmp_bf06c489d617db840e7a960772e029af.jpg', '30', '2', NULL);
COMMIT;

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
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 2);
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
INSERT INTO `sys_menu` VALUES (72, 0, '农心商品', 'null', NULL, 0, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (80, 72, '生鲜', 'nxGoods?fatherId=1', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (81, 72, '食品', 'nxGoods?fatherId=2', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (82, 72, '冻品', 'nxGoods?fatherId=3', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (83, 72, '服装厨具', 'nxGoods?fatherId=4', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (84, 72, '酒类', 'nxGoods?fatherId=5', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (85, 72, '食品', 'nxGoods?fatherId=6', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (87, 72, '一次性用品', 'nxGoods?fatherId=7', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (88, 72, '其它', 'nxGoods?fatherId=8', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
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

SET FOREIGN_KEY_CHECKS = 1;
