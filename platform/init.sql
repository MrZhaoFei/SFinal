/*
Navicat MySQL Data Transfer

Source Server         : 应用开发库
Source Server Version : 50555
Source Host           : company.99kst.com:3306
Source Database       : temp

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2017-08-02 11:16:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_module
-- ----------------------------
DROP TABLE IF EXISTS `base_module`;
CREATE TABLE `base_module` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '模块名称 如医总管、养老系统、协同系统等',
  `app_key` varchar(32) NOT NULL COMMENT '客户端唯一标识',
  `app_secret` varchar(128) NOT NULL COMMENT '客户端密码',
  `private_key` varchar(1024) NOT NULL COMMENT '私钥',
  `public_key` varchar(1024) NOT NULL COMMENT '公钥',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_key_UNIQUE` (`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模块表';

-- ----------------------------
-- Records of base_module
-- ----------------------------
INSERT INTO `base_module` VALUES ('1', '医总管', '2HGZYEKIEB4LNHLV6D', '2HGZYEKIEB4LNHLV6DV', 'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJK2pZY9q7q8VozsOmKnNL2fUxZnlEegjHcHjYBRs4RbwLxyTV2hzlhoEy/dSfS/tbAqdrigPyuK3QXTChy5QpcghlkRiCt/d6bwPhaji08lAgHXqPd+Z9cj+MeBqunWPJ4ZsoVMAHq95L7Z0Xid+c43y28CWF4jBVtLMi/M5fL5AgMBAAECgYEAgqkDY4Bc9ptRAYRIox+CivXfy25H0lqbfk5NqOAaXmBQkAPD/wVhfb6Ch/guKzipGNFYliiw2Zh8Kvm+YcJkGFYbN8ZpOHIF8VJmftubazmJOE7DIkmqscfA2AEzZcRsbThBcVYxJoZwNJHcnRGd+ix50gLaigOtWlp4SyHi5RkCQQDLO+QEFonYWWzNhrmQVhdQzivO403oMrVlrXFogM+yBNJFSYPx2V4fABDCQubsTZH/M44CZRO+a4TzQsZ1Od9XAkEAuM4TiIOO4jBGQeBDUb5wPStGalbdVKO8CUAQqDmAfOVExPxWMKP0fVGZtH7l2FPSIvGFK0zgqQttwwGW3FxeLwJAbROZz2/hT9K/CJf0ZDkwjlf5PzLUD3mXzhiGs5Xe4yafTDymqlkFoRHB7OFHWzBO2W9sGnDxZdQDKSR/q08CRQJAdFyFXhJ/+BmvUzFTEfhYEZva9YAGUpHaBvUIx/OU3I87ktDTsEK74eBsaILyVBjLGmd6kz4Pw0DH9t5cUBn0zwJAH/WN8Cfy4kN2R2rxi6sZ4koP7NzYFPd83FqlDTIJcPZhY0W9YZ+QpA4x3kTKBxGlohIQsBT4uv4VI1ZVR+MM9A==', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCStqWWPau6vFaM7DpipzS9n1MWZ5RHoIx3B42AUbOEW8C8ck1doc5YaBMv3Un0v7WwKna4oD8rit0F0wocuUKXIIZZEYgrf3em8D4Wo4tPJQIB16j3fmfXI/jHgarp1jyeGbKFTAB6veS+2dF4nfnON8tvAlheIwVbSzIvzOXy+QIDAQAB', null);

-- ----------------------------
-- Table structure for base_module_role
-- ----------------------------
DROP TABLE IF EXISTS `base_module_role`;
CREATE TABLE `base_module_role` (
  `base_module_id` int(11) NOT NULL,
  `base_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模块权限关联表';

-- ----------------------------
-- Records of base_module_role
-- ----------------------------
INSERT INTO `base_module_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for base_operation
-- ----------------------------
DROP TABLE IF EXISTS `base_operation`;
CREATE TABLE `base_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '操作名',
  `code` varchar(64) NOT NULL COMMENT '操作方法编码 唯一标识',
  `base_module_id` int(11) NOT NULL COMMENT '关联base_module表',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `remark` text COMMENT '备注',
  `is_used` tinyint(1) DEFAULT NULL COMMENT '是否使用\n0：使用\n1：未使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作表';

-- ----------------------------
-- Records of base_operation
-- ----------------------------

-- ----------------------------
-- Table structure for base_permission
-- ----------------------------
DROP TABLE IF EXISTS `base_permission`;
CREATE TABLE `base_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '权限名称',
  `code` varchar(64) NOT NULL COMMENT '权限码（唯一标识权限）',
  `base_module_id` int(11) NOT NULL COMMENT '关联base_module表',
  `create_time` datetime NOT NULL,
  `is_used` int(11) DEFAULT NULL COMMENT '是否使用\n 0：未使用\n 1：使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- ----------------------------
-- Records of base_permission
-- ----------------------------

-- ----------------------------
-- Table structure for base_permission_menu_resource
-- ----------------------------
DROP TABLE IF EXISTS `base_permission_menu_resource`;
CREATE TABLE `base_permission_menu_resource` (
  `base_permission_id` int(11) NOT NULL,
  `base_menu_resource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限菜单关联表';

-- ----------------------------
-- Records of base_permission_menu_resource
-- ----------------------------

-- ----------------------------
-- Table structure for base_permission_operation
-- ----------------------------
DROP TABLE IF EXISTS `base_permission_operation`;
CREATE TABLE `base_permission_operation` (
  `base_permission_id` int(11) NOT NULL,
  `base_operation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限操作关联表';

-- ----------------------------
-- Records of base_permission_operation
-- ----------------------------

-- ----------------------------
-- Table structure for base_role
-- ----------------------------
DROP TABLE IF EXISTS `base_role`;
CREATE TABLE `base_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `code` varchar(64) NOT NULL COMMENT '角色码 唯一键',
  `is_used` tinyint(1) DEFAULT NULL COMMENT '是否使用\n0：未使用\n1：使用',
  `base_module_id` int(11) NOT NULL COMMENT '关联base_module表',
  `sub_module_group` varchar(32) DEFAULT NULL COMMENT '用于区分模块下面的子业务块',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of base_role
-- ----------------------------
INSERT INTO `base_role` VALUES ('1', '用户管理', 'base:user', '1', '1', null, '2017-07-11 10:54:58');

-- ----------------------------
-- Table structure for base_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `base_role_permission`;
CREATE TABLE `base_role_permission` (
  `base_permission_id` int(11) NOT NULL,
  `base_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关联表';

-- ----------------------------
-- Records of base_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(64) NOT NULL COMMENT '用户真实姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别   1男 2女',
  `id_card` varchar(64) NOT NULL COMMENT '身份证号码 和state字段作为唯一标识',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `phone` varchar(64) NOT NULL COMMENT '用户手机号码 ',
  `home_address` varchar(256) DEFAULT NULL COMMENT '居住地址',
  `base_module_id` int(11) NOT NULL COMMENT '用户来源模块',
  `register_date` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT NULL COMMENT '是否使用\n            0-未使用\n            1-使用',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_id_card_state` (`id_card`,`is_used`),
  KEY `ix_phone` (`phone`),
  KEY `ix_reg_date` (`register_date`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='用户基本信息表';

-- ----------------------------
-- Table structure for base_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `base_user_detail`;
CREATE TABLE `base_user_detail` (
  `user_id` int(11) NOT NULL,
  `residence_address` varchar(256) DEFAULT NULL COMMENT '户籍地址',
  `nation` varchar(64) DEFAULT NULL COMMENT '名族',
  `degree` varchar(64) DEFAULT NULL COMMENT '学历',
  `occupation` varchar(128) DEFAULT NULL COMMENT '职业\r\n            1-国家机关、党群组织、企业、事业单位负责人\r\n            2-专业技术人员\r\n            3-办事人员和有关人员\r\n            4-商业、服务业人员\r\n            5-农、林、牧、渔、水利业生产人员\r\n            6-生产、运输设备操作人员及有关人员\r\n            7-军人\r\n            8-不便分类的其他从业人员',
  `islocal` tinyint(1) DEFAULT '1' COMMENT '是否是本地居民',
  `marriage_type` int(11) DEFAULT '0' COMMENT '婚姻状况\r\n            1-未婚\r\n            2-已婚\r\n            3-丧偶\r\n            4-离婚\r\n            5-未说明的婚姻状况',
  `contact` varchar(32) DEFAULT NULL COMMENT '联系方式（座机、手机或其他）\r\n            说明：暂时不用，改用health_info.sjhm（手机号码）',
  `photo` varchar(128) DEFAULT NULL COMMENT '用户头像url',
  `create_time` datetime DEFAULT NULL COMMENT '用户信息创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '用户信息更新时间',
  KEY `ix_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户详细信息';

