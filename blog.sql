/*
 Navicat Premium Data Transfer

 Source Server         : MySQL_LOCAL
 Source Server Type    : MySQL
 Source Server Version : 100135
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 100135
 File Encoding         : 65001

 Date: 06/07/2019 23:11:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `countries_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES (1, 'Dhaka', NULL, NULL, NULL, NULL, 1);
INSERT INTO `cities` VALUES (2, 'Delhi', NULL, NULL, NULL, NULL, 2);
INSERT INTO `cities` VALUES (3, 'Islamabad', NULL, NULL, NULL, NULL, 3);
INSERT INTO `cities` VALUES (4, 'Rajshahi', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES (1, 'Bangladesh', NULL, NULL, NULL, NULL);
INSERT INTO `countries` VALUES (2, 'India', NULL, NULL, NULL, NULL);
INSERT INTO `countries` VALUES (3, 'Pakisthan', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menus_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `menus_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_menus_id` int(11) NOT NULL,
  `modules_id` int(11) NOT NULL,
  `icon_class` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_number` int(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `is_active` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'Add New Photo', NULL, 'Main', 0, 2, 'fa fa-plus', '/add_new_photo', 0, 0, 0, NULL, NULL, '1');
INSERT INTO `menus` VALUES (2, 'My Collections', NULL, 'Main', 0, 2, 'fa fa-list', '/my_collections', 1, 0, 0, NULL, NULL, '1');
INSERT INTO `menus` VALUES (3, 'Create New User', NULL, 'Main', 0, 1, 'fa fa-plus', '/create_new_user', 0, 0, 0, NULL, NULL, '1');
INSERT INTO `menus` VALUES (4, 'User Collections', NULL, 'Main', 0, 1, 'fa  fa-list', '/user_collections', 2, 0, 0, NULL, NULL, '1');
INSERT INTO `menus` VALUES (5, 'All Photos', NULL, 'Main', 0, 1, 'fa fa-list', '/all_photos', 3, 0, 0, NULL, NULL, '1');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules_icon` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `status` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES (1, 'Admin', 'fff', 'na', '/', 0, 0, 'Active', NULL, NULL);
INSERT INTO `modules` VALUES (2, 'User', '', '', '', 0, 0, 'Active', NULL, NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`(191)) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for photoes
-- ----------------------------
DROP TABLE IF EXISTS `photoes`;
CREATE TABLE `photoes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NULL DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `countries_id` int(11) NULL DEFAULT NULL,
  `cities_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `photoes_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of photoes
-- ----------------------------
INSERT INTO `photoes` VALUES (1, 1, 'test', '5820', 1, 1, '2019-07-06 12:51:57', NULL, 1, NULL, 'images/1562364306.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (2, 1, 'MY Nice Photoes', '5800', 1, 1, '2019-07-06 12:52:01', NULL, 2, NULL, 'images/1562364999.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (3, 2, 'TEST', NULL, 1, 1, '2019-07-06 09:01:46', '2019-07-06 09:01:46', 2, NULL, 'images/1562403706.jpg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (4, 1, 'sdtgh', NULL, 1, 1, '2019-07-06 10:10:58', '2019-07-06 10:10:58', 1, NULL, 'images/1562407858.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (5, 1, 'ee', NULL, 1, 1, '2019-07-06 10:12:19', '2019-07-06 10:12:19', 1, NULL, 'images/1562407939.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (6, 1, 'ee', NULL, 1, 1, '2019-07-06 10:12:42', '2019-07-06 10:12:42', 1, NULL, 'images/1562407962.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (7, 1, 'sdreg', NULL, 1, 1, '2019-07-06 10:13:18', '2019-07-06 10:13:18', 1, NULL, 'images/1562407998.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (8, 1, 'sdreg', NULL, 1, 1, '2019-07-06 10:13:38', '2019-07-06 10:13:38', 1, NULL, 'images/1562408018.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (9, 1, 'sdreg', NULL, 1, 1, '2019-07-06 10:13:52', '2019-07-06 10:13:52', 1, NULL, 'images/1562408032.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (10, 1, 'sdrg', NULL, 1, 1, '2019-07-06 10:17:51', '2019-07-06 10:17:51', 1, NULL, 'images/1562408271.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (11, 1, 'ert', NULL, 1, 1, '2019-07-06 10:39:14', '2019-07-06 10:39:14', 1, NULL, 'images/1562409554.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (12, 1, 'rt', NULL, 2, 1, '2019-07-06 11:28:55', '2019-07-06 11:28:55', 1, NULL, 'images/1562412535.jpeg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');
INSERT INTO `photoes` VALUES (13, 1, 'dsfg', '5800', 1, 1, '2019-07-06 11:33:05', '2019-07-06 16:25:56', 1, NULL, 'images/1562430305.jpg', 'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.\r\n\r\nParagraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.');

-- ----------------------------
-- Table structure for privilege_levels
-- ----------------------------
DROP TABLE IF EXISTS `privilege_levels`;
CREATE TABLE `privilege_levels`  (
  `users_id` int(11) NULL DEFAULT NULL,
  `user_levels_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  UNIQUE INDEX `privilege_levels_user_id_user_level_id_unique`(`users_id`, `user_levels_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of privilege_levels
-- ----------------------------
INSERT INTO `privilege_levels` VALUES (1, 1, NULL, NULL);
INSERT INTO `privilege_levels` VALUES (2, 2, '2019-07-05 20:09:30', '2019-07-05 20:09:30');

-- ----------------------------
-- Table structure for privilege_menus
-- ----------------------------
DROP TABLE IF EXISTS `privilege_menus`;
CREATE TABLE `privilege_menus`  (
  `menus_id` int(10) UNSIGNED NOT NULL,
  `user_levels_id` int(11) NULL DEFAULT NULL,
  `users_id` int(11) NULL DEFAULT NULL,
  `all` tinyint(1) NOT NULL DEFAULT 0,
  `create` tinyint(1) NOT NULL DEFAULT 0,
  `edit` tinyint(1) NOT NULL DEFAULT 0,
  `del` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  UNIQUE INDEX `privilege_menus_menu_id_user_level_id_unique`(`menus_id`, `user_levels_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of privilege_menus
-- ----------------------------
INSERT INTO `privilege_menus` VALUES (1, 2, NULL, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `privilege_menus` VALUES (2, 2, NULL, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `privilege_menus` VALUES (3, 1, NULL, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `privilege_menus` VALUES (4, 1, NULL, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `privilege_menus` VALUES (1, 1, NULL, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `privilege_menus` VALUES (2, 1, NULL, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `privilege_menus` VALUES (5, 1, NULL, 0, 0, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for privilege_modules
-- ----------------------------
DROP TABLE IF EXISTS `privilege_modules`;
CREATE TABLE `privilege_modules`  (
  `users_id` int(11) NOT NULL DEFAULT 0,
  `modules_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `user_levels_id` int(11) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of privilege_modules
-- ----------------------------
INSERT INTO `privilege_modules` VALUES (1, 1, NULL, NULL, NULL, 1);
INSERT INTO `privilege_modules` VALUES (22, 2, '2019-07-05 20:09:30', '2019-07-05 20:09:30', NULL, 2);
INSERT INTO `privilege_modules` VALUES (23, 1, '2019-07-05 20:56:15', '2019-07-05 20:56:15', NULL, 3);
INSERT INTO `privilege_modules` VALUES (24, 1, '2019-07-05 20:57:55', '2019-07-05 20:57:55', NULL, 4);
INSERT INTO `privilege_modules` VALUES (25, 1, '2019-07-05 21:03:45', '2019-07-05 21:03:45', NULL, 5);

-- ----------------------------
-- Table structure for sys_dropdowns
-- ----------------------------
DROP TABLE IF EXISTS `sys_dropdowns`;
CREATE TABLE `sys_dropdowns`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dropdown_slug` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dropdown_mode` enum('dropdown','dropdown_grid') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'dropdown',
  `sys_search_panel_slug` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sqltext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `value_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `multiple` tinyint(1) NULL DEFAULT 0,
  `search_columns` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dropdown_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(10) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_by` int(10) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Active',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dropdownslug`(`dropdown_slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dropdowns
-- ----------------------------
INSERT INTO `sys_dropdowns` VALUES (1, 'country', 'dropdown', NULL, 'SELECT id, name FROM countries', 'id', 'name', 0, NULL, 'countries', '', 1, '2019-07-06 18:11:23', 1, '2019-07-06 16:19:10', 'Active');
INSERT INTO `sys_dropdowns` VALUES (2, 'city', 'dropdown', NULL, 'SELECT id, name FROM cities', 'id', 'name', 0, NULL, 'cities', '', 1, '2019-07-06 18:11:23', 1, '2019-07-06 16:19:10', 'Active');
INSERT INTO `sys_dropdowns` VALUES (3, 'users', 'dropdown', NULL, 'SELECT users.id, users.name FROM users LEFT JOIN privilege_levels ON users.id = privilege_levels.users_id LEFT JOIN user_levels ON privilege_levels.user_levels_id = user_levels.id WHERE user_levels.id <> 1', 'id', 'name', 0, NULL, 'users', '', 1, '2019-07-06 17:03:29', NULL, '2019-07-06 17:03:25', 'Active');

-- ----------------------------
-- Table structure for user_levels
-- ----------------------------
DROP TABLE IF EXISTS `user_levels`;
CREATE TABLE `user_levels`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created` datetime(0) NULL DEFAULT NULL,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `updated` datetime(0) NULL DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `privilege_edit` tinyint(4) NOT NULL DEFAULT 0,
  `privilege_delete` tinyint(4) NOT NULL DEFAULT 0,
  `privilege_add` tinyint(4) NOT NULL DEFAULT 0,
  `privilege_view_all` tinyint(4) NOT NULL DEFAULT 0,
  `all_privilege` tinyint(4) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_levels
-- ----------------------------
INSERT INTO `user_levels` VALUES (1, 'Admin', 'dd', 0, '2018-05-14 10:24:52', 0, '2018-05-14 10:25:03', 'Active', 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `user_levels` VALUES (2, 'User', '', 0, NULL, 0, NULL, 'Active', 0, 0, 0, 0, 0, NULL, '2018-10-17 14:27:18');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Atik', 'rahmanatawur@gmail.com', NULL, '$2y$10$Mdpv8wuH7XyOR7OsA.0fQ.Qo6X5zwiitDLxe4LycvegQYRT5IxdVS', NULL, '2019-07-05 12:53:52', '2019-07-05 12:53:52');
INSERT INTO `users` VALUES (2, 'Md. Atawur Rahman', 'rahmanatawur2@gmail.com', NULL, '$2y$10$zm9wp69uEkS9SPWs5XIobOpZC4eOr2VGM.cK1bWxfHq1q4jbE6ty.', NULL, '2019-07-05 21:03:44', '2019-07-05 21:03:44');

-- ----------------------------
-- Table structure for users_photoes_collections
-- ----------------------------
DROP TABLE IF EXISTS `users_photoes_collections`;
CREATE TABLE `users_photoes_collections`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photoes_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_photoes_collections
-- ----------------------------
INSERT INTO `users_photoes_collections` VALUES (1, '1', 1, NULL, NULL, 1, NULL);
INSERT INTO `users_photoes_collections` VALUES (2, '1', 1, '2019-07-06 08:36:30', '2019-07-06 08:36:30', 2, NULL);
INSERT INTO `users_photoes_collections` VALUES (3, '1', 1, '2019-07-06 08:36:41', '2019-07-06 08:36:41', 2, NULL);
INSERT INTO `users_photoes_collections` VALUES (4, '1', 1, '2019-07-06 08:38:30', '2019-07-06 08:38:30', 2, NULL);
INSERT INTO `users_photoes_collections` VALUES (5, '1', 1, '2019-07-06 08:38:35', '2019-07-06 08:38:35', 2, NULL);
INSERT INTO `users_photoes_collections` VALUES (15, '1', 9, '2019-07-06 10:13:52', '2019-07-06 10:13:52', 1, NULL);
INSERT INTO `users_photoes_collections` VALUES (16, '1', 10, '2019-07-06 10:17:51', '2019-07-06 10:17:51', 1, NULL);
INSERT INTO `users_photoes_collections` VALUES (17, '1', 2, '2019-07-06 10:25:33', '2019-07-06 10:25:33', 1, NULL);
INSERT INTO `users_photoes_collections` VALUES (18, '1', 3, '2019-07-06 10:37:42', '2019-07-06 10:37:42', 1, NULL);
INSERT INTO `users_photoes_collections` VALUES (19, '1', 11, '2019-07-06 10:39:14', '2019-07-06 10:39:14', 1, NULL);
INSERT INTO `users_photoes_collections` VALUES (20, '1', 12, '2019-07-06 11:28:55', '2019-07-06 11:28:55', 1, NULL);
INSERT INTO `users_photoes_collections` VALUES (21, '2', 13, '2019-07-06 11:33:05', '2019-07-06 11:33:05', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
