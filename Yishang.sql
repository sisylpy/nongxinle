/*
 Navicat Premium Data Transfer

 Source Server         : mac
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : Yishang

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 09/12/2019 06:43:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf16_czech_ci NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf16_czech_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf16_czech_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf16_czech_ci NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf16_czech_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf16_czech_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf16_czech_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf16_czech_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf16_czech_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf16_czech_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf16_czech_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf16_czech_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf16_czech_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf16_czech_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf16_czech_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf16_czech_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf16_czech_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'test', 'shiro', '0 0/30 * * * ?', 0, '有参数测试', '2017-05-01 23:16:46');
INSERT INTO `schedule_job` VALUES (2, 'testTask', 'test2', NULL, '0 0/30 * * * ?', 1, '无参数测试', '2017-05-03 14:55:56');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu.html', NULL, 1, 'fa fa-th-list', 3);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '100@qq.com', '13888888888', 1, '2017-05-01 11:11:11');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Table structure for ys_customer
-- ----------------------------
DROP TABLE IF EXISTS `ys_customer`;
CREATE TABLE `ys_customer` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `custer_name` varchar(30) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户名称',
  `admin_phone` int(11) DEFAULT NULL COMMENT '管理员手机',
  `business_type_id` int(20) DEFAULT NULL COMMENT '商业类型',
  `lat` varchar(30) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '横坐标',
  `lun` varchar(30) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '纵坐标',
  `father_id` int(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for ys_goods
-- ----------------------------
DROP TABLE IF EXISTS `ys_goods`;
CREATE TABLE `ys_goods` (
  `g_id` int(20) NOT NULL AUTO_INCREMENT,
  `father_id` int(20) DEFAULT NULL,
  `goods_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `products_amount` int(4) DEFAULT '0',
  `color` varchar(15) COLLATE utf16_czech_ci DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `pinyin` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL,
  `py` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of ys_goods
-- ----------------------------
BEGIN;
INSERT INTO `ys_goods` VALUES (1, 0, '生鲜', 0, '#20afb8', 1, NULL, NULL);
INSERT INTO `ys_goods` VALUES (2, 0, '食品', 0, '#1ebaee', 2, NULL, NULL);
INSERT INTO `ys_goods` VALUES (3, 0, '冻品', 0, '#3cc36e', 3, NULL, NULL);
INSERT INTO `ys_goods` VALUES (4, 0, '一次性用品', 0, '#f5c832', 4, NULL, NULL);
INSERT INTO `ys_goods` VALUES (5, 0, '服装,厨具', 0, '#f09628', 5, NULL, NULL);
INSERT INTO `ys_goods` VALUES (6, 0, '酒类', 0, '#f05a32', 6, NULL, NULL);
INSERT INTO `ys_goods` VALUES (7, 0, '食品', 0, '#20afb8', 7, NULL, NULL);
INSERT INTO `ys_goods` VALUES (8, 0, '其它', 0, '#969696', 8, NULL, NULL);
INSERT INTO `ys_goods` VALUES (9, 1, '新鲜蔬菜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (10, 1, '肉禽蛋品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (11, 1, '新鲜水果', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (12, 1, '海鲜水产', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (13, 1, '豆制品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (14, 1, '新鲜蔬菜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (15, 2, '主食', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (16, 2, '粮油调味', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (17, 2, '干果食品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (18, 2, '罐头', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (19, 2, '进口食品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (20, 2, '休闲食品', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (21, 2, '主食', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (22, 2, '饮料冲调', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (23, 3, '冻猪肉', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (24, 3, '冻牛肉', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (25, 9, '根茎类', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (26, 9, '葱姜蒜椒', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (27, 9, '茄果瓜类', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (28, 9, '叶菜类', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (29, 9, '鲜菌菇', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (30, 25, '白萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (31, 25, '春笋', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (32, 25, '白萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (33, 25, '春笋', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (34, 25, '苦苣', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (35, 25, '荷兰豆', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (36, 25, '胡萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (37, 25, '黄花菜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (38, 25, '苤蓝', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (39, 25, '宽豆角', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (40, 25, '秋葵', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (41, 25, '山药', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (42, 25, '蒜苔', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (43, 25, '土豆', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (44, 25, '西兰花', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (45, 25, '铁棍山药', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (46, 25, '莲藕', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (47, 25, '凉姜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (48, 25, '小萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (49, 25, '青笋', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (50, 25, '豆角', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (51, 25, '心里美', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (53, 25, '芥菜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (54, 25, '樱桃萝卜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (55, 25, '红薯', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (56, 25, '小芋头', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (57, 25, '小土豆', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (58, 25, '南瓜', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ys_goods` VALUES (59, 26, '大蒜', 0, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ys_handling
-- ----------------------------
DROP TABLE IF EXISTS `ys_handling`;
CREATE TABLE `ys_handling` (
  `h_id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `products_id` int(20) DEFAULT NULL COMMENT '产品id',
  `handling_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '加工名称',
  `handling_content` varchar(50) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '加工内容',
  `yield_up_percent` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '加工率不高于比例',
  `yield_down_percent` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '加工率不低于比例',
  `handling_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '加工费',
  `img` varchar(300) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of ys_handling
-- ----------------------------
BEGIN;
INSERT INTO `ys_handling` VALUES (1, 1, '土豆丝', '长度不小于5厘米，粗细3-5毫米', '85', '80', '0.5', 'uploadImage/wxbc686226ccc443f1.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.FVn4suLIWc3Ge79b101340f03c31718f2c9633c752a7.png');
INSERT INTO `ys_handling` VALUES (2, 1, 'abc', 'ddd', '12', '33', '45.0', 'uploadImage/wxbc686226ccc443f1.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.FVn4suLIWc3Ge79b101340f03c31718f2c9633c752a7.png');
INSERT INTO `ys_handling` VALUES (3, 1, 'abc', 'ddd', '12', '33', '45.0', 'uploadImage/wxbc686226ccc443f1.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.FVn4suLIWc3Ge79b101340f03c31718f2c9633c752a7.png');
COMMIT;

-- ----------------------------
-- Table structure for ys_products
-- ----------------------------
DROP TABLE IF EXISTS `ys_products`;
CREATE TABLE `ys_products` (
  `p_id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_id` int(20) DEFAULT NULL COMMENT '商品id',
  `brand` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '品牌',
  `describe` varchar(40) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL COMMENT '描述',
  `origin` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '原产地',
  `pur_standard` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '销售规格',
  `order_standard` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货规格',
  `handling_amount` int(4) DEFAULT '0' COMMENT '加工数量',
  `pur_price` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '销售价格',
  `store_id` int(20) DEFAULT NULL COMMENT '商家id',
  `update_date` varchar(20) CHARACTER SET utf16 COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of ys_products
-- ----------------------------
BEGIN;
INSERT INTO `ys_products` VALUES (1, 43, 'new', '黄心', '内蒙', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (2, 59, NULL, '新蒜', '山东', '斤', '斤', 0, '3.00', 1, '12月07日');
INSERT INTO `ys_products` VALUES (3, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (4, 41, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (5, 41, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (6, 41, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (7, 41, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (8, 41, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (9, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (10, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (11, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (12, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (13, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (14, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (15, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (16, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (17, 43, NULL, '白心', '陕西', '斤', '斤', 0, '1.45', 1, '12月07日');
INSERT INTO `ys_products` VALUES (18, 43, NULL, '白心', '陕西', '斤', '斤', 0, '', 1, '');
INSERT INTO `ys_products` VALUES (19, 43, NULL, '白心', '陕西', '斤', '斤', 0, '', 1, '');
INSERT INTO `ys_products` VALUES (20, 43, NULL, '白心', '陕西', '斤', '斤', 0, '', 1, '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
