/*
 Navicat Premium Data Transfer

 Source Server         : localhost_wamp
 Source Server Type    : MariaDB
 Source Server Version : 100314
 Source Host           : localhost:3307
 Source Schema         : faculty-ku

 Target Server Type    : MariaDB
 Target Server Version : 100314
 File Encoding         : 65001

 Date: 17/06/2020 10:33:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for calendar
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ชื่อกิจกรรม',
  `date` date NOT NULL COMMENT 'วันที่',
  `start_time` time(0) NOT NULL COMMENT 'ตั้งแต่เวลา',
  `end_time` time(0) NOT NULL COMMENT 'ถึงเวลา',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text_color` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `background_color` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `date`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
