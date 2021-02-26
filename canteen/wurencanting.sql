/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : wurencanting

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 26/02/2021 18:20:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES (1, 'admin', 'Admin', '64329c7bfca33c728502e5fb94aa468d', '3cf752', '/assets/img/avatar.png', 'admin@admin.com', 0, 1614331357, '127.0.0.1', 1492186163, 1614331357, '5d1e8625-e217-49ce-a1b4-214a3dfe4e10', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES (1, 1, 'admin', '/wBqMyUCfFn.php/index/login?url=%2FwBqMyUCfFn.php', '登录', '{\"url\":\"\\/wBqMyUCfFn.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"z3xp\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1614222036);
INSERT INTO `fa_admin_log` VALUES (2, 1, 'admin', '/wBqMyUCfFn.php/addon/install', '插件管理', '{\"name\":\"third\",\"force\":\"0\",\"uid\":\"33500\",\"token\":\"***\",\"version\":\"1.2.2\",\"faversion\":\"1.2.0.20201008_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1614224331);
INSERT INTO `fa_admin_log` VALUES (3, 1, 'admin', '/wBqMyUCfFn.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"85\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1614224387);
INSERT INTO `fa_admin_log` VALUES (4, 1, 'admin', '/wBqMyUCfFn.php/index/login?url=%2FwBqMyUCfFn.php%2Fauth%2Frule%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/wBqMyUCfFn.php\\/auth\\/rule?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"6bd5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1614245081);
INSERT INTO `fa_admin_log` VALUES (5, 1, 'admin', '/wBqMyUCfFn.php/index/login?url=%2FwBqMyUCfFn.php', '登录', '{\"url\":\"\\/wBqMyUCfFn.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"ptxr\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1614331357);
INSERT INTO `fa_admin_log` VALUES (6, 1, 'admin', '/wBqMyUCfFn.php/auth/rule/edit/ids/88?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"order_form\",\"title\":\"订单管理\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"88\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1614331489);
INSERT INTO `fa_admin_log` VALUES (7, 1, 'admin', '/wBqMyUCfFn.php/auth/rule/edit/ids/67?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"user\\/user\",\"title\":\"会员管理\",\"icon\":\"fa fa-user\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"67\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1614333678);

-- ----------------------------
-- Table structure for fa_area
-- ----------------------------
DROP TABLE IF EXISTS `fa_area`;
CREATE TABLE `fa_area`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) NULL DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '层级 0 1 2 省市区县',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES (1, 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES (1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal');
INSERT INTO `fa_auth_group` VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal');
INSERT INTO `fa_auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal');
INSERT INTO `fa_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal');
INSERT INTO `fa_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES (1, 1);

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal');
INSERT INTO `fa_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal');
INSERT INTO `fa_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', 'Category tips', 1, 1497429920, 1497429920, 119, 'normal');
INSERT INTO `fa_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 99, 'normal');
INSERT INTO `fa_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `fa_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal');
INSERT INTO `fa_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `fa_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal');
INSERT INTO `fa_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal');
INSERT INTO `fa_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal');
INSERT INTO `fa_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal');
INSERT INTO `fa_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `fa_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `fa_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `fa_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `fa_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `fa_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `fa_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `fa_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `fa_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `fa_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `fa_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `fa_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `fa_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `fa_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `fa_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal');
INSERT INTO `fa_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal');
INSERT INTO `fa_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `fa_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `fa_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `fa_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal');
INSERT INTO `fa_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `fa_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `fa_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal');
INSERT INTO `fa_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal');
INSERT INTO `fa_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal');
INSERT INTO `fa_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal');
INSERT INTO `fa_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal');
INSERT INTO `fa_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal');
INSERT INTO `fa_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal');
INSERT INTO `fa_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal');
INSERT INTO `fa_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal');
INSERT INTO `fa_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal');
INSERT INTO `fa_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal');
INSERT INTO `fa_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal');
INSERT INTO `fa_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal');
INSERT INTO `fa_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal');
INSERT INTO `fa_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal');
INSERT INTO `fa_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal');
INSERT INTO `fa_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal');
INSERT INTO `fa_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal');
INSERT INTO `fa_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal');
INSERT INTO `fa_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal');
INSERT INTO `fa_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (67, 'file', 0, 'user/user', '会员管理', 'fa fa-user', '', '', 1, 1516374729, 1614333678, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (85, 'file', 0, 'third', '第三方登录管理', 'fa fa-users', '', '', 0, 1614224331, 1614224387, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (86, 'file', 85, 'third/index', '查看', 'fa fa-circle-o', '', '', 0, 1614224331, 1614224331, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (87, 'file', 85, 'third/del', '删除', 'fa fa-circle-o', '', '', 0, 1614224331, 1614224331, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (88, 'file', 0, 'order_form', '订单管理', 'fa fa-circle-o', '', '', 1, 1614331405, 1614331489, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (89, 'file', 88, 'order_form/import', 'Import', 'fa fa-circle-o', '', '', 0, 1614331405, 1614331405, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (90, 'file', 88, 'order_form/index', '查看', 'fa fa-circle-o', '', '', 0, 1614331405, 1614331405, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (91, 'file', 88, 'order_form/add', '添加', 'fa fa-circle-o', '', '', 0, 1614331405, 1614331405, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (92, 'file', 88, 'order_form/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1614331405, 1614331405, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (93, 'file', 88, 'order_form/del', '删除', 'fa fa-circle-o', '', '', 0, 1614331405, 1614331405, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (94, 'file', 88, 'order_form/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1614331405, 1614331405, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (95, 'file', 0, 'desk', '桌子管理', 'fa fa-circle-o', '', '', 1, 1614331497, 1614331497, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (96, 'file', 95, 'desk/import', 'Import', 'fa fa-circle-o', '', '', 0, 1614331497, 1614331497, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (97, 'file', 95, 'desk/index', '查看', 'fa fa-circle-o', '', '', 0, 1614331497, 1614331497, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (98, 'file', 95, 'desk/add', '添加', 'fa fa-circle-o', '', '', 0, 1614331497, 1614331497, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (99, 'file', 95, 'desk/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1614331497, 1614331497, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (100, 'file', 95, 'desk/del', '删除', 'fa fa-circle-o', '', '', 0, 1614331497, 1614331497, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (101, 'file', 95, 'desk/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1614331497, 1614331497, 0, 'normal');

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_category
-- ----------------------------
INSERT INTO `fa_category` VALUES (1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1495262190, 1495262190, 1, 'normal');
INSERT INTO `fa_category` VALUES (2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1495262244, 1495262244, 2, 'normal');
INSERT INTO `fa_category` VALUES (3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1495262288, 1495262288, 3, 'normal');
INSERT INTO `fa_category` VALUES (4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1495262317, 1495262317, 4, 'normal');
INSERT INTO `fa_category` VALUES (5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1495262336, 1499681850, 5, 'normal');
INSERT INTO `fa_category` VALUES (6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1495262357, 1495262357, 6, 'normal');
INSERT INTO `fa_category` VALUES (7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1495262391, 1495262391, 7, 'normal');
INSERT INTO `fa_category` VALUES (8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1495262424, 1495262424, 8, 'normal');
INSERT INTO `fa_category` VALUES (9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1495262456, 1495262456, 9, 'normal');
INSERT INTO `fa_category` VALUES (10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1495262487, 1495262487, 10, 'normal');
INSERT INTO `fa_category` VALUES (11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1495262515, 1495262515, 11, 'normal');
INSERT INTO `fa_category` VALUES (12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1497015727, 1497015727, 12, 'normal');
INSERT INTO `fa_category` VALUES (13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1497015738, 1497015738, 13, 'normal');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '无人餐厅', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '');
INSERT INTO `fa_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '', '');
INSERT INTO `fa_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '', '');
INSERT INTO `fa_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '', '');
INSERT INTO `fa_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"请选择\",\"SMTP\",\"Mail\"]', '', '', '');
INSERT INTO `fa_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '', '');
INSERT INTO `fa_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '', '');
INSERT INTO `fa_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '', '');
INSERT INTO `fa_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '', '');
INSERT INTO `fa_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', '');
INSERT INTO `fa_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '', '');

-- ----------------------------
-- Table structure for fa_desk
-- ----------------------------
DROP TABLE IF EXISTS `fa_desk`;
CREATE TABLE `fa_desk`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '桌子名',
  `people` int(5) NULL DEFAULT NULL COMMENT '可用人数',
  `lock` smallint(1) NULL DEFAULT NULL COMMENT '是否被使用',
  `now_people` int(5) NULL DEFAULT NULL COMMENT '现在人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '桌子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_desk
-- ----------------------------
INSERT INTO `fa_desk` VALUES (1, '一号', 10, 0, 5);
INSERT INTO `fa_desk` VALUES (2, '二号', 10, 0, 0);
INSERT INTO `fa_desk` VALUES (3, '三号', 10, 0, 0);

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_menu
-- ----------------------------
DROP TABLE IF EXISTS `fa_menu`;
CREATE TABLE `fa_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜名',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '缩略图',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `class` smallint(10) NULL DEFAULT NULL COMMENT '菜品类型',
  `price` int(10) NULL DEFAULT NULL COMMENT '价格',
  `oldprice` int(10) NULL DEFAULT NULL COMMENT '原价',
  `brief` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'tips',
  `is_banner` smallint(1) NULL DEFAULT NULL COMMENT '是否为轮播菜品',
  `is_goodlist` smallint(1) NULL DEFAULT NULL COMMENT '是否为人气菜品',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 321 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_menu
-- ----------------------------
INSERT INTO `fa_menu` VALUES (1, '香辣莲藕', '/uploads/Menu/78468144_1.jpg', '雷小厨', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (2, '海鲜秀珍菇豆腐', '/uploads/Menu/78468144_2.jpg', '花鱼儿', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (3, '紫苏土豆焖鸭', '/uploads/Menu/78468144_3.jpg', 'Suki燕儿', 3, 50, 10, '美味香甜,同嫂无欺', 1, NULL);
INSERT INTO `fa_menu` VALUES (4, '酥炸带鱼', '/uploads/Menu/78468144_4.jpg', '夏家私享菜', 15, 50, 10, '美味香甜,同嫂无欺', 1, NULL);
INSERT INTO `fa_menu` VALUES (5, '辣炒扁芸豆', '/uploads/Menu/78468144_5.jpg', '政妈妈', 16, 50, 10, '美味香甜,同嫂无欺', 1, NULL);
INSERT INTO `fa_menu` VALUES (6, '蛋蒸花蛤', '/uploads/Menu/78468144_6.jpg', 'YNZAXYS_XOCKeM', 12, 50, 10, '美味香甜,同嫂无欺', 1, NULL);
INSERT INTO `fa_menu` VALUES (7, '可乐翅中', '/uploads/Menu/78468144_7.jpg', 'YNZAXYS_XOCKeM', 13, 50, 10, '美味香甜,同嫂无欺', 1, NULL);
INSERT INTO `fa_menu` VALUES (8, '清蒸龙利鱼柳', '/uploads/Menu/78468144_8.jpg', '宣大爷是胖妞', 6, 50, 10, '美味香甜,同嫂无欺', 1, NULL);
INSERT INTO `fa_menu` VALUES (9, '干锅酱香蟹', '/uploads/Menu/78468144_9.jpg', 'YNZAXYS_XOCKeM', 11, 50, 10, '美味香甜,同嫂无欺', 1, NULL);
INSERT INTO `fa_menu` VALUES (10, '西红柿炒蛋', '/uploads/Menu/78468144_10.jpg', 'YouTude精彩视频', 8, 50, 10, '美味香甜,同嫂无欺', 1, NULL);
INSERT INTO `fa_menu` VALUES (11, '酸甜排骨', '/uploads/Menu/78468144_11.jpg', 'Elin', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (12, '荷兰豆炒五花肉', '/uploads/Menu/78468144_12.jpg', '关于小妮', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (13, '酱香杏鲍菇肉片', '/uploads/Menu/78468144_13.jpg', '二婷爱美食', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (14, '蒜蓉粉丝蒸扇贝', '/uploads/Menu/78468144_14.jpg', '马小马_CGGLmT', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (15, '葱爆羊肉', '/uploads/Menu/78468144_15.jpg', '家夏', 6, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (16, '私房浓香鸡煲', '/uploads/Menu/78468144_16.jpg', '允儿小妞的厨房', 12, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (17, '泡椒笋干回锅肉', '/uploads/Menu/78468144_17.jpg', '掀帘晨曦datura', 16, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (18, '秋葵炒虾仁', '/uploads/Menu/78468144_18.jpg', '清水淡竹', 8, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (19, '蒜蓉虾仁生蚝蒸粉丝', '/uploads/Menu/78468144_19.jpg', '宣大爷是胖妞', 7, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (20, '包菜炒粉丝', '/uploads/Menu/78468144_20.jpg', '掀帘晨曦datura', 15, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (21, '叫花鸡', '/uploads/Menu/78468144_21.jpg', '这世道☆没人道', 16, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (22, '泡椒蒸鱼', '/uploads/Menu/78468144_22.jpg', 'sourcehe', 9, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (23, '盖浇嫩豆腐', '/uploads/Menu/78468144_23.jpg', '女为悦己者而容', 2, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (24, '干煸手撕杏鲍菇', '/uploads/Menu/78468144_24.jpg', '李李小酒窝', 3, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (25, '蜜汁叉烧', '/uploads/Menu/78468144_25.jpg', '胖子瘦子我都爱', 12, 50, 10, '美味香甜,同嫂无欺', NULL, 1);
INSERT INTO `fa_menu` VALUES (26, '香辣土豆片', '/uploads/Menu/78468144_26.jpg', '二婷爱美食', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (27, '水煮牛肉', '/uploads/Menu/78468144_27.jpg', '罗拉藏馆', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (28, '牛肉炒农家菜', '/uploads/Menu/78468144_28.jpg', 'rosejyy2000', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (29, '蒜黄木耳炒鸡蛋', '/uploads/Menu/78468144_29.jpg', 'JOJOJOJOJOJO', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (30, '麻辣牛肚百叶', '/uploads/Menu/78468144_30.jpg', '沵沵', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (31, '锅巴肉片', '/uploads/Menu/78468144_31.jpg', '个性胜过姿色', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (32, '空气炸锅版花菜', '/uploads/Menu/78468144_32.jpg', '韩优生活馆', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (33, '番茄土豆炖牛腩', '/uploads/Menu/78468144_33.jpg', '我幸福相约', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (34, '尖椒炒鸡胗', '/uploads/Menu/78468144_34.jpg', 'sourcehe', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (35, '可乐鸡翅', '/uploads/Menu/78468144_35.jpg', '陶玻网', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (36, '干烧白虾', '/uploads/Menu/78468144_36.jpg', '壹家食志', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (37, '炒土豆片', '/uploads/Menu/78468144_37.jpg', '雷小厨', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (38, '香椿炒鸡蛋', '/uploads/Menu/78468144_38.jpg', '冬季心情', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (39, '啤酒鹌鹑蛋', '/uploads/Menu/78468144_39.jpg', '食·色', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (40, '麻辣小龙虾', '/uploads/Menu/78468144_40.jpg', 'qem2000', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (41, '培根炒松花菜', '/uploads/Menu/78468144_41.jpg', '关于小妮', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (42, '酱香豆干', '/uploads/Menu/78468144_42.jpg', '眉儿', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (43, '回锅肉', '/uploads/Menu/78468144_43.jpg', '沵沵', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (44, '酸辣藕丁', '/uploads/Menu/78468144_44.jpg', '银元宝', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (45, '奥尔良烤翅', '/uploads/Menu/78468144_45.jpg', '蒙的宝', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (46, '红果茄汁焖大虾', '/uploads/Menu/78468144_46.jpg', '艳梅_h', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (47, '豆花牛肉', '/uploads/Menu/78468144_47.jpg', '遗忘↘蕾拉●', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (48, '飘香鸡翅', '/uploads/Menu/78468144_48.jpg', '四叶小馆', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (49, '桂花红糖鸡翅', '/uploads/Menu/78468144_49.jpg', '大嘴螺', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (50, '鸡汁蟹味菇', '/uploads/Menu/78468144_50.jpg', '梦悦的小灶炉', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (51, '蒜泥蒸茄子', '/uploads/Menu/78468144_51.jpg', '清水淡竹', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (52, '莲子豌豆炒虾仁', '/uploads/Menu/78468144_52.jpg', '清水淡竹', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (53, '冬瓜烧大排', '/uploads/Menu/78468144_53.jpg', '花鱼儿', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (54, '原味蒜苔排骨', '/uploads/Menu/78468144_54.jpg', 'ferrarizhun', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (55, '小白菜咸肉炒莲藕', '/uploads/Menu/78468144_55.jpg', '花鱼儿', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (56, '蒜茸空心菜', '/uploads/Menu/78468144_56.jpg', 'Meggy跳舞的苹果', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (57, '芷香鸡爪', '/uploads/Menu/78468144_57.jpg', '关于小妮', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (58, '玉米炖排骨', '/uploads/Menu/78468144_58.jpg', '舞之灵', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (59, '酸辣豆腐', '/uploads/Menu/78468144_59.jpg', '阳光明媚99', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (60, '糖醋丸子', '/uploads/Menu/78468144_60.jpg', 'twinsliuliu', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (61, '清蒸黄花鱼', '/uploads/Menu/78468144_61.jpg', '女为悦己者而容', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (62, '茄汁鱼柳', '/uploads/Menu/78468144_62.jpg', '黑猫警长kitchen', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (63, '可乐鸡翅', '/uploads/Menu/78468144_63.jpg', '随便粑粑', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (64, '咸肉炒豇豆豆干', '/uploads/Menu/78468144_64.jpg', 'rosejyy2000', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (65, '空气炸锅版蒜蓉烤基围虾', '/uploads/Menu/78468144_65.jpg', '韩优生活馆', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (66, '粉蒸排骨', '/uploads/Menu/78468144_66.jpg', '恬萝姑娘', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (67, '鲜莲子炒虾仁', '/uploads/Menu/78468144_67.jpg', '营养美食设计李晖', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (68, '夏日田园小炒', '/uploads/Menu/78468144_68.jpg', '斯佳丽WH', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (69, '无水炒青菜', '/uploads/Menu/78468144_69.jpg', '威捷朗家居', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (70, '洋葱豆角炒香干', '/uploads/Menu/78468144_70.jpg', 'lxp幸福', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (71, '炖土豆', '/uploads/Menu/78468144_71.jpg', '雷小厨', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (72, '咖喱白菜鸡翅根', '/uploads/Menu/78468144_72.jpg', '花鱼儿', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (73, '家常焖三鲜', '/uploads/Menu/78468144_73.jpg', '贾府私房菜', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (74, '凤梨炒虾仁', '/uploads/Menu/78468144_74.jpg', '寒飘', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (75, '孜然麻辣小土豆', '/uploads/Menu/78468144_75.jpg', '猫猫家的私厨', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (76, '韭菜花炒蛏子', '/uploads/Menu/78468144_76.jpg', '花鱼儿', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (77, '干锅香辣鸭翅', '/uploads/Menu/78468144_77.jpg', '允儿小妞的厨房', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (78, '红烧肉烧笋', '/uploads/Menu/78468144_78.jpg', '舞之灵', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (79, '辣椒酱焖老豆腐', '/uploads/Menu/78468144_79.jpg', '黑猫警长kitchen', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (80, '豉香莲藕鲜虾', '/uploads/Menu/78468144_80.jpg', '花鱼儿', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (81, '豆豉鲮鱼油麦菜', '/uploads/Menu/78468144_81.jpg', 'hlr02', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (82, '咸肉卷心菜炒粉丝', '/uploads/Menu/78468144_82.jpg', '悦悦玉食', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (83, '葱烧鸡腿', '/uploads/Menu/78468144_83.jpg', '悦悦玉食', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (84, '韭菜炒鱿鱼', '/uploads/Menu/78468144_84.jpg', '冬季心情', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (85, '茄汁鸡蛋老豆腐', '/uploads/Menu/78468144_85.jpg', 'rosejyy2000', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (86, '百花酿茄子', '/uploads/Menu/78468144_86.jpg', '遗忘↘蕾拉●', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (87, '麻婆肉末白菜', '/uploads/Menu/78468144_87.jpg', '花鱼儿', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (88, '干煎小平鱼', '/uploads/Menu/78468144_88.jpg', '演堃@杨爸爸', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (89, '白萝卜炖排骨', '/uploads/Menu/78468144_89.jpg', 'Meggy跳舞的苹果', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (90, '豆腐圆子', '/uploads/Menu/78468144_90.jpg', '紫嫣秀儿', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (91, '清蒸帝王蟹', '/uploads/Menu/78468144_91.jpg', '翟女……', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (92, '泡椒猪肝', '/uploads/Menu/78468144_92.jpg', '人生就是过客', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (93, '酱香肉沫蒸茄子', '/uploads/Menu/78468144_93.jpg', '我家臭猪', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (94, '咖喱里脊肉豆腐', '/uploads/Menu/78468144_94.jpg', '花鱼儿', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (95, '酱鸡翅根', '/uploads/Menu/78468144_95.jpg', '我的美食我做主77', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (96, '家常麻婆豆腐', '/uploads/Menu/78468144_96.jpg', '眉儿', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (97, '青豆炒肉末', '/uploads/Menu/78468144_97.jpg', '二婷爱美食', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (98, '豆角焖面', '/uploads/Menu/78468144_98.jpg', '个性胜过姿色', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (99, '葱香蛏子', '/uploads/Menu/78468144_99.jpg', '美乐猪', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (100, '家常版梅干菜扣肉', '/uploads/Menu/78468144_100.jpg', '小诺厨娘', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (101, '鱼香肉丝', '/uploads/Menu/78468144_101.jpg', '心语梦境', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (102, '有机花菜炒花肉', '/uploads/Menu/78468144_102.jpg', '黑猫警长kitchen', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (103, '剁椒魚頭', '/uploads/Menu/78468144_103.jpg', '蔡礼城', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (104, '尖椒猪肉炒酸菜', '/uploads/Menu/78468144_104.jpg', '花鱼儿', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (105, '家烧粉丝小黄鱼', '/uploads/Menu/78468144_105.jpg', '夏家私享菜', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (106, '香椿炒鸡蛋', '/uploads/Menu/78468144_106.jpg', 'Meggy跳舞的苹果', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (107, '蒜蓉娃娃菜', '/uploads/Menu/78468144_107.jpg', '美乐猪', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (108, '粉蒸土豆丝', '/uploads/Menu/78468144_108.jpg', '个性胜过姿色', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (109, '圆白菜炒粉条', '/uploads/Menu/78468144_109.jpg', '宝妈小厨.', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (110, '蚝油烧豆腐', '/uploads/Menu/78468144_110.jpg', '宝妈小厨.', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (111, '家常炖鱼', '/uploads/Menu/78468144_111.jpg', '宝妈小厨.', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (112, '素炒茼蒿', '/uploads/Menu/78468144_112.jpg', '冬季心情', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (113, '香葱土豆', '/uploads/Menu/78468144_113.jpg', 'sourcehe', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (114, '蒜苗豆腐', '/uploads/Menu/78468144_114.jpg', '美乐猪', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (115, '鸡翅炖胡萝卜', '/uploads/Menu/78468144_115.jpg', '蒲的贪吃老爸', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (116, '苦瓜酿土豆泥', '/uploads/Menu/78468144_116.jpg', '大嘴螺', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (117, '灯笼茄子', '/uploads/Menu/78468144_117.jpg', '安娜_Anna', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (118, '酸辣土豆丝', '/uploads/Menu/78468144_118.jpg', 'Elin', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (119, '鱼香素鸡', '/uploads/Menu/78468144_119.jpg', '悦悦玉食', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (120, '家常美味千页豆腐', '/uploads/Menu/78468144_120.jpg', '掀帘晨曦datura', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (121, '卤水鱼', '/uploads/Menu/78468144_121.jpg', '人生就是过客', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (122, '糖衣莲子', '/uploads/Menu/78468144_122.jpg', '七九星星', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (123, '玉米焖牛肉', '/uploads/Menu/78468144_123.jpg', 'sunshinewinnie', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (124, '粉蒸胡萝卜丝', '/uploads/Menu/78468144_124.jpg', '个性胜过姿色', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (125, '茄汁黄豆炖牛肉', '/uploads/Menu/78468144_125.jpg', '政妈妈', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (126, '山蘑菇炖鸡', '/uploads/Menu/78468144_126.jpg', '政妈妈', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (127, '肉沫茄子', '/uploads/Menu/78468144_127.jpg', '雷小厨', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (128, '土豆啤酒鸭', '/uploads/Menu/78468144_128.jpg', '悦悦玉食', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (129, '鲜香板栗红烧肉', '/uploads/Menu/78468144_129.jpg', '陶玻网', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (130, '菠菜炒鸡蛋', '/uploads/Menu/78468144_130.jpg', '掀帘晨曦datura', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (131, '爆炒花蛤', '/uploads/Menu/78468144_131.jpg', '家夏', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (132, '金沙鸡翅', '/uploads/Menu/78468144_132.jpg', '安宝的虎妈', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (133, '猪颈肉炒西瓜皮', '/uploads/Menu/78468144_133.jpg', 'rosejyy2000', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (134, '蒜蓉椒香空心菜', '/uploads/Menu/78468144_134.jpg', '掀帘晨曦datura', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (135, '红烧排骨', '/uploads/Menu/78468144_135.jpg', '安宝的虎妈', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (136, '茄汁卷心菜炖鸡肉', '/uploads/Menu/78468144_136.jpg', '遗忘↘蕾拉●', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (137, '咖喱小龙虾', '/uploads/Menu/78468144_137.jpg', '天天的呀', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (138, '丝瓜炒鸡蛋', '/uploads/Menu/78468144_138.jpg', '美乐猪', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (139, '秋葵煎皖鱼', '/uploads/Menu/78468144_139.jpg', 'sourcehe', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (140, '川味啤酒鱼', '/uploads/Menu/78468144_140.jpg', '人生就是过客', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (141, '辣炒花蛤', '/uploads/Menu/78468144_141.jpg', '乐悠厨房', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (142, '生蚝鸡蛋饼', '/uploads/Menu/78468144_142.jpg', '寒飘', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (143, '炸酱油鸡翅根', '/uploads/Menu/78468144_143.jpg', '花鱼儿', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (144, '肉丝苦瓜', '/uploads/Menu/78468144_144.jpg', '清水鱼翅', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (145, '豆腐炒秋葵', '/uploads/Menu/78468144_145.jpg', '清水淡竹', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (146, '素炒豆角黑木耳', '/uploads/Menu/78468144_146.jpg', 'Meggy跳舞的苹果', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (147, '花生米茶树菇烤麸', '/uploads/Menu/78468144_147.jpg', '花鱼儿', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (148, '辣酱爆鱿鱼', '/uploads/Menu/78468144_148.jpg', '眉儿', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (149, '三鲜鳝丝', '/uploads/Menu/78468144_149.jpg', '舍得的美食诱惑', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (150, '酱焖白豆腐干', '/uploads/Menu/78468144_150.jpg', '允儿小妞的厨房', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (151, '炸锅版日式可乐饼', '/uploads/Menu/78468144_151.jpg', '韩优生活馆', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (152, '鲜香肉末炒粒粒', '/uploads/Menu/78468144_152.jpg', '掀帘晨曦datura', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (153, '尖椒白萝卜炒肉丝', '/uploads/Menu/78468144_153.jpg', '掀帘晨曦datura', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (154, '番茄酱煎鱼', '/uploads/Menu/78468144_154.jpg', 'sourcehe', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (155, '排骨烩菜', '/uploads/Menu/78468144_155.jpg', 'nuomama522', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (156, '丝瓜酿肉', '/uploads/Menu/78468144_156.jpg', '威捷朗家居', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (157, '荷叶蒸排骨', '/uploads/Menu/78468144_157.jpg', 'hlr02', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (158, '绿豆芽炒韭菜', '/uploads/Menu/78468144_158.jpg', '绿野薄荷', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (159, '蒜香炸鸡排', '/uploads/Menu/78468144_159.jpg', '绿野薄荷', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (160, '香酥鸡翅根', '/uploads/Menu/78468144_160.jpg', '花鱼儿', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (161, '鱼香肉丝', '/uploads/Menu/78468144_161.jpg', '个性胜过姿色', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (162, '菇爆鸡丁', '/uploads/Menu/78468144_162.jpg', '小耳Maggie', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (163, '培根金针菇卷', '/uploads/Menu/78468144_163.jpg', '眼角眉梢-格格', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (164, '肉片炒南瓜藤', '/uploads/Menu/78468144_164.jpg', 'Meggy跳舞的苹果', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (165, '冬瓜焖鸭', '/uploads/Menu/78468144_165.jpg', '美乐猪', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (166, '香干芹菜', '/uploads/Menu/78468144_166.jpg', 'Meggy跳舞的苹果', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (167, '酱爆猪肝', '/uploads/Menu/78468144_167.jpg', '我家臭猪', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (168, '干煸土豆里脊丝', '/uploads/Menu/78468144_168.jpg', '绿野薄荷', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (169, '胡萝卜炖牛肉', '/uploads/Menu/78468144_169.jpg', '爱美食的妈妈H', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (170, '培根芦笋卷', '/uploads/Menu/78468144_170.jpg', '斯佳丽WH', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (171, '香辣炒花甲', '/uploads/Menu/78468144_171.jpg', '斯佳丽WH', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (172, '洋葱南瓜烧秋葵', '/uploads/Menu/78468144_172.jpg', '遗忘↘蕾拉●', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (173, '黄番茄炒鸡蛋', '/uploads/Menu/78468144_173.jpg', 'rosejyy2000', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (174, '香干韭菜芽炒莲藕', '/uploads/Menu/78468144_174.jpg', '花鱼儿', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (175, '熏干芹菜', '/uploads/Menu/78468144_175.jpg', '猫猫家的私厨', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (176, '咸肉西兰花煮粉丝', '/uploads/Menu/78468144_176.jpg', '花鱼儿', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (177, '菌菇肉片', '/uploads/Menu/78468144_177.jpg', '宝妈小厨.', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (178, '滋味红烧海鳗', '/uploads/Menu/78468144_178.jpg', '微笑momo宝贝', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (179, '煎鱼块', '/uploads/Menu/78468144_179.jpg', '美乐猪', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (180, '黄焖鸡米饭', '/uploads/Menu/78468144_180.jpg', '绿野薄荷', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (181, '回锅肉', '/uploads/Menu/78468144_181.jpg', 'hlr02', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (182, '干笋烧老鸭', '/uploads/Menu/78468144_182.jpg', '舍得的美食诱惑', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (183, '西兰花炒螃蟹', '/uploads/Menu/78468144_183.jpg', '花鱼儿', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (184, '茶树菇茭白烧五花肉', '/uploads/Menu/78468144_184.jpg', '花鱼儿', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (185, '红三剁', '/uploads/Menu/78468144_185.jpg', '颢玥私房', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (186, '蛋炒江蟹', '/uploads/Menu/78468144_186.jpg', '幸福的煮妇', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (187, '锅蒸红烧肉', '/uploads/Menu/78468144_187.jpg', '多元中心', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (188, '金玉满堂', '/uploads/Menu/78468144_188.jpg', '轩雨_', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (189, '清炖鹅肉', '/uploads/Menu/78468144_189.jpg', '多元中心', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (190, '美味麻婆豆腐', '/uploads/Menu/78468144_190.jpg', '让家人体验美味', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (191, '孜然脆皮土豆块', '/uploads/Menu/78468144_191.jpg', '个性胜过姿色', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (192, '啤酒焖鱼', '/uploads/Menu/78468144_192.jpg', '手心里的宝_fWwnek', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (193, '香辣炒藕片儿', '/uploads/Menu/78468144_193.jpg', '允儿小妞的厨房', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (194, '青椒土豆丝', '/uploads/Menu/78468144_194.jpg', '芥末豆子', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (195, '懒人卷心菜', '/uploads/Menu/78468144_195.jpg', '夏家私享菜', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (196, '辣子鸡丁', '/uploads/Menu/78468144_196.jpg', 'hlr02', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (197, '小白菜炒淡菜', '/uploads/Menu/78468144_197.jpg', '花鱼儿', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (198, '五花肉炒荷兰豆', '/uploads/Menu/78468144_198.jpg', '绿野薄荷', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (199, '五花肉炒鲜蘑', '/uploads/Menu/78468144_199.jpg', '冬季心情', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (200, '三绝麻辣小龙虾', '/uploads/Menu/78468144_200.jpg', '猫猫家的私厨', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (201, '韭菜炒猪肝', '/uploads/Menu/78468144_201.jpg', '寒飘', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (202, '韭菜芽炒千张', '/uploads/Menu/78468144_202.jpg', '花鱼儿', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (203, '黄焖鸡', '/uploads/Menu/78468144_203.jpg', '允儿小妞的厨房', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (204, '五彩炒鸡蛋', '/uploads/Menu/78468144_204.jpg', '壹家食志', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (205, '粉蒸排骨', '/uploads/Menu/78468144_205.jpg', '捷赛私房菜', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (206, '培根青笋卷', '/uploads/Menu/78468144_206.jpg', 'WFMM牛妈', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (207, '香炸小鱼仔', '/uploads/Menu/78468144_207.jpg', '美乐猪', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (208, '孜然煎秋葵', '/uploads/Menu/78468144_208.jpg', 'sourcehe', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (209, '蒜苔炒腊肠', '/uploads/Menu/78468144_209.jpg', '雷小厨', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (210, '榨菜千张炒冬瓜', '/uploads/Menu/78468144_210.jpg', '花鱼儿', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (211, '木耳豆芽炒肉丝', '/uploads/Menu/78468144_211.jpg', '掀帘晨曦datura', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (212, '冰糖猪手', '/uploads/Menu/78468144_212.jpg', '鸣翠燕', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (213, '红烧牛肉', '/uploads/Menu/78468144_213.jpg', 'hlr02', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (214, '尖椒炒莲藕', '/uploads/Menu/78468144_214.jpg', '花鱼儿', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (215, '黄瓜炒猪肝', '/uploads/Menu/78468144_215.jpg', 'Meggy跳舞的苹果', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (216, '菠菜拌海虹', '/uploads/Menu/78468144_216.jpg', '政妈妈', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (217, '韭菜炒墨鱼仔', '/uploads/Menu/78468144_217.jpg', '壹家食志', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (218, '红烧鱼', '/uploads/Menu/78468144_218.jpg', '政妈妈', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (219, '香菇炖土豆', '/uploads/Menu/78468144_219.jpg', '政妈妈', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (220, '凤梨虾球', '/uploads/Menu/78468144_220.jpg', '一食半刻', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (221, '辣椒炒咸肉', '/uploads/Menu/78468144_221.jpg', '悦悦玉食', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (222, '酱猪肘子', '/uploads/Menu/78468144_222.jpg', '允儿小妞的厨房', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (223, '七彩时蔬鹌鹑蛋', '/uploads/Menu/78468144_223.jpg', '濠-ma-mi', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (224, '丝瓜炒虾仁', '/uploads/Menu/78468144_224.jpg', '心语梦境', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (225, '红烧鸡腿', '/uploads/Menu/78468144_225.jpg', '花鱼儿', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (226, '榨菜丝带豆煮冬瓜', '/uploads/Menu/78468144_226.jpg', '花鱼儿', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (227, '酸辣糖醋排骨', '/uploads/Menu/78468144_227.jpg', '老方小雨', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (228, '土豆焖鸡', '/uploads/Menu/78468144_228.jpg', '笑看天下524335751', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (229, '粉蒸胡萝卜', '/uploads/Menu/78468144_229.jpg', '眉儿', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (230, '香烤猪颈肉', '/uploads/Menu/78468144_230.jpg', '余甘果蜜', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (231, '水煮花蛤', '/uploads/Menu/78468144_231.jpg', '眉儿', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (232, '牙签肉', '/uploads/Menu/78468144_232.jpg', '眉儿', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (233, '五花肉焖土豆', '/uploads/Menu/78468144_233.jpg', '开心果姐姐', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (234, '青椒回锅肉', '/uploads/Menu/78468144_234.jpg', 'SiSi的练手记录', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (235, '尖椒韭菜芽炒绿豆芽', '/uploads/Menu/78468144_235.jpg', '花鱼儿', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (236, '八宝酿凤翼', '/uploads/Menu/78468144_236.jpg', '心煮艺的厨房', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (237, '香烤叉烧酱香干', '/uploads/Menu/78468144_237.jpg', 'BeiBei_Mom', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (238, '煎带鱼', '/uploads/Menu/78468144_238.jpg', '政妈妈', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (239, '苦瓜煎太阳蛋', '/uploads/Menu/78468144_239.jpg', 'sourcehe', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (240, '笨鸡蛋炒大葱', '/uploads/Menu/78468144_240.jpg', '贾府私房菜', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (241, '煎龙利鱼', '/uploads/Menu/78468144_241.jpg', '政妈妈', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (242, '洋葱木耳炒肉丝', '/uploads/Menu/78468144_242.jpg', 'GXL8728', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (243, '杂蔬鹅蛋', '/uploads/Menu/78468144_243.jpg', 'GXL8728', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (244, '柠檬鲜虾', '/uploads/Menu/78468144_244.jpg', '梦想家烘焙', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (245, '腊鸡腿煮包心菜', '/uploads/Menu/78468144_245.jpg', '花鱼儿', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (246, '香辣猪手烧花生', '/uploads/Menu/78468144_246.jpg', '鑫姐厨房', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (247, '粉丝剁椒蒸丝瓜', '/uploads/Menu/78468144_247.jpg', '鑫姐厨房', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (248, '夏日蜂蜜糟卤浸三宝', '/uploads/Menu/78468144_248.jpg', 'Jackylicious', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (249, '洋芋炒腌菜', '/uploads/Menu/78468144_249.jpg', '茶云坡', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (250, '黑木耳带豆煮烤麸', '/uploads/Menu/78468144_250.jpg', '花鱼儿', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (251, '丝瓜油条', '/uploads/Menu/78468144_251.jpg', '水墨墨', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (252, '煎烤鸡翅两吃', '/uploads/Menu/78468144_252.jpg', 'siyi777', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (253, '尖椒韭菜芽炒猪肚', '/uploads/Menu/78468144_253.jpg', '花鱼儿', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (254, '土豆番茄烧牛肉', '/uploads/Menu/78468144_254.jpg', '想鱼的', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (255, '千张炒木耳菜', '/uploads/Menu/78468144_255.jpg', '花鱼儿', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (256, '上汤手打鱼肉塞面筋', '/uploads/Menu/78468144_256.jpg', 'Jackylicious', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (257, '酸辣土豆丝', '/uploads/Menu/78468144_257.jpg', 'Meggy跳舞的苹果', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (258, '麻辣十三香小龙虾', '/uploads/Menu/78468144_258.jpg', '萌食志', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (259, '油焖鸡翅', '/uploads/Menu/78468144_259.jpg', '清水淡竹', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (260, '砂锅黄焖鸡', '/uploads/Menu/78468144_260.jpg', '舍得的美食诱惑', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (261, '花生绿豆猪脚汤', '/uploads/Menu/78468144_261.jpg', '舍得的美食诱惑', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (262, '肉末豇豆', '/uploads/Menu/78468144_262.jpg', 'rosejyy2000', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (263, '香煎虾饼', '/uploads/Menu/78468144_263.jpg', 'Suki66', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (264, '叉烧肉', '/uploads/Menu/78468144_264.jpg', '素年米妈厨房', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (265, '剁椒蒸豆角', '/uploads/Menu/78468144_265.jpg', '夏家私享菜', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (266, '咸蛋南瓜', '/uploads/Menu/78468144_266.jpg', 'Elin', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (267, '麻辣水煮肉片', '/uploads/Menu/78468144_267.jpg', '茶云坡', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (268, '咸蛋苦瓜', '/uploads/Menu/78468144_268.jpg', 'sunshinewinnie', 10, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (269, '皮皮虾炖豆腐', '/uploads/Menu/78468144_269.jpg', '心煮艺的厨房', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (270, '毛豆茭白煮小油豆腐', '/uploads/Menu/78468144_270.jpg', '花鱼儿', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (271, '经典培根卷', '/uploads/Menu/78468144_271.jpg', '胖子瘦子我都爱', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (272, '海鲜菇日本豆腐', '/uploads/Menu/78468144_272.jpg', '政妈妈', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (273, '梅豆莲藕煮排骨', '/uploads/Menu/78468144_273.jpg', '花鱼儿', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (274, '椒香鸡柳', '/uploads/Menu/78468144_274.jpg', 'Meggy跳舞的苹果', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (275, '蒜烧冬瓜条', '/uploads/Menu/78468144_275.jpg', 'Meggy跳舞的苹果', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (276, '烤脆骨土豆', '/uploads/Menu/78468144_276.jpg', '政妈妈', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (277, '煎日本豆腐', '/uploads/Menu/78468144_277.jpg', '政妈妈', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (278, '香酥麻辣虾', '/uploads/Menu/78468144_278.jpg', '舍得的美食诱惑', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (279, '瓠子尖椒炒肉片', '/uploads/Menu/78468144_279.jpg', '掀帘晨曦datura', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (280, '苏式响油鳝丝', '/uploads/Menu/78468144_280.jpg', '七九星星', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (281, '菠菜炒牛肉', '/uploads/Menu/78468144_281.jpg', '寒飘', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (282, '玉翠满堂', '/uploads/Menu/78468144_282.jpg', '蜜蜜爸爸', 7, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (283, '吮指腐乳花生炖猪蹄', '/uploads/Menu/78468144_283.jpg', 'jijiqucho', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (284, '腐竹粉丝牛筋煲', '/uploads/Menu/78468144_284.jpg', '七九星星', 12, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (285, '土豆面筋烧鸡块', '/uploads/Menu/78468144_285.jpg', '七九星星', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (286, '豆腐饼焖肉', '/uploads/Menu/78468144_286.jpg', '橙子妈妈Eva', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (287, '素炒年糕', '/uploads/Menu/78468144_287.jpg', '胖熊小兔', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (288, '豆角杂锦烧肉丁', '/uploads/Menu/78468144_288.jpg', '掀帘晨曦datura', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (289, '炒疙瘩', '/uploads/Menu/78468144_289.jpg', 'Meggy跳舞的苹果', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (290, '素炒小白菜', '/uploads/Menu/78468144_290.jpg', '冬季心情', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (291, '咖喱小龙虾', '/uploads/Menu/78468144_291.jpg', '小M的厨房', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (292, '干锅藕片', '/uploads/Menu/78468144_292.jpg', '安娜_Anna', 17, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (293, '尖椒猪肉炒茄子', '/uploads/Menu/78468144_293.jpg', '花鱼儿', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (294, '鸡蛋炒尖椒', '/uploads/Menu/78468144_294.jpg', 'Meggy跳舞的苹果', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (295, '蚝油罗氏虾', '/uploads/Menu/78468144_295.jpg', '鸣翠燕', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (296, '小鸡炖蘑菇', '/uploads/Menu/78468144_296.jpg', '小玲珑妈妈…', 3, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (297, '红烧排骨', '/uploads/Menu/78468144_297.jpg', '蜜蜜爸爸', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (298, '广式叉烧', '/uploads/Menu/78468144_298.jpg', '烘焙123', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (299, '土豆烧素鸡', '/uploads/Menu/78468144_299.jpg', '花鱼儿', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (300, '咖喱素什锦', '/uploads/Menu/78468144_300.jpg', '心煮艺的厨房', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (301, '双味鱼', '/uploads/Menu/78468144_301.jpg', '人生就是过客', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (302, '番茄龙利鱼汤', '/uploads/Menu/78468144_302.jpg', '拾味十', 4, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (303, '耋耄酸辣猪脚', '/uploads/Menu/78468144_303.jpg', '舍得的美食诱惑', 13, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (304, '水煮牛肉', '/uploads/Menu/78468144_304.jpg', '美食侦探yk', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (305, '上汤娃娃菜', '/uploads/Menu/78468144_305.jpg', 'sunshinewinnie', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (306, '白灼香螺', '/uploads/Menu/78468144_306.jpg', '祯祯宝贝', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (307, '苦瓜炒牛肉', '/uploads/Menu/78468144_307.jpg', '清水淡竹', 15, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (308, '啤酒鸭', '/uploads/Menu/78468144_308.jpg', 'lqmy2k', 14, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (309, '鸡胗炒豆角', '/uploads/Menu/78468144_309.jpg', 'sourcehe', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (310, '茄子酱', '/uploads/Menu/78468144_310.jpg', '奇玉音缘', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (311, '肉末带豆炒年糕', '/uploads/Menu/78468144_311.jpg', '花鱼儿', 9, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (312, '家常烧鲫鱼', '/uploads/Menu/78468144_312.jpg', '允儿小妞的厨房', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (313, '老干妈烧茄子', '/uploads/Menu/78468144_313.jpg', '斯佳丽WH', 5, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (314, '红烧安康鱼肚', '/uploads/Menu/78468144_314.jpg', '奇玉音缘', 16, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (315, '干锅香辣虾', '/uploads/Menu/78468144_315.jpg', '浅紫姑娘??_xLwdqU', 2, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (316, '水煮鱼', '/uploads/Menu/78468144_316.jpg', '花开夕颜', 1, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (317, '麻辣干锅虾', '/uploads/Menu/78468144_317.jpg', '橙子妈妈Eva', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (318, '盐煎肉', '/uploads/Menu/78468144_318.jpg', '秋宝恬然', 8, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (319, '双椒鱼片', '/uploads/Menu/78468144_319.jpg', '我是狂草', 11, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);
INSERT INTO `fa_menu` VALUES (320, '椒盐酱油虾', '/uploads/Menu/78468144_320.jpg', '寒飘', 6, 50, 10, '美味香甜,同嫂无欺', NULL, NULL);

-- ----------------------------
-- Table structure for fa_menu_class
-- ----------------------------
DROP TABLE IF EXISTS `fa_menu_class`;
CREATE TABLE `fa_menu_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜品类型',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '菜品类型图片',
  `is_navdata` smallint(1) NULL DEFAULT NULL COMMENT '是否为推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_menu_class
-- ----------------------------
INSERT INTO `fa_menu_class` VALUES (1, '川菜', '/uploads/Menu/78468144_11.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (2, '鲁菜', '/uploads/Menu/78468144_12.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (3, '粤菜', '/uploads/Menu/78468144_13.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (4, '淮扬菜', '/uploads/Menu/78468144_14.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (5, '浙菜', '/uploads/Menu/78468144_15.jpg', 1);
INSERT INTO `fa_menu_class` VALUES (6, '闽菜', '/uploads/Menu/78468144_16.jpg', 1);
INSERT INTO `fa_menu_class` VALUES (7, '湘菜', '/uploads/Menu/78468144_17.jpg', 1);
INSERT INTO `fa_menu_class` VALUES (8, '徽菜', '/uploads/Menu/78468144_18.jpg', 1);
INSERT INTO `fa_menu_class` VALUES (9, '东北菜', '/uploads/Menu/78468144_19.jpg', 1);
INSERT INTO `fa_menu_class` VALUES (10, '冀菜', '/uploads/Menu/78468144_20.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (11, '豫菜', '/uploads/Menu/78468144_21.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (12, '鄂菜', '/uploads/Menu/78468144_22.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (13, '本帮菜', '/uploads/Menu/78468144_23.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (14, '客家菜', '/uploads/Menu/78468144_24.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (15, '赣菜', '/uploads/Menu/78468144_25.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (16, '京菜', '/uploads/Menu/78468144_26.jpg', NULL);
INSERT INTO `fa_menu_class` VALUES (17, '清真菜', '/uploads/Menu/78468144_27.jpg', NULL);

-- ----------------------------
-- Table structure for fa_menu_copy1
-- ----------------------------
DROP TABLE IF EXISTS `fa_menu_copy1`;
CREATE TABLE `fa_menu_copy1`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜名',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '缩略图',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 321 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_menu_copy1
-- ----------------------------
INSERT INTO `fa_menu_copy1` VALUES (1, '香辣莲藕', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_1.jpg', '雷小厨');
INSERT INTO `fa_menu_copy1` VALUES (2, '海鲜秀珍菇豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_2.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (3, '紫苏土豆焖鸭', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_3.jpg', 'Suki燕儿');
INSERT INTO `fa_menu_copy1` VALUES (4, '酥炸带鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_4.jpg', '夏家私享菜');
INSERT INTO `fa_menu_copy1` VALUES (5, '辣炒扁芸豆', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_5.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (6, '蛋蒸花蛤', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_6.jpg', 'YNZAXYS_XOCKeM');
INSERT INTO `fa_menu_copy1` VALUES (7, '可乐翅中', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_7.jpg', 'YNZAXYS_XOCKeM');
INSERT INTO `fa_menu_copy1` VALUES (8, '清蒸龙利鱼柳', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_8.jpg', '宣大爷是胖妞');
INSERT INTO `fa_menu_copy1` VALUES (9, '干锅酱香蟹', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_9.jpg', 'YNZAXYS_XOCKeM');
INSERT INTO `fa_menu_copy1` VALUES (10, '西红柿炒蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_10.jpg', 'YouTude精彩视频');
INSERT INTO `fa_menu_copy1` VALUES (11, '酸甜排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_11.jpg', 'Elin');
INSERT INTO `fa_menu_copy1` VALUES (12, '荷兰豆炒五花肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_12.jpg', '关于小妮');
INSERT INTO `fa_menu_copy1` VALUES (13, '酱香杏鲍菇肉片', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_13.jpg', '二婷爱美食');
INSERT INTO `fa_menu_copy1` VALUES (14, '蒜蓉粉丝蒸扇贝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_14.jpg', '马小马_CGGLmT');
INSERT INTO `fa_menu_copy1` VALUES (15, '葱爆羊肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_15.jpg', '家夏');
INSERT INTO `fa_menu_copy1` VALUES (16, '私房浓香鸡煲', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_16.jpg', '允儿小妞的厨房');
INSERT INTO `fa_menu_copy1` VALUES (17, '泡椒笋干回锅肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_17.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (18, '秋葵炒虾仁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_18.jpg', '清水淡竹');
INSERT INTO `fa_menu_copy1` VALUES (19, '蒜蓉虾仁生蚝蒸粉丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_19.jpg', '宣大爷是胖妞');
INSERT INTO `fa_menu_copy1` VALUES (20, '包菜炒粉丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_20.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (21, '叫花鸡', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_21.jpg', '这世道☆没人道');
INSERT INTO `fa_menu_copy1` VALUES (22, '泡椒蒸鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_22.jpg', 'sourcehe');
INSERT INTO `fa_menu_copy1` VALUES (23, '盖浇嫩豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_23.jpg', '女为悦己者而容');
INSERT INTO `fa_menu_copy1` VALUES (24, '干煸手撕杏鲍菇', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_24.jpg', '李李小酒窝');
INSERT INTO `fa_menu_copy1` VALUES (25, '蜜汁叉烧', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_25.jpg', '胖子瘦子我都爱');
INSERT INTO `fa_menu_copy1` VALUES (26, '香辣土豆片', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_26.jpg', '二婷爱美食');
INSERT INTO `fa_menu_copy1` VALUES (27, '水煮牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_27.jpg', '罗拉藏馆');
INSERT INTO `fa_menu_copy1` VALUES (28, '牛肉炒农家菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_28.jpg', 'rosejyy2000');
INSERT INTO `fa_menu_copy1` VALUES (29, '蒜黄木耳炒鸡蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_29.jpg', 'JOJOJOJOJOJO');
INSERT INTO `fa_menu_copy1` VALUES (30, '麻辣牛肚百叶', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_30.jpg', '沵沵');
INSERT INTO `fa_menu_copy1` VALUES (31, '锅巴肉片', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_31.jpg', '个性胜过姿色');
INSERT INTO `fa_menu_copy1` VALUES (32, '空气炸锅版花菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_32.jpg', '韩优生活馆');
INSERT INTO `fa_menu_copy1` VALUES (33, '番茄土豆炖牛腩', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_33.jpg', '我幸福相约');
INSERT INTO `fa_menu_copy1` VALUES (34, '尖椒炒鸡胗', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_34.jpg', 'sourcehe');
INSERT INTO `fa_menu_copy1` VALUES (35, '可乐鸡翅', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_35.jpg', '陶玻网');
INSERT INTO `fa_menu_copy1` VALUES (36, '干烧白虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_36.jpg', '壹家食志');
INSERT INTO `fa_menu_copy1` VALUES (37, '炒土豆片', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_37.jpg', '雷小厨');
INSERT INTO `fa_menu_copy1` VALUES (38, '香椿炒鸡蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_38.jpg', '冬季心情');
INSERT INTO `fa_menu_copy1` VALUES (39, '啤酒鹌鹑蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_39.jpg', '食·色');
INSERT INTO `fa_menu_copy1` VALUES (40, '麻辣小龙虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_40.jpg', 'qem2000');
INSERT INTO `fa_menu_copy1` VALUES (41, '培根炒松花菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_41.jpg', '关于小妮');
INSERT INTO `fa_menu_copy1` VALUES (42, '酱香豆干', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_42.jpg', '眉儿');
INSERT INTO `fa_menu_copy1` VALUES (43, '回锅肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_43.jpg', '沵沵');
INSERT INTO `fa_menu_copy1` VALUES (44, '酸辣藕丁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_44.jpg', '银元宝');
INSERT INTO `fa_menu_copy1` VALUES (45, '奥尔良烤翅', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_45.jpg', '蒙的宝');
INSERT INTO `fa_menu_copy1` VALUES (46, '红果茄汁焖大虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_46.jpg', '艳梅_h');
INSERT INTO `fa_menu_copy1` VALUES (47, '豆花牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_47.jpg', '遗忘↘蕾拉●');
INSERT INTO `fa_menu_copy1` VALUES (48, '飘香鸡翅', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_48.jpg', '四叶小馆');
INSERT INTO `fa_menu_copy1` VALUES (49, '桂花红糖鸡翅', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_49.jpg', '大嘴螺');
INSERT INTO `fa_menu_copy1` VALUES (50, '鸡汁蟹味菇', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_50.jpg', '梦悦的小灶炉');
INSERT INTO `fa_menu_copy1` VALUES (51, '蒜泥蒸茄子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_51.jpg', '清水淡竹');
INSERT INTO `fa_menu_copy1` VALUES (52, '莲子豌豆炒虾仁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_52.jpg', '清水淡竹');
INSERT INTO `fa_menu_copy1` VALUES (53, '冬瓜烧大排', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_53.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (54, '原味蒜苔排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_54.jpg', 'ferrarizhun');
INSERT INTO `fa_menu_copy1` VALUES (55, '小白菜咸肉炒莲藕', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_55.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (56, '蒜茸空心菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_56.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (57, '芷香鸡爪', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_57.jpg', '关于小妮');
INSERT INTO `fa_menu_copy1` VALUES (58, '玉米炖排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_58.jpg', '舞之灵');
INSERT INTO `fa_menu_copy1` VALUES (59, '酸辣豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_59.jpg', '阳光明媚99');
INSERT INTO `fa_menu_copy1` VALUES (60, '糖醋丸子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_60.jpg', 'twinsliuliu');
INSERT INTO `fa_menu_copy1` VALUES (61, '清蒸黄花鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_61.jpg', '女为悦己者而容');
INSERT INTO `fa_menu_copy1` VALUES (62, '茄汁鱼柳', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_62.jpg', '黑猫警长kitchen');
INSERT INTO `fa_menu_copy1` VALUES (63, '可乐鸡翅', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_63.jpg', '随便粑粑');
INSERT INTO `fa_menu_copy1` VALUES (64, '咸肉炒豇豆豆干', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_64.jpg', 'rosejyy2000');
INSERT INTO `fa_menu_copy1` VALUES (65, '空气炸锅版蒜蓉烤基围虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_65.jpg', '韩优生活馆');
INSERT INTO `fa_menu_copy1` VALUES (66, '粉蒸排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_66.jpg', '恬萝姑娘');
INSERT INTO `fa_menu_copy1` VALUES (67, '鲜莲子炒虾仁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_67.jpg', '营养美食设计李晖');
INSERT INTO `fa_menu_copy1` VALUES (68, '夏日田园小炒', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_68.jpg', '斯佳丽WH');
INSERT INTO `fa_menu_copy1` VALUES (69, '无水炒青菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_69.jpg', '威捷朗家居');
INSERT INTO `fa_menu_copy1` VALUES (70, '洋葱豆角炒香干', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_70.jpg', 'lxp幸福');
INSERT INTO `fa_menu_copy1` VALUES (71, '炖土豆', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_71.jpg', '雷小厨');
INSERT INTO `fa_menu_copy1` VALUES (72, '咖喱白菜鸡翅根', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_72.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (73, '家常焖三鲜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_73.jpg', '贾府私房菜');
INSERT INTO `fa_menu_copy1` VALUES (74, '凤梨炒虾仁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_74.jpg', '寒飘');
INSERT INTO `fa_menu_copy1` VALUES (75, '孜然麻辣小土豆', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_75.jpg', '猫猫家的私厨');
INSERT INTO `fa_menu_copy1` VALUES (76, '韭菜花炒蛏子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_76.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (77, '干锅香辣鸭翅', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_77.jpg', '允儿小妞的厨房');
INSERT INTO `fa_menu_copy1` VALUES (78, '红烧肉烧笋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_78.jpg', '舞之灵');
INSERT INTO `fa_menu_copy1` VALUES (79, '辣椒酱焖老豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_79.jpg', '黑猫警长kitchen');
INSERT INTO `fa_menu_copy1` VALUES (80, '豉香莲藕鲜虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_80.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (81, '豆豉鲮鱼油麦菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_81.jpg', 'hlr02');
INSERT INTO `fa_menu_copy1` VALUES (82, '咸肉卷心菜炒粉丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_82.jpg', '悦悦玉食');
INSERT INTO `fa_menu_copy1` VALUES (83, '葱烧鸡腿', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_83.jpg', '悦悦玉食');
INSERT INTO `fa_menu_copy1` VALUES (84, '韭菜炒鱿鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_84.jpg', '冬季心情');
INSERT INTO `fa_menu_copy1` VALUES (85, '茄汁鸡蛋老豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_85.jpg', 'rosejyy2000');
INSERT INTO `fa_menu_copy1` VALUES (86, '百花酿茄子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_86.jpg', '遗忘↘蕾拉●');
INSERT INTO `fa_menu_copy1` VALUES (87, '麻婆肉末白菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_87.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (88, '干煎小平鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_88.jpg', '演堃@杨爸爸');
INSERT INTO `fa_menu_copy1` VALUES (89, '白萝卜炖排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_89.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (90, '豆腐圆子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_90.jpg', '紫嫣秀儿');
INSERT INTO `fa_menu_copy1` VALUES (91, '清蒸帝王蟹', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_91.jpg', '翟女……');
INSERT INTO `fa_menu_copy1` VALUES (92, '泡椒猪肝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_92.jpg', '人生就是过客');
INSERT INTO `fa_menu_copy1` VALUES (93, '酱香肉沫蒸茄子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_93.jpg', '我家臭猪');
INSERT INTO `fa_menu_copy1` VALUES (94, '咖喱里脊肉豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_94.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (95, '酱鸡翅根', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_95.jpg', '我的美食我做主77');
INSERT INTO `fa_menu_copy1` VALUES (96, '家常麻婆豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_96.jpg', '眉儿');
INSERT INTO `fa_menu_copy1` VALUES (97, '青豆炒肉末', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_97.jpg', '二婷爱美食');
INSERT INTO `fa_menu_copy1` VALUES (98, '豆角焖面', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_98.jpg', '个性胜过姿色');
INSERT INTO `fa_menu_copy1` VALUES (99, '葱香蛏子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_99.jpg', '美乐猪');
INSERT INTO `fa_menu_copy1` VALUES (100, '家常版梅干菜扣肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_100.jpg', '小诺厨娘');
INSERT INTO `fa_menu_copy1` VALUES (101, '鱼香肉丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_101.jpg', '心语梦境');
INSERT INTO `fa_menu_copy1` VALUES (102, '有机花菜炒花肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_102.jpg', '黑猫警长kitchen');
INSERT INTO `fa_menu_copy1` VALUES (103, '剁椒魚頭', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_103.jpg', '蔡礼城');
INSERT INTO `fa_menu_copy1` VALUES (104, '尖椒猪肉炒酸菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_104.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (105, '家烧粉丝小黄鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_105.jpg', '夏家私享菜');
INSERT INTO `fa_menu_copy1` VALUES (106, '香椿炒鸡蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_106.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (107, '蒜蓉娃娃菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_107.jpg', '美乐猪');
INSERT INTO `fa_menu_copy1` VALUES (108, '粉蒸土豆丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_108.jpg', '个性胜过姿色');
INSERT INTO `fa_menu_copy1` VALUES (109, '圆白菜炒粉条', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_109.jpg', '宝妈小厨.');
INSERT INTO `fa_menu_copy1` VALUES (110, '蚝油烧豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_110.jpg', '宝妈小厨.');
INSERT INTO `fa_menu_copy1` VALUES (111, '家常炖鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_111.jpg', '宝妈小厨.');
INSERT INTO `fa_menu_copy1` VALUES (112, '素炒茼蒿', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_112.jpg', '冬季心情');
INSERT INTO `fa_menu_copy1` VALUES (113, '香葱土豆', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_113.jpg', 'sourcehe');
INSERT INTO `fa_menu_copy1` VALUES (114, '蒜苗豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_114.jpg', '美乐猪');
INSERT INTO `fa_menu_copy1` VALUES (115, '鸡翅炖胡萝卜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_115.jpg', '蒲的贪吃老爸');
INSERT INTO `fa_menu_copy1` VALUES (116, '苦瓜酿土豆泥', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_116.jpg', '大嘴螺');
INSERT INTO `fa_menu_copy1` VALUES (117, '灯笼茄子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_117.jpg', '安娜_Anna');
INSERT INTO `fa_menu_copy1` VALUES (118, '酸辣土豆丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_118.jpg', 'Elin');
INSERT INTO `fa_menu_copy1` VALUES (119, '鱼香素鸡', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_119.jpg', '悦悦玉食');
INSERT INTO `fa_menu_copy1` VALUES (120, '家常美味千页豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_120.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (121, '卤水鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_121.jpg', '人生就是过客');
INSERT INTO `fa_menu_copy1` VALUES (122, '糖衣莲子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_122.jpg', '七九星星');
INSERT INTO `fa_menu_copy1` VALUES (123, '玉米焖牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_123.jpg', 'sunshinewinnie');
INSERT INTO `fa_menu_copy1` VALUES (124, '粉蒸胡萝卜丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_124.jpg', '个性胜过姿色');
INSERT INTO `fa_menu_copy1` VALUES (125, '茄汁黄豆炖牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_125.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (126, '山蘑菇炖鸡', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_126.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (127, '肉沫茄子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_127.jpg', '雷小厨');
INSERT INTO `fa_menu_copy1` VALUES (128, '土豆啤酒鸭', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_128.jpg', '悦悦玉食');
INSERT INTO `fa_menu_copy1` VALUES (129, '鲜香板栗红烧肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_129.jpg', '陶玻网');
INSERT INTO `fa_menu_copy1` VALUES (130, '菠菜炒鸡蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_130.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (131, '爆炒花蛤', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_131.jpg', '家夏');
INSERT INTO `fa_menu_copy1` VALUES (132, '金沙鸡翅', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_132.jpg', '安宝的虎妈');
INSERT INTO `fa_menu_copy1` VALUES (133, '猪颈肉炒西瓜皮', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_133.jpg', 'rosejyy2000');
INSERT INTO `fa_menu_copy1` VALUES (134, '蒜蓉椒香空心菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_134.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (135, '红烧排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_135.jpg', '安宝的虎妈');
INSERT INTO `fa_menu_copy1` VALUES (136, '茄汁卷心菜炖鸡肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_136.jpg', '遗忘↘蕾拉●');
INSERT INTO `fa_menu_copy1` VALUES (137, '咖喱小龙虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_137.jpg', '天天的呀');
INSERT INTO `fa_menu_copy1` VALUES (138, '丝瓜炒鸡蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_138.jpg', '美乐猪');
INSERT INTO `fa_menu_copy1` VALUES (139, '秋葵煎皖鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_139.jpg', 'sourcehe');
INSERT INTO `fa_menu_copy1` VALUES (140, '川味啤酒鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_140.jpg', '人生就是过客');
INSERT INTO `fa_menu_copy1` VALUES (141, '辣炒花蛤', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_141.jpg', '乐悠厨房');
INSERT INTO `fa_menu_copy1` VALUES (142, '生蚝鸡蛋饼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_142.jpg', '寒飘');
INSERT INTO `fa_menu_copy1` VALUES (143, '炸酱油鸡翅根', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_143.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (144, '肉丝苦瓜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_144.jpg', '清水鱼翅');
INSERT INTO `fa_menu_copy1` VALUES (145, '豆腐炒秋葵', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_145.jpg', '清水淡竹');
INSERT INTO `fa_menu_copy1` VALUES (146, '素炒豆角黑木耳', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_146.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (147, '花生米茶树菇烤麸', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_147.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (148, '辣酱爆鱿鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_148.jpg', '眉儿');
INSERT INTO `fa_menu_copy1` VALUES (149, '三鲜鳝丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_149.jpg', '舍得的美食诱惑');
INSERT INTO `fa_menu_copy1` VALUES (150, '酱焖白豆腐干', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_150.jpg', '允儿小妞的厨房');
INSERT INTO `fa_menu_copy1` VALUES (151, '炸锅版日式可乐饼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_151.jpg', '韩优生活馆');
INSERT INTO `fa_menu_copy1` VALUES (152, '鲜香肉末炒粒粒', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_152.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (153, '尖椒白萝卜炒肉丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_153.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (154, '番茄酱煎鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_154.jpg', 'sourcehe');
INSERT INTO `fa_menu_copy1` VALUES (155, '排骨烩菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_155.jpg', 'nuomama522');
INSERT INTO `fa_menu_copy1` VALUES (156, '丝瓜酿肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_156.jpg', '威捷朗家居');
INSERT INTO `fa_menu_copy1` VALUES (157, '荷叶蒸排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_157.jpg', 'hlr02');
INSERT INTO `fa_menu_copy1` VALUES (158, '绿豆芽炒韭菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_158.jpg', '绿野薄荷');
INSERT INTO `fa_menu_copy1` VALUES (159, '蒜香炸鸡排', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_159.jpg', '绿野薄荷');
INSERT INTO `fa_menu_copy1` VALUES (160, '香酥鸡翅根', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_160.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (161, '鱼香肉丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_161.jpg', '个性胜过姿色');
INSERT INTO `fa_menu_copy1` VALUES (162, '菇爆鸡丁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_162.jpg', '小耳Maggie');
INSERT INTO `fa_menu_copy1` VALUES (163, '培根金针菇卷', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_163.jpg', '眼角眉梢-格格');
INSERT INTO `fa_menu_copy1` VALUES (164, '肉片炒南瓜藤', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_164.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (165, '冬瓜焖鸭', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_165.jpg', '美乐猪');
INSERT INTO `fa_menu_copy1` VALUES (166, '香干芹菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_166.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (167, '酱爆猪肝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_167.jpg', '我家臭猪');
INSERT INTO `fa_menu_copy1` VALUES (168, '干煸土豆里脊丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_168.jpg', '绿野薄荷');
INSERT INTO `fa_menu_copy1` VALUES (169, '胡萝卜炖牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_169.jpg', '爱美食的妈妈H');
INSERT INTO `fa_menu_copy1` VALUES (170, '培根芦笋卷', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_170.jpg', '斯佳丽WH');
INSERT INTO `fa_menu_copy1` VALUES (171, '香辣炒花甲', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_171.jpg', '斯佳丽WH');
INSERT INTO `fa_menu_copy1` VALUES (172, '洋葱南瓜烧秋葵', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_172.jpg', '遗忘↘蕾拉●');
INSERT INTO `fa_menu_copy1` VALUES (173, '黄番茄炒鸡蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_173.jpg', 'rosejyy2000');
INSERT INTO `fa_menu_copy1` VALUES (174, '香干韭菜芽炒莲藕', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_174.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (175, '熏干芹菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_175.jpg', '猫猫家的私厨');
INSERT INTO `fa_menu_copy1` VALUES (176, '咸肉西兰花煮粉丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_176.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (177, '菌菇肉片', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_177.jpg', '宝妈小厨.');
INSERT INTO `fa_menu_copy1` VALUES (178, '滋味红烧海鳗', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_178.jpg', '微笑momo宝贝');
INSERT INTO `fa_menu_copy1` VALUES (179, '煎鱼块', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_179.jpg', '美乐猪');
INSERT INTO `fa_menu_copy1` VALUES (180, '黄焖鸡米饭', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_180.jpg', '绿野薄荷');
INSERT INTO `fa_menu_copy1` VALUES (181, '回锅肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_181.jpg', 'hlr02');
INSERT INTO `fa_menu_copy1` VALUES (182, '干笋烧老鸭', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_182.jpg', '舍得的美食诱惑');
INSERT INTO `fa_menu_copy1` VALUES (183, '西兰花炒螃蟹', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_183.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (184, '茶树菇茭白烧五花肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_184.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (185, '红三剁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_185.jpg', '颢玥私房');
INSERT INTO `fa_menu_copy1` VALUES (186, '蛋炒江蟹', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_186.jpg', '幸福的煮妇');
INSERT INTO `fa_menu_copy1` VALUES (187, '锅蒸红烧肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_187.jpg', '多元中心');
INSERT INTO `fa_menu_copy1` VALUES (188, '金玉满堂', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_188.jpg', '轩雨_');
INSERT INTO `fa_menu_copy1` VALUES (189, '清炖鹅肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_189.jpg', '多元中心');
INSERT INTO `fa_menu_copy1` VALUES (190, '美味麻婆豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_190.jpg', '让家人体验美味');
INSERT INTO `fa_menu_copy1` VALUES (191, '孜然脆皮土豆块', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_191.jpg', '个性胜过姿色');
INSERT INTO `fa_menu_copy1` VALUES (192, '啤酒焖鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_192.jpg', '手心里的宝_fWwnek');
INSERT INTO `fa_menu_copy1` VALUES (193, '香辣炒藕片儿', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_193.jpg', '允儿小妞的厨房');
INSERT INTO `fa_menu_copy1` VALUES (194, '青椒土豆丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_194.jpg', '芥末豆子');
INSERT INTO `fa_menu_copy1` VALUES (195, '懒人卷心菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_195.jpg', '夏家私享菜');
INSERT INTO `fa_menu_copy1` VALUES (196, '辣子鸡丁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_196.jpg', 'hlr02');
INSERT INTO `fa_menu_copy1` VALUES (197, '小白菜炒淡菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_197.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (198, '五花肉炒荷兰豆', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_198.jpg', '绿野薄荷');
INSERT INTO `fa_menu_copy1` VALUES (199, '五花肉炒鲜蘑', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_199.jpg', '冬季心情');
INSERT INTO `fa_menu_copy1` VALUES (200, '三绝麻辣小龙虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_200.jpg', '猫猫家的私厨');
INSERT INTO `fa_menu_copy1` VALUES (201, '韭菜炒猪肝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_201.jpg', '寒飘');
INSERT INTO `fa_menu_copy1` VALUES (202, '韭菜芽炒千张', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_202.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (203, '黄焖鸡', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_203.jpg', '允儿小妞的厨房');
INSERT INTO `fa_menu_copy1` VALUES (204, '五彩炒鸡蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_204.jpg', '壹家食志');
INSERT INTO `fa_menu_copy1` VALUES (205, '粉蒸排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_205.jpg', '捷赛私房菜');
INSERT INTO `fa_menu_copy1` VALUES (206, '培根青笋卷', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_206.jpg', 'WFMM牛妈');
INSERT INTO `fa_menu_copy1` VALUES (207, '香炸小鱼仔', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_207.jpg', '美乐猪');
INSERT INTO `fa_menu_copy1` VALUES (208, '孜然煎秋葵', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_208.jpg', 'sourcehe');
INSERT INTO `fa_menu_copy1` VALUES (209, '蒜苔炒腊肠', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_209.jpg', '雷小厨');
INSERT INTO `fa_menu_copy1` VALUES (210, '榨菜千张炒冬瓜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_210.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (211, '木耳豆芽炒肉丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_211.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (212, '冰糖猪手', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_212.jpg', '鸣翠燕');
INSERT INTO `fa_menu_copy1` VALUES (213, '红烧牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_213.jpg', 'hlr02');
INSERT INTO `fa_menu_copy1` VALUES (214, '尖椒炒莲藕', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_214.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (215, '黄瓜炒猪肝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_215.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (216, '菠菜拌海虹', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_216.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (217, '韭菜炒墨鱼仔', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_217.jpg', '壹家食志');
INSERT INTO `fa_menu_copy1` VALUES (218, '红烧鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_218.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (219, '香菇炖土豆', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_219.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (220, '凤梨虾球', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_220.jpg', '一食半刻');
INSERT INTO `fa_menu_copy1` VALUES (221, '辣椒炒咸肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_221.jpg', '悦悦玉食');
INSERT INTO `fa_menu_copy1` VALUES (222, '酱猪肘子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_222.jpg', '允儿小妞的厨房');
INSERT INTO `fa_menu_copy1` VALUES (223, '七彩时蔬鹌鹑蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_223.jpg', '濠-ma-mi');
INSERT INTO `fa_menu_copy1` VALUES (224, '丝瓜炒虾仁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_224.jpg', '心语梦境');
INSERT INTO `fa_menu_copy1` VALUES (225, '红烧鸡腿', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_225.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (226, '榨菜丝带豆煮冬瓜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_226.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (227, '酸辣糖醋排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_227.jpg', '老方小雨');
INSERT INTO `fa_menu_copy1` VALUES (228, '土豆焖鸡', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_228.jpg', '笑看天下524335751');
INSERT INTO `fa_menu_copy1` VALUES (229, '粉蒸胡萝卜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_229.jpg', '眉儿');
INSERT INTO `fa_menu_copy1` VALUES (230, '香烤猪颈肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_230.jpg', '余甘果蜜');
INSERT INTO `fa_menu_copy1` VALUES (231, '水煮花蛤', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_231.jpg', '眉儿');
INSERT INTO `fa_menu_copy1` VALUES (232, '牙签肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_232.jpg', '眉儿');
INSERT INTO `fa_menu_copy1` VALUES (233, '五花肉焖土豆', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_233.jpg', '开心果姐姐');
INSERT INTO `fa_menu_copy1` VALUES (234, '青椒回锅肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_234.jpg', 'SiSi的练手记录');
INSERT INTO `fa_menu_copy1` VALUES (235, '尖椒韭菜芽炒绿豆芽', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_235.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (236, '八宝酿凤翼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_236.jpg', '心煮艺的厨房');
INSERT INTO `fa_menu_copy1` VALUES (237, '香烤叉烧酱香干', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_237.jpg', 'BeiBei_Mom');
INSERT INTO `fa_menu_copy1` VALUES (238, '煎带鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_238.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (239, '苦瓜煎太阳蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_239.jpg', 'sourcehe');
INSERT INTO `fa_menu_copy1` VALUES (240, '笨鸡蛋炒大葱', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_240.jpg', '贾府私房菜');
INSERT INTO `fa_menu_copy1` VALUES (241, '煎龙利鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_241.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (242, '洋葱木耳炒肉丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_242.jpg', 'GXL8728');
INSERT INTO `fa_menu_copy1` VALUES (243, '杂蔬鹅蛋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_243.jpg', 'GXL8728');
INSERT INTO `fa_menu_copy1` VALUES (244, '柠檬鲜虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_244.jpg', '梦想家烘焙');
INSERT INTO `fa_menu_copy1` VALUES (245, '腊鸡腿煮包心菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_245.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (246, '香辣猪手烧花生', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_246.jpg', '鑫姐厨房');
INSERT INTO `fa_menu_copy1` VALUES (247, '粉丝剁椒蒸丝瓜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_247.jpg', '鑫姐厨房');
INSERT INTO `fa_menu_copy1` VALUES (248, '夏日蜂蜜糟卤浸三宝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_248.jpg', 'Jackylicious');
INSERT INTO `fa_menu_copy1` VALUES (249, '洋芋炒腌菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_249.jpg', '茶云坡');
INSERT INTO `fa_menu_copy1` VALUES (250, '黑木耳带豆煮烤麸', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_250.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (251, '丝瓜油条', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_251.jpg', '水墨墨');
INSERT INTO `fa_menu_copy1` VALUES (252, '煎烤鸡翅两吃', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_252.jpg', 'siyi777');
INSERT INTO `fa_menu_copy1` VALUES (253, '尖椒韭菜芽炒猪肚', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_253.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (254, '土豆番茄烧牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_254.jpg', '想鱼的');
INSERT INTO `fa_menu_copy1` VALUES (255, '千张炒木耳菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_255.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (256, '上汤手打鱼肉塞面筋', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_256.jpg', 'Jackylicious');
INSERT INTO `fa_menu_copy1` VALUES (257, '酸辣土豆丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_257.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (258, '麻辣十三香小龙虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_258.jpg', '萌食志');
INSERT INTO `fa_menu_copy1` VALUES (259, '油焖鸡翅', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_259.jpg', '清水淡竹');
INSERT INTO `fa_menu_copy1` VALUES (260, '砂锅黄焖鸡', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_260.jpg', '舍得的美食诱惑');
INSERT INTO `fa_menu_copy1` VALUES (261, '花生绿豆猪脚汤', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_261.jpg', '舍得的美食诱惑');
INSERT INTO `fa_menu_copy1` VALUES (262, '肉末豇豆', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_262.jpg', 'rosejyy2000');
INSERT INTO `fa_menu_copy1` VALUES (263, '香煎虾饼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_263.jpg', 'Suki66');
INSERT INTO `fa_menu_copy1` VALUES (264, '叉烧肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_264.jpg', '素年米妈厨房');
INSERT INTO `fa_menu_copy1` VALUES (265, '剁椒蒸豆角', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_265.jpg', '夏家私享菜');
INSERT INTO `fa_menu_copy1` VALUES (266, '咸蛋南瓜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_266.jpg', 'Elin');
INSERT INTO `fa_menu_copy1` VALUES (267, '麻辣水煮肉片', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_267.jpg', '茶云坡');
INSERT INTO `fa_menu_copy1` VALUES (268, '咸蛋苦瓜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_268.jpg', 'sunshinewinnie');
INSERT INTO `fa_menu_copy1` VALUES (269, '皮皮虾炖豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_269.jpg', '心煮艺的厨房');
INSERT INTO `fa_menu_copy1` VALUES (270, '毛豆茭白煮小油豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_270.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (271, '经典培根卷', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_271.jpg', '胖子瘦子我都爱');
INSERT INTO `fa_menu_copy1` VALUES (272, '海鲜菇日本豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_272.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (273, '梅豆莲藕煮排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_273.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (274, '椒香鸡柳', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_274.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (275, '蒜烧冬瓜条', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_275.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (276, '烤脆骨土豆', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_276.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (277, '煎日本豆腐', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_277.jpg', '政妈妈');
INSERT INTO `fa_menu_copy1` VALUES (278, '香酥麻辣虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_278.jpg', '舍得的美食诱惑');
INSERT INTO `fa_menu_copy1` VALUES (279, '瓠子尖椒炒肉片', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_279.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (280, '苏式响油鳝丝', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_280.jpg', '七九星星');
INSERT INTO `fa_menu_copy1` VALUES (281, '菠菜炒牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_281.jpg', '寒飘');
INSERT INTO `fa_menu_copy1` VALUES (282, '玉翠满堂', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_282.jpg', '蜜蜜爸爸');
INSERT INTO `fa_menu_copy1` VALUES (283, '吮指腐乳花生炖猪蹄', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_283.jpg', 'jijiqucho');
INSERT INTO `fa_menu_copy1` VALUES (284, '腐竹粉丝牛筋煲', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_284.jpg', '七九星星');
INSERT INTO `fa_menu_copy1` VALUES (285, '土豆面筋烧鸡块', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_285.jpg', '七九星星');
INSERT INTO `fa_menu_copy1` VALUES (286, '豆腐饼焖肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_286.jpg', '橙子妈妈Eva');
INSERT INTO `fa_menu_copy1` VALUES (287, '素炒年糕', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_287.jpg', '胖熊小兔');
INSERT INTO `fa_menu_copy1` VALUES (288, '豆角杂锦烧肉丁', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_288.jpg', '掀帘晨曦datura');
INSERT INTO `fa_menu_copy1` VALUES (289, '炒疙瘩', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_289.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (290, '素炒小白菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_290.jpg', '冬季心情');
INSERT INTO `fa_menu_copy1` VALUES (291, '咖喱小龙虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_291.jpg', '小M的厨房');
INSERT INTO `fa_menu_copy1` VALUES (292, '干锅藕片', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_292.jpg', '安娜_Anna');
INSERT INTO `fa_menu_copy1` VALUES (293, '尖椒猪肉炒茄子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_293.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (294, '鸡蛋炒尖椒', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_294.jpg', 'Meggy跳舞的苹果');
INSERT INTO `fa_menu_copy1` VALUES (295, '蚝油罗氏虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_295.jpg', '鸣翠燕');
INSERT INTO `fa_menu_copy1` VALUES (296, '小鸡炖蘑菇', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_296.jpg', '小玲珑妈妈…');
INSERT INTO `fa_menu_copy1` VALUES (297, '红烧排骨', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_297.jpg', '蜜蜜爸爸');
INSERT INTO `fa_menu_copy1` VALUES (298, '广式叉烧', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_298.jpg', '烘焙123');
INSERT INTO `fa_menu_copy1` VALUES (299, '土豆烧素鸡', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_299.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (300, '咖喱素什锦', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_300.jpg', '心煮艺的厨房');
INSERT INTO `fa_menu_copy1` VALUES (301, '双味鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_301.jpg', '人生就是过客');
INSERT INTO `fa_menu_copy1` VALUES (302, '番茄龙利鱼汤', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_302.jpg', '拾味十');
INSERT INTO `fa_menu_copy1` VALUES (303, '耋耄酸辣猪脚', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_303.jpg', '舍得的美食诱惑');
INSERT INTO `fa_menu_copy1` VALUES (304, '水煮牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_304.jpg', '美食侦探yk');
INSERT INTO `fa_menu_copy1` VALUES (305, '上汤娃娃菜', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_305.jpg', 'sunshinewinnie');
INSERT INTO `fa_menu_copy1` VALUES (306, '白灼香螺', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_306.jpg', '祯祯宝贝');
INSERT INTO `fa_menu_copy1` VALUES (307, '苦瓜炒牛肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_307.jpg', '清水淡竹');
INSERT INTO `fa_menu_copy1` VALUES (308, '啤酒鸭', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_308.jpg', 'lqmy2k');
INSERT INTO `fa_menu_copy1` VALUES (309, '鸡胗炒豆角', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_309.jpg', 'sourcehe');
INSERT INTO `fa_menu_copy1` VALUES (310, '茄子酱', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_310.jpg', '奇玉音缘');
INSERT INTO `fa_menu_copy1` VALUES (311, '肉末带豆炒年糕', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_311.jpg', '花鱼儿');
INSERT INTO `fa_menu_copy1` VALUES (312, '家常烧鲫鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_312.jpg', '允儿小妞的厨房');
INSERT INTO `fa_menu_copy1` VALUES (313, '老干妈烧茄子', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_313.jpg', '斯佳丽WH');
INSERT INTO `fa_menu_copy1` VALUES (314, '红烧安康鱼肚', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_314.jpg', '奇玉音缘');
INSERT INTO `fa_menu_copy1` VALUES (315, '干锅香辣虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_315.jpg', '浅紫姑娘??_xLwdqU');
INSERT INTO `fa_menu_copy1` VALUES (316, '水煮鱼', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_316.jpg', '花开夕颜');
INSERT INTO `fa_menu_copy1` VALUES (317, '麻辣干锅虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_317.jpg', '橙子妈妈Eva');
INSERT INTO `fa_menu_copy1` VALUES (318, '盐煎肉', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_318.jpg', '秋宝恬然');
INSERT INTO `fa_menu_copy1` VALUES (319, '双椒鱼片', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_319.jpg', '我是狂草');
INSERT INTO `fa_menu_copy1` VALUES (320, '椒盐酱油虾', 'http://image99.360doc.com/DownloadImg/2016/08/2210/78468144_320.jpg', '寒飘');

-- ----------------------------
-- Table structure for fa_order_form
-- ----------------------------
DROP TABLE IF EXISTS `fa_order_form`;
CREATE TABLE `fa_order_form`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `desk_id` int(10) NULL DEFAULT NULL COMMENT '桌号',
  `user` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `status` smallint(1) NULL DEFAULT NULL COMMENT '状态',
  `sum` int(10) NULL DEFAULT NULL COMMENT '总金额',
  `start_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '桌子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_order_form
-- ----------------------------
INSERT INTO `fa_order_form` VALUES (1, 1, 14, 2, 1000, '1614319483', '1614331051');
INSERT INTO `fa_order_form` VALUES (2, 1, 14, 2, 50, '1614330927', '1614331161');
INSERT INTO `fa_order_form` VALUES (3, 3, 14, 2, 150, '1614331196', '1614331223');
INSERT INTO `fa_order_form` VALUES (4, 1, 14, 1, NULL, '1614333599', NULL);

-- ----------------------------
-- Table structure for fa_order_form_info
-- ----------------------------
DROP TABLE IF EXISTS `fa_order_form_info`;
CREATE TABLE `fa_order_form_info`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order` int(10) NULL DEFAULT NULL COMMENT '订单号',
  `menu` int(10) NULL DEFAULT NULL COMMENT '菜单名',
  `num` int(10) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of fa_order_form_info
-- ----------------------------
INSERT INTO `fa_order_form_info` VALUES (1, 1, 1, 20);
INSERT INTO `fa_order_form_info` VALUES (2, 2, 160, 1);
INSERT INTO `fa_order_form_info` VALUES (3, 3, 152, 1);
INSERT INTO `fa_order_form_info` VALUES (4, 3, 94, 1);
INSERT INTO `fa_order_form_info` VALUES (5, 3, 249, 1);
INSERT INTO `fa_order_form_info` VALUES (6, 4, 40, 1);

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击',
  `startdate` date NULL DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime(0) NULL DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year NULL DEFAULT NULL COMMENT '年',
  `times` time(0) NULL DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) NULL DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT 0 COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES (1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1499682526, NULL, 0, 1, 'normal', '1');

-- ----------------------------
-- Table structure for fa_third
-- ----------------------------
DROP TABLE IF EXISTS `fa_third`;
CREATE TABLE `fa_third`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '会员ID',
  `platform` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '第三方应用',
  `apptype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '应用类型',
  `unionid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '第三方UNIONID',
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '第三方OPENID',
  `openname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '第三方会员昵称',
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'AccessToken',
  `refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'RefreshToken',
  `expires_in` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '有效期',
  `createtime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `logintime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '登录时间',
  `expiretime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `platform`(`platform`, `openid`) USING BTREE,
  INDEX `user_id`(`user_id`, `platform`) USING BTREE,
  INDEX `unionid`(`platform`, `unionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方登录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(10) NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) NULL DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信openid',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES (1, 1, 'admin', 'admin', '13d496542c01914203a3094359f332e9', '792172', 'admin@163.com', '13888888888', '', 0, 0, '2017-04-15', '', 0.00, 0, 1, 1, 1516170492, 1516171614, '127.0.0.1', 0, '127.0.0.1', 1491461418, 0, 1516171614, '', 'normal', '', NULL);
INSERT INTO `fa_user` VALUES (3, 0, 'demo', 'demo', 'c1505b7108adb91f5bf5c65c2588412c', '5JpAKD', '645418484@qq.com', '', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1614235632, 1614235632, '127.0.0.1', 0, '127.0.0.1', 1614235632, 1614235632, 1614235632, '', 'normal', '', NULL);
INSERT INTO `fa_user` VALUES (14, 0, '🇭 🇪 🇦 🇷 🇹', '🇭 🇪 🇦 🇷 🇹', '10cadba5d2f5cffd9f057fff8a2f2f13', 'GHhfF3', '', '', '', 1, 0, NULL, '', 99999999.99, 0, 1, 1, 1614334422, 1614334428, '127.0.0.1', 0, '127.0.0.1', 1614333265, 1614333265, 1614334428, '', 'normal', '', 'oHaTX5artgrxJDrLX-SelI5RgfM8');

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '权限节点',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
INSERT INTO `fa_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1515386468, 1516168298, 'normal');

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员余额变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES (1, 0, 'index', 'Frontend', '', 1, 1516168079, 1516168079, 1, 'normal');
INSERT INTO `fa_user_rule` VALUES (2, 0, 'api', 'API Interface', '', 1, 1516168062, 1516168062, 2, 'normal');
INSERT INTO `fa_user_rule` VALUES (3, 1, 'user', 'User Module', '', 1, 1515386221, 1516168103, 12, 'normal');
INSERT INTO `fa_user_rule` VALUES (4, 2, 'user', 'User Module', '', 1, 1515386221, 1516168092, 11, 'normal');
INSERT INTO `fa_user_rule` VALUES (5, 3, 'index/user/login', 'Login', '', 0, 1515386247, 1515386247, 5, 'normal');
INSERT INTO `fa_user_rule` VALUES (6, 3, 'index/user/register', 'Register', '', 0, 1515386262, 1516015236, 7, 'normal');
INSERT INTO `fa_user_rule` VALUES (7, 3, 'index/user/index', 'User Center', '', 0, 1516015012, 1516015012, 9, 'normal');
INSERT INTO `fa_user_rule` VALUES (8, 3, 'index/user/profile', 'Profile', '', 0, 1516015012, 1516015012, 4, 'normal');
INSERT INTO `fa_user_rule` VALUES (9, 4, 'api/user/login', 'Login', '', 0, 1515386247, 1515386247, 6, 'normal');
INSERT INTO `fa_user_rule` VALUES (10, 4, 'api/user/register', 'Register', '', 0, 1515386262, 1516015236, 8, 'normal');
INSERT INTO `fa_user_rule` VALUES (11, 4, 'api/user/index', 'User Center', '', 0, 1516015012, 1516015012, 10, 'normal');
INSERT INTO `fa_user_rule` VALUES (12, 4, 'api/user/profile', 'Profile', '', 0, 1516015012, 1516015012, 3, 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员积分变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token`  (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员Token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------
INSERT INTO `fa_user_token` VALUES ('0b192a002466a06ad1a734248e1509f8980b5684', 14, 1614333413, 1616925413);
INSERT INTO `fa_user_token` VALUES ('0d5686b8a341b3bc53c383761239bb99f55555d4', 11, 1614332471, 1616924471);
INSERT INTO `fa_user_token` VALUES ('1119b6e642e4cdc3ee4720238d96b2684e0fee55', 13, 1614332549, 1616924549);
INSERT INTO `fa_user_token` VALUES ('11cf0bcb1f39faf3b806b45597dbc0dcdbf35d91', 7, 1614319174, 1616911174);
INSERT INTO `fa_user_token` VALUES ('1f6d338536b49c2cf7fabac2fb1fccba5c3bc2b6', 14, 1614334388, 1616926388);
INSERT INTO `fa_user_token` VALUES ('3381d231bdd4dd8a1f6f89c785795dfead9c7eea', 14, 1614334422, 1616926422);
INSERT INTO `fa_user_token` VALUES ('382db6321615ebcb47baf486eece3c240cf52d90', 10, 1614327197, 1616919197);
INSERT INTO `fa_user_token` VALUES ('894efe1dd4d6582f33130cb3a2978beefee7dab8', 7, 1614319169, 1616911169);
INSERT INTO `fa_user_token` VALUES ('8c21a2f98edf0ac914ab135afabc97aa7c0a9b05', 14, 1614334428, 1616926428);
INSERT INTO `fa_user_token` VALUES ('a22bd2e5e19cde15792b7a6fa3c522f793a0cf9e', 12, 1614332508, 1616924508);
INSERT INTO `fa_user_token` VALUES ('a320a1c2d5837d4c681c3907b8066165bba36f0d', 10, 1614329824, 1616921824);
INSERT INTO `fa_user_token` VALUES ('b91be0190437b417c3ef17e19cf439c50bcf2cd1', 12, 1614332544, 1616924544);
INSERT INTO `fa_user_token` VALUES ('eb9a17be644315fd00820167090049c4621164f1', 14, 1614333265, 1616925265);

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强制更新',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '版本表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
