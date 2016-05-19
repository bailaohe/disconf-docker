CREATE DATABASE IF NOT EXISTS `disconf`;
USE `disconf`;

CREATE TABLE `app` (
  `app_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一的ID（没有啥意义，主键，自增长而已）',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'APP名(一般是产品线+服务名)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '介绍',
  `create_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '生成时间',
  `update_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '修改时',
  `emails` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱列表逗号分隔',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='app';

CREATE TABLE `config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一的ID（没有啥意义，主键，自增长而已）',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '配置文件/配置项',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '配置文件名/配置项KeY名',
  `value` text NOT NULL COMMENT '0 配置文件：文件的内容，1 配置项：配置值',
  `app_id` bigint(20) NOT NULL COMMENT 'appid',
  `version` varchar(255) NOT NULL DEFAULT 'DEFAULT_VERSION' COMMENT '版本',
  `env_id` bigint(20) NOT NULL COMMENT 'envid',
  `create_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '生成时间',
  `update_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '修改时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COMMENT='配置';

CREATE TABLE `env` (
  `env_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '环境ID（主键，自增长）',
  `name` varchar(255) NOT NULL DEFAULT 'DEFAULT_ENV' COMMENT '环境名字',
  PRIMARY KEY (`env_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='rd/qa/local可以自定义，默认为 DEFAULT_ENV';

CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名',
  `create_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '创建时间',
  `create_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '更新时间',
  `update_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `role_resource` (
  `role_res_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'role-resource id',
  `role_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户角色id',
  `url_pattern` varchar(200) NOT NULL DEFAULT '' COMMENT 'controller_requestMapping_value + method_requestMapping_value',
  `url_description` varchar(200) NOT NULL DEFAULT '' COMMENT 'url功能描述',
  `method_mask` varchar(4) NOT NULL DEFAULT '' COMMENT 'GET, PUT, POST, DELETE, 1: accessible',
  `update_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '更新时间',
  PRIMARY KEY (`role_res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='用户角色_url访问权限表';

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `token` varchar(255) NOT NULL COMMENT 'token',
  `ownapps` varchar(255) NOT NULL DEFAULT '' COMMENT '能操作的APPID,逗号分隔',
  `role_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '角色ID',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';

INSERT INTO `app` (`app_id`, `name`, `description`, `create_time`, `update_time`, `emails`)
VALUES
    (2, 'disconf_demo', 'disconf demo', '99991231235959', '99991231235959', '');

INSERT INTO `config` (`config_id`, `type`, `name`, `value`, `app_id`, `version`, `env_id`, `create_time`, `update_time`)
VALUES
    (4, 0, 'coefficients.properties', 'coe.baiFaCoe=1.3\ncoe.yuErBaoCoe=1.3\n', 2, '1_0_0_0', 1, '99991231235959', '20141205154137'),
    (5, 1, 'moneyInvest', '10000', 2, '1_0_0_0', 1, '99991231235959', '20140902183514'),
    (6, 0, 'remote.properties', 'remoteHost=127.0.0.1\r\nremotePort=8081', 2, '1_0_0_0', 1, '20140729174707', '20140804233309'),
    (7, 1, 'discountRate', '0.5', 2, '1_0_0_0', 1, '20140801142833', '20140905130141'),
    (12, 0, 'redis.properties', 'redis.host=127.0.0.1\nredis.port=6379', 2, '1_0_0_0', 1, '20140811172327', '20141011154244'),
    (16, 0, 'static.properties', 'staticVar=147', 2, '1_0_0_0', 1, '20140814202654', '20140905145616'),
    (17, 1, 'staticItem', '30', 2, '1_0_0_0', 1, '20140814210709', '20140814211054'),
    (29, 0, 'empty.properties', 'redis.host=127.0.0.1\r\nredis.port=8310', 2, '1_0_0_0', 1, '20140909164001', '20140909164125'),
    (48, 0, 'myserver.properties', 'server=127.0.0.1:16600,127.0.0.1:16602,127.0.0.1:16603\nretry=5\n', 2, '1_0_0_0', 1, '20140911223117', '20141117153116'),
    (119, 0, 'myserver_slave.properties', '#online\r\nserver=127.0.0.1:16700,127.0.0.1:16700,127.0.0.1:16700,127.0.0.1:16700\r\nretry=3', 2, '1_0_0_0', 1, '20141103163302', '20141103163302'),
    (122, 0, 'testXml.xml', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<routes>\n    <route sourceHost=\"*\" sourcePort=\"*\"\n        proxyHost=\"127.0.0.1\" proxyPort=\"8081\">\n        <rule>\n            <from method=\"get\">/tradeMap</from>\n            <to method=\"get\">/tradeMap</to>\n        </rule>\n    </route>\n</routes>', 2, '1_0_0_0', 1, '20141103202829', '20141110193440'),
    (143, 0, 'testXml2.xml', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<routes>\n    <route sourceHost=\"*\" sourcePort=\"*\"\n        proxyHost=\"127.0.0.1\" proxyPort=\"8081\">\n        <rule>\n            <from method=\"get\">/tradeMap</from>\n            <to method=\"get\">/tradeMap</to>\n        </rule>\n    </route>\n</routes>', 2, '1_0_0_0', 1, '20141110193605', '20141110193605'),
    (146, 0, 'code.properties', 'syserror.paramtype=\\u8bf7\\u6c42\\u53c2\\u6570\\u89e3\\u6790\\u9519\" + \"\\u8bef', 2, '1_0_0_0', 1, '20150107115835', '20150107115835'),
    (147, 0, 'testJson.json', '{\"message\": {}, \"success\": \"true\"}', 2, '1_0_0_0', 1, '20150121150626', '20150121153650'),
    (148, 0, 'autoconfig.properties', 'auto=bbdxxjdccd', 2, '1_0_0_0', 1, '20150320130619', '20150320224956'),
    (149, 0, 'autoconfig2.properties', 'auto2=cd', 2, '1_0_0_0', 1, '20150320130625', '20150320203808');

INSERT INTO `env` (`env_id`, `name`)
VALUES
    (1, 'rd'),
    (2, 'qa'),
    (3, 'local'),
    (4, 'online');

INSERT INTO `role` (`role_id`, `role_name`, `create_time`, `create_by`, `update_time`, `update_by`)
VALUES
    (1, '普通人', '99991231235959', 2, '99991231235959', 2),
    (2, '管理员', '99991231235959', 2, '99991231235959', 2),
    (3, '测试管理员', '99991231235959', 2, '99991231235959', 2);

INSERT INTO `role_resource` (`role_res_id`, `role_id`, `url_pattern`, `url_description`, `method_mask`, `update_time`)
VALUES
    (1, 1, '/api/app/list', 'app列表', '1000', '99991231235959'),
    (2, 2, '/api/app/list', 'app列表', '1000', '99991231235959'),
    (3, 3, '/api/app/list', 'app列表', '1000', '99991231235959'),
    (4, 1, '/api/app', '生成一个app', '0000', '99991231235959'),
    (5, 2, '/api/app', '生成一个app', '0010', '99991231235959'),
    (6, 3, '/api/app', '生成一个app', '0000', '99991231235959'),
    (7, 1, '/api/env/list', 'env-list', '1000', '99991231235959'),
    (8, 2, '/api/env/list', 'env-list', '1000', '99991231235959'),
    (9, 3, '/api/env/list', 'env-list', '1000', '99991231235959'),
    (10, 1, '/api/account/session', '会话', '1000', '99991231235959'),
    (11, 2, '/api/account/session', '会话', '1000', '99991231235959'),
    (12, 3, '/api/account/session', '会话', '1000', '99991231235959'),
    (13, 1, '/api/account/signin', '登录', '1000', '99991231235959'),
    (14, 2, '/api/account/signin', '登录', '1000', '99991231235959'),
    (15, 3, '/api/account/signin', '登录', '1000', '99991231235959'),
    (16, 1, '/api/account/signout', '登出', '1000', '99991231235959'),
    (17, 2, '/api/account/signout', '登出', '1000', '99991231235959'),
    (18, 3, '/api/account/signout', '登出', '1000', '99991231235959'),
    (19, 1, '/api/config/item', '获取配置项', '1000', '99991231235959'),
    (20, 2, '/api/config/item', '获取配置项', '1000', '99991231235959'),
    (21, 3, '/api/config/item', '获取配置项', '1000', '99991231235959'),
    (22, 1, '/api/config/file', '获取配置文件', '1000', '99991231235959'),
    (23, 2, '/api/config/file', '获取配置文件', '1000', '99991231235959'),
    (24, 3, '/api/config/file', '获取配置文件', '1000', '99991231235959'),
    (25, 1, '/api/zoo/hosts', 'zoo', '1000', '99991231235959'),
    (26, 2, '/api/zoo/hosts', 'zoo', '1000', '99991231235959'),
    (27, 3, '/api/zoo/hosts', 'zoo', '1000', '99991231235959'),
    (28, 1, '/api/zoo/prefix', 'zoo', '1000', '99991231235959'),
    (29, 2, '/api/zoo/prefix', 'zoo', '1000', '99991231235959'),
    (30, 3, '/api/zoo/prefix', 'zoo', '1000', '99991231235959'),
    (31, 1, '/api/zoo/zkdeploy', 'zoo', '1000', '99991231235959'),
    (32, 2, '/api/zoo/zkdeploy', 'zoo', '1000', '99991231235959'),
    (33, 3, '/api/zoo/zkdeploy', 'zoo', '1000', '99991231235959'),
    (34, 1, '/api/web/config/item', '创建item-config', '0010', '99991231235959'),
    (35, 2, '/api/web/config/item', '创建item-config', '0010', '99991231235959'),
    (36, 3, '/api/web/config/item', '创建item-config', '0000', '99991231235959'),
    (37, 1, '/api/web/config/file', '创建file-config', '0010', '99991231235959'),
    (38, 2, '/api/web/config/file', '创建file-config', '0010', '99991231235959'),
    (39, 3, '/api/web/config/file', '创建file-config', '0000', '99991231235959'),
    (40, 1, '/api/web/config/filetext', '创建file-config', '0010', '99991231235959'),
    (41, 2, '/api/web/config/filetext', '创建file-config', '0010', '99991231235959'),
    (42, 3, '/api/web/config/filetext', '创建file-config', '0000', '99991231235959'),
    (43, 1, '/api/web/config/versionlist', '版本list', '1000', '99991231235959'),
    (44, 2, '/api/web/config/versionlist', '版本list', '1000', '99991231235959'),
    (45, 3, '/api/web/config/versionlist', '版本list', '1000', '99991231235959'),
    (46, 1, '/api/web/config/list', 'config-list', '1000', '99991231235959'),
    (47, 2, '/api/web/config/list', 'config-list', '1000', '99991231235959'),
    (48, 3, '/api/web/config/list', 'config-list', '1000', '99991231235959'),
    (49, 1, '/api/web/config/simple/list', 'config-list', '1000', '99991231235959'),
    (50, 2, '/api/web/config/simple/list', 'config-list', '1000', '99991231235959'),
    (51, 3, '/api/web/config/simple/list', 'config-list', '1000', '99991231235959'),
    (52, 1, '/api/web/config/{configId}', 'get/post', '1001', '99991231235959'),
    (53, 2, '/api/web/config/{configId}', 'get/post', '1001', '99991231235959'),
    (54, 3, '/api/web/config/{configId}', 'get/post', '1000', '99991231235959'),
    (55, 1, '/api/web/config/zk/{configId}', 'get-zk', '1000', '99991231235959'),
    (56, 2, '/api/web/config/zk/{configId}', 'get-zk', '1000', '99991231235959'),
    (57, 3, '/api/web/config/zk/{configId}', 'get-zk', '1000', '99991231235959'),
    (58, 1, '/api/web/config/download/{configId}', 'download', '1000', '99991231235959'),
    (59, 2, '/api/web/config/download/{configId}', 'download', '1000', '99991231235959'),
    (60, 3, '/api/web/config/download/{configId}', 'download', '1000', '99991231235959'),
    (61, 1, '/api/web/config/downloadfilebatch', 'download', '1000', '99991231235959'),
    (62, 2, '/api/web/config/downloadfilebatch', 'download', '1000', '99991231235959'),
    (63, 3, '/api/web/config/downloadfilebatch', 'download', '1000', '99991231235959'),
    (64, 1, '/api/web/config/item/{configId}', 'update', '0100', '99991231235959'),
    (65, 2, '/api/web/config/item/{configId}', 'update', '0100', '99991231235959'),
    (66, 3, '/api/web/config/item/{configId}', 'update', '0000', '99991231235959'),
    (67, 1, '/api/web/config/file/{configId}', 'update/post', '0010', '99991231235959'),
    (68, 2, '/api/web/config/file/{configId}', 'update/post', '0010', '99991231235959'),
    (69, 3, '/api/web/config/file/{configId}', 'update/post', '0000', '99991231235959'),
    (70, 1, '/api/web/config/filetext/{configId}', 'update', '0100', '99991231235959'),
    (71, 2, '/api/web/config/filetext/{configId}', 'update', '0100', '99991231235959'),
    (72, 3, '/api/web/config/filetext/{configId}', 'update', '0000', '99991231235959');

/* testUser1  MhxzKhl9209*/
/* testUser2  MhxzKhl167*/
/* testUser3  MhxzKhl783*/
/* testUser4  MhxzKhl8758*/
/* testUser5  MhxzKhl112*/
/* admin    admin*/
INSERT INTO `user` (`user_id`, `name`, `password`, `token`, `ownapps`, `role_id`)
VALUES
    (1, 'testUser1', '5eec8499597a115c88e0a9580ae1562ab85d0b1a', 'b9070d385a13357efa09e50e080607c2b299241b', '2', 1),
    (2, 'testUser2', '71e9dc667eefa5a3a4840cb4f1ce22bc246f22f0', 'b169dec42f61ec6cbad88d70e7c4c6b89630ccfb', '2', 1),
    (3, 'testUser3', 'e2cdc4a9195030543e38e19a923f075d54471cc4', 'a1a20b0e03a5191c530cbfc064eda3c16254df64', '2', 1),
    (4, 'testUser4', '5cef2d7e4ada5a615f03e12b569d80aedfb056fc', '007b07fccbc1c82c987f7b8e4651e85cca01cf2b', '2', 1),
    (5, 'testUser5', 'f996eeaa224abe0037d99adbce73c315e13238f9', 'c9dfdcb50a3d84f2b6a4771dcb7c2ceb19e7d281', '2', 1),
    (6, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'f28d164d23291c732f64134e6b7d92be3ff8b1b3', '', 2),
    (7, 'admin_read', 'b76f3e20d1c8d0bc17d40158e44097d5eeee8640', '2022ab9c2754d62f9ddba5fded91e4238247ebaf', '2', 3),
    (8, 'mobiledsp', '0855b44a368e44dc6e6825532073b29a368584af', '132069654193f802203d1c6c86e753ecede698f6', '4', 1);
CREATE TABLE `config_history` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `config_id` BIGINT NOT NULL,
  `old_value` LONGTEXT NOT NULL,
  `new_value` LONGTEXT NOT NULL,
  `create_time` VARCHAR(14) NOT NULL DEFAULT '99991231235959',
  PRIMARY KEY (`id`)
)DEFAULT CHARSET=utf8 ENGINE=InnoDB;

ALTER TABLE `config`
	ADD COLUMN `status` TINYINT(4) NOT NULL DEFAULT '1' COMMENT '状态：1是正常 0是删除' AFTER `type`;
