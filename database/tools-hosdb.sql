/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50531
Source Host           : 127.0.0.1:3306
Source Database       : tools-hosdb

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2021-02-09 07:02:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accident
-- ----------------------------
DROP TABLE IF EXISTS `accident`;
CREATE TABLE `accident` (
  `HOSPCODE` varchar(255) DEFAULT NULL,
  `PID` varchar(255) DEFAULT NULL,
  `SEQ` varchar(255) DEFAULT NULL,
  `DATETIME_SERV` varchar(255) DEFAULT NULL,
  `DATETIME_AE` varchar(255) DEFAULT NULL,
  `AETYPE` varchar(255) DEFAULT NULL,
  `AEPLACE` varchar(255) DEFAULT NULL,
  `TYPEIN_AE` varchar(255) DEFAULT NULL,
  `TRAFFIC` varchar(255) DEFAULT NULL,
  `VEHICLE` varchar(255) DEFAULT NULL,
  `ALCOHOL` varchar(255) DEFAULT NULL,
  `NACROTIC_DRUG` varchar(255) DEFAULT NULL,
  `BELT` varchar(255) DEFAULT NULL,
  `HELMET` varchar(255) DEFAULT NULL,
  `AIRWAY` varchar(255) DEFAULT NULL,
  `STOPBLEED` varchar(255) DEFAULT NULL,
  `SPLINT` varchar(255) DEFAULT NULL,
  `FLUID` varchar(255) DEFAULT NULL,
  `URGENCY` varchar(255) DEFAULT NULL,
  `COMA_EYE` varchar(255) DEFAULT NULL,
  `COMA_SPEAK` varchar(255) DEFAULT NULL,
  `COMA_MOVEMENT` varchar(255) DEFAULT NULL,
  `D_UPDATE` varchar(255) DEFAULT NULL,
  `CID` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accident
-- ----------------------------

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
INSERT INTO `auth_assignment` VALUES ('claimcode', '2', '1612819710');
INSERT INTO `auth_assignment` VALUES ('superadmin', '1', '1591337718');
INSERT INTO `auth_assignment` VALUES ('งานสุขภาพจิต', '3', '1612819717');

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
INSERT INTO `auth_item` VALUES ('/admin/permission/get-users', '2', null, null, null, '1612806632', '1612806632');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1591333020', '1591333020');
INSERT INTO `auth_item` VALUES ('/admin/role/get-users', '2', null, null, null, '1612806632', '1612806632');
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
INSERT INTO `auth_item` VALUES ('/hosxp/config/*', '2', null, null, null, '1612806632', '1612806632');
INSERT INTO `auth_item` VALUES ('/hosxp/config/index', '2', null, null, null, '1612806632', '1612806632');
INSERT INTO `auth_item` VALUES ('/hosxp/config/update', '2', null, null, null, '1612806632', '1612806632');
INSERT INTO `auth_item` VALUES ('/hosxp/config/updatebyear', '2', null, null, null, '1612822085', '1612822085');
INSERT INTO `auth_item` VALUES ('/hosxp/default/*', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/default/claimcode', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/default/claimcodeupdate', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/default/index', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/default/report1', '2', null, null, null, '1610604037', '1610604037');
INSERT INTO `auth_item` VALUES ('/hosxp/default/sm-dr', '2', null, null, null, '1612806632', '1612806632');
INSERT INTO `auth_item` VALUES ('/hosxp/visit-pttype/*', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/visit-pttype/claimcode', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/visit-pttype/index', '2', null, null, null, '1610507302', '1610507302');
INSERT INTO `auth_item` VALUES ('/hosxp/visit-pttype/test-error', '2', null, null, null, '1612806632', '1612806632');
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
INSERT INTO `auth_item` VALUES ('/site/api-error', '2', null, null, null, '1612806632', '1612806632');
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
INSERT INTO `auth_item` VALUES ('/wsc/*', '2', null, null, null, '1612806632', '1612806632');
INSERT INTO `auth_item` VALUES ('/wsc/default/*', '2', null, null, null, '1612806632', '1612806632');
INSERT INTO `auth_item` VALUES ('/wsc/default/index', '2', null, null, null, '1612806632', '1612806632');
INSERT INTO `auth_item` VALUES ('/wsc/default/smdrfromhos', '2', null, null, null, '1612806632', '1612806632');
INSERT INTO `auth_item` VALUES ('claimcode', '2', null, null, null, '1610507351', '1612807276');
INSERT INTO `auth_item` VALUES ('PrMenu', '1', 'งานประชาสัมพันธ์', null, null, '1592650366', '1592809249');
INSERT INTO `auth_item` VALUES ('superadmin', '1', null, null, null, '1591337706', '1609767481');
INSERT INTO `auth_item` VALUES ('user', '1', 'ผู้ใช้งานทั่วไป', null, null, '1591337468', '1592464583');
INSERT INTO `auth_item` VALUES ('งานสุขภาพจิต', '2', null, null, null, '1612807041', '1612823787');

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
INSERT INTO `auth_item_child` VALUES ('claimcode', '/hosxp/default/index');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/hosxp/default/report1');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/hosxp/visit-pttype/claimcode');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/hosxp/visit-pttype/index');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/hosxp/visit-pttype/update');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/site/about');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/site/api-err');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/site/api-error');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/site/captcha');
INSERT INTO `auth_item_child` VALUES ('claimcode', '/site/contact');
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
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/depress/default/allsm');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/gridview/export/download');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/hosxp/default/index');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/hosxp/default/sm-dr');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/site/about');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/site/api-err');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/site/api-error');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/site/captcha');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/site/contact');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/site/error');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/site/index');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/site/logout');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/user/security/logout');
INSERT INTO `auth_item_child` VALUES ('งานสุขภาพจิต', '/user/settings/profile');

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

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospcode` varchar(5) DEFAULT NULL,
  `befor_byear` date DEFAULT NULL,
  `byear` date DEFAULT NULL,
  `chwpart` char(2) DEFAULT NULL,
  `amppart` char(2) DEFAULT NULL,
  `thbyear` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '10918', '2020-09-30', '2021-01-01', '32', '05', '2564');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_count
-- ----------------------------

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
INSERT INTO `date_process` VALUES ('1', '2021-02-09');

-- ----------------------------
-- Table structure for hos_basedata
-- ----------------------------
DROP TABLE IF EXISTS `hos_basedata`;
CREATE TABLE `hos_basedata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_data` varchar(255) DEFAULT NULL,
  `detail` longtext,
  `link` varchar(150) DEFAULT NULL,
  `link2` varchar(150) DEFAULT NULL,
  `active` enum('True','False') DEFAULT 'True',
  `count_report` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=tis620 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of hos_basedata
-- ----------------------------
INSERT INTO `hos_basedata` VALUES ('1', 'รายงานนำเข้าคัดกรองบุหรี่ - สุรา', '', '/hosxp/default/sm-dr', '/mreport/rdu/*', 'True', null);
INSERT INTO `hos_basedata` VALUES ('2', 'รายงาน ClaimCode', null, '/hosxp/default/report1', null, 'True', null);

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
-- Table structure for pp_special_monit
-- ----------------------------
DROP TABLE IF EXISTS `pp_special_monit`;
CREATE TABLE `pp_special_monit` (
  `vn` varchar(12) NOT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `hn` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`vn`),
  KEY `ix_vn` (`vn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

-- ----------------------------
-- Records of pp_special_monit
-- ----------------------------
INSERT INTO `pp_special_monit` VALUES ('640207141439', '2021-02-07 14:24:39', '000012011');
INSERT INTO `pp_special_monit` VALUES ('640209032531', '2021-02-09 03:35:31', '000024915');
INSERT INTO `pp_special_monit` VALUES ('640209032844', '2021-02-09 03:38:44', '000004798');
INSERT INTO `pp_special_monit` VALUES ('640209032958', '2021-02-09 03:39:58', '000121839');

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
INSERT INTO `profile` VALUES ('1', 'นายทดสอบ ระบบงาน', null, 'admin@toolshos.test', null, null, null, null, null, '1', '##Psmi50584@', null, null, null, null, null, '');
INSERT INTO `profile` VALUES ('2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `profile` VALUES ('3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin@toolshos.test', '10', '$2y$12$NJHlHtVF5U..9kMgl41JzOEHoNtBVffj56TB1o3hDOzGhNJDhJSSW', 'cqxz7TrkKeR_94e5PwHCE2SETcs4KhKV', '1592649000', 'admin@Toolshos.test', null, '127.0.0.1', '1590650584', '1609769211', '0', '1612823773', '1', 'admin');
INSERT INTO `user` VALUES ('2', 'card1', 'card1@toolshos.test', '10', '$2y$12$OHBEXgqRo5DOvgLjHscbcu5lH1CS90O9G8ROnOfTqOfGe8ym8pInW', 'o9RW-Xaxt6gvqoWiFATJda0Y2zXtJqPt', '1612819267', null, null, '127.0.0.1', '1612819267', '1612819267', '0', '1612819797', '20', 'card1');
INSERT INTO `user` VALUES ('3', 'user1', 'user1@tools.com', '10', '$2y$12$uJwTCW35FU5uzzEfe4CxveODmhla8i31Xy8DblSMgMnJ/Mv58dEc.', 'g4NM39cpm9sjye9YzqchRTL0c2bsHwI9', '1612819660', null, null, '127.0.0.1', '1612819660', '1612819660', '0', '1612823633', '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_hos
-- ----------------------------
INSERT INTO `user_hos` VALUES ('1', '', 'admin@toolshos.test', '$2b$10$jXLKtxAvSmlSEsFqiLa/hOrxVq6VopQXz7UnMxQFqeyuTE7GcZkDa', '1');
INSERT INTO `user_hos` VALUES ('2', '', 'card1@toolshos.test', '$2b$10$NR34n6/fRzpqKOj9ruDuw.6ZOsI6fxVRw0bxqT5p8Ns4QDsPbskY.', '10');
INSERT INTO `user_hos` VALUES ('3', '', 'user1@tools.com', '$2b$10$w9tJtHw0N5mVCo3tMd1Z1uK4rVFb0Z9owBZGXRNcwpon/CaVf1KDO', '10');

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

-- ----------------------------
-- Procedure structure for update_byear
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_byear`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `update_byear`()
BEGIN

SET @b_year := DATE_FORMAT(NOW(),'%Y');
SET @thbyear := @b_year+544;
update config c
SET thbyear = @thbyear;

update config c
SET c.befor_byear = concat((thbyear-544),'-09-30'),c.byear = concat((thbyear-543),'-01-01');

END
;;
DELIMITER ;
