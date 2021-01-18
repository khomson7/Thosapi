/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50531
Source Host           : 127.0.0.1:3306
Source Database       : tools-hosdb

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2021-01-18 20:38:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('superadmin', '1', '1591337718');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`) USING BTREE,
  KEY `idx-auth_item-type` (`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/default/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/default/all-auto-sm', '2', null, null, null, '1609767467', '1609767467');
INSERT INTO `auth_item` VALUES ('/depress/default/allsm', '2', null, null, null, '1592464570', '1592464570');
INSERT INTO `auth_item` VALUES ('/depress/default/depress', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/default/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/default/ppspecialapi', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/default/update', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/line/*', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/depress/line/curl-depress', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/depress/location/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/location/create', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/location/delete', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/location/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/location/options', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/location/update', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/location/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/profile/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/profile/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/profile/index2', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/profile/test', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/profile/update', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/depress/profile/update2', '2', null, null, null, '1592464570', '1592464570');
INSERT INTO `auth_item` VALUES ('/depress/profile/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/gridview/*', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/gridview/export/*', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/gridview/export/download', '2', null, null, null, '1591333010', '1591333010');
INSERT INTO `auth_item` VALUES ('/hosxp/*', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/default/*', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/default/claimcode', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/default/claimcodeupdate', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/default/index', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/default/report1', '2', null, null, null, '1610604037', '1610604037');
INSERT INTO `auth_item` VALUES ('/hosxp/visit-pttype/*', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/visit-pttype/claimcode', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/visit-pttype/index', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/visit-pttype/update', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/ipt/*', '2', null, null, null, '1592650323', '1592650323');
INSERT INTO `auth_item` VALUES ('/ipt/default/*', '2', null, null, null, '1592650323', '1592650323');
INSERT INTO `auth_item` VALUES ('/ipt/default/index', '2', null, null, null, '1592650323', '1592650323');
INSERT INTO `auth_item` VALUES ('/ipt/default/ipt-adm', '2', null, null, null, '1592650323', '1592650323');
INSERT INTO `auth_item` VALUES ('/mainreport/*', '2', null, null, null, '1592650323', '1592650323');
INSERT INTO `auth_item` VALUES ('/mainreport/default/*', '2', null, null, null, '1592650323', '1592650323');
INSERT INTO `auth_item` VALUES ('/mainreport/default/index', '2', null, null, null, '1592650323', '1592650323');
INSERT INTO `auth_item` VALUES ('/rbac/*', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/assignment/*', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/assignment/assign', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/permission/*', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/permission/create', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/permission/delete', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/permission/index', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/permission/update', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/role/*', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/role/create', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/role/delete', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/role/index', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/role/update', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/rule/*', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/rule/create', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/rule/delete', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/rule/index', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/rule/search', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/rbac/rule/update', '2', null, null, null, '1591337377', '1591337377');
INSERT INTO `auth_item` VALUES ('/site/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/site/about', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/site/api-err', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/site/auto-login', '2', null, null, null, '1609767473', '1609767473');
INSERT INTO `auth_item` VALUES ('/site/captcha', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/site/contact', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/site/error', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/site/login', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/site/logout', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/admin/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/admin/assignments', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/user/admin/block', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/admin/confirm', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/user/admin/create', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/user/admin/delete', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/user/admin/index', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/user/admin/info', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/user/admin/resend-password', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/admin/switch', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/user/admin/update', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/user/admin/update-profile', '2', null, null, null, '1591333019', '1591333019');
INSERT INTO `auth_item` VALUES ('/user/profile/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/profile/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/profile/show', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/recovery/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/recovery/request', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/recovery/reset', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/registration/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/registration/confirm', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/registration/connect', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/registration/register', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/registration/resend', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/security/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/security/auth', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/security/login', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/security/logout', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/settings/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/settings/account', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/settings/confirm', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/settings/delete', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/settings/disconnect', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/settings/networks', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/user/settings/profile', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('claimcode', '2', null, null, null, '1610507351', '1610609435');
INSERT INTO `auth_item` VALUES ('PrMenu', '1', 'งานประชาสัมพันธ์', null, null, '1592650366', '1592809249');
INSERT INTO `auth_item` VALUES ('superadmin', '1', null, null, null, '1591337706', '1609767481');
INSERT INTO `auth_item` VALUES ('user', '1', 'ผู้ใช้งานทั่วไป', null, null, '1591337468', '1592464583');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('claimcode', '/gridview/export/download');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/hosxp/default/report1');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/hosxp/visit-pttype/claimcode');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/hosxp/visit-pttype/index');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/hosxp/visit-pttype/update');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/site/error');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/site/index');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/site/logout');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/user/security/logout');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/user/settings/profile');
INSERT INTO `auth_item_child` VALUES ('PrMenu', '/ipt/default/ipt-adm');
INSERT INTO `auth_item_child` VALUES ('PrMenu', '/site/*');
INSERT INTO `auth_item_child` VALUES ('PrMenu', '/user/security/logout');
INSERT INTO `auth_item_child` VALUES ('PrMenu', '/user/settings/*');
INSERT INTO `auth_item_child` VALUES ('superadmin', '/*');
INSERT INTO `auth_item_child` VALUES ('user', '/depress/*');
INSERT INTO `auth_item_child` VALUES ('user', '/depress/profile/*');
INSERT INTO `auth_item_child` VALUES ('user', '/site/*');
INSERT INTO `auth_item_child` VALUES ('user', '/user/security/logout');
INSERT INTO `auth_item_child` VALUES ('user', '/user/settings/profile');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for check_token
-- ----------------------------
DROP TABLE IF EXISTS `check_token`;
CREATE TABLE `check_token` (
  `user_id` int(11) NOT NULL,
  `check_token` varchar(255) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idkey` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of check_token
-- ----------------------------
INSERT INTO `check_token` VALUES ('1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXN1bHQiOnsiZW1haWwiOiJhZG1pbkB0b29sc2hvcy50ZXN0In0sImlhdCI6MTYxMDk3Njc0NCwiZXhwIjoxNjEwOTk0NzQ0fQ.S1CxX3cZG9LPI9Qc8i9n0fB7hXNauuSf67ynuLwhiEk', null, '2021-01-18 20:32:24', null);

-- ----------------------------
-- Table structure for data_count
-- ----------------------------
DROP TABLE IF EXISTS `data_count`;
CREATE TABLE `data_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_count` int(11) DEFAULT NULL,
  `date_count` datetime DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_count
-- ----------------------------
INSERT INTO `data_count` VALUES ('1', '0', '2021-01-04 23:19:37', '1');
INSERT INTO `data_count` VALUES ('2', '128', '2021-01-04 23:20:16', '1');
INSERT INTO `data_count` VALUES ('3', '123', '2021-01-04 23:20:50', '1');
INSERT INTO `data_count` VALUES ('4', '2', '2021-01-04 23:23:26', '1');
INSERT INTO `data_count` VALUES ('5', '2', '2021-01-04 23:24:55', '1');
INSERT INTO `data_count` VALUES ('6', '165', '2021-01-04 23:25:08', '1');
INSERT INTO `data_count` VALUES ('11', '0', '2021-01-04 23:55:33', '1');
INSERT INTO `data_count` VALUES ('12', '0', '2021-01-04 23:56:06', '1');
INSERT INTO `data_count` VALUES ('13', '2', '2021-01-04 23:56:50', '1');
INSERT INTO `data_count` VALUES ('14', '0', '2021-01-08 20:59:56', '1');
INSERT INTO `data_count` VALUES ('15', '0', '2021-01-08 21:21:14', '1');
INSERT INTO `data_count` VALUES ('16', '0', '2021-01-08 21:23:19', '1');
INSERT INTO `data_count` VALUES ('17', '0', '2021-01-08 21:23:56', '1');
INSERT INTO `data_count` VALUES ('18', '0', '2021-01-08 21:25:43', '1');
INSERT INTO `data_count` VALUES ('19', '0', '2021-01-08 23:55:07', '1');
INSERT INTO `data_count` VALUES ('20', '0', '2021-01-09 23:55:07', '1');
INSERT INTO `data_count` VALUES ('21', '0', '2021-01-10 03:21:39', '1');
INSERT INTO `data_count` VALUES ('22', '0', '2021-01-10 03:48:56', '1');
INSERT INTO `data_count` VALUES ('23', '0', '2021-01-10 03:52:19', '1');
INSERT INTO `data_count` VALUES ('24', '89', '2021-01-10 03:56:22', '1');
INSERT INTO `data_count` VALUES ('25', '0', '2021-01-10 03:57:08', '1');
INSERT INTO `data_count` VALUES ('26', '0', '2021-01-10 07:46:37', '1');
INSERT INTO `data_count` VALUES ('27', '0', '2021-01-10 23:55:07', '1');
INSERT INTO `data_count` VALUES ('28', '0', '2021-01-11 09:59:59', '1');
INSERT INTO `data_count` VALUES ('29', '0', '2021-01-11 10:25:44', '1');
INSERT INTO `data_count` VALUES ('30', '0', '2021-01-11 23:55:07', '1');
INSERT INTO `data_count` VALUES ('31', '0', '2021-01-12 10:14:44', '1');
INSERT INTO `data_count` VALUES ('32', '0', '2021-01-12 23:55:08', '1');
INSERT INTO `data_count` VALUES ('33', '0', '2021-01-13 23:55:08', '1');
INSERT INTO `data_count` VALUES ('34', '36', '2021-01-14 23:55:07', '1');
INSERT INTO `data_count` VALUES ('35', '263', '2021-01-15 23:55:07', '1');
INSERT INTO `data_count` VALUES ('36', '96', '2021-01-16 23:55:07', '1');
INSERT INTO `data_count` VALUES ('37', '100', '2021-01-17 23:55:08', '1');
INSERT INTO `data_count` VALUES ('38', '0', '2021-01-18 20:32:29', '1');

-- ----------------------------
-- Table structure for date_process
-- ----------------------------
DROP TABLE IF EXISTS `date_process`;
CREATE TABLE `date_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of date_process
-- ----------------------------
INSERT INTO `date_process` VALUES ('1', '2021-01-18');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m140209_132017_init', '1590650152');
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', '1590650155');
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', '1590650168');
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', '1590650171');
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', '1590648775');
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', '1590650172');
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', '1590650173');
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', '1590650174');
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', '1590650176');
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', '1590650188');
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', '1590650188');
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', '1590650189');
INSERT INTO `migration` VALUES ('m160312_050000_create_user', '1590648776');
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', '1590650191');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_hos_id` int(11) DEFAULT NULL,
  `ps` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ps2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doctor_code` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b_date` date DEFAULT NULL,
  `e_date` date DEFAULT NULL,
  `data_count` int(11) DEFAULT NULL,
  `check_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'นายทดสอบ ระบบงาน', null, 'admin@toolshos.test', null, null, null, null, null, null, null, null, null, null, null, null, '');

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`) USING BTREE,
  UNIQUE KEY `account_unique_code` (`code`) USING BTREE,
  KEY `fk_user_account` (`user_id`) USING BTREE,
  CONSTRAINT `social_account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of social_account
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_token
-- ----------------------------
DROP TABLE IF EXISTS `tbl_token`;
CREATE TABLE `tbl_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token_` varchar(50) DEFAULT NULL,
  `send_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_token
-- ----------------------------
INSERT INTO `tbl_token` VALUES ('1', '', '1');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`) USING BTREE,
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of token
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT '10',
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL,
  `role` int(2) DEFAULT '0',
  `opduser` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`) USING BTREE,
  UNIQUE KEY `user_unique_email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin@toolshos.test', '10', '$2y$12$NJHlHtVF5U..9kMgl41JzOEHoNtBVffj56TB1o3hDOzGhNJDhJSSW', 'cqxz7TrkKeR_94e5PwHCE2SETcs4KhKV', '1592649000', 'admin@Toolshos.test', null, '127.0.0.1', '1590650584', '1609769211', '0', '1610964856', '1', 'admin');

-- ----------------------------
-- Table structure for user_hos
-- ----------------------------
DROP TABLE IF EXISTS `user_hos`;
CREATE TABLE `user_hos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_role` int(11) DEFAULT '10',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_hos
-- ----------------------------
INSERT INTO `user_hos` VALUES ('1', '', 'admin@toolshos.test', '$2b$10$jXLKtxAvSmlSEsFqiLa/hOrxVq6VopQXz7UnMxQFqeyuTE7GcZkDa', '1');

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_log
-- ----------------------------
