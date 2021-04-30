/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100314
 Source Host           : localhost:3307
 Source Schema         : fm-gr

 Target Server Type    : MariaDB
 Target Server Version : 100314
 File Encoding         : 65001

 Date: 10/07/2020 14:08:52
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
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of calendar
-- ----------------------------
INSERT INTO `calendar` VALUES (3, 'test123', '2020-06-17', '09:40:00', '12:40:00', '', '', '');
INSERT INTO `calendar` VALUES (4, 'test2', '2020-06-17', '15:00:00', '15:30:00', '', '#674ea7', '#ffe599');
INSERT INTO `calendar` VALUES (5, 'test3', '2020-06-17', '15:27:00', '15:27:00', '', '', '');
INSERT INTO `calendar` VALUES (6, 'test4', '2020-06-17', '15:31:00', '15:31:00', '', '', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES (12, 'ส่งเสริมทักษะความรู้ในห้องเรียนและนอกห้องเรียน และงานบริการเพื่อสังคม', NULL, '<p>นิสิตที่มีความสนใจด้านเทคโนโลยีและการจัดการระบบเกษตร<br />ได้เข้าร่วมโครงการศึกษาดูงานเทคโนโลยีระบบเกษตร<br />ในเขตพื้นที่ภาคตะวันออก (จังหวัดชลบุรี จังหวัดจันทบุรี และจังหวัดระยอง)</p>', 'sng-serim-thaksa-khwam-ru-ni-hxngreiyn-laea-nxk-hxngreiyn-laea-ngan-brikar-pheux-sangkhm', 0, 1, 'http://faculty-ku.local/storage/source', '\\1\\n_yTDFnf885BILG9H_73DMNPp5OGwNaL.jpg', 1, 1, '2020-06-17', 1592379701, 1592801463, '');
INSERT INTO `events` VALUES (13, 'ทดสอบ', NULL, '<p>รายละเอียดกิจกรรม:</p>', 'thdsxb', 0, 1, NULL, NULL, 1, 1, '2020-06-23', 1592904363, 1592906519, '');
INSERT INTO `events` VALUES (14, 'ทดสอบ 3', NULL, '<p>รายละเอียดกิจกรรม:</p>', 'thdsxb-3', 0, 1, NULL, NULL, 1, 1, '2020-06-23', 1592906492, 1592906492, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events_attachment
-- ----------------------------
INSERT INTO `events_attachment` VALUES (11, 7, '\\1\\GQSLVFPVCgZvQ9JCMBaQATOrJ5j1MGJC.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 69316, '12443.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (12, 7, '\\1\\2c10xBW10CkcJOu3fwz64fXLIW0K-ob7.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 315262, '1558149932440.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (13, 7, '\\1\\zKNqvIpiGfqDXO3isZEVVWwWpLtGnruJ.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 249124, '1558149950416.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (14, 7, '\\1\\1z3xvCbRu2nADla-PwNFvQwvRH7rmlAI.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 16246, '1558968629812.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (15, 7, '\\1\\ssBMpqQpk5_hxAre1zs_Rwopzi1NiVtY.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 202932, '1561556078520.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (16, 7, '\\1\\eopc3SaNbO4I1KGNlKDghYlXMryBtU9F.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 291334, '1561556400870.jpg', 1592200308, NULL);
INSERT INTO `events_attachment` VALUES (17, 8, '\\1\\aI3zrWAEfxD6uvh91k-1XEq-rAJJtH1A.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 78522, 'r0_476_5184_3405_w1200_h678_fmax.jpg', 1592203811, NULL);
INSERT INTO `events_attachment` VALUES (18, 12, '\\1\\SFy7OZBf1L5BVLehc5VXch2RzCBYy9gB.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 339136, '2 (1).jpg', 1592379701, NULL);
INSERT INTO `events_attachment` VALUES (19, 12, '\\1\\4SmNXHYI6ZFzuHKcRVm5I_vaftpkypsJ.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 364851, '5.jpg', 1592379701, NULL);
INSERT INTO `events_attachment` VALUES (20, 12, '\\1\\9ytgSlAwVDcj7q0X-9KTqtxREiy5rc0q.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 306746, '4.jpg', 1592379701, NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 161 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `file_storage_item` VALUES (105, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\B5vzrZ0DLLgGSDHCxAEZVy6BBHX7e69q.png', 'image/png', 36064, 'B5vzrZ0DLLgGSDHCxAEZVy6BBHX7e69q', '127.0.0.1', NULL, 1591853153, NULL);
INSERT INTO `file_storage_item` VALUES (108, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8.png', 'image/png', 22422, '2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8', '127.0.0.1', NULL, 1591859607, NULL);
INSERT INTO `file_storage_item` VALUES (113, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\obJeBX2igcFQNa-Ux9Wqz95N4SolELgp.png', 'image/png', 3372423, 'obJeBX2igcFQNa-Ux9Wqz95N4SolELgp', '127.0.0.1', NULL, 1592020224, NULL);
INSERT INTO `file_storage_item` VALUES (112, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\pukXe37XlzzBEZ_BL4H5Qf0F3Y-YeDG4.jpg', 'image/jpeg', 419325, 'pukXe37XlzzBEZ_BL4H5Qf0F3Y-YeDG4', '127.0.0.1', NULL, 1592020128, NULL);
INSERT INTO `file_storage_item` VALUES (114, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\Y95AbmgulXmyPOJZajd-chX7Q7G2_RbQ.jpg', 'image/jpeg', 663771, 'Y95AbmgulXmyPOJZajd-chX7Q7G2_RbQ', '127.0.0.1', NULL, 1592020257, NULL);
INSERT INTO `file_storage_item` VALUES (159, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\Ua0hP92z4Xt82DLC54-UN3iJp6gLx5j-.jpg', 'image/jpeg', 384138, 'Ua0hP92z4Xt82DLC54-UN3iJp6gLx5j-', '127.0.0.1', NULL, 1592895726, NULL);
INSERT INTO `file_storage_item` VALUES (160, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\N-9tlR6rDjfM963zwzMbAOC2hywQvvQG.jpg', 'image/jpeg', 87659, 'N-9tlR6rDjfM963zwzMbAOC2hywQvvQG', '127.0.0.1', NULL, 1592896622, NULL);
INSERT INTO `file_storage_item` VALUES (152, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\n_yTDFnf885BILG9H_73DMNPp5OGwNaL.jpg', 'image/jpeg', 288522, 'n_yTDFnf885BILG9H_73DMNPp5OGwNaL', '127.0.0.1', NULL, 1592379616, NULL);
INSERT INTO `file_storage_item` VALUES (129, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\iQnIPwPsK3Kh1EuEaPvTOl3PhakVPYSB.jpg', 'image/jpeg', 315262, 'iQnIPwPsK3Kh1EuEaPvTOl3PhakVPYSB', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (130, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\WQqU4xzcu8qvCYMd7h0fOQ2qyikiJPCc.jpg', 'image/jpeg', 249124, 'WQqU4xzcu8qvCYMd7h0fOQ2qyikiJPCc', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (131, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\we7BFKpCzE8SMuceXoW5Fr_5DOXcySbV.jpg', 'image/jpeg', 16246, 'we7BFKpCzE8SMuceXoW5Fr_5DOXcySbV', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (132, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\A2DE-4r_apgXrexQ-ODmSXtIIgnPotha.jpg', 'image/jpeg', 202932, 'A2DE-4r_apgXrexQ-ODmSXtIIgnPotha', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (133, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\hMpOIjkPvkWtQOBLVef_KyQ9wkXxpZFb.jpg', 'image/jpeg', 291334, 'hMpOIjkPvkWtQOBLVef_KyQ9wkXxpZFb', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (134, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\NS38UTgur8NA7mNUYp7fimV-ORcM6_a3.jpg', 'image/jpeg', 69316, 'NS38UTgur8NA7mNUYp7fimV-ORcM6_a3', '127.0.0.1', NULL, 1592200201, NULL);
INSERT INTO `file_storage_item` VALUES (153, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\SFy7OZBf1L5BVLehc5VXch2RzCBYy9gB.jpg', 'image/jpeg', 339136, 'SFy7OZBf1L5BVLehc5VXch2RzCBYy9gB', '127.0.0.1', NULL, 1592379682, NULL);
INSERT INTO `file_storage_item` VALUES (154, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\4SmNXHYI6ZFzuHKcRVm5I_vaftpkypsJ.jpg', 'image/jpeg', 364851, '4SmNXHYI6ZFzuHKcRVm5I_vaftpkypsJ', '127.0.0.1', NULL, 1592379687, NULL);
INSERT INTO `file_storage_item` VALUES (155, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\9ytgSlAwVDcj7q0X-9KTqtxREiy5rc0q.jpg', 'image/jpeg', 306746, '9ytgSlAwVDcj7q0X-9KTqtxREiy5rc0q', '127.0.0.1', NULL, 1592379691, NULL);
INSERT INTO `file_storage_item` VALUES (156, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\YpZb62agiOAZPSP1Qa-Ew8jV6USVbXXU.jpg', 'image/jpeg', 339136, 'YpZb62agiOAZPSP1Qa-Ew8jV6USVbXXU', '127.0.0.1', NULL, 1592385262, NULL);
INSERT INTO `file_storage_item` VALUES (157, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\ZLdJfFSwj7DTHAewNF7g3enhEZaN6AVI.jpg', 'image/jpeg', 364851, 'ZLdJfFSwj7DTHAewNF7g3enhEZaN6AVI', '127.0.0.1', NULL, 1592385366, NULL);
INSERT INTO `file_storage_item` VALUES (158, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\dHqBfhRW7F_vlwIK0ILK2ceS5FtcrswE.jpg', 'image/jpeg', 373638, 'dHqBfhRW7F_vlwIK0ILK2ceS5FtcrswE', '127.0.0.1', NULL, 1592892537, NULL);
INSERT INTO `file_storage_item` VALUES (149, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\5SAgQvSU9LL7zKXfjMgp_rMYQQdlWFlK.jpg', 'image/jpeg', 87659, '5SAgQvSU9LL7zKXfjMgp_rMYQQdlWFlK', '127.0.0.1', NULL, 1592379041, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (8, 3, 'นายกรัฐมนตรีรับมอบนวัตกรรมทางการแพทย์จากกระทรวงพลังงาน กฟผ. สนับสนุนรัฐ ต้าน COVID-19', 'นายกรัฐมนตรีรับมอบ 6 นวัตกรรมทางการแพทย์จากกระทรวงพลังงาน โดย กฟผ. ได้นำความเชี่ยวชาญด้านการผลิตไฟฟ้ามาคิดค้นและประดิษฐ์นวัตกรรม เพื่อช่วยลดเสี่ยงภัย COVID-19 ซึ่งกฟผ. ได้ส่งมอบให้กับโรงพยาบาลต่าง ๆ แล้วกว่า 200 แห่ง ครอบคลุมพื้นที่กว่า 50 จังหวัดทั้งนี้หลังจบเหตุการณ์ COVID-19ยังสามารถนำนวัตกรรมเหล่านี้มาใช้ตรวจโรคติดเชื้อทางเดินหายใจอื่น ๆ ได้ด้วย', '<p>นายกรัฐมนตรีรับมอบ 6 นวัตกรรมทางการแพทย์จากกระทรวงพลังงาน โดย กฟผ. ได้นำความเชี่ยวชาญด้านการผลิตไฟฟ้ามาคิดค้นและประดิษฐ์นวัตกรรม เพื่อช่วยลดเสี่ยงภัย COVID-19 ซึ่ง กฟผ. ได้ส่งมอบให้กับโรงพยาบาลต่าง ๆ แล้วกว่า 200 แห่ง ครอบคลุมพื้นที่กว่า 50 จังหวัดทั้งนี้หลังจบเหตุการณ์ COVID-19ยังสามารถนำนวัตกรรมเหล่านี้มาใช้ตรวจโรคติดเชื้อทางเดินหายใจอื่น ๆ ได้ด้วย</p>\r\n<p>วันนี้ (9 มิถุนายน 2563) พลเอก ประยุทธ์ จันทร์โอชา นายกรัฐมนตรี รับมอบนวัตกรรม กฟผ. สู้ภัย COVID-19 จากนายสนธิรัตน์ สนธิจิรวงศ์ รัฐมนตรีว่าการกระทรวงพลังงาน พร้อมด้วยนายกุลิศ สมบัติศิริ ปลัดกระทรวงพลังงานและประธานกรรมการการไฟฟ้าฝ่ายผลิตแห่งประเทศไทย (กฟผ.) นายวิบูลย์ ฤกษ์ศิระทัยผู้ว่าการ กฟผ. และผู้บริหาร กฟผ. ณ โถงกลาง ตึกสันติไมตรี ทำเนียบรัฐบาล</p>\r\n<p>นายวิบูลย์ ฤกษ์ศิระทัย ผู้ว่าการ กฟผ. เปิดเผยว่า กฟผ. ในฐานะหน่วยงานภายใต้การกำกับดูแลของกระทรวงพลังงาน สนับสนุนนโยบายรัฐบาลในการช่วยเหลือและบรรเทาผลกระทบที่เกิดขึ้นในช่วงสถานการณ์ COVID-19 โดยได้ระดมจิตอาสาพนักงาน กฟผ. ที่มีความรู้ความเชี่ยวชาญด้านนวัตกรรมการผลิตไฟฟ้า คิดค้นและประดิษฐ์นวัตกรรมทางการแพทย์ ส่งมอบให้กับโรงพยาบาลทั่วประเทศ เพื่อช่วยป้องกันและลดความเสี่ยงให้กับบุคลากรทางการแพทย์ พร้อมเสริมศักยภาพในการตรวจรักษาผู้ป่วยทุกขั้นตอนตั้งแต่กระบวนการตรวจคัดกรอง ประกอบด้วย 1.ฉากกั้นอะคริลิคป้องกันเชื้อ 185 ชิ้น 2.ตู้เก็บสิ่งส่งตรวจระบบความดันลบ 170 ตู้ 3.ตู้เก็บสิ่งส่งตรวจระบบความดันบวก 80 ตู้ 4.เตียงเคลื่อนย้ายผู้ป่วยระบบความดันลบ 30 ตู้ 5.หน้ากากความดันบวกชนิดพกพา 50 ชิ้น 6.เสากดแอลกอฮอล์เจลแบบเท้าเหยียบ 4,000 ชิ้น ทั้งนี้ นวัตกรรมทางการแพทย์ที่ กฟผ. พัฒนาขึ้น เน้นรูปแบบการใช้งานที่ถูกหลักการทางการแพทย์และสะดวกต่อการเคลื่อนย้าย เพื่อป้องกันการแพร่ระบาดของ COVID-19 ได้อย่างมีประสิทธิภาพ และแม้ว่าจะผ่านพ้นสถานการณ์ COVID-19 ไปแล้ว นวัตกรรมเหล่านี้ก็ยังสามารถนำมาใช้ในการตรวจโรคติดเชื้อทางเดินหายใจอื่น ๆ ได้ด้วย โดยที่ผ่านมา กฟผ. ได้ส่งมอบนวัตกรรมให้กับโรงพยาบาลต่าง ๆ รวมกว่า 200 แห่งในพื้นที่กว่า 50 จังหวัดทั่วประเทศแล้ว</p>\r\n<p>นอกจากนี้ กฟผ. ยังได้ผลิตเจลอนามัยน้ำใจ กฟผ. สำหรับล้างมือที่มีส่วนผสมของแอลกอฮอล์ไม่ต่ำกว่า 70 เปอร์เซ็นต์ สามารถฆ่าเชื้อโรคได้ตามมาตรฐานที่กระทรวงสาธารณสุขกำหนด โดยแจกจ่ายให้กับโรงพยาบาลและประชาชนทั่วประเทศแล้วกว่า 40,000 ลิตร รวมถึงมอบเงินสนับสนุนจำนวน 30 ล้านบาท เพื่อช่วยเหลือโรงพยาบาลและจัดซื้ออุปกรณ์ทางการแพทย์ อีกทั้งจัดหาแอลกอฮอล์มูลค่า 60 ล้านบาท โดยร่วมกับกระทรวงพลังงาน เพื่อแจกจ่ายให้กับโรงพยาบาลสุขภาพตำบลทั่วประเทศ และยังได้มอบสิ่งของจำเป็นสำหรับการดำรงชีพให้กับประชาชนทั่วประเทศ ได้แก่ การจัดตั้งโรงทานแจกข้าวกล้องไข่เจียวและน้ำดื่ม การแจกจ่ายถุงยังชีพ และการจัดตั้งตู้ปันสุข กฟผ. พร้อมกันนี้ กฟผ. ยังได้เดินหน้าแคมเปญ &ldquo;Stop COVID Fast Restart Faster : หยุดได้ไว เริ่มใหม่ได้เร็ว&rdquo; โดยกำหนดกิจกรรมรณรงค์ป้องกันการแพร่ระบาดของเชื้อไวรัสอย่างเคร่งครัด และร่วมกันเป็นส่วนหนึ่งในการ Restart เศรษฐกิจ สังคม และสิ่งแวดล้อมของประเทศไทย อาทิ จัดทำตลาดนัดออนไลน์ &ldquo;เอนจี้&rdquo; เพื่อเป็นอีกหนึ่งช่องทางในการสร้างรายได้เพิ่มให้กับชุมชนรอบพื้นที่ เขตเขื่อน และโรงไฟฟ้าของ กฟผ. ทั่วประเทศ อีกด้วย</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&ldquo;นวัตกรรม กฟผ. สู้ภัย COVID-19 เป็นผลงานด้านจิตอาสาของ กฟผ. ทั่วประเทศ ที่ขอร่วมเป็นส่วนหนึ่งในการช่วยเหลือสังคมไทยและพร้อมจะเคียงข้างคนไทยในทุกวิกฤต&rdquo;ผู้ว่าการ กฟผ. กล่าวในตอนท้าย</p>', 'new', 0, 0, 'http://faculty-ku.local/storage/source', '\\1\\dHqBfhRW7F_vlwIK0ILK2ceS5FtcrswE.jpg', 1, 1, '2020-06-23', 1592892594, 1592896553, '');
INSERT INTO `news` VALUES (9, 3, '4 กูรูด้านสิ่งแวดล้อมร่วมรณรงค์ให้คนไทย เริ่มต้นใหม่ในการดูแลสิ่งแวดล้อมอย่างจริงจัง หลังโควิด-19', '         รักษ์โลกให้เรียนรู้ กฟผ. เชิญกูรูดังด้านสิ่งแวดล้อมแนะแนวทางรักษ์โลกหลังวิกฤตโควิด-19 ชวนทุกภาคส่วนหันมาเรียนรู้เรื่องสิ่งแวดล้อม ย้ำธุรกิจหรือองค์กรที่ยั่งยืนต้องมีความสมดุลของเป้าหมายการดำเนินธุรกิจควบคู่ไปกับแนวทางการพัฒนาอย่างยั่งยืนที่คำนึงถึงสิ่งแวดล้อม พร้อมเปิดตัวนิทรรศการออนไลน์ แหล่งเรียนรู้การอนุรักษ์สิ่งแวดล้อมมิติใหม่ในแบบ New Normal ภายใต้โครงการณรงค์ Stop COVID Fast Restart Faster หยุดได้ไวเริ่มใหม่ได้เร็ว', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;รักษ์โลกให้เรียนรู้ กฟผ. เชิญกูรูดังด้านสิ่งแวดล้อมแนะแนวทางรักษ์โลกหลังวิกฤตโควิด-19 ชวนทุกภาคส่วนหันมาเรียนรู้เรื่องสิ่งแวดล้อม ย้ำธุรกิจหรือองค์กรที่ยั่งยืนต้องมีความสมดุลของเป้าหมายการดำเนินธุรกิจควบคู่ไปกับแนวทางการพัฒนาอย่างยั่งยืนที่คำนึงถึงสิ่งแวดล้อม พร้อมเปิดตัวนิทรรศการออนไลน์ แหล่งเรียนรู้การอนุรักษ์สิ่งแวดล้อมมิติใหม่ในแบบ New Normal ภายใต้โครงการณรงค์ Stop COVID Fast Restart Faster หยุดได้ไวเริ่มใหม่ได้เร็ว</p>\r\n<p>&nbsp;การไฟฟ้าฝ่ายผลิตแห่งประเทศไทย (กฟผ.) จัดงานวันสิ่งแวดล้อม กฟผ. ในวันสิ่งแวดล้อมโลก 5 มิถุนายน2563 ด้วยการจัดเสวนา EGAT GURU Talk ครั้งที่ 2 แบบ Live สด รับ New Normal ในหัวข้อ &ldquo;Action for Green รักษ์โลกให้เรียนรู้&rdquo; เพื่อร่วมหาแนวทางดูแลสิ่งแวดล้อมหลังวิกฤตโควิด-19 กับกูรูดังด้านสิ่งแวดล้อม ได้แก่ศาสตราจารย์ ดร.พิสุทธิ์ เพียรมนกุล รองคณบดีด้านยุทธศาสตร์และนวัตกรรม คณะวิศวกรรมศาสตร์ จุฬาลงกรณมหาวิทยาลัย ในฐานะกรรมการ กฟผ. คุณติ๊ก เจษฎาภรณ์ ผลดี ดารานักแสดง ผู้ดำเนินรายการเนวิเกเตอร์และรายการ The Brothers Thailand คุณพิมพรรณ ดิศกุล ณ อยุธยา ผู้อำนวยการเครือข่ายเพื่อความยั่งยืนแห่งประเทศไทย และคุณปิยะชาติ อิศรภักดี ประธานเจ้าหน้าที่บริหารบริษัท แบรนดิ คอร์ปอเรชัน จำกัด จากห้องออดิทอเรียม กฟผ.สำนักงานกลาง อำเภอบางกรวย จังหวัดนนทบุรี</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ศาสตราจารย์ ดร.พิสุทธิ์ เพียรมนกุล ให้ทัศนะว่า วันสิ่งแวดล้อมโลกปีนี้ ให้ความสำคัญกับเรื่องความหลากหลายทางชีวภาพ (Bio Diversity) ซึ่งมีผลมาจากปัญหาไฟป่าที่เกิดขึ้นในพื้นที่ที่มีความหลากหลายทางชีวภาพสูงระดับโลกอย่างประเทศออสเตรเลีย และป่าอเมซอน สาเหตุสำคัญของปัญหาฝุ่นละอองขนาดเล็ก PM2.5 ความแปรปรวนของสภาพอากาศทั่วโลก และคุณภาพชีวิตที่แย่ลงของสิ่งมีชีวิต ไม่ว่าจะคน สัตว์ หรือพืช ซึ่งการดำเนินการของทุกองค์กรหลังจากจบวิกฤตโควิด-19 นี้จะต้องปรับตัวเพื่อรองรับความเปลี่ยนแปลงและการดำเนินชีวิตปกติในรูปแบบใหม่ (New Normal) โดยต้องนำแผนธุรกิจ แผนความยั่งยืน และแผนการดำเนินชีวิตแบบ New Normal มาปรับใช้ควบคู่กันอย่างสมดุล เพื่อนำไปสู่การเป็นองค์การแห่งความยั่งยืนอย่างแท้จริง</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;ด้านคุณติ๊ก เจษฎาภรณ์ ผลดี ให้แนวคิดว่า ปัจจุบันทั่วโลกให้ความสำคัญกับการรณรงค์ด้านการอนุรักษ์ธรรมชาติมากขึ้น แต่เราก็ยังคงพบกับเหตุการณ์ไฟป่า การทิ้งขยะ หรือการทำลายสิ่งแวดล้อมอยู่การใช้เทคโนโลยีเข้ามาช่วยเหลือในการป้องกันปัญหาสิ่งแวดล้อมถือเป็นเรื่องที่ดี แต่ควรดำเนินการควบคู่ไปกับการจัดการด้านสิ่งแวดล้อมที่ดีของมนุษย์และการบังคับใช้กฎหมายร่วมกัน ทั้งนี้ควรเปิดโอกาสให้ประชาชนได้เข้าไปเที่ยวตามแหล่งท่องเที่ยวธรรมชาติ เพื่อเรียนรู้เสริมสร้างประสบการณ์ในการดูแลรักษาธรรมชาติ สามารถใช้ชีวิตอยู่ร่วมกับธรรมชาติอย่างกลมกลืน</p>\r\n<p>&nbsp;&nbsp;คุณพิมพรรณ ดิศกุล ณ อยุธยา ได้ถ่ายทอดประสบการณ์จากการร่วมพัฒนาดอยตุง จังหวัดเชียงรายว่า ปัจจัยที่ทำให้คนอยู่ร่วมกับป่าได้อย่างยั่งยืนคือ ต้องขจัดความยากจน เข้าใจวิถีชีวิต ลักษณะพื้นที่ และระบบสาธารณูปโภค ซึ่งต้องอาศัยการมีส่วนร่วมจากทั้งชุมชน ภาครัฐ และภาคเอกชนในการแก้ปัญหา สำหรับในช่วงวิกฤตโควิด-19 ที่ผ่านมา นโยบายอยู่บ้านของประชาชน ทำให้มีขยะพลาสติกจากการสั่งซื้ออาหารออนไลน์จำนวนมาก ทางเครือข่ายจึงจัดทำโครงการพลาสติกกลับบ้านเพื่อนำพลาสติกมารีไซเคิลวนใช้ใหม่ โดยสามารถนำไปส่งได้ที่จุดรับฝากของภาคเอกชนที่มาร่วมเป็นจิตอาสา</p>\r\n<p>&nbsp;&nbsp; &nbsp;ด้านคุณปิยะชาติ อิศรภักดี กล่าวว่า กลยุทธ์ที่จะช่วยให้ภาคธุรกิจก้าวข้ามวิกฤตครั้งนี้ คือ การหาความสมดุลระหว่างธุรกิจ สิ่งแวดล้อม และผู้มีส่วนได้ส่วนเสียเพื่อให้เกิดความร่วมมือ เพราะในอนาคตคนจะสนใจความสำเร็จทางธุรกิจที่ให้ความสำคัญกับการดำเนินธุรกิจที่ส่งผลดีต่อคนในสังคมและสิ่งแวดล้อมซึ่งจะนำมาสู่ความเชื่อมั่นต่อองค์กรและเอื้อให้ธุรกิจเติบโต</p>\r\n<p>&nbsp;&nbsp;งานสิ่งแวดล้อม กฟผ. ปีนี้ ยังถือเป็นครั้งแรกที่ กฟผ. จัดสวนนิทรรศการออนไลน์ (E-Exhibition) เพื่อส่งเสริมการเรียนรู้สิ่งแวดล้อมด้านพลังงานแบบ New Normal ที่จะให้ความรู้สึกเสมือนได้เดินเยี่ยมชมนิทรรศการในสวนด้วยตัวเอง ภายใต้แนวคิด &ldquo;Action for Green รักษ์โลกให้เรียนรู้&rdquo; โดยรวบรวมความรู้และความสนุกมาไว้ถึง 16 จุด เช่น ยานยนต์ไฟฟ้า (EV Car) ซึ่งผู้เข้าชมจะได้พบกับชุดประกอบรถไฟฟ้าดัดแปลงที่จะเปลี่ยนรถยนต์เก่าให้เป็นรถไฟฟ้าในต้นทุนไม่เกิน 2 แสนบาท เยี่ยมชม EGAT Green Building ภายในอาคาร ท.103 ซึ่งเป็นอาคารอนุรักษ์พลังงานที่ออกแบบตามมาตรฐาน LEED ของประเทศสหรัฐอเมริกา ให้ประหยัดพลังงาน ช่วยลดความร้อนเข้าสู่ตัวอาคาร นอกจากนี้ภายในนิทรรศการได้ยกความสวยงามจากกังหันลมลำตะคองที่ใช้ผลิตไฟฟ้าจากบนยอดเขายายเที่ยง จ.นครราชสีมา มาไว้บนหน้าจอเสมือนไปเยือนด้วยตาตนเอง รวมถึงโครงการพลังงานแสงอาทิตย์ทุ่นลอยน้ำแบบไฮบริดที่ใหญ่ที่สุดในโลกจากเขื่อนสิรินธร จ.อุบลราชธานี ซึ่งผสมผสานการผลิตไฟฟ้าจากโซลาร์เซลล์ลอยน้ำและพลังน้ำจากเขื่อน ช่วยเสริมความมั่นคงกับการผลิตไฟฟ้าจากพลังงานหมุนเวียน ทั้งนี้ หากเยี่ยมชมนิทรรศการครบทุกจุดระหว่างวันที่ 5-12 มิถุนายน 2563 ยังสามารถลุ้นรับของรางวัลได้อีกด้วย โดยผู้ที่สนใจสามารถเข้าชมนิทรรศการได้ทาง https://e-exhibition.egat.co.th/</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&ldquo;กฟผ. เชื่อมั่นว่า การอนุรักษ์พลังงานเป็นการเรียนรู้ที่ไม่สิ้นสุด ทุกคนสามารถเริ่มได้ที่ตนเองโดยปรับตัวตามวิถีแนวทางใหม่ ซึ่งตลอดระยะเวลา 51 ปี กฟผ. ดำเนินกิจการโดยคำนึงถึงสิ่งแวดล้อมและคุณภาพชีวิตของชุมชนเป็นหลัก และในวิกฤตโควิด-19 นี้ กฟผ. ขอเป็นส่วนหนึ่งในการขับเคลื่อนสังคมด้วยกิจกรรมต่าง ๆที่สร้างสรรค์ขึ้นมาภายใต้แคมเปญ &ldquo;Stop COVID Fast Restart Faster หยุดได้ไว เริ่มใหม่ได้เร็ว&rdquo;</p>', 'stop-covid', 0, 1, 'http://faculty-ku.local/storage/source', '\\1\\Ua0hP92z4Xt82DLC54-UN3iJp6gLx5j-.jpg', 1, 1, NULL, 1592895803, 1592895803, '');
INSERT INTO `news` VALUES (10, 3, 'ผศ.ดร.เกรียงไกร แก้วตระกูลพงษ์ ได้เข้าพบรองผู้อำนวยการ สำนักงานเศรษฐกิจอุตสาหกรรม', 'เมื่อวันที่ 14 มีนาคม 2559\r\nผศ.ดร.เกรียงไกร แก้วตระกูลพงษ์ (หัวหน้าภาควิชาเกษตรกลวิธาน) พร้อมดร.ถวัลย์ศักดิ์ เผ่าสังข์ และอาจารย์อณสว์ ยี่สุดี ได้เข้าพบรองผู้อำนวยการ สำนักงานเศรษฐกิจอุตสาหกรรม กระทรวงอุตสาหกรรม เพื่อรายงานผลการดำเนินงานทั้งหมด และสรุปถึงรายงานฉบับสมบูรณ์ของโครงการศึกษาและกำหนดพื้นที่อุตสาหกรรม (zoning) เพื่อรองรับการลงทุนของอุตสาหกรรมเป้าหมายในภูมิภาค: ระยะที่ 2', '<p>เมื่อวันที่ 14 มีนาคม 2559<br />ผศ.ดร.เกรียงไกร แก้วตระกูลพงษ์ (หัวหน้าภาควิชาเกษตรกลวิธาน) พร้อมดร.ถวัลย์ศักดิ์ เผ่าสังข์ และอาจารย์อณสว์ ยี่สุดี ได้เข้าพบรองผู้อำนวยการ สำนักงานเศรษฐกิจอุตสาหกรรม กระทรวงอุตสาหกรรม เพื่อรายงานผลการดำเนินงานทั้งหมด และสรุปถึงรายงานฉบับสมบูรณ์ของโครงการศึกษาและกำหนดพื้นที่อุตสาหกรรม (zoning) เพื่อรองรับการลงทุนของอุตสาหกรรมเป้าหมายในภูมิภาค: ระยะที่ 2</p>', 'new2', 0, 1, 'http://faculty-ku.local/storage/source', '\\1\\N-9tlR6rDjfM963zwzMbAOC2hywQvvQG.jpg', 1, 1, '2020-06-23', 1592896660, 1592896660, '');

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
INSERT INTO `news_attachment` VALUES (5, 5, '\\1\\7hIM8aoBJl0JIEHkXr3QHy31tBxWCTjb.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 275900, '4.1 webservice_0.pdf', 1592061156, NULL);
INSERT INTO `news_attachment` VALUES (6, 5, '\\1\\d_5N-RCuec_ZPE4egbSI9D5bFq49U1Ta.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 341790, '4.2  MOPH Connect api.pdf', 1592061156, NULL);
INSERT INTO `news_attachment` VALUES (7, 5, '\\1\\ocReeYvtI1ZD23p9XPzGK8jETYqvEoq2.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 1576623, '5. Decha WEB VIEW_edit.pdf', 1592061156, NULL);
INSERT INTO `news_attachment` VALUES (8, 5, '\\1\\Bkqv_yVRJlIyBEKEDH8SXJ2BPcsQWs01.xlsx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 9892, 'user-import.xlsx', 1592130685, NULL);
INSERT INTO `news_attachment` VALUES (9, 5, '\\1\\ZKKoZ8W8P8vRAcNN-Hj-LyiA2ltgc73j.docx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 16506, '19 - งานบิล.docx', 1592130685, NULL);
INSERT INTO `news_attachment` VALUES (10, 5, '\\1\\DWMzrPLB83zFFuSPBZEC9XvO9WjtZgGI.pptx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 743515, 'หัวข้อการทดสอบระบบ_mobile_app_01.pptx', 1592130685, NULL);

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
INSERT INTO `news_categories` VALUES (1, 'news', 'ประชุม / อบรม / สัมมนา', 'far fa-newspaper', NULL, 1, 1572518477, 1592384320, 1);
INSERT INTO `news_categories` VALUES (2, 'career', 'รับสมัครงาน', 'far fa-newspaper', NULL, 1, 1592055764, 1592180289, 3);
INSERT INTO `news_categories` VALUES (3, 'general', 'ข่าวประชาสัมพันธ์', 'far fa-newspaper', NULL, 1, 1592055764, 1592379110, 2);
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
INSERT INTO `pages` VALUES (4, 'activity', 'ตารางกิจกรรม', '<p style=\"text-align: center;\">กิจกรรมของคณะ</p>', 'calendar', 1, NULL, 1592365229);
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
INSERT INTO `profile` VALUES (1, 'Tanakorn Phompak', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', 'Asia/Bangkok', '\\1\\2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8.png', 'http://faculty-ku.local/storage/source');
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
INSERT INTO `seotext` VALUES (34, 'common\\models\\Page', 3, 'กิจกรรม', 'กิจกรรม', '', 'กิจกรรม');

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
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `frequency` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (1, 'php', 1);
INSERT INTO `tags` VALUES (2, 'yii2', 3);
INSERT INTO `tags` VALUES (3, 'jquery', 2);
INSERT INTO `tags` VALUES (4, 'html', 1);
INSERT INTO `tags` VALUES (5, 'css', 1);
INSERT INTO `tags` VALUES (6, 'bootstrap', 1);
INSERT INTO `tags` VALUES (7, 'ajax', 1);
INSERT INTO `tags` VALUES (8, 'levis', 1);

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
INSERT INTO `user` VALUES (1, 'admin', 'admin-ku@gmail.com', '$2y$12$P/nrEYjCwBNEyQHt//O2VOJw/WjSjCoV32HuOXxthIDKmpP9LCalK', '7sCGkzBxTGIyoig1cxWzjlziAhH5nnDj', 1591830631, NULL, NULL, NULL, 1591830630, 1591830630, 0, 1592966467);
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of widget_carousel
-- ----------------------------
INSERT INTO `widget_carousel` VALUES (1, 'index', 1);
INSERT INTO `widget_carousel` VALUES (2, 'test', 1);
INSERT INTO `widget_carousel` VALUES (3, 'test4', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of widget_carousel_item
-- ----------------------------
INSERT INTO `widget_carousel_item` VALUES (4, 1, 'http://faculty-ku.local/storage/source', '\\1\\pukXe37XlzzBEZ_BL4H5Qf0F3Y-YeDG4.jpg', 'http://faculty-ku.local/storage/source/\\1\\pukXe37XlzzBEZ_BL4H5Qf0F3Y-YeDG4.jpg', 'image/jpeg', '', '<h2>Department of Farm Mechanics</h2><h2>Faculty of Agriculture</h2><h2>Kasetsart University</h2>', 1, 1, 1592020216, 1592026334);
INSERT INTO `widget_carousel_item` VALUES (5, 1, 'http://faculty-ku.local/storage/source', '\\1\\obJeBX2igcFQNa-Ux9Wqz95N4SolELgp.png', 'http://faculty-ku.local/storage/source/\\1\\obJeBX2igcFQNa-Ux9Wqz95N4SolELgp.png', 'image/png', 'http://faculty-ku.local/', '<h2>หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร</h2><p>Bimply dummy text of the printing and typesetting istryrem Ipsum has been the industry\'s standard dummy text ever when an unknown printer.</p>', 1, 3, 1592020242, 1592026337);
INSERT INTO `widget_carousel_item` VALUES (6, 1, 'http://faculty-ku.local/storage/source', '\\1\\Y95AbmgulXmyPOJZajd-chX7Q7G2_RbQ.jpg', 'http://faculty-ku.local/storage/source/\\1\\Y95AbmgulXmyPOJZajd-chX7Q7G2_RbQ.jpg', 'image/jpeg', '', '<h2>หลักสูตร วท.ม-เทคโนโลยีระบบเกษตร</h2>', 1, 2, 1592020264, 1592026336);
INSERT INTO `widget_carousel_item` VALUES (7, 2, 'http://faculty-ku.local/storage/source', '\\1\\YpZb62agiOAZPSP1Qa-Ew8jV6USVbXXU.jpg', NULL, 'image/jpeg', '', '<p>ทดสอบ</p>', 1, 4, 1592385278, 1592385278);
INSERT INTO `widget_carousel_item` VALUES (8, 2, 'http://faculty-ku.local/storage/source', '\\1\\ZLdJfFSwj7DTHAewNF7g3enhEZaN6AVI.jpg', NULL, 'image/jpeg', '', '<p>ทดสอบ</p>', 1, 5, 1592385379, 1592385379);

SET FOREIGN_KEY_CHECKS = 1;
