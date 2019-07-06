/*
Navicat MySQL Data Transfer

Source Server         : locL
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-07-07 00:19:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `countries_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES ('1', 'Dhaka', null, null, null, null, '1');
INSERT INTO `cities` VALUES ('2', 'Delhi', null, null, null, null, '2');
INSERT INTO `cities` VALUES ('3', 'Islamabad', null, null, null, null, '3');
INSERT INTO `cities` VALUES ('4', 'Rajshahi', null, null, null, null, '1');

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'Bangladesh', null, null, null, null);
INSERT INTO `countries` VALUES ('2', 'India', null, null, null, null);
INSERT INTO `countries` VALUES ('3', 'Pakisthan', null, null, null, null);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menus_description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menus_type` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_menus_id` int(11) NOT NULL,
  `modules_id` int(11) NOT NULL,
  `icon_class` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_number` int(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', 'Add New Photo', null, 'Main', '0', '2', 'fa fa-plus', '/add_new_photo', '0', '0', '0', null, null, '1');
INSERT INTO `menus` VALUES ('2', 'My Collections', null, 'Main', '0', '2', 'fa fa-list', '/my_collections', '1', '0', '0', null, null, '1');
INSERT INTO `menus` VALUES ('3', 'Create New User', null, 'Main', '0', '1', 'fa fa-plus', '/create_new_user', '0', '0', '0', null, null, '1');
INSERT INTO `menus` VALUES ('4', 'User Collections', null, 'Main', '0', '1', 'fa  fa-list', '/user_collections', '2', '0', '0', null, null, '1');
INSERT INTO `menus` VALUES ('5', 'All Photos', null, 'Main', '0', '1', 'fa fa-list', '/all_photos', '3', '0', '0', null, null, '1');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules_icon` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `status` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES ('1', 'Admin', 'fff', 'na', '/', '0', '0', 'Active', null, null);
INSERT INTO `modules` VALUES ('2', 'User', '', '', '', '0', '0', 'Active', null, null);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for photoes
-- ----------------------------
DROP TABLE IF EXISTS `photoes`;
CREATE TABLE `photoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `countries_id` int(11) DEFAULT NULL,
  `cities_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `photoes_path` varchar(500) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of photoes
-- ----------------------------
INSERT INTO `photoes` VALUES ('1', '1', 'test', '5820', '1', '1', '2019-07-06 12:51:57', null, '1', null, 'images/1562364306.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES ('2', '1', 'MY Nice Photoes', '5800', '1', '1', '2019-07-06 12:52:01', null, '2', null, 'images/1562364999.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES ('3', '1', 'test', '5820', '1', '1', '2019-07-06 12:51:57', '2019-08-05 23:49:51', '1', null, 'images/1562364306.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES ('4', '1', 'MY Nice Photoes', '5800', '1', '1', '2019-07-06 12:52:01', '2019-07-22 23:49:57', '2', null, 'images/1562364999.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');

-- ----------------------------
-- Table structure for privilege_levels
-- ----------------------------
DROP TABLE IF EXISTS `privilege_levels`;
CREATE TABLE `privilege_levels` (
  `users_id` int(11) DEFAULT NULL,
  `user_levels_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `privilege_levels_user_id_user_level_id_unique` (`users_id`,`user_levels_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of privilege_levels
-- ----------------------------
INSERT INTO `privilege_levels` VALUES ('1', '1', null, null);
INSERT INTO `privilege_levels` VALUES ('2', '2', '2019-07-05 20:09:30', '2019-07-05 20:09:30');

-- ----------------------------
-- Table structure for privilege_menus
-- ----------------------------
DROP TABLE IF EXISTS `privilege_menus`;
CREATE TABLE `privilege_menus` (
  `menus_id` int(10) unsigned NOT NULL,
  `user_levels_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `all` tinyint(1) NOT NULL DEFAULT '0',
  `create` tinyint(1) NOT NULL DEFAULT '0',
  `edit` tinyint(1) NOT NULL DEFAULT '0',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `privilege_menus_menu_id_user_level_id_unique` (`menus_id`,`user_levels_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of privilege_menus
-- ----------------------------
INSERT INTO `privilege_menus` VALUES ('1', '2', null, '0', '0', '0', '0', null, null);
INSERT INTO `privilege_menus` VALUES ('2', '2', null, '0', '0', '0', '0', null, null);
INSERT INTO `privilege_menus` VALUES ('3', '1', null, '0', '0', '0', '0', null, null);
INSERT INTO `privilege_menus` VALUES ('4', '1', null, '0', '0', '0', '0', null, null);
INSERT INTO `privilege_menus` VALUES ('5', '1', null, '0', '0', '0', '0', null, null);

-- ----------------------------
-- Table structure for privilege_modules
-- ----------------------------
DROP TABLE IF EXISTS `privilege_modules`;
CREATE TABLE `privilege_modules` (
  `users_id` int(11) NOT NULL DEFAULT '0',
  `modules_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_levels_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of privilege_modules
-- ----------------------------
INSERT INTO `privilege_modules` VALUES ('1', '1', null, null, null, '1');
INSERT INTO `privilege_modules` VALUES ('22', '2', '2019-07-05 20:09:30', '2019-07-05 20:09:30', null, '2');
INSERT INTO `privilege_modules` VALUES ('23', '1', '2019-07-05 20:56:15', '2019-07-05 20:56:15', null, '3');
INSERT INTO `privilege_modules` VALUES ('24', '1', '2019-07-05 20:57:55', '2019-07-05 20:57:55', null, '4');
INSERT INTO `privilege_modules` VALUES ('25', '1', '2019-07-05 21:03:45', '2019-07-05 21:03:45', null, '5');

-- ----------------------------
-- Table structure for sys_dropdowns
-- ----------------------------
DROP TABLE IF EXISTS `sys_dropdowns`;
CREATE TABLE `sys_dropdowns` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dropdown_slug` varchar(100) DEFAULT NULL,
  `dropdown_mode` enum('dropdown','dropdown_grid') DEFAULT 'dropdown',
  `sys_search_panel_slug` varchar(100) DEFAULT NULL,
  `sqltext` text,
  `value_field` varchar(50) DEFAULT NULL,
  `option_field` varchar(100) DEFAULT NULL,
  `multiple` tinyint(1) DEFAULT '0',
  `search_columns` text,
  `dropdown_name` varchar(100) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dropdownslug` (`dropdown_slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dropdowns
-- ----------------------------
INSERT INTO `sys_dropdowns` VALUES ('1', 'country', 'dropdown', null, 'SELECT id, name FROM countries', 'id', 'name', '0', null, 'countries', '', '1', '2019-07-06 18:11:23', '1', '2019-07-06 16:19:10', 'Active');
INSERT INTO `sys_dropdowns` VALUES ('2', 'city', 'dropdown', null, 'SELECT id, name FROM cities', 'id', 'name', '0', null, 'cities', '', '1', '2019-07-06 18:11:23', '1', '2019-07-06 16:19:10', 'Active');
INSERT INTO `sys_dropdowns` VALUES ('3', 'users', 'dropdown', null, 'SELECT users.id, users.name FROM users LEFT JOIN privilege_levels ON users.id = privilege_levels.users_id LEFT JOIN user_levels ON privilege_levels.user_levels_id = user_levels.id WHERE user_levels.id <> 1', 'id', 'name', '0', null, 'users', '', '1', '2019-07-06 17:03:29', null, '2019-07-06 17:03:25', 'Active');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Atik', 'rahmanatawur@gmail.com', null, '$2y$10$zm9wp69uEkS9SPWs5XIobOpZC4eOr2VGM.cK1bWxfHq1q4jbE6ty.', null, '2019-07-05 12:53:52', '2019-07-05 12:53:52');
INSERT INTO `users` VALUES ('2', 'Md. Atawur Rahman', 'rahmanatawur2@gmail.com', null, '$2y$10$zm9wp69uEkS9SPWs5XIobOpZC4eOr2VGM.cK1bWxfHq1q4jbE6ty.', null, '2019-07-05 21:03:44', '2019-07-05 21:03:44');

-- ----------------------------
-- Table structure for users_photoes_collections
-- ----------------------------
DROP TABLE IF EXISTS `users_photoes_collections`;
CREATE TABLE `users_photoes_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(500) DEFAULT NULL,
  `photoes_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users_photoes_collections
-- ----------------------------
INSERT INTO `users_photoes_collections` VALUES ('1', '1', '1', null, null, '1', null);
INSERT INTO `users_photoes_collections` VALUES ('2', '1', '1', '2019-07-06 08:36:30', '2019-07-06 08:36:30', '2', null);
INSERT INTO `users_photoes_collections` VALUES ('3', '1', '1', '2019-07-06 08:36:41', '2019-07-06 08:36:41', '2', null);
INSERT INTO `users_photoes_collections` VALUES ('4', '1', '1', '2019-07-06 08:38:30', '2019-07-06 08:38:30', '2', null);
INSERT INTO `users_photoes_collections` VALUES ('5', '1', '1', '2019-07-06 08:38:35', '2019-07-06 08:38:35', '2', null);
INSERT INTO `users_photoes_collections` VALUES ('15', '1', '9', '2019-07-06 10:13:52', '2019-07-06 10:13:52', '1', null);
INSERT INTO `users_photoes_collections` VALUES ('16', '1', '10', '2019-07-06 10:17:51', '2019-07-06 10:17:51', '1', null);
INSERT INTO `users_photoes_collections` VALUES ('17', '1', '2', '2019-07-06 10:25:33', '2019-07-06 10:25:33', '1', null);
INSERT INTO `users_photoes_collections` VALUES ('18', '1', '3', '2019-07-06 10:37:42', '2019-07-06 10:37:42', '1', null);
INSERT INTO `users_photoes_collections` VALUES ('19', '1', '11', '2019-07-06 10:39:14', '2019-07-06 10:39:14', '1', null);
INSERT INTO `users_photoes_collections` VALUES ('20', '1', '12', '2019-07-06 11:28:55', '2019-07-06 11:28:55', '1', null);
INSERT INTO `users_photoes_collections` VALUES ('21', '2', '13', '2019-07-06 11:33:05', '2019-07-06 11:33:05', '1', null);
INSERT INTO `users_photoes_collections` VALUES ('22', '2', '1', '2019-07-06 17:49:05', '2019-07-06 17:49:05', '2', null);
INSERT INTO `users_photoes_collections` VALUES ('23', '2', '3', '2019-07-06 17:50:15', '2019-07-06 17:50:15', '2', null);

-- ----------------------------
-- Table structure for user_levels
-- ----------------------------
DROP TABLE IF EXISTS `user_levels`;
CREATE TABLE `user_levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `privilege_edit` tinyint(4) NOT NULL DEFAULT '0',
  `privilege_delete` tinyint(4) NOT NULL DEFAULT '0',
  `privilege_add` tinyint(4) NOT NULL DEFAULT '0',
  `privilege_view_all` tinyint(4) NOT NULL DEFAULT '0',
  `all_privilege` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_levels
-- ----------------------------
INSERT INTO `user_levels` VALUES ('1', 'Admin', 'dd', '0', '2018-05-14 10:24:52', '0', '2018-05-14 10:25:03', 'Active', '0', '0', '0', '0', '0', null, null);
INSERT INTO `user_levels` VALUES ('2', 'User', '', '0', null, '0', null, 'Active', '0', '0', '0', '0', '0', null, '2018-10-17 14:27:18');
