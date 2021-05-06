/*
 Navicat Premium Data Transfer

 Source Server         : localhost_wamp
 Source Server Type    : MariaDB
 Source Server Version : 100314
 Source Host           : localhost:3307
 Source Schema         : andaman-web

 Target Server Type    : MariaDB
 Target Server Version : 100314
 File Encoding         : 65001

 Date: 15/06/2020 15:29:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `idx-auth_assignment-user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `data` blob NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item
-- ----------------------------

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` blob NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `events_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `short` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `views` int(11) NULL DEFAULT 0,
  `status` smallint(1) NULL DEFAULT 1,
  `image_base_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `published_at` date NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`events_id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `published_at`(`published_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES (7, 'ฝ่ายวิชาการประชุมแนวทางการจัดกิจกรรมการเรียนการสอน ปีการศึกษา 2563', NULL, '<p>กิจกรรมทดสอบ</p>', 'events', 44, 1, 'http://159.65.131.194/storage/source', '\\1\\NCs_ZqGm8YtZjNP0vU0olYztNc7sND5E.jpg', 1, 1, '2020-06-15', 1592200239, 1592203702, '');
INSERT INTO `events` VALUES (8, 'ฝ่ายวิชาการประชุมแนวทางการจัดกิจกรรมการเรียนการสอน ปีการศึกษา 2563', NULL, '<h3>ฝ่ายวิชาการประชุมแนวทางการจัดกิจกรรมการเรียนการสอน ปีการศึกษา 2563</h3>', 'fay-wichakar-prachum-naewthang-kar-cad-kickrrm-kar-reiyn-kar-sxn-pi-kar-suksa-2563', 15, 1, 'http://159.65.131.194/storage/source', '\\1\\jNyhqlHiRpC7RznQVqiGPAc8hPu9a9GC.jpg', 1, 1, '2020-06-15', 1592203811, 1592207855, '');
INSERT INTO `events` VALUES (9, 'ฝ่ายวิชาการประชุมแนวทางการจัดกิจกรรมการเรียนการสอน ปีการศึกษา 2563', NULL, '<p>กิจกรรม</p>', 'fay-wichakar-prachum-naewthang-kar-cad-kickrrm-kar-reiyn-kar-sxn-pi-kar-suksa-2563-2', 2, 1, 'http://159.65.131.194/storage/source', '\\1\\WNv3jDeQNCqMnoMpRlMBPwp1OrS4nGYV.jpg', 1, 1, '2020-06-15', 1592208269, 1592208269, '');
INSERT INTO `events` VALUES (10, 'ฝ่ายวิชาการประชุมแนวทางการจัดกิจกรรมการเรียนการสอน ปีการศึกษา 2563', NULL, '<p>กิจกรรม</p>', 'fay-wichakar-prachum-naewthang-kar-cad-kickrrm-kar-reiyn-kar-sxn-pi-kar-suksa-2563-3', 1, 1, 'http://159.65.131.194/storage/source', '\\1\\W0nHHjOthgB6utVQIG0H3-YLjPQugl4R.jpg', 1, 1, '2020-06-15', 1592208330, 1592208330, '');
INSERT INTO `events` VALUES (11, 'ฝ่ายวิชาการประชุมแนวทางการจัดกิจกรรมการเรียนการสอน ปีการศึกษา 2563', NULL, '<p>กิจกรรม</p>', 'fay-wichakar-prachum-naewthang-kar-cad-kickrrm-kar-reiyn-kar-sxn-pi-kar-suksa-2563-4', 2, 1, 'http://159.65.131.194/storage/source', '\\1\\bKXDcZ3WqvcvIdU1r4WPKNoxtkU1AhB3.jpg', 1, 1, '2020-06-15', 1592208361, 1592208361, '');

-- ----------------------------
-- Table structure for events_attachment
-- ----------------------------
DROP TABLE IF EXISTS `events_attachment`;
CREATE TABLE `events_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `events_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_attachment_article`(`events_id`) USING BTREE,
  INDEX `order`(`order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events_attachment
-- ----------------------------
INSERT INTO `events_attachment` VALUES (11, 7, '\\1\\GQSLVFPVCgZvQ9JCMBaQATOrJ5j1MGJC.jpg', 'http://159.65.131.194/storage/source', 'image/jpeg', 69316, '12443.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (12, 7, '\\1\\2c10xBW10CkcJOu3fwz64fXLIW0K-ob7.jpg', 'http://159.65.131.194/storage/source', 'image/jpeg', 315262, '1558149932440.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (13, 7, '\\1\\zKNqvIpiGfqDXO3isZEVVWwWpLtGnruJ.jpg', 'http://159.65.131.194/storage/source', 'image/jpeg', 249124, '1558149950416.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (14, 7, '\\1\\1z3xvCbRu2nADla-PwNFvQwvRH7rmlAI.jpg', 'http://159.65.131.194/storage/source', 'image/jpeg', 16246, '1558968629812.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (15, 7, '\\1\\ssBMpqQpk5_hxAre1zs_Rwopzi1NiVtY.jpg', 'http://159.65.131.194/storage/source', 'image/jpeg', 202932, '1561556078520.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (16, 7, '\\1\\eopc3SaNbO4I1KGNlKDghYlXMryBtU9F.jpg', 'http://159.65.131.194/storage/source', 'image/jpeg', 291334, '1561556400870.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (17, 8, '\\1\\aI3zrWAEfxD6uvh91k-1XEq-rAJJtH1A.jpg', 'http://159.65.131.194/storage/source', 'image/jpeg', 78522, 'r0_476_5184_3405_w1200_h678_fmax.jpg', 1592203811, NULL);

-- ----------------------------
-- Table structure for file_storage_item
-- ----------------------------
DROP TABLE IF EXISTS `file_storage_item`;
CREATE TABLE `file_storage_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `base_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ref_id` int(11) NULL DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `ref_table` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ref_id`(`ref_id`) USING BTREE,
  INDEX `created_at`(`created_at`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_storage_item
-- ----------------------------
INSERT INTO `file_storage_item` VALUES (4, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\-1Pv-O_7W3xAUhZvr9inxlR77kNm2C7f.jpg', 'image/jpeg', 185775, '-1Pv-O_7W3xAUhZvr9inxlR77kNm2C7f', '127.0.0.1', NULL, 1572776635, NULL);
INSERT INTO `file_storage_item` VALUES (3, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\kpZmwB-T_gi1cko3j4WyTAJgtJVEnqnJ.jpg', 'image/jpeg', 128697, 'kpZmwB-T_gi1cko3j4WyTAJgtJVEnqnJ', '127.0.0.1', NULL, 1572666787, NULL);
INSERT INTO `file_storage_item` VALUES (6, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\tovPqUFd2gYNIBUvv2mgxCzguSrZHGE6.png', 'image/png', 9734, 'tovPqUFd2gYNIBUvv2mgxCzguSrZHGE6', '127.0.0.1', NULL, 1573444989, NULL);
INSERT INTO `file_storage_item` VALUES (28, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\uUCdjZAIuDktp-6XiuGe6tS50i_D6M2t.jpg', 'image/jpeg', 130570, 'uUCdjZAIuDktp-6XiuGe6tS50i_D6M2t', '127.0.0.1', NULL, 1576323487, NULL);
INSERT INTO `file_storage_item` VALUES (8, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\tKjLZsGSAK9laDEYou5lQzFVH1RMdUuh.png', 'image/png', 2197, 'tKjLZsGSAK9laDEYou5lQzFVH1RMdUuh', '127.0.0.1', NULL, 1573448044, NULL);
INSERT INTO `file_storage_item` VALUES (9, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\fOaRLejpMnW35bZQx1AEv-lx3849lBjh.png', 'image/png', 2870, 'fOaRLejpMnW35bZQx1AEv-lx3849lBjh', '127.0.0.1', NULL, 1573448055, NULL);
INSERT INTO `file_storage_item` VALUES (11, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\3Lw4TJtDhFqI8ba26iiRc_Gd9EL3opzA.png', 'image/png', 3010, '3Lw4TJtDhFqI8ba26iiRc_Gd9EL3opzA', '127.0.0.1', NULL, 1573448084, NULL);
INSERT INTO `file_storage_item` VALUES (12, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\QpxxbsgegQKBoCUa145saM8Xa7KEskIE.png', 'image/png', 3732, 'QpxxbsgegQKBoCUa145saM8Xa7KEskIE', '127.0.0.1', NULL, 1573448095, NULL);
INSERT INTO `file_storage_item` VALUES (25, 'fileStorage', 'http://yii2-queue-udon.local/source', '/opd/171/470/5/1714705.jpg', 'image/jpeg', 5118, '1714705', NULL, 58033, 1574725100, 'tbl_patient');
INSERT INTO `file_storage_item` VALUES (23, 'fileStorage', 'http://yii2-queue-udon.local/source', '/opd/171/470/5/1714705.jpg', 'image/jpeg', 5118, '1714705', NULL, 58031, 1574694658, 'tbl_patient');
INSERT INTO `file_storage_item` VALUES (26, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\FY7EyfrzV1IZ4dlq5VWJEUYCzKTZ-sFM.png', 'image/png', 15668, 'FY7EyfrzV1IZ4dlq5VWJEUYCzKTZ-sFM', '127.0.0.1', NULL, 1574851968, NULL);
INSERT INTO `file_storage_item` VALUES (29, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\Glx8SDyi-zc_P9AoMoMxLqmuTza0AlPN.jpg', 'image/jpeg', 130570, 'Glx8SDyi-zc_P9AoMoMxLqmuTza0AlPN', '127.0.0.1', NULL, 1576323662, NULL);
INSERT INTO `file_storage_item` VALUES (30, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\eSuASMGKnjlpG-gw9j2hnmNkb6P2CJHM.jpg', 'image/jpeg', 130570, 'eSuASMGKnjlpG-gw9j2hnmNkb6P2CJHM', '127.0.0.1', NULL, 1576323695, NULL);
INSERT INTO `file_storage_item` VALUES (33, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\EGA7fizpjusIIolGzR6d-JiQ-AyQyCCN.png', 'image/png', 8327, 'EGA7fizpjusIIolGzR6d-JiQ-AyQyCCN', '127.0.0.1', NULL, 1576324569, NULL);
INSERT INTO `file_storage_item` VALUES (46, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\PWZy-8OQLkiCuKDmgNZcrlUkFBdEncnr.jpg', 'image/jpeg', 964391, 'PWZy-8OQLkiCuKDmgNZcrlUkFBdEncnr', '127.0.0.1', NULL, 1580017465, NULL);
INSERT INTO `file_storage_item` VALUES (34, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\WrfPMe4Vu_L9yiNg4jm03eNC3ljNo_n0.png', 'image/png', 10015, 'WrfPMe4Vu_L9yiNg4jm03eNC3ljNo_n0', '127.0.0.1', NULL, 1576324610, NULL);
INSERT INTO `file_storage_item` VALUES (35, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\Imy0SxDvmoK29Pxpmuk7COqZnfSBtfgJ.png', 'image/png', 6415, 'Imy0SxDvmoK29Pxpmuk7COqZnfSBtfgJ', '127.0.0.1', NULL, 1576324644, NULL);
INSERT INTO `file_storage_item` VALUES (43, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\oIwtRr8su03WhW3soKZDSAe0vRemJNfE.png', 'image/png', 4553, 'oIwtRr8su03WhW3soKZDSAe0vRemJNfE', '127.0.0.1', NULL, 1576326501, NULL);
INSERT INTO `file_storage_item` VALUES (39, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\HyiIse7aEVBSVD5Y7R5MJoAy9p5vZWGw.png', 'image/png', 8140, 'HyiIse7aEVBSVD5Y7R5MJoAy9p5vZWGw', '127.0.0.1', NULL, 1576325602, NULL);
INSERT INTO `file_storage_item` VALUES (40, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\Ll64YeReVrWbhAmqDHoOr7M5WD_H0wMp.png', 'image/png', 8299, 'Ll64YeReVrWbhAmqDHoOr7M5WD_H0wMp', '127.0.0.1', NULL, 1576325632, NULL);
INSERT INTO `file_storage_item` VALUES (44, 'fileStorage', 'http://yii2-queue-udon.local/source', '/opd/171/470/5/1714705.jpg', 'image/jpeg', 5118, '1714705', NULL, 58103, 1576378791, 'tbl_patient');
INSERT INTO `file_storage_item` VALUES (45, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\wNZegZ1DOV_AfEq1RxQ1X0YFGsbx2NXP.png', 'image/png', 8299, 'wNZegZ1DOV_AfEq1RxQ1X0YFGsbx2NXP', '127.0.0.1', NULL, 1576677521, NULL);
INSERT INTO `file_storage_item` VALUES (49, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\E0OXddoVjL8g342R-tn1ApKQvo6ndEXJ.png', 'image/png', 8140, 'E0OXddoVjL8g342R-tn1ApKQvo6ndEXJ', '127.0.0.1', NULL, 1580892444, NULL);
INSERT INTO `file_storage_item` VALUES (50, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\gSnm_oQLsU0RKeBWSway6dozUrr2yh6J.png', 'image/png', 10015, 'gSnm_oQLsU0RKeBWSway6dozUrr2yh6J', '127.0.0.1', NULL, 1580892466, NULL);
INSERT INTO `file_storage_item` VALUES (51, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\4lLsnKNR-8BtC9g21Dzby1CP8wsbGYnV.png', 'image/png', 6415, '4lLsnKNR-8BtC9g21Dzby1CP8wsbGYnV', '127.0.0.1', NULL, 1580892480, NULL);
INSERT INTO `file_storage_item` VALUES (52, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\UkMOL2P7HDt1GGC7hvl2TppnES3-CYLj.png', 'image/png', 11384, 'UkMOL2P7HDt1GGC7hvl2TppnES3-CYLj', '127.0.0.1', NULL, 1580907167, NULL);
INSERT INTO `file_storage_item` VALUES (53, 'fileStorage', 'http://yii2-queue-udon.local/source', '\\1\\_Ip19Xb-4VlU171cDUdvzai_uF0qGxKk.jpg', 'image/jpeg', 964391, '_Ip19Xb-4VlU171cDUdvzai_uF0qGxKk', '127.0.0.1', NULL, 1580993324, NULL);
INSERT INTO `file_storage_item` VALUES (60, 'fileStorage', 'http://localhost:8083', '/images/opd/171/766/6/1717666.jpg', 'image/jpeg', 128697, '1717666', '127.0.0.1', 419711, 1583938363, 'tbl_patient');
INSERT INTO `file_storage_item` VALUES (79, 'fileStorage', 'http://localhost:8083', '/images/opd/171/766/6/1717666.jpg', 'image/jpeg', 128697, '1717666', '127.0.0.1', 419713, 1583989508, 'tbl_patient');
INSERT INTO `file_storage_item` VALUES (97, 'fileStorage', 'http://localhost:8083', '/images/opd/017/641/9/176419.jpg', 'image/jpeg', 136402, '176419', '127.0.0.1', 419714, 1583993568, 'tbl_patient');
INSERT INTO `file_storage_item` VALUES (98, 'fileStorage', '', '\\1\\E4G3g3e6qcq2DjYwkO-rherclj96gi3X.png', 'image/png', 36064, 'E4G3g3e6qcq2DjYwkO-rherclj96gi3X', '127.0.0.1', NULL, 1591851813, NULL);
INSERT INTO `file_storage_item` VALUES (99, 'fileStorage', '', '\\1\\uEvKQl4rC-XNK0G76MQIDQv6frkATQv4.png', 'image/png', 36064, 'uEvKQl4rC-XNK0G76MQIDQv6frkATQv4', '127.0.0.1', NULL, 1591851931, NULL);
INSERT INTO `file_storage_item` VALUES (101, 'fileStorage', '/source', '\\1\\0Od6N91W-cp6RyiL0ot1mx_RXI3QpAlO.png', 'image/png', 36064, '0Od6N91W-cp6RyiL0ot1mx_RXI3QpAlO', '127.0.0.1', NULL, 1591852180, NULL);
INSERT INTO `file_storage_item` VALUES (102, 'fileStorage', '/source', '\\1\\ZPKqJjkA4ySv8FECy-BOd5IpndqLOhg5.png', 'image/png', 36064, 'ZPKqJjkA4ySv8FECy-BOd5IpndqLOhg5', '127.0.0.1', NULL, 1591852202, NULL);
INSERT INTO `file_storage_item` VALUES (103, 'fileStorage', '/source', '\\1\\C4JGfVW9lb7V3iCuK-wDKo2QK5Rkvfkn.png', 'image/png', 36064, 'C4JGfVW9lb7V3iCuK-wDKo2QK5Rkvfkn', '127.0.0.1', NULL, 1591852828, NULL);
INSERT INTO `file_storage_item` VALUES (104, 'fileStorage', '/source', '\\1\\Zv4QHpR_8zu4TuZr3ZUzpXzPfHTtj978.png', 'image/png', 22422, 'Zv4QHpR_8zu4TuZr3ZUzpXzPfHTtj978', '127.0.0.1', NULL, 1591852979, NULL);
INSERT INTO `file_storage_item` VALUES (105, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\B5vzrZ0DLLgGSDHCxAEZVy6BBHX7e69q.png', 'image/png', 36064, 'B5vzrZ0DLLgGSDHCxAEZVy6BBHX7e69q', '127.0.0.1', NULL, 1591853153, NULL);
INSERT INTO `file_storage_item` VALUES (108, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8.png', 'image/png', 22422, '2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8', '127.0.0.1', NULL, 1591859607, NULL);
INSERT INTO `file_storage_item` VALUES (113, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\obJeBX2igcFQNa-Ux9Wqz95N4SolELgp.png', 'image/png', 3372423, 'obJeBX2igcFQNa-Ux9Wqz95N4SolELgp', '127.0.0.1', NULL, 1592020224, NULL);
INSERT INTO `file_storage_item` VALUES (112, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\pukXe37XlzzBEZ_BL4H5Qf0F3Y-YeDG4.jpg', 'image/jpeg', 419325, 'pukXe37XlzzBEZ_BL4H5Qf0F3Y-YeDG4', '127.0.0.1', NULL, 1592020128, NULL);
INSERT INTO `file_storage_item` VALUES (114, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\Y95AbmgulXmyPOJZajd-chX7Q7G2_RbQ.jpg', 'image/jpeg', 663771, 'Y95AbmgulXmyPOJZajd-chX7Q7G2_RbQ', '127.0.0.1', NULL, 1592020257, NULL);
INSERT INTO `file_storage_item` VALUES (124, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\Bkqv_yVRJlIyBEKEDH8SXJ2BPcsQWs01.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 9892, 'Bkqv_yVRJlIyBEKEDH8SXJ2BPcsQWs01', '127.0.0.1', NULL, 1592130659, NULL);
INSERT INTO `file_storage_item` VALUES (117, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\7hIM8aoBJl0JIEHkXr3QHy31tBxWCTjb.pdf', 'application/pdf', 275900, '7hIM8aoBJl0JIEHkXr3QHy31tBxWCTjb', '127.0.0.1', NULL, 1592060699, NULL);
INSERT INTO `file_storage_item` VALUES (118, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\d_5N-RCuec_ZPE4egbSI9D5bFq49U1Ta.pdf', 'application/pdf', 341790, 'd_5N-RCuec_ZPE4egbSI9D5bFq49U1Ta', '127.0.0.1', NULL, 1592060699, NULL);
INSERT INTO `file_storage_item` VALUES (119, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\ocReeYvtI1ZD23p9XPzGK8jETYqvEoq2.pdf', 'application/pdf', 1576623, 'ocReeYvtI1ZD23p9XPzGK8jETYqvEoq2', '127.0.0.1', NULL, 1592060699, NULL);
INSERT INTO `file_storage_item` VALUES (120, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\npe5Appyo2yZgJyrEpr7UAJPaRy4oe2L.jpg', 'image/jpeg', 322212, 'npe5Appyo2yZgJyrEpr7UAJPaRy4oe2L', '127.0.0.1', NULL, 1592105063, NULL);
INSERT INTO `file_storage_item` VALUES (122, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\Dnx4Ospu9SizLD5evuxYIK6N64tSdhQM.jpg', 'image/jpeg', 133440, 'Dnx4Ospu9SizLD5evuxYIK6N64tSdhQM', '127.0.0.1', NULL, 1592108402, NULL);
INSERT INTO `file_storage_item` VALUES (125, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\ZKKoZ8W8P8vRAcNN-Hj-LyiA2ltgc73j.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 16506, 'ZKKoZ8W8P8vRAcNN-Hj-LyiA2ltgc73j', '127.0.0.1', NULL, 1592130664, NULL);
INSERT INTO `file_storage_item` VALUES (126, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\DWMzrPLB83zFFuSPBZEC9XvO9WjtZgGI.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 743515, 'DWMzrPLB83zFFuSPBZEC9XvO9WjtZgGI', '127.0.0.1', NULL, 1592130680, NULL);
INSERT INTO `file_storage_item` VALUES (127, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\0XaCnfxDtuEs71a7VMrt6EB_0quL5D1q.png', 'image/png', 75784, '0XaCnfxDtuEs71a7VMrt6EB_0quL5D1q', '127.0.0.1', NULL, 1592139823, NULL);
INSERT INTO `file_storage_item` VALUES (128, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\NCs_ZqGm8YtZjNP0vU0olYztNc7sND5E.jpg', 'image/jpeg', 274671, 'NCs_ZqGm8YtZjNP0vU0olYztNc7sND5E', '127.0.0.1', NULL, 1592200051, NULL);
INSERT INTO `file_storage_item` VALUES (129, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\iQnIPwPsK3Kh1EuEaPvTOl3PhakVPYSB.jpg', 'image/jpeg', 315262, 'iQnIPwPsK3Kh1EuEaPvTOl3PhakVPYSB', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (130, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\WQqU4xzcu8qvCYMd7h0fOQ2qyikiJPCc.jpg', 'image/jpeg', 249124, 'WQqU4xzcu8qvCYMd7h0fOQ2qyikiJPCc', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (131, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\we7BFKpCzE8SMuceXoW5Fr_5DOXcySbV.jpg', 'image/jpeg', 16246, 'we7BFKpCzE8SMuceXoW5Fr_5DOXcySbV', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (132, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\A2DE-4r_apgXrexQ-ODmSXtIIgnPotha.jpg', 'image/jpeg', 202932, 'A2DE-4r_apgXrexQ-ODmSXtIIgnPotha', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (133, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\hMpOIjkPvkWtQOBLVef_KyQ9wkXxpZFb.jpg', 'image/jpeg', 291334, 'hMpOIjkPvkWtQOBLVef_KyQ9wkXxpZFb', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (134, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\NS38UTgur8NA7mNUYp7fimV-ORcM6_a3.jpg', 'image/jpeg', 69316, 'NS38UTgur8NA7mNUYp7fimV-ORcM6_a3', '127.0.0.1', NULL, 1592200201, NULL);
INSERT INTO `file_storage_item` VALUES (135, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\GQSLVFPVCgZvQ9JCMBaQATOrJ5j1MGJC.jpg', 'image/jpeg', 69316, 'GQSLVFPVCgZvQ9JCMBaQATOrJ5j1MGJC', '127.0.0.1', NULL, 1592200304, NULL);
INSERT INTO `file_storage_item` VALUES (136, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\2c10xBW10CkcJOu3fwz64fXLIW0K-ob7.jpg', 'image/jpeg', 315262, '2c10xBW10CkcJOu3fwz64fXLIW0K-ob7', '127.0.0.1', NULL, 1592200304, NULL);
INSERT INTO `file_storage_item` VALUES (137, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\zKNqvIpiGfqDXO3isZEVVWwWpLtGnruJ.jpg', 'image/jpeg', 249124, 'zKNqvIpiGfqDXO3isZEVVWwWpLtGnruJ', '127.0.0.1', NULL, 1592200304, NULL);
INSERT INTO `file_storage_item` VALUES (138, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\1z3xvCbRu2nADla-PwNFvQwvRH7rmlAI.jpg', 'image/jpeg', 16246, '1z3xvCbRu2nADla-PwNFvQwvRH7rmlAI', '127.0.0.1', NULL, 1592200304, NULL);
INSERT INTO `file_storage_item` VALUES (139, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\ssBMpqQpk5_hxAre1zs_Rwopzi1NiVtY.jpg', 'image/jpeg', 202932, 'ssBMpqQpk5_hxAre1zs_Rwopzi1NiVtY', '127.0.0.1', NULL, 1592200304, NULL);
INSERT INTO `file_storage_item` VALUES (140, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\eopc3SaNbO4I1KGNlKDghYlXMryBtU9F.jpg', 'image/jpeg', 291334, 'eopc3SaNbO4I1KGNlKDghYlXMryBtU9F', '127.0.0.1', NULL, 1592200304, NULL);
INSERT INTO `file_storage_item` VALUES (141, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\jNyhqlHiRpC7RznQVqiGPAc8hPu9a9GC.jpg', 'image/jpeg', 1399371, 'jNyhqlHiRpC7RznQVqiGPAc8hPu9a9GC', '127.0.0.1', NULL, 1592203770, NULL);
INSERT INTO `file_storage_item` VALUES (142, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\aI3zrWAEfxD6uvh91k-1XEq-rAJJtH1A.jpg', 'image/jpeg', 78522, 'aI3zrWAEfxD6uvh91k-1XEq-rAJJtH1A', '127.0.0.1', NULL, 1592203787, NULL);
INSERT INTO `file_storage_item` VALUES (143, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\WNv3jDeQNCqMnoMpRlMBPwp1OrS4nGYV.jpg', 'image/jpeg', 83385, 'WNv3jDeQNCqMnoMpRlMBPwp1OrS4nGYV', '127.0.0.1', NULL, 1592208244, NULL);
INSERT INTO `file_storage_item` VALUES (144, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\W0nHHjOthgB6utVQIG0H3-YLjPQugl4R.jpg', 'image/jpeg', 319097, 'W0nHHjOthgB6utVQIG0H3-YLjPQugl4R', '127.0.0.1', NULL, 1592208310, NULL);
INSERT INTO `file_storage_item` VALUES (145, 'fileStorage', 'http://159.65.131.194/storage/source', '\\1\\bKXDcZ3WqvcvIdU1r4WPKNoxtkU1AhB3.jpg', 'image/jpeg', 145324, 'bKXDcZ3WqvcvIdU1r4WPKNoxtkU1AhB3', '127.0.0.1', NULL, 1592208341, NULL);

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apply_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1591744412);
INSERT INTO `migration` VALUES ('m140209_132017_init', 1591744417);
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', 1591744418);
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', 1591744420);
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', 1591744421);
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', 1591744422);
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', 1591744422);
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', 1591744422);
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', 1591744423);
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', 1591744423);
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', 1591744423);
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', 1591744423);
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', 1591744423);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1591744520);
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1591744520);
INSERT INTO `migration` VALUES ('m180523_151638_rbac_updates_indexes_without_prefix', 1591744521);
INSERT INTO `migration` VALUES ('m200409_110543_rbac_update_mssql_trigger', 1591744521);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `short` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `views` int(11) NULL DEFAULT 0,
  `status` smallint(1) NULL DEFAULT 1,
  `image_base_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `published_at` date NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`news_id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `published_at`(`published_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, 1, 'สัมมนาเชิงปฏิบัติการ การพัฒนาหลักสูตรและรายวิชา', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti', '<p style=\"text-align: center;\">&nbsp;</p>\r\n<p><strong>Sed ut perspiciatis</strong>, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.&nbsp;</p>\r\n<ul>\r\n<li>item 1</li>\r\n<li>item 2</li>\r\n<li>item 3</li>\r\n</ul>\r\n<p>ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?</p>', 'first-news-title', 36, 1, 'http://159.65.131.194/storage/source', '\\1\\0XaCnfxDtuEs71a7VMrt6EB_0quL5D1q.png', 2, 1, '2020-06-12', NULL, 1592139893, '');
INSERT INTO `news` VALUES (2, 1, 'Second news title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\r\n<ol>\r\n<li>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</li>\r\n<li>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</li>\r\n</ol>', 'second-news-title', 1, 1, NULL, NULL, 1, 1, '2020-06-12', NULL, 1592126604, '');
INSERT INTO `news` VALUES (4, 1, 'How To Build HTML To WordPress Site?', '', '<p>Bimply dummy text of the printing and typesetting istryrem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer.when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuriesp into electronic.simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'how-to-build-html-to-wordpress-site', 33, 1, 'http://159.65.131.194/storage/source', '\\1\\npe5Appyo2yZgJyrEpr7UAJPaRy4oe2L.jpg', 1, 1, '2020-06-12', 1592060710, 1592105080, '');
INSERT INTO `news` VALUES (5, 3, 'เทคโนโลยีดิจิทัลที่มาช่วยในการเรียนการสอน การสอบ การประชุม และกิจกรรมต่างๆ : สำนักบริการคอมพิวเตอร์', 'ตามที่มหาวิทยาลัยเกษตรศาสตร์ ได้มีประกาศ เรื่อง มาตรการและแนวปฏิบัติในการเฝ้าระวังสุขอนามัยการระบาดโรคติดเชื้อไวรัสโคโรนา 2019 (COVID-19) ในส่วนของคณะหรืออาจารย์ผู้สอนให้พิจารณาปรับรูปแบบการเรียนการสอนให้กับนิสิตตามความเหมาะสม เช่น จัดการเรียนการสอนในรูปแบบออนไลน์ หรือ การมอบหมายงาน โดยไม่จำเป็นต้องมีการเข้าชั้นเรียน เพื่อลดการชุมนุมรวมกลุ่มของนิสิตแล้วนั้น', '<table style=\"border-collapse: collapse; border-style: dashed;\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td><strong>เครื่องมือ</strong></td>\r\n<td><strong>การประชุม</strong></td>\r\n<td><strong>การเรียน การสอน</strong></td>\r\n<td><strong>การสอบ</strong></td>\r\n<td><strong>กิจกรรมนิสิต</strong></td>\r\n<td><strong>การอบรม</strong></td>\r\n</tr>\r\n<tr>\r\n<td>TeleConference</td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Ku Cisco Webex Meetings<br />@ku.th</td>\r\n<td><strong>/</strong></td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Google Classroom<br />@ku.th</td>\r\n<td>&nbsp;</td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Microsoft Teams<br />@live.ku.th</td>\r\n<td><strong>/</strong></td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td><strong>/</strong></td>\r\n<td><strong>/</strong></td>\r\n</tr>\r\n<tr>\r\n<td>KU Workplace<br />@ku.th</td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>EduFarm<br />@ku.ac.th</td>\r\n<td>&nbsp;</td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Google Meet<br />@ku.th</td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td><strong>/</strong></td>\r\n<td><strong>/</strong></td>\r\n</tr>\r\n<tr>\r\n<td>Loom</td>\r\n<td>&nbsp;</td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Google for Education<br />@ku.th</td>\r\n<td>&nbsp;</td>\r\n<td><strong>/</strong></td>\r\n<td><strong>/</strong></td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"font-weight: 100;\">&nbsp;</p>\r\n<p style=\"font-weight: 100;\"><strong>รายละเอียดเครื่องมือต่าง ๆ</strong></p>\r\n<p style=\"font-weight: 100;\"><strong>การประชุม/การสอบ</strong></p>\r\n<ol style=\"font-weight: 100;\">\r\n<li><strong>TeleConference :&nbsp;</strong>สำหรับการประชุมและการสอบ ที่ปลายทางมีระบบ VDO Conference มาตรฐาน สามารถใช้บริการได้ที่ สำนักบริการบริการคอมพิวเตอร์ ชั้น 9 จำนวน 2 ห้อง ให้บริการเวลาราชการ โดยไม่คิดค่าใช้จ่าย<br />&nbsp;</li>\r\n<li><strong>KU Cisco Webex Meetings :&nbsp;</strong>สำหรับการประชุม การเรียนการสอน มีคุณสมบัติดังนี้</li>\r\n</ol>\r\n<ul style=\"font-weight: 100;\">\r\n<li>รองรับการประชุมได้สูงสุดถึง 100 คน โดยไม่จำกัดระยะเวลาการใช้งาน<br />(เนื่องจากสถานการณ์การระบาดของเชื้อ COVID-19 ทาง Cisco ได้เปิดให้รองรับผู้เข้าได้มากขึ้น ปกติได้สูงสุด 50 คน ภายในเวลา 40 นาที)</li>\r\n<li>มีระบบบันทึกการประชุม รองรับวิดีโอระดับ HD</li>\r\n<li>รองรับการใช้งานที่หลากหลายบน Desktop, IOS และ Android</li>\r\n<li>มีฟังก์ชั่นในการ Chat</li>\r\n<li>การแชร์หน้าจอ รูปภาพ ไฟล์ และข้อความอย่างไม่จำกัด</li>\r\n<li>ดาวน์โหลดคู่มือการใช้งานได้ที่&nbsp;<a href=\"http://bit.ly/kuwebex\">http://bit.ly/kuwebex</a></li>\r\n<li>สมัครใช้งานได้ที่เว็บ&nbsp;<a href=\"https://webex.com/\">https://webex.com</a>&nbsp;โดยใช้ account ของ มก. [<a href=\"mailto:account@ku.th\">account@ku.th</a>] ในการสมัครใช้งาน</li>\r\n</ul>\r\n<ol style=\"font-weight: 100;\">\r\n<li><strong>Microsoft Teams :&nbsp;</strong>สำหรับการประชุม การเรียนการสอน มีคุณสมบัติ ดังนี้</li>\r\n</ol>\r\n<ul style=\"font-weight: 100;\">\r\n<li>การประชุมหรือการเรียนการสอน online แบบ 2 way communication ทั้งภาพและเสียง สูงสุด 250 users</li>\r\n<li>รองรับการใช้งานที่หลากหลายบน Desktop, IOS และ Android</li>\r\n<li>สามารถใช้งานโดยผ่าน account ของ มก. ได้&nbsp; [<a href=\"mailto:account@live.ku.th\">account@live.ku.th</a>]</li>\r\n<li>ดาวน์โหลดได้ที่&nbsp;<a href=\"https://products.office.com/th-th/microsoft-teams/download-app\">https://products.office.com/th-th/microsoft-teams/download-app</a></li>\r\n</ul>\r\n<ol style=\"font-weight: 100;\">\r\n<li><strong>Google Meet :&nbsp;&nbsp;</strong>สำหรับการประชุม มีคุณสมบัติ ดังนี้</li>\r\n</ol>\r\n<ul style=\"font-weight: 100;\">\r\n<li>รองรับการประชุมได้สูงสุดถึง 100 คน โดยไม่จำกัดระยะเวลาการใช้งาน</li>\r\n<li>รองรับการใช้งานที่หลากหลายบน Desktop, IOS และ Android</li>\r\n<li>มีฟังก์ชั่นในการ Chat</li>\r\n<li>การแชร์หน้าจอ รูปภาพ ไฟล์ และข้อความอย่างไม่จำกัด</li>\r\n<li>สามารถใช้งานโดยผ่าน account ของ มก. &nbsp;[<a href=\"mailto:account@ku.th\">account@ku.th</a>]</li>\r\n<li>ดาวน์โหลดคู่มือการใช้งานได้ที่&nbsp;<a href=\"http://bit.ly/googlmeet\">http://bit.ly/googlmeet</a></li>\r\n<li>สมัครเข้าใช้งานได้ที่&nbsp;<a href=\"https://meet.google.com/\">https://meet.google.com/</a></li>\r\n</ul>\r\n<ol style=\"font-weight: 100;\">\r\n<li><strong>KU Workplace :</strong>&nbsp;เครื่องมือช่วยในการสื่อสารภายในองค์กร</li>\r\n</ol>\r\n<ul style=\"font-weight: 100;\">\r\n<li>รองรับการถ่ายทอดสดการประชุม</li>\r\n<li>สามารถใช้งานโดยผ่าน account ของ มก.&nbsp; [<a href=\"mailto:account@ku.th\">account@ku.th</a>]</li>\r\n<li>สมัครเข้าใช้งานได้ที่&nbsp;<a href=\"https://kasetsart.workplace.com/\">https://kasetsart.workplace.com/</a></li>\r\n</ul>\r\n<p style=\"font-weight: 100;\">&nbsp;</p>\r\n<p style=\"font-weight: 100;\"><strong>การเรียนการสอน/การสอบ</strong></p>\r\n<ol style=\"font-weight: 100;\">\r\n<li><strong>Google Classroom Platform for LMS</strong>&nbsp;:&nbsp; สำหรับการเรียนการสอน เป็นบริการสำหรับ Google Apps for Education</li>\r\n</ol>\r\n<ul style=\"font-weight: 100;\">\r\n<li>การออกแบบสร้างห้องเรียนออนไลน์ เพื่อให้นิสิตได้ศึกษา และทบทวนบทเรียนตามประมวลการสอน (Material, Assignment, Quiz, Discussion, Project Based Learning)</li>\r\n<li>รองรับการใช้งานที่หลากหลายบน Desktop , IOS และ Android</li>\r\n<li>สามารถใช้งานได้ที่&nbsp;<a href=\"https://classroom.google.com/\">https://classroom.google.com</a></li>\r\n</ul>\r\n<ol style=\"font-weight: 100;\">\r\n<li><strong>eduFarm :</strong>&nbsp;ระบบสนับสนุนการเรียนการสอนออนไลน์ eduFarm ฟาร์ม(เรียน)รู้ มก.</li>\r\n</ol>\r\n<ul style=\"font-weight: 100;\">\r\n<li>อาจารย์ นิสิต ใช้งานได้ที่เว็บไซต์&nbsp;<a href=\"https://edufarm.ku.ac.th/\">https://edufarm.ku.ac.th/</a>&nbsp;ผ่าน account ของ มก. [<a href=\"mailto:account@ku.ac.th\">account@ku.ac.th</a>]</li>\r\n</ul>\r\n<ol style=\"font-weight: 100;\">\r\n<li><strong>LOOM Video Recording :</strong>&nbsp;เป็นการสร้างสื่อการสอนในรูปแบบ Video Clip (สไลด์ และเสียงบรรยาย)</li>\r\n</ol>\r\n<ul style=\"font-weight: 100;\">\r\n<li>ดาวน์โหลดใช้งานฟรี ได้ที่&nbsp;<a href=\"https://www.loom.com/download\">https://www.loom.com/download</a></li>\r\n<li>บันทึกลง cloud ของ LOOM โดยอัตโนมัติ ง่ายต่อการแชร์</li>\r\n<li>อาจารย์สามารถตรวจสอบได้ว่า มีนิสิตคนไหนเข้าชมวีดีโอบ้าง</li>\r\n</ul>\r\n<ol start=\"4\">\r\n<li style=\"font-weight: 100;\"><strong>Google for Education :</strong>&nbsp;มหาวิทยาลัยเกษตรศาสตร์ ร่วมกับ Google เปิดโลกการเรียนรู้ผ่านเทคโนโลยีสมัยใหม่ Google for Education เพื่อสนับสนุนให้นิสิต อาจารย์ และบุคลากร มก. สามารถนำไปประยุกต์ใช้ให้เกิดประโยชน์ในการเรียนการสอนและการปฏิบัติงานได้ โดยมีเครื่องมือที่สนับสนุนการใช้งานที่หลากหลาย อาทิ บริการพื้นที่จัดเก็บข้อมูลขนาดใหญ่ (Google Drive) บริการพื้นที่รับส่งจดหมายอิเล็กทรอนิกส์ (Google Mail) บริการห้องเรียนออนไลน์ (Google Classroom) บริการแบบฟอร์มออนไลน์ (Google Form) และบริการสร้างเว็บเพจ (Google Site) ทั้งนี้ ทุกบริการสำหรับสถาบันการศึกษาจะให้บริการแบบไม่จำกัดโควตาการใช้งาน และเมื่อจบการศึกษา หรือเกษียณอายุราชการ ก็ยังสามารถใช้งานได้</li>\r\n</ol>\r\n<p style=\"font-weight: 100;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; คณาจารย์ บุคลากร และหน่วยงานของ มหาวิทยาลัยเกษตรศาสตร์ สามารถติดต่อขอใช้บริการ หรือสอบถามรายละเอียดเพิ่มเติม ได้ที่ สำนักบริการคอมพิวเตอร์ โทร. 02-562-0951-6 &nbsp;ต่อ Helpdesk สายใน 622541-3 หรือ คุณศรัณย์ญา อมรกุลาจารย์ สายใน 622523</p>', 'how-to-build-html-to-wordpress-site-2', 202, 1, 'http://159.65.131.194/storage/source', '\\1\\Dnx4Ospu9SizLD5evuxYIK6N64tSdhQM.jpg', 1, 1, '2020-06-13', 1592061156, 1592139567, '');
INSERT INTO `news` VALUES (6, 3, 'ตอบแบบสำรวจพฤติกรรมการใช้อินเทอร์เน็ตปี 2563', 'ตอบแบบสำรวจพฤติกรรมการใช้อินเทอร์เน็ตปี 2563', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://www.ku.ac.th/web2012/resources/upload/content/images/etda2020.jpg\" alt=\"\" width=\"800\" /></p>\r\n<p><strong>สำนักงานพัฒนาธุรกรรมทางอิเล็กทรอนิกส์ หรือ สพธอ.</strong></p>\r\n<p><br />&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; ได้จัดทำการสำรวจพฤติกรรมผู้ใช้อินเทอร์เน็ตในประเทศไทย ปี 2563 เพื่อสะท้อนภาพการใช้อินเทอร์เน็ตกับ Lifestyle ของคนไทยในยุคดิจิทัล ทั้งชั่วโมงการใช้อินเทอร์เน็ต กิจกรรมออนไลน์ยอดฮิต ปัญหาที่เกิดจากการใช้งาน รวมถึงความเชื่อมั่นในการใช้อินเทอร์เน็ต และในส่วนของคำถามพิเศษ (Hot Issue) ประจำปีนี้ เรายังได้รับเสียงโหวตจากประชาชนส่วนหนึ่งให้สำรวจเกี่ยวกับพฤติกรรมการใช้อินเทอร์เน็ตกับการแชร์ข่าวปลอม (Fake News) เพราะเป็นปัญหาสำคัญที่ทำให้ผู้คนเกิดความวิตกกังวล หลงเชื่อและได้รับผลกระทบในรูปแบบต่างๆ อีกด้วย<br /><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ทุกการตอบแบบสำรวจฯ ของท่าน คือ ข้อมูลที่เป็นประโยชน์และมีความสำคัญมากต่อการพัฒนาประเทศ เพื่อจัดทำฐานข้อมูลที่สำคัญให้ภาครัฐ ภาคเอกชน และหน่วยงานที่เกี่ยวข้องนำข้อมูลไปต่อยอดให้เกิดประโยชน์กับประชาชน เช่น การสร้างความรู้ความเข้าใจในการใช้อินเทอร์เน็ตอย่างสร้างสรรค์และปลอดภัย การพัฒนาสินค้าและบริการของธุรกิจที่ตอบโจทย์ความต้องการประชาชน เป็นต้น<br /><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; สพธอ. จึงขอเชิญชวนท่านร่วมเป็นส่วนหนึ่งในการตอบแบบสำรวจฯ นี้ ซึ่งมีจำนวน 20 ข้อ ใช้เวลาประมาณ 10 นาที โดยการประมวลผลข้อมูลส่วนบุคคลของท่านจะเป็นไปตาม พ.ร.บ. คุ้มครองข้อมูลส่วนบุคคล พ.ศ. 2562 และเพื่อเป็นการแสดงความขอบคุณ สพธอ. จะมีการสุ่มจับรางวัลผู้โชคดีจากการตอบแบบสำรวจฯ ในครั้งนี้ด้วย</p>', 'txb-baeb-sarwc-phvtikrrm-kar-chi-xinthexrnet-pi-2563', 37, 1, NULL, NULL, 1, 1, '2020-06-14', 1592138160, 1592138160, '');

-- ----------------------------
-- Table structure for news_attachment
-- ----------------------------
DROP TABLE IF EXISTS `news_attachment`;
CREATE TABLE `news_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_attachment_article`(`news_id`) USING BTREE,
  INDEX `order`(`order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_attachment
-- ----------------------------
INSERT INTO `news_attachment` VALUES (1, 1, '\\1\\4hEabon70KqzOP7bE8tZBmPJn7n0Ia5E.pdf', 'http://storage.yii2-starter-kit.localhost/source', 'application/pdf', 143329, 'ใบเสนอราคา QO-2019092100013.pdf', 1572518992, NULL);
INSERT INTO `news_attachment` VALUES (2, 2, '\\1\\sByxviz0RXHEb2TxogTHDXVAL4wrpyzC.pdf', 'http://storage.yii2-starter-kit.localhost/source', 'application/pdf', 90911, '8D22851E12DC4EF7BCB6EA360BF12B8A.pdf', 1592055221, NULL);
INSERT INTO `news_attachment` VALUES (4, 2, '\\1\\t-CvlOvVoUVXHaOssTRhhDOhTvD6vutC.pdf', 'http://storage.yii2-starter-kit.localhost/source', 'application/pdf', 4916323, '20190211MOPH Connect &amp; Smart Q Concept.pdf', 1592055288, NULL);
INSERT INTO `news_attachment` VALUES (5, 5, '\\1\\7hIM8aoBJl0JIEHkXr3QHy31tBxWCTjb.pdf', 'http://159.65.131.194/storage/source', 'application/pdf', 275900, '4.1 webservice_0.pdf', 1592061156, NULL);
INSERT INTO `news_attachment` VALUES (6, 5, '\\1\\d_5N-RCuec_ZPE4egbSI9D5bFq49U1Ta.pdf', 'http://159.65.131.194/storage/source', 'application/pdf', 341790, '4.2  MOPH Connect api.pdf', 1592061156, NULL);
INSERT INTO `news_attachment` VALUES (7, 5, '\\1\\ocReeYvtI1ZD23p9XPzGK8jETYqvEoq2.pdf', 'http://159.65.131.194/storage/source', 'application/pdf', 1576623, '5. Decha WEB VIEW_edit.pdf', 1592061156, NULL);
INSERT INTO `news_attachment` VALUES (8, 5, '\\1\\Bkqv_yVRJlIyBEKEDH8SXJ2BPcsQWs01.xlsx', 'http://159.65.131.194/storage/source', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 9892, 'user-import.xlsx', 1592130685, NULL);
INSERT INTO `news_attachment` VALUES (9, 5, '\\1\\ZKKoZ8W8P8vRAcNN-Hj-LyiA2ltgc73j.docx', 'http://159.65.131.194/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 16506, '19 - งานบิล.docx', 1592130685, NULL);
INSERT INTO `news_attachment` VALUES (10, 5, '\\1\\DWMzrPLB83zFFuSPBZEC9XvO9WjtZgGI.pptx', 'http://159.65.131.194/storage/source', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 743515, 'หัวข้อการทดสอบระบบ_mobile_app_01.pptx', 1592130685, NULL);

-- ----------------------------
-- Table structure for news_categories
-- ----------------------------
DROP TABLE IF EXISTS `news_categories`;
CREATE TABLE `news_categories`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE INDEX `idx_article_category_slug`(`slug`) USING BTREE,
  INDEX `fk_article_category_section`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_categories
-- ----------------------------
INSERT INTO `news_categories` VALUES (1, 'news', 'ประชุม / อบรม / สัมมนา', 'far fa-newspaper', NULL, 1, 1572518477, 1592180207, 1);
INSERT INTO `news_categories` VALUES (2, 'career', 'รับสมัครงาน', 'far fa-newspaper', NULL, 1, 1592055764, 1592180289, 3);
INSERT INTO `news_categories` VALUES (3, 'general', 'ข่าวทั่วไป', 'far fa-newspaper', NULL, 1, 1592055764, 1592180297, 2);
INSERT INTO `news_categories` VALUES (4, 'procurementlist', 'จัดซื้อ จัดจ้าง', 'far fa-newspaper', NULL, 1, 1592180281, 1592180281, 4);

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`page_id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, 'page-index', 'Index', '<p><strong>All elements are live-editable, switch on Live Edit button to see this feature.</strong>&nbsp;</p><p>Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.&nbsp;Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, 1, NULL, 1592029535);
INSERT INTO `pages` VALUES (2, 'page-shop', 'Shop', '', NULL, 0, NULL, NULL);
INSERT INTO `pages` VALUES (3, 'page-events', 'กิจกรรม', '<p>กิจกรรม</p>', '', 1, NULL, 1592201748);
INSERT INTO `pages` VALUES (4, 'activity', 'ตารางกิจกรรม', '<p style=\"text-align: center;\">กิจกรรมของคณะ</p>', 'activity', 1, NULL, 1592182962);
INSERT INTO `pages` VALUES (5, 'coming-soon', 'Coming soon', '<h2 style=\"text-align: center;\"><strong>...</strong></h2>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 272px; top: 63.6px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', '', 1, NULL, 1592050337);
INSERT INTO `pages` VALUES (6, 'page-news', 'ข่าวทั้งหมด', '<p>ข่าว</p>', '', 1, NULL, 1592123183);
INSERT INTO `pages` VALUES (7, 'technology', 'เทคโนโลยีระบบเกษตร', '<section class=\"about-lists\">\r\n<div class=\"container aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n<div class=\"section-title\">\r\n<h2>เทคโนโลยีระบบเกษตร</h2>\r\n</div>\r\n<div class=\"row no-gutters\">\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init aos-animate\" data-aos=\"fade-up\">01\r\n<h4 style=\"color: gray;\">เทคโนโลยี</h4>\r\n<h4>เครื่องจักรกลเกษตร</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"100\">02\r\n<h4 style=\"color: gray;\">เทคโนโลยี</h4>\r\n<h4>การให้น้ำเพื่อการเกษตร</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"200\">03\r\n<h4 style=\"color: gray;\">เทคโนโลยี</h4>\r\n<h4>หลังการเก็บเกี่ยวและการแปรสภาพ</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"300\">04\r\n<h4 style=\"color: gray;\">ระบบควบคุม</h4>\r\n<h4>อัจฉริยะทางการเกษตร</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"400\">05\r\n<h4 style=\"color: gray;\">เทคโนโลยี</h4>\r\n<h4>สารสนเทศและการตัดสินใจ</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"500\">06\r\n<h4 style=\"color: gray;\">อากาศยานไร้คนขับ</h4>\r\n<h4>เพื่อการเกษตร</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"600\">07\r\n<h4 style=\"color: gray;\">การจัดการโลจิสติกส์</h4>\r\n<h4>ห่วงโซ่อุปทาน และห่วงโซ่คุณค่า</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"700\">08\r\n<h4 style=\"color: gray;\">เกษตรอินทรีย์</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"800\">09\r\n<h4 style=\"color: gray;\">พลังงานในระบบเกษตร</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section>', '', 1, NULL, 1592049919);
INSERT INTO `pages` VALUES (8, 'department', 'งานบริการวิชาการ', '<section id=\"about\" class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row no-gutters\">\r\n<div class=\"col-lg-6 video-box\"><img class=\"img-fluid\" src=\"https://agr-ku.netlify.app/assets/img/about.png\" alt=\"\" /> <!-- <a href=\"https://www.youtube.com/watch?v=jDDaplaOz7Q\" class=\"venobox play-btn mb-4\" data-vbtype=\"video\"\r\n              data-autoplay=\"true\">\r\n            </a> --></div>\r\n<div class=\"col-lg-6 d-flex flex-column justify-content-center about-content\">\r\n<div class=\"section-title\">\r\n<h2>ภาควิชาเกษตรกลวิธาน</h2>\r\n<p>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; ภาควิชาเกษตรกลวิธาน (Department of Farm Mechanics) ได้ก่อตั้งเมื่อ 24 สิงหาคม 2486 โดยใช้ชื่อ &ldquo; แผนกเกษตรวิศวกรรม (Department of Agricultural of Engineering)&rdquo;</p>\r\n<a class=\"btn-get-started animated fadeInUp scrollto\" href=\"about.html\">Read More...</a></div>\r\n<div class=\"icon-box aos-init\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n<div class=\"icon\" style=\"font-size: 50px; background: #fae91c; color: #5c768d;\">\r\n<p>V</p>\r\n</div>\r\n<h4 class=\"title\"><a>วิสัยทัศน์</a></h4>\r\n<p class=\"description\">เกษตรกลวิธานสร้างสรรค์นวัตกรและนวัตกรรมด้านเครื่องจักรกลเกษตรและเทคโนโลยีระบบเกษตรเพื่อพัฒนาประเทศ</p>\r\n</div>\r\n<div class=\"icon-box aos-init\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n<div class=\"icon\" style=\"font-size: 50px; background: #fae91c; color: #5c768d;\">\r\n<p>M</p>\r\n</div>\r\n<h4 class=\"title\"><a>คุณค่าร่วม</a></h4>\r\n<p class=\"description\">เกษตรกลวิธาน ผลงานเป็นที่ประจักษ์ด้วยการศึกษาและการวิจัยที่เข้มแข็ง At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</section>', '', 1, NULL, 1592049614);
INSERT INTO `pages` VALUES (9, 'contact', 'ติดต่อเรา', '<p style=\"text-align: center;\">ติดต่อเรา</p>', 'contact', 1, NULL, 1592047012);
INSERT INTO `pages` VALUES (10, 'masterscience', 'หลักสูตร วท.ม-เทคโนโลยีระบบเกษตร', '<p class=\"text-left\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong>หลักสูตรวิทยาศาสตรมหาบัณฑิต</strong>&nbsp;สาขาวิชาเทคโนโลยีระบบเกษตร มุ่งให้การศึกษา และส่งเสริมความรู้ด้านเทคโนโลยีระบบเกษตร เพื่อนำไปสู่การบูรณาการเทคโนโลยีที่ทันสมัยในระบบเกษตรจากการผลิตสู่การแปรรูป ประยุกต์ใช้เทคโนโลยีเครื่องจักรกลที่เหมาะสมเพื่อขยายการผลิต เสริมสร้างคุณภาพผลผลิตเกษตรด้วยเทคโนโลยีและการจัดการ มุ่งผลิตมหาบัณฑิตที่มีความรู้ และสามารถทำการวิจัยขั้นสูงทางเทคโนโลยีเครื่องจักรกล และเทคโนโลยีอื่นที่เกี่ยวข้องในระบบเกษตร ได้แก่ เทคโนโลยีที่ทันสมัยในระบบเกษตร การจัดการทรัพยากรดินและน้ำเพื่อการเกษตร การจัดการโรงเรือนทางการเกษตร เทคโนโลยีหลังการเก็บเกี่ยวและการแปรสภาพ การจัดการโลจิสติกส์และวิศวกรรมระบบเกษตร เทคโนโลยีสารสนเทศและการตัดสินใจ และการจัดการพลังงานในระบบเกษตร ซึ่งสามารถนำองค์ความรู้ที่ได้ไปใช้ในการแก้ไขปัญหาในระบบการผลิตทางการเกษตรได้อย่างมีกระบวนการและเป็นระบบ</p>\r\n<div>\r\n<h5 class=\"text-left\">ข้อมูลเพิ่มเติม</h5>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3%20%E0%B8%A7%E0%B8%97%E0%B8%A1%20%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%95%E0%B8%A3.pdf\" target=\"_blank\" rel=\"noopener\"><u>หลักสูตร วท.ม เทคโนโลยีระบบเกษตร !&nbsp;<em class=\"tiny material-icons dp48\">file_download</em></u></a></p>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B9%81%E0%B8%9C%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2%20%E0%B8%9B%20%E0%B9%82%E0%B8%97.pdf\" target=\"_blank\" rel=\"noopener\"><u>แผนการศึกษา !&nbsp;<em class=\"tiny material-icons dp48\">file_download</em></u></a></p>\r\n</div>', '', 1, NULL, 1592046610);
INSERT INTO `pages` VALUES (11, 'curriculum', 'หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร', '<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; หลักสูตรวิทยาศาสตรบัณฑิต</strong>&nbsp;สาขาวิชาเทคโนโลยีระบบเกษตร มุ่งผลิตบัณฑิตที่มีความรู้ทางด้านเทคโนโลยีเครื่องจักรกลเกษตร และเทคโนโลยีที่เกี่ยวข้อง ได้แก่ เทคโนโลยีการให้น้ำเพื่อการเกษตร เทคโนโลยีหลังการเก็บเกี่ยวและการแปรสภาพ ระบบควบคุมอัจฉริยะทางการเกษตร เทคโนโลยีสารสนเทศและการตัดสินใจ อากาศยานไร้คนขับเพื่อการเกษตร การจัดการโลจิสติกส์ ห่วงโซ่อุปทาน และห่วงโซ่คุณค่า เกษตรอินทรีย์ และพลังงานในระบบเกษตร เป็นต้น เพื่อเป็นนักเทคโนโลยีระบบเกษตร ที่สามารถนำองค์ความรู้ที่ได้ไปประยุกต์ใช้เพื่อการจัดการและแก้ไขปัญหาทางด้านการผลิตทางการเกษตรได้อย่างเป็นระบบ</p>\r\n<p><a href=\"https://agr-ku.netlify.app/assets/img/curriculum1.jpg\" data-fancybox=\"gallery\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://agr-ku.netlify.app/assets/img/curriculum1.jpg\" alt=\"\" width=\"1070\" height=\"763\" /></a></p>\r\n<p style=\"text-align: center;\"><a href=\"https://agr-ku.netlify.app/assets/img/curriculum2.jpg\" data-fancybox=\"gallery\"><img src=\"https://agr-ku.netlify.app/assets/img/curriculum2.jpg\" alt=\"\" width=\"1070\" height=\"767\" /></a></p>\r\n<h5 class=\"text-left\">ข้อมูลเพิ่มเติม</h5>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3-%E0%B8%A7%E0%B8%97%E0%B8%9A-%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%95%E0%B8%A3.pdf\" target=\"_blank\" rel=\"noopener\">รายละเอียดหลักสูตร วท.บ-เทคโนโลยีระบบเกษตร !</a></p>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B9%81%E0%B8%9C%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2%E0%B8%95%E0%B8%A5%E0%B8%AD%E0%B8%94%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B0%E0%B9%80%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3-4%E0%B8%9B%E0%B8%B5.pdf\" target=\"_blank\" rel=\"noopener\">แผนการศึกษา !</a></p>', '', 1, NULL, 1592048320);
INSERT INTO `pages` VALUES (12, 'about', 'เกี่ยวกับเรา', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;คณะเกษตร เป็นหนึ่งในสี่คณะแรกในมหาวิทยาลัยเกษตรศาสตร์ โดยการโอนกิจการของกองวิทยาลัยเกษตรศาสตร์จากกรมเกษตร มาดำเนินการตามพระราชบัญญัติมหาวิทยาลัยเกษตรศาสตร์ พ.ศ. 2486 เมื่อแรกก่อตั้งมีชื่อว่าคณะเกษตรศาสตร์ ตามพระราชกฤษฎีกา จัดแบ่งคณะในมหาวิทยาลัยเกษตรศาสตร์ พุทธศักราช 2486 ตราไว้ ณ วันที่ 9 สิงหาคม พ.ศ 2486 และประกาศในพระราชกิจจานุเบกษา เมื่อวันที่ 24 สิงหาคม พ.ศ.2486 โดยแบ่งกิจการออกเป็น 5 แผนก คือ แผนกวิชาเกษตรศาสตร์ แผนกวิชาสัตวบาล แผนกวิชาเคมี แผนกวิชากีฏวิทยาและโรคพืช และแผนกวิชาวิศวกรรมเกษตร</p>\r\n<p>ใน พ.ศ. 2486 ที่ได้เริ่มการเรียนการสอนนั้นคณะเกษตรศาสตร์ยังไม่มีที่ทำการคณะโดยเฉพาะ อาคารสำนักงานต่างๆ อยู่รวมกับสำนักงานเลขานุการกรมมหาวิทยาลัยเกษตรศาสตร์ คือ อาคาร ที่ต่อมาเรียกกันว่า เรือนเขียว ส่วนอาคารเรียนก็กระจัดกระจายอยู่ในบริเวณเกษตรกลางบางเขน ได้แก่ อาคารสัตวบาล (ปัจจุบันเป็นร้านสหกรณ์ มหาวิทยาลัยเกษตรศาสตร์ บริเวณประตู 2) และอาคารเรือนไม้ 2 ชั้นรูปตัว L ก่อสร้างติดกับอาคารสัตวบาลซึ่งขณะนั้นเป็นอาคารที่ใช้สอนวิทยาศาสตร์ เคมี และสัตววิทยา มีลักษณะเป็นอาคารไม้ยาง หลังคามุงกระเบื้องสีขาว ชั้นบนมี 4 ห้องเรียน ชั้นล่างมี 4 ห้องเรียน นอกจากนี้ก็ยังจัดการเรียนการสอนที่อาคารพืชพรรณ และอาคารโภชากร ของกระทรวงเกษตรและสหกรณ์ ต่อจากนั้นจึงมีอาคารไม้ชั้นเดียวทางด้านหลังอาคารสัตวบาลเพิ่มขึ้นอีก 1 ห้อง มีสะพานข้าม คูน้ำจากอาคารสัตวบาลไปยังอาคารไม้หลังนี้ ห้องเรียนที่สร้างขึ้นเป็นรูปตัว T ใช้เป็นห้องเรียน (ห้อง 600) ห้องประชุม ต่อมาจึงมีอาคารเรียนเพิ่มขึ้นอีก เช่น อาคารชีววิทยา (ปัจจุบันเป็นสำนักงานสถิติการเกษตร) ซึ่งก่อสร้างแล้วเสร็จใน พ.ศ. 2496 บางแผนกของคณะเกษตรศาสตร์จึงได้ย้ายเข้ามาใช้อาคารหลังนี้ร่วมกับสำนักงานอธิการบดี ภายหลังเมื่อหอประชุมใหญ่ก่อสร้างแล้วเสร็จใน พ.ศ. 2500 สำนักงานอธิการบดีจึงได้ย้ายเพื่อไปใช้พื้นที่ร่วมภายในหอประชุมใหญ่ คณะเกษตรศาสตร์จึงได้ใช้พื้นที่ทั้งหมดของอาคารชีววิทยาเพื่อการสอนวิชาด้านวิทยาศาสตร์และภาษาอังกฤษ ต่อมาเมื่อคณะประมงและคณะเศรษฐศาสตร์สหกรณ์ได้ย้ายออกไปจากตึกเดิมไปยังตึกพลเทพ และตึกพิทยาลงกรณ์ ตามลำดับ คณะเกษตรศาสตร์จึงได้ย้ายที่ทำการคณะไปอยู่แทนที่อาคารหลังนี้ซึ่งปัจจุบันเป็นสถาบันวิจัยพืชไร่ กรมวิชาการเกษตร โดยระยะแรกของการก่อตั้งคณะเกษตรศาสตร์มีการเปิดสอนหลักสูตรเพียง 2 หลักสูตร คือหลักสูตรอนุปริญญากสิกรรมและสัตวบาล (อปก.) หลักสูตร 3 ปี</p>\r\n<p>หลังจากการจัดตั้งคณะเกษตรศาสตร์อย่างเป็นทางการ ได้มีการเปิดแผนกชีววิทยาเพิ่มขึ้นอีก 1 แผนก และเปลี่ยนชื่อแผนกเคมีเป็นแผนกฟิสิกส์และเคมี ในวันที่ 18 มิถุนายน พ.ศ. 2495 ต่อมาในวันที่ 16 พฤษภาคม พ.ศ.2499 คณะเกษตรศาสตร์ได้เริ่มเปิดสอนหลักสูตรปริญญาโท คือ หลักสูตรปริญญากสิกรรมและสัตวบาลมหาบัณฑิต สาขาวิชาเอกสัตวบาล ซึ่งนับเป็นหลักสูตรแรกของมหาวิทยาลัยเกษตรศาสตร์ และได้มีการเปลี่ยนชื่อจาก คณะเกษตรศาสตร์ เป็น คณะกสิกรรมและสัตวบาล และเพิ่มแผนกเคหเศรษฐศาสตร์ขึ้นอีก 1 แผนก และได้เปลี่ยนชื่อแผนกฟิสิกส์และเคมีเป็นแผนกเคมีตามเดิม</p>\r\n<p>เมื่อวันที่ 1 มีนาคม พ.ศ.2509 ได้มีพระราชกฤษฎีกาจัดแบ่งคณะในมหาวิทยาลัย ในวันที่ 9 มีนาคม พ.ศ. 2509 จึงได้เปลี่ยนชื่อคณะกสิกรรมและสัตวบาล เป็น คณะเกษตร และแบ่งส่วนราชการใหม่เป็น 8 ภาควิชา ดังนี้</p>\r\n<ol>\r\n<li>ภาควิชากีฏวิทยาและโรคพืช</li>\r\n<li>ภาควิชาเกษตรกลวิธาน (เดิมชื่อแผนกวิชาเกษตรวิศวกรรม)</li>\r\n<li>ภาควิชาคหกรรมศาสตร์ (เดิมชื่อแผนกวิชาเคหเศรษฐศาสตร์)</li>\r\n<li>ภาควิชาพืชศาสตร์ (เดิมชื่อแผนกวิชาเกษตรศาสตร์)</li>\r\n<li>ภาควิชาสัตวบาล</li>\r\n<li>ภาควิชาวิทยาศาสตร์การอาหาร (เป็นแผนกวิชาใหม่)</li>\r\n<li>ภาควิชาเกษตรนิเทศ (เป็นแผนกวิชาใหม่)</li>\r\n<li>ภาควิชาปฐพีวิทยา (เป็นแผนกวิชาใหม่)</li>\r\n</ol>\r\n<p>ปี พ.ศ. 2511 ได้เปลี่ยนหลักสูตรปริญญาตรีจาก 5 ปี เป็นหลักสูตร 4 ปี เช่น ในปัจจุบัน</p>\r\n<p>ปี พ.ศ.2512 ในวันที่ 12 พฤษภาคม มีประกาศสำนักนายกรัฐมนตรีเรื่องการแบ่งส่วนราชการในมหาวิทยาลัยเกษตรศาสตร์และแบ่งภาควิชาในมหาวิทยาลัยเกษตรศาสตร์ โดยเปลี่ยนจากการเรียกชื่อแผนกวิชาเป็นภาควิชาในทุกคณะ และเริ่มจัดตั้งส่วนราชการที่เรียกว่าสำนักงานเลขานุการให้สังกัดอยู่คณะด้วย และในปีนี้ได้ย้ายแผนกวิชาเกษตรนิเทศจากคณะเกษตรไปสังกัดคณะศึกษาศาสตร์แทน โดยเรียกใหม่เป็น ภาควิชาอาชีวศึกษา</p>\r\n<p>ปี พ.ศ. 2515 ตามแผนพัฒนามหาวิทยาลัยเกษตรศาสตร์ โดยโครงการเงินกู้จากธนาคารโลก โดยมติของคณะรัฐมนตรี ได้มีการแบ่งสรรการใช้พื้นที่ในเกษตรกลางบางเขนระหว่างมหาวิทยาลัยเกษตรศาสตร์กับกระทรวงเกษตรและสหกรณ์ คณะเกษตรจึงได้ย้ายจากที่เดิมมาอยู่ทางฝั่งทิศตะวันตกของถนนหลวงสุวรรณฯ โดยได้สร้างที่ทำการคณะขึ้นใหม่เป็นอาคาร 5 ชั้น ซึ่งเป็นที่ทำการของคณะในปัจจุบันนี้ และใน พ.ศ. 2522 ได้งบประมาณเพิ่มเติมจากโครงการเงินกู้เพื่อก่อสร้างอาคาร จรัด สุนทรสิงห์ จนแล้วเสร็จอีก 1 หลัง</p>\r\n<p>ต่อมาในวันที่ 13 ตุลาคม พ.ศ. 2518 มีประกาศสำนักนายกรัฐมนตรีเรื่อง การแบ่งส่วนราชการในมหาวิทยาลัยเกษตรศาสตร์ ลงวันที่ 2 ตุลาคม พ.ศ. 2518 ได้แยกภาควิชากีฏวิทยาและโรคพืชเป็นภาควิชากีฏวิทยา และภาควิชาโรคพืช และยุบเลิกภาควิชาพืชศาสตร์ โดยจัดตั้งเป็น 2 ภาควิชาใหม่ คือ ภาควิชาพืชไร่นา กับ ภาควิชาพืชสวน</p>\r\n<p>คณะเกษตรได้เริ่มดำเนินการสอนหลักสูตรปริญญาเอกเป็นครั้งแรก ในปีการศึกษา พ.ศ. 2521 ใน สาขากีฏวิทยา และ สาขาปฐพีวิทยา เป็นต้นมา และต่อมาในปี พ.ศ. 2522 ได้เริ่มดำเนินกิจกรรม การเรียนการสอนที่วิทยาเขตกำแพงแสน จังหวัดนครปฐม เมื่อวันที่ 8 พฤศจิกายน พ.ศ. 2522 ซึ่งเป็น วันเปิดเรียนภาคปลาย ปีการศึกษา 2521 โดยเริ่มให้นิสิตปริญญาตรีชั้นปีที่ 3 และ 4 หลักสูตร วิทยาศาสตรบัณฑิต (เกษตรศาสตร์) ไปเรียนที่วิทยาเขตกำแพงแสน และต่อมาในปีการศึกษา 2528 คณะเกษตรได้มีนโยบายให้นิสิตชั้นปีที่ 1 ของหลักสูตรวิทยาศาสตรบัณฑิต (เกษตรศาสตร์) ไปศึกษา ณ วิทยาเขตกำแพงแสน</p>\r\n<p>ต่อมาในปี พ.ศ. 2523 ได้มีประกาศสำนักนายกรัฐมนตรีเรื่อง การแบ่งส่วนราชการในมหาวิทยาลัยเกษตรศาสตร์ ลงวันที่ 23 พฤษภาคม พ.ศ. 2523 ได้ย้ายภาควิชาวิทยาศาสตร์การอาหาร จากคณะเกษตรไปสังกัดคณะอุตสาหกรรมเกษตร โดยตั้งชื่อใหม่เป็น ภาควิชาวิทยาศาสตร์และเทคโนโลยีการอาหาร ต่อมา พ.ศ. 2527 มีประกาศทบวงมหาวิทยาลัยเรื่อง การแบ่งส่วนราชการในมหาวิทยาลัยเกษตรศาสตร์ (ฉบับที่ 3) พ.ศ. 2527 ลงวันที่ 7 กุมภาพันธ์ พ.ศ. 2527 ได้กำหนดให้มีภาควิชาส่งเสริมและนิเทศศาสตร์เกษตรในคณะเกษตร ดังนั้นคณะเกษตรจึงมีภาควิชาทั้งหมด 9 ภาควิชา มาจนถึงปัจจุบัน</p>\r\n<p>ปี พ.ศ. 2531 คณะเกษตรได้มีการเปิดหลักสูตรระดับปริญญาตรีแบบบูรณาการความรู้ขึ้น โดย เปิดสอนหลักสูตร วิทยาศาสตรบัณฑิต (การจัดการศัตรูพืช) และ วิทยาศาสตรบัณฑิต (เคมีการเกษตร) ณ วิทยาเขตบางเขน และต่อมาในปี พ.ศ. 2541 ได้เปิดหลักสูตร วิทยาศาสตรบัณฑิต (เกษตรกลวิธาน) และ พ.ศ. 2543 เปิดหลักสูตร วิทยาศาสตรบัณฑิต (เทคโนโลยีชีวภาพทางการเกษตร) ณ วิทยาเขตกำแพงแสน</p>\r\n<p>ปี พ.ศ. 2536 คณะเกษตร ได้เริ่มเปิดสอนระดับบัณฑิตศึกษาในหลักสูตรนานาชาติเกษตรเขตร้อน (Tropical Agriculture) ทั้งในระดับปริญญาโท และ ปริญญาเอกในทุกภาควิชา และอีก 3 ปีต่อมาได้เปิดสอนหลักสูตรวิทยาศาสตรมหาบัณฑิต สาขาการสื่อสารเพื่อการพัฒนา (หลักสูตรนานาชาติ) ในภาควิชาส่งเสริมและนิเทศศาสตร์เกษตร</p>\r\n<p>ต่อมาวันที่ 18 มีนาคม พ.ศ. 2546 มีประกาศสภามหาวิทยาลัยเกษตรศาสตร์ให้แยกคณะเกษตรเป็น 2 คณะคือ คณะเกษตร และ คณะเกษตร กำแพงแสน และในวันที่ 30 ตุลาคม พ.ศ. 2546 ได้มีประกาศสภามหาวิทยาลัยเกษตรศาสตร์ เรื่อง จัดตั้งศูนย์ธุรกิจเกษตร คณะเกษตร มหาวิทยาลัยเกษตรศาสตร์ เป็นหน่วยงานเทียบเท่าระดับภาควิชาสังกัดคณะเกษตร</p>\r\n<p>ในปี พ.ศ. 2547 ได้เปิดสอนหลักสูตรนานาชาติ 2 ปริญญา (International Double Degree Program) ร่วมกับ Victoria University of Technology ประเทศออสเตรเลีย ประกอบด้วย สาขาเกษตรเขตร้อน (Tropical Agriculture) และ สาขาธุรกิจระหว่างประเทศ (International Trade)</p>\r\n<p>ปัจจุบันคณะเกษตรมีส่วนราชการทั้งหมด 11 หน่วยงาน โดยแบ่งเป็น 9 ภาควิชา 1 สำนักงานเลขานุการ และ 2 ศูนย์</p>', '', 1, 1592032697, 1592048753);

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `public_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gravatar_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gravatar_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `timezone` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `avatar_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, 'Tanakorn Phompak', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', 'Asia/Bangkok', '\\1\\2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8.png', 'http://159.65.131.194/storage/source');
INSERT INTO `profile` VALUES (2, 'ประชาสัมพันธ์', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for seotext
-- ----------------------------
DROP TABLE IF EXISTS `seotext`;
CREATE TABLE `seotext`  (
  `seotext_id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `h1` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`seotext_id`) USING BTREE,
  UNIQUE INDEX `model_item`(`class`, `item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seotext
-- ----------------------------
INSERT INTO `seotext` VALUES (1, 'yii\\easyii\\modules\\page\\models\\Page', 1, '', 'EasyiiCMS demo', '', 'yii2, easyii, admin');
INSERT INTO `seotext` VALUES (2, 'yii\\easyii\\modules\\page\\models\\Page', 2, 'Shop categories', 'Extended shop title', '', '');
INSERT INTO `seotext` VALUES (3, 'yii\\easyii\\modules\\page\\models\\Page', 3, 'Shop search results', 'Extended shop search title', '', '');
INSERT INTO `seotext` VALUES (4, 'yii\\easyii\\modules\\page\\models\\Page', 4, 'Shopping cart H1', 'Extended shopping cart title', '', '');
INSERT INTO `seotext` VALUES (5, 'yii\\easyii\\modules\\page\\models\\Page', 5, 'Success', 'Extended order success title', '', '');
INSERT INTO `seotext` VALUES (6, 'yii\\easyii\\modules\\page\\models\\Page', 6, 'News H1', 'Extended news title', '', '');
INSERT INTO `seotext` VALUES (7, 'yii\\easyii\\modules\\page\\models\\Page', 7, 'Articles H1', 'Extended articles title', '', '');
INSERT INTO `seotext` VALUES (8, 'yii\\easyii\\modules\\page\\models\\Page', 8, 'Photo gallery', 'Extended gallery title', '', '');
INSERT INTO `seotext` VALUES (9, 'yii\\easyii\\modules\\page\\models\\Page', 9, 'Guestbook H1', 'Extended guestbook title', '', '');
INSERT INTO `seotext` VALUES (10, 'yii\\easyii\\modules\\page\\models\\Page', 10, 'Frequently Asked Question', 'Extended faq title', '', '');
INSERT INTO `seotext` VALUES (11, 'yii\\easyii\\modules\\page\\models\\Page', 11, 'Contact us', 'Extended contact title', '', '');
INSERT INTO `seotext` VALUES (12, 'yii\\easyii\\modules\\catalog\\models\\Category', 2, 'Smartphones H1', 'Extended smartphones title', '', '');
INSERT INTO `seotext` VALUES (13, 'yii\\easyii\\modules\\catalog\\models\\Category', 3, 'Tablets H1', 'Extended tablets title', '', '');
INSERT INTO `seotext` VALUES (14, 'yii\\easyii\\modules\\catalog\\models\\Item', 1, 'Nokia 3310', '', '', '');
INSERT INTO `seotext` VALUES (15, 'yii\\easyii\\modules\\catalog\\models\\Item', 2, 'Samsung Galaxy S6', '', '', '');
INSERT INTO `seotext` VALUES (16, 'yii\\easyii\\modules\\catalog\\models\\Item', 3, 'Apple Iphone 6', '', '', '');
INSERT INTO `seotext` VALUES (17, 'yii\\easyii\\modules\\news\\models\\News', 1, 'First news H1', '', '', 'First news H1 Seo Description');
INSERT INTO `seotext` VALUES (18, 'yii\\easyii\\modules\\news\\models\\News', 2, 'Second news H1', '', '', '');
INSERT INTO `seotext` VALUES (19, 'yii\\easyii\\modules\\news\\models\\News', 3, 'Third news H1', '', '', '');
INSERT INTO `seotext` VALUES (20, 'yii\\easyii\\modules\\article\\models\\Category', 1, 'Articles category 1 H1', 'Extended category 1 title', '', '');
INSERT INTO `seotext` VALUES (21, 'yii\\easyii\\modules\\article\\models\\Category', 3, 'Subcategory 1 H1', 'Extended subcategory 1 title', '', '');
INSERT INTO `seotext` VALUES (22, 'yii\\easyii\\modules\\article\\models\\Category', 4, 'Subcategory 2 H1', 'Extended subcategory 2 title', '', '');
INSERT INTO `seotext` VALUES (23, 'yii\\easyii\\modules\\article\\models\\Item', 1, 'First article H1', '', '', '');
INSERT INTO `seotext` VALUES (24, 'yii\\easyii\\modules\\article\\models\\Item', 2, 'Second article H1', '', '', '');
INSERT INTO `seotext` VALUES (25, 'yii\\easyii\\modules\\article\\models\\Item', 3, 'Third article H1', '', '', '');
INSERT INTO `seotext` VALUES (26, 'yii\\easyii\\modules\\gallery\\models\\Category', 1, 'Album 1 H1', 'Extended Album 1 title', '', '');
INSERT INTO `seotext` VALUES (27, 'yii\\easyii\\modules\\gallery\\models\\Category', 2, 'Album 2 H1', 'Extended Album 2 title', '', '');
INSERT INTO `seotext` VALUES (28, 'common\\models\\Page', 12, 'เกี่ยวกับเรา', 'เกี่ยวกับเรา', '', 'คณะเกษตร เป็นหนึ่งในสี่คณะแรกในมหาวิทยาลัยเกษตรศาสตร์');
INSERT INTO `seotext` VALUES (29, 'common\\models\\Page', 11, 'หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร', 'หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร', '', 'หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาเทคโนโลยีระบบเกษตร มุ่งผลิตบัณฑิตที่มีความรู้ทางด้านเทคโนโลยีเครื่องจักรกลเกษตร');
INSERT INTO `seotext` VALUES (30, 'common\\models\\Page', 10, 'หลักสูตร วท.ม-เทคโนโลยีระบบเกษตร', 'หลักสูตร วท.ม-เทคโนโลยีระบบเกษตร', '', '');
INSERT INTO `seotext` VALUES (31, 'common\\models\\Page', 9, 'ติดต่อเรา', 'ติดต่อเรา', '', '');
INSERT INTO `seotext` VALUES (32, 'common\\models\\News', 5, 'เทคโนโลยีดิจิทัลที่มาช่วยในการเรียนการสอน การสอบ การประชุม และกิจกรรมต่างๆ : สำนักบริการคอมพิวเตอร์', 'เทคโนโลยีดิจิทัลที่มาช่วยในการเรียนการสอน การสอบ การประชุม และกิจกรรมต่างๆ : สำนักบริการคอมพิวเตอร์', '', 'เทคโนโลยีดิจิทัลที่มาช่วยในการเรียนการสอน การสอบ การประชุม และกิจกรรมต่างๆ : สำนักบริการคอมพิวเตอร์');
INSERT INTO `seotext` VALUES (33, 'common\\models\\News', 1, 'สัมมนาเชิงปฏิบัติการ การพัฒนาหลักสูตรและรายวิชา', 'สัมมนาเชิงปฏิบัติการ การพัฒนาหลักสูตรและรายวิชา', '', 'สัมมนาเชิงปฏิบัติการ การพัฒนาหลักสูตรและรายวิชา');
INSERT INTO `seotext` VALUES (34, 'common\\models\\Page', 3, 'กิจกรรม', 'กิจกรรม', '', 'กิจกรรม');
INSERT INTO `seotext` VALUES (35, 'common\\models\\Events', 8, 'ฝ่ายวิชาการประชุมแนวทางการจัดกิจกรรมการเรียนการสอน ปีการศึกษา 2563', 'ฝ่ายวิชาการประชุมแนวทางการจัดกิจกรรมการเรียนการสอน ปีการศึกษา 2563', '', 'ฝ่ายวิชาการประชุมแนวทางการจัดกิจกรรมการเรียนการสอน ปีการศึกษา 2563');

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_unique`(`provider`, `client_id`) USING BTREE,
  UNIQUE INDEX `account_unique_code`(`code`) USING BTREE,
  INDEX `fk_user_account`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of social_account
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `frequency` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (1, 'php', 3);
INSERT INTO `tags` VALUES (2, 'yii2', 5);
INSERT INTO `tags` VALUES (3, 'jquery', 2);
INSERT INTO `tags` VALUES (4, 'html', 1);
INSERT INTO `tags` VALUES (5, 'css', 1);
INSERT INTO `tags` VALUES (6, 'bootstrap', 1);
INSERT INTO `tags` VALUES (7, 'ajax', 1);
INSERT INTO `tags` VALUES (8, 'levis', 1);
INSERT INTO `tags` VALUES (19, 'test', 1);
INSERT INTO `tags` VALUES (28, 'ข่าวประชาสัมพัธ์', 1);
INSERT INTO `tags` VALUES (32, 'กิจกรรมคณะ', 2);
INSERT INTO `tags` VALUES (33, 'กิจกรรมนักศึกษา', 3);

-- ----------------------------
-- Table structure for tags_assign
-- ----------------------------
DROP TABLE IF EXISTS `tags_assign`;
CREATE TABLE `tags_assign`  (
  `class` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  INDEX `class`(`class`) USING BTREE,
  INDEX `item_tag`(`item_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags_assign
-- ----------------------------
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\news\\models\\News', 1, 8);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\news\\models\\News', 1, 2);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\news\\models\\News', 2, 2);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\news\\models\\News', 2, 3);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\news\\models\\News', 2, 4);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\article\\models\\Item', 1, 1);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\article\\models\\Item', 1, 5);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\article\\models\\Item', 1, 6);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\article\\models\\Item', 2, 2);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\article\\models\\Item', 2, 3);
INSERT INTO `tags_assign` VALUES ('yii\\easyii\\modules\\article\\models\\Item', 2, 7);
INSERT INTO `tags_assign` VALUES ('common\\models\\News', 4, 19);
INSERT INTO `tags_assign` VALUES ('common\\models\\News', 2, 1);
INSERT INTO `tags_assign` VALUES ('common\\models\\News', 5, 2);
INSERT INTO `tags_assign` VALUES ('common\\models\\News', 5, 28);
INSERT INTO `tags_assign` VALUES ('common\\models\\News', 1, 1);
INSERT INTO `tags_assign` VALUES ('common\\models\\News', 1, 2);
INSERT INTO `tags_assign` VALUES ('common\\models\\Events', 7, 32);
INSERT INTO `tags_assign` VALUES ('common\\models\\Events', 8, 33);
INSERT INTO `tags_assign` VALUES ('common\\models\\Events', 9, 32);
INSERT INTO `tags_assign` VALUES ('common\\models\\Events', 10, 33);
INSERT INTO `tags_assign` VALUES ('common\\models\\Events', 11, 33);

-- ----------------------------
-- Table structure for texts
-- ----------------------------
DROP TABLE IF EXISTS `texts`;
CREATE TABLE `texts`  (
  `text_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`text_id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of texts
-- ----------------------------
INSERT INTO `texts` VALUES (1, 'footer-title', 'Footer', 'คณะเกษตร มหาวิทยาลัยเกษตรศาสตร์', 1, NULL, 1592052613);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE INDEX `token_unique`(`user_id`, `code`, `type`) USING BTREE,
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) NULL DEFAULT NULL,
  `unconfirmed_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `blocked_at` int(11) NULL DEFAULT NULL,
  `registration_ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_unique_username`(`username`) USING BTREE,
  UNIQUE INDEX `user_unique_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin-ku@gmail.com', '$2y$12$P/nrEYjCwBNEyQHt//O2VOJw/WjSjCoV32HuOXxthIDKmpP9LCalK', '7sCGkzBxTGIyoig1cxWzjlziAhH5nnDj', 1591830631, NULL, NULL, NULL, 1591830630, 1591830630, 0, 1592206404);
INSERT INTO `user` VALUES (2, 'demo', 'demo@demo.com', '$2y$12$gPty5oS/tETH3SdAdurlAOU3awRfck47ehd/j.ffnaSBWIAGcfOgS', 'znXxtr7d8nLWDyAJfO6ip1Q5M7DQ5ABf', 1592109874, NULL, NULL, '127.0.0.1', 1592109874, 1592109874, 0, NULL);

-- ----------------------------
-- Table structure for widget_carousel
-- ----------------------------
DROP TABLE IF EXISTS `widget_carousel`;
CREATE TABLE `widget_carousel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` smallint(6) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key`(`key`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of widget_carousel
-- ----------------------------
INSERT INTO `widget_carousel` VALUES (1, 'index', 1);

-- ----------------------------
-- Table structure for widget_carousel_item
-- ----------------------------
DROP TABLE IF EXISTS `widget_carousel_item`;
CREATE TABLE `widget_carousel_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `asset_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `caption` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `order` int(11) NULL DEFAULT 0,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_item_carousel`(`carousel_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of widget_carousel_item
-- ----------------------------
INSERT INTO `widget_carousel_item` VALUES (4, 1, 'http://159.65.131.194/storage/source', '\\1\\pukXe37XlzzBEZ_BL4H5Qf0F3Y-YeDG4.jpg', 'http://159.65.131.194/storage/source/\\1\\pukXe37XlzzBEZ_BL4H5Qf0F3Y-YeDG4.jpg', 'image/jpeg', '', '<h2>Department of Farm Mechanics</h2><h2>Faculty of Agriculture</h2><h2>Kasetsart University</h2>', 1, 1, 1592020216, 1592026334);
INSERT INTO `widget_carousel_item` VALUES (5, 1, 'http://159.65.131.194/storage/source', '\\1\\obJeBX2igcFQNa-Ux9Wqz95N4SolELgp.png', 'http://159.65.131.194/storage/source/\\1\\obJeBX2igcFQNa-Ux9Wqz95N4SolELgp.png', 'image/png', 'http://159.65.131.194/', '<h2>หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร</h2><p>Bimply dummy text of the printing and typesetting istryrem Ipsum has been the industry\'s standard dummy text ever when an unknown printer.</p>', 1, 3, 1592020242, 1592026337);
INSERT INTO `widget_carousel_item` VALUES (6, 1, 'http://159.65.131.194/storage/source', '\\1\\Y95AbmgulXmyPOJZajd-chX7Q7G2_RbQ.jpg', 'http://159.65.131.194/storage/source/\\1\\Y95AbmgulXmyPOJZajd-chX7Q7G2_RbQ.jpg', 'image/jpeg', '', '<h2>หลักสูตร วท.ม-เทคโนโลยีระบบเกษตร</h2>', 1, 2, 1592020264, 1592026336);

SET FOREIGN_KEY_CHECKS = 1;
