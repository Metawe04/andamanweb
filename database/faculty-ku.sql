/*
 Navicat Premium Data Transfer

 Source Server         : andaman
 Source Server Type    : MariaDB
 Source Server Version : 100413
 Source Host           : localhost:3307
 Source Schema         : andaman

 Target Server Type    : MariaDB
 Target Server Version : 100413
 File Encoding         : 65001

 Date: 06/05/2021 11:50:36
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
  INDEX `idx-auth_assignment-user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('admin', '1', 1606202489);
INSERT INTO `auth_assignment` VALUES ('news', '2', 1606202693);

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
INSERT INTO `auth_item` VALUES ('/*', 2, NULL, NULL, NULL, 1606201983, 1606201983);
INSERT INTO `auth_item` VALUES ('/settings/calendar/*', 2, NULL, NULL, NULL, 1606202078, 1606202078);
INSERT INTO `auth_item` VALUES ('/settings/carousel/*', 2, NULL, NULL, NULL, 1606202042, 1606202042);
INSERT INTO `auth_item` VALUES ('/settings/events/*', 2, NULL, NULL, NULL, 1606202073, 1606202073);
INSERT INTO `auth_item` VALUES ('/settings/news-category/*', 2, NULL, NULL, NULL, 1606202211, 1606202211);
INSERT INTO `auth_item` VALUES ('/settings/news/*', 2, NULL, NULL, NULL, 1606202060, 1606202060);
INSERT INTO `auth_item` VALUES ('/settings/page/*', 2, NULL, NULL, NULL, 1606202003, 1606202003);
INSERT INTO `auth_item` VALUES ('/settings/research/*', 2, NULL, NULL, NULL, 1606202020, 1606202020);
INSERT INTO `auth_item` VALUES ('admin', 1, 'ผู้ดูแลระบบ', NULL, NULL, 1606201862, 1606201862);
INSERT INTO `auth_item` VALUES ('CalendarManager', 2, 'เพิ่ม,ลบ,แก้ไข ตารางกิจกรรม', NULL, NULL, 1606202383, 1606202383);
INSERT INTO `auth_item` VALUES ('CarouselManager', 2, 'เพิ่ม,ลบ,แก้ไข สไลด์รูปภาพ', NULL, NULL, 1606202428, 1606202448);
INSERT INTO `auth_item` VALUES ('EventsManager', 2, 'เพิ่ม,ลบ,แก้ไข กิจกรรม', NULL, NULL, 1606202251, 1606202275);
INSERT INTO `auth_item` VALUES ('news', 1, 'จัดการข่าว', NULL, NULL, 1606201960, 1606201960);
INSERT INTO `auth_item` VALUES ('NewsManager', 2, 'เพิ่ม,ลบ,แก้ไข ข่าว', NULL, NULL, 1606202184, 1606202184);
INSERT INTO `auth_item` VALUES ('page', 1, 'จัดการ page', NULL, NULL, 1606201926, 1606201926);
INSERT INTO `auth_item` VALUES ('PageManager', 2, 'เพิ่ม,ลบ,แก้ไข เพจ', NULL, NULL, 1606202592, 1606202592);
INSERT INTO `auth_item` VALUES ('research', 1, 'จัดการ งานวิจัย', NULL, NULL, 1606201942, 1606201942);
INSERT INTO `auth_item` VALUES ('ResearchManager', 2, 'เพิ่ม,ลบ,แก้ไข  งานวิจัย', NULL, NULL, 1606202317, 1606202317);

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
INSERT INTO `auth_item_child` VALUES ('admin', '/*');
INSERT INTO `auth_item_child` VALUES ('CalendarManager', '/settings/calendar/*');
INSERT INTO `auth_item_child` VALUES ('CarouselManager', '/settings/carousel/*');
INSERT INTO `auth_item_child` VALUES ('EventsManager', '/settings/events/*');
INSERT INTO `auth_item_child` VALUES ('news', 'CalendarManager');
INSERT INTO `auth_item_child` VALUES ('news', 'CarouselManager');
INSERT INTO `auth_item_child` VALUES ('news', 'EventsManager');
INSERT INTO `auth_item_child` VALUES ('news', 'NewsManager');
INSERT INTO `auth_item_child` VALUES ('NewsManager', '/settings/news-category/*');
INSERT INTO `auth_item_child` VALUES ('NewsManager', '/settings/news/*');
INSERT INTO `auth_item_child` VALUES ('page', 'PageManager');
INSERT INTO `auth_item_child` VALUES ('PageManager', '/settings/page/*');
INSERT INTO `auth_item_child` VALUES ('research', 'ResearchManager');
INSERT INTO `auth_item_child` VALUES ('ResearchManager', '/settings/research/*');

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
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `COUNTRYID` int(5) NOT NULL,
  `COUNTRY_NAME` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COUNTRY_CODE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ตัวย่อ',
  PRIMARY KEY (`COUNTRYID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES (1, 'Afghanistan', 'AF');
INSERT INTO `country` VALUES (2, 'Albania', 'AL');
INSERT INTO `country` VALUES (3, 'Algeria', 'DZ');
INSERT INTO `country` VALUES (4, 'American Samoa', 'DS');
INSERT INTO `country` VALUES (5, 'Andorra', 'AD');
INSERT INTO `country` VALUES (6, 'Angola', 'AO');
INSERT INTO `country` VALUES (7, 'Anguilla', 'AI');
INSERT INTO `country` VALUES (8, 'Antarctica', 'AQ');
INSERT INTO `country` VALUES (9, 'Antigua and Barbuda', 'AG');
INSERT INTO `country` VALUES (10, 'Argentina', 'AR');
INSERT INTO `country` VALUES (11, 'Armenia', 'AM');
INSERT INTO `country` VALUES (12, 'Aruba', 'AW');
INSERT INTO `country` VALUES (13, 'Australia', 'AU');
INSERT INTO `country` VALUES (14, 'Austria', 'AT');
INSERT INTO `country` VALUES (15, 'Azerbaijan', 'AZ');
INSERT INTO `country` VALUES (16, 'Bahamas', 'BS');
INSERT INTO `country` VALUES (17, 'Bahrain', 'BH');
INSERT INTO `country` VALUES (18, 'Bangladesh', 'BD');
INSERT INTO `country` VALUES (19, 'Barbados', 'BB');
INSERT INTO `country` VALUES (20, 'Belarus', 'BY');
INSERT INTO `country` VALUES (21, 'Belgium', 'BE');
INSERT INTO `country` VALUES (22, 'Belize', 'BZ');
INSERT INTO `country` VALUES (23, 'Benin', 'BJ');
INSERT INTO `country` VALUES (24, 'Bermuda', 'BM');
INSERT INTO `country` VALUES (25, 'Bhutan', 'BT');
INSERT INTO `country` VALUES (26, 'Bolivia', 'BO');
INSERT INTO `country` VALUES (27, 'Bosnia and Herzegovina', 'BA');
INSERT INTO `country` VALUES (28, 'Botswana', 'BW');
INSERT INTO `country` VALUES (29, 'Bouvet Island', 'BV');
INSERT INTO `country` VALUES (30, 'Brazil', 'BR');
INSERT INTO `country` VALUES (31, 'British Indian Ocean Territory', 'IO');
INSERT INTO `country` VALUES (32, 'Brunei Darussalam', 'BN');
INSERT INTO `country` VALUES (33, 'Bulgaria', 'BG');
INSERT INTO `country` VALUES (34, 'Burkina Faso', 'BF');
INSERT INTO `country` VALUES (35, 'Burundi', 'BI');
INSERT INTO `country` VALUES (36, 'Cambodia', 'KH');
INSERT INTO `country` VALUES (37, 'Cameroon', 'CM');
INSERT INTO `country` VALUES (38, 'Canada', 'CA');
INSERT INTO `country` VALUES (39, 'Cape Verde', 'CV');
INSERT INTO `country` VALUES (40, 'Cayman Islands', 'KY');
INSERT INTO `country` VALUES (41, 'Central African Republic', 'CF');
INSERT INTO `country` VALUES (42, 'Chad', 'TD');
INSERT INTO `country` VALUES (43, 'Chile', 'CL');
INSERT INTO `country` VALUES (44, 'China', 'CN');
INSERT INTO `country` VALUES (45, 'Christmas Island', 'CX');
INSERT INTO `country` VALUES (46, 'Cocos (Keeling) Islands', 'CC');
INSERT INTO `country` VALUES (47, 'Colombia', 'CO');
INSERT INTO `country` VALUES (48, 'Comoros', 'KM');
INSERT INTO `country` VALUES (49, 'Congo', 'CG');
INSERT INTO `country` VALUES (50, 'Cook Islands', 'CK');
INSERT INTO `country` VALUES (51, 'Costa Rica', 'CR');
INSERT INTO `country` VALUES (52, 'Croatia (Hrvatska)', 'HR');
INSERT INTO `country` VALUES (53, 'Cuba', 'CU');
INSERT INTO `country` VALUES (54, 'Cyprus', 'CY');
INSERT INTO `country` VALUES (55, 'Czech Republic', 'CZ');
INSERT INTO `country` VALUES (56, 'Denmark', 'DK');
INSERT INTO `country` VALUES (57, 'Djibouti', 'DJ');
INSERT INTO `country` VALUES (58, 'Dominica', 'DM');
INSERT INTO `country` VALUES (59, 'Dominican Republic', 'DO');
INSERT INTO `country` VALUES (60, 'East Timor', 'TP');
INSERT INTO `country` VALUES (61, 'Ecuador', 'EC');
INSERT INTO `country` VALUES (62, 'Egypt', 'EG');
INSERT INTO `country` VALUES (63, 'El Salvador', 'SV');
INSERT INTO `country` VALUES (64, 'Equatorial Guinea', 'GQ');
INSERT INTO `country` VALUES (65, 'Eritrea', 'ER');
INSERT INTO `country` VALUES (66, 'Estonia', 'EE');
INSERT INTO `country` VALUES (67, 'Ethiopia', 'ET');
INSERT INTO `country` VALUES (68, 'Falkland Islands (Malvinas)', 'FK');
INSERT INTO `country` VALUES (69, 'Faroe Islands', 'FO');
INSERT INTO `country` VALUES (70, 'Fiji', 'FJ');
INSERT INTO `country` VALUES (71, 'Finland', 'FI');
INSERT INTO `country` VALUES (72, 'France', 'FR');
INSERT INTO `country` VALUES (73, 'France, Metropolitan', 'FX');
INSERT INTO `country` VALUES (74, 'French Guiana', 'GF');
INSERT INTO `country` VALUES (75, 'French Polynesia', 'PF');
INSERT INTO `country` VALUES (76, 'French Southern Territories', 'TF');
INSERT INTO `country` VALUES (77, 'Gabon', 'GA');
INSERT INTO `country` VALUES (78, 'Gambia', 'GM');
INSERT INTO `country` VALUES (79, 'Georgia', 'GE');
INSERT INTO `country` VALUES (80, 'Germany', 'DE');
INSERT INTO `country` VALUES (81, 'Ghana', 'GH');
INSERT INTO `country` VALUES (82, 'Gibraltar', 'GI');
INSERT INTO `country` VALUES (83, 'Guernsey', 'GK');
INSERT INTO `country` VALUES (84, 'Greece', 'GR');
INSERT INTO `country` VALUES (85, 'Greenland', 'GL');
INSERT INTO `country` VALUES (86, 'Grenada', 'GD');
INSERT INTO `country` VALUES (87, 'Guadeloupe', 'GP');
INSERT INTO `country` VALUES (88, 'Guam', 'GU');
INSERT INTO `country` VALUES (89, 'Guatemala', 'GT');
INSERT INTO `country` VALUES (90, 'Guinea', 'GN');
INSERT INTO `country` VALUES (91, 'Guinea-Bissau', 'GW');
INSERT INTO `country` VALUES (92, 'Guyana', 'GY');
INSERT INTO `country` VALUES (93, 'Haiti', 'HT');
INSERT INTO `country` VALUES (94, 'Heard and Mc Donald Islands', 'HM');
INSERT INTO `country` VALUES (95, 'Honduras', 'HN');
INSERT INTO `country` VALUES (96, 'Hong Kong', 'HK');
INSERT INTO `country` VALUES (97, 'Hungary', 'HU');
INSERT INTO `country` VALUES (98, 'Iceland', 'IS');
INSERT INTO `country` VALUES (99, 'India', 'IN');
INSERT INTO `country` VALUES (100, 'Isle of Man', 'IM');
INSERT INTO `country` VALUES (101, 'Indonesia', 'ID');
INSERT INTO `country` VALUES (102, 'Iran (Islamic Republic of)', 'IR');
INSERT INTO `country` VALUES (103, 'Iraq', 'IQ');
INSERT INTO `country` VALUES (104, 'Ireland', 'IE');
INSERT INTO `country` VALUES (105, 'Israel', 'IL');
INSERT INTO `country` VALUES (106, 'Italy', 'IT');
INSERT INTO `country` VALUES (107, 'Ivory Coast', 'CI');
INSERT INTO `country` VALUES (108, 'Jersey', 'JE');
INSERT INTO `country` VALUES (109, 'Jamaica', 'JM');
INSERT INTO `country` VALUES (110, 'Japan', 'JP');
INSERT INTO `country` VALUES (111, 'Jordan', 'JO');
INSERT INTO `country` VALUES (112, 'Kazakhstan', 'KZ');
INSERT INTO `country` VALUES (113, 'Kenya', 'KE');
INSERT INTO `country` VALUES (114, 'Kiribati', 'KI');
INSERT INTO `country` VALUES (115, 'Korea, Democratic People\'s Republic of', 'KP');
INSERT INTO `country` VALUES (116, 'Korea, Republic of', 'KR');
INSERT INTO `country` VALUES (117, 'Kosovo', 'XK');
INSERT INTO `country` VALUES (118, 'Kuwait', 'KW');
INSERT INTO `country` VALUES (119, 'Kyrgyzstan', 'KG');
INSERT INTO `country` VALUES (120, 'Lao People\'s Democratic Republic', 'LA');
INSERT INTO `country` VALUES (121, 'Latvia', 'LV');
INSERT INTO `country` VALUES (122, 'Lebanon', 'LB');
INSERT INTO `country` VALUES (123, 'Lesotho', 'LS');
INSERT INTO `country` VALUES (124, 'Liberia', 'LR');
INSERT INTO `country` VALUES (125, 'Libyan Arab Jamahiriya', 'LY');
INSERT INTO `country` VALUES (126, 'Liechtenstein', 'LI');
INSERT INTO `country` VALUES (127, 'Lithuania', 'LT');
INSERT INTO `country` VALUES (128, 'Luxembourg', 'LU');
INSERT INTO `country` VALUES (129, 'Macau', 'MO');
INSERT INTO `country` VALUES (130, 'Macedonia', 'MK');
INSERT INTO `country` VALUES (131, 'Madagascar', 'MG');
INSERT INTO `country` VALUES (132, 'Malawi', 'MW');
INSERT INTO `country` VALUES (133, 'Malaysia', 'MY');
INSERT INTO `country` VALUES (134, 'Maldives', 'MV');
INSERT INTO `country` VALUES (135, 'Mali', 'ML');
INSERT INTO `country` VALUES (136, 'Malta', 'MT');
INSERT INTO `country` VALUES (137, 'Marshall Islands', 'MH');
INSERT INTO `country` VALUES (138, 'Martinique', 'MQ');
INSERT INTO `country` VALUES (139, 'Mauritania', 'MR');
INSERT INTO `country` VALUES (140, 'Mauritius', 'MU');
INSERT INTO `country` VALUES (141, 'Mayotte', 'TY');
INSERT INTO `country` VALUES (142, 'Mexico', 'MX');
INSERT INTO `country` VALUES (143, 'Micronesia, Federated States of', 'FM');
INSERT INTO `country` VALUES (144, 'Moldova, Republic of', 'MD');
INSERT INTO `country` VALUES (145, 'Monaco', 'MC');
INSERT INTO `country` VALUES (146, 'Mongolia', 'MN');
INSERT INTO `country` VALUES (147, 'Montenegro', 'ME');
INSERT INTO `country` VALUES (148, 'Montserrat', 'MS');
INSERT INTO `country` VALUES (149, 'Morocco', 'MA');
INSERT INTO `country` VALUES (150, 'Mozambique', 'MZ');
INSERT INTO `country` VALUES (151, 'Myanmar', 'MM');
INSERT INTO `country` VALUES (152, 'Namibia', 'NA');
INSERT INTO `country` VALUES (153, 'Nauru', 'NR');
INSERT INTO `country` VALUES (154, 'Nepal', 'NP');
INSERT INTO `country` VALUES (155, 'Netherlands', 'NL');
INSERT INTO `country` VALUES (156, 'Netherlands Antilles', 'AN');
INSERT INTO `country` VALUES (157, 'New Caledonia', 'NC');
INSERT INTO `country` VALUES (158, 'New Zealand', 'NZ');
INSERT INTO `country` VALUES (159, 'Nicaragua', 'NI');
INSERT INTO `country` VALUES (160, 'Niger', 'NE');
INSERT INTO `country` VALUES (161, 'Nigeria', 'NG');
INSERT INTO `country` VALUES (162, 'Niue', 'NU');
INSERT INTO `country` VALUES (163, 'Norfolk Island', 'NF');
INSERT INTO `country` VALUES (164, 'Northern Mariana Islands', 'MP');
INSERT INTO `country` VALUES (165, 'Norway', 'NO');
INSERT INTO `country` VALUES (166, 'Oman', 'OM');
INSERT INTO `country` VALUES (167, 'Pakistan', 'PK');
INSERT INTO `country` VALUES (168, 'Palau', 'PW');
INSERT INTO `country` VALUES (169, 'Palestine', 'PS');
INSERT INTO `country` VALUES (170, 'Panama', 'PA');
INSERT INTO `country` VALUES (171, 'Papua New Guinea', 'PG');
INSERT INTO `country` VALUES (172, 'Paraguay', 'PY');
INSERT INTO `country` VALUES (173, 'Peru', 'PE');
INSERT INTO `country` VALUES (174, 'Philippines', 'PH');
INSERT INTO `country` VALUES (175, 'Pitcairn', 'PN');
INSERT INTO `country` VALUES (176, 'Poland', 'PL');
INSERT INTO `country` VALUES (177, 'Portugal', 'PT');
INSERT INTO `country` VALUES (178, 'Puerto Rico', 'PR');
INSERT INTO `country` VALUES (179, 'Qatar', 'QA');
INSERT INTO `country` VALUES (180, 'Reunion', 'RE');
INSERT INTO `country` VALUES (181, 'Romania', 'RO');
INSERT INTO `country` VALUES (182, 'Russian Federation', 'RU');
INSERT INTO `country` VALUES (183, 'Rwanda', 'RW');
INSERT INTO `country` VALUES (184, 'Saint Kitts and Nevis', 'KN');
INSERT INTO `country` VALUES (185, 'Saint Lucia', 'LC');
INSERT INTO `country` VALUES (186, 'Saint Vincent and the Grenadines', 'VC');
INSERT INTO `country` VALUES (187, 'Samoa', 'WS');
INSERT INTO `country` VALUES (188, 'San Marino', 'SM');
INSERT INTO `country` VALUES (189, 'Sao Tome and Principe', 'ST');
INSERT INTO `country` VALUES (190, 'Saudi Arabia', 'SA');
INSERT INTO `country` VALUES (191, 'Senegal', 'SN');
INSERT INTO `country` VALUES (192, 'Serbia', 'RS');
INSERT INTO `country` VALUES (193, 'Seychelles', 'SC');
INSERT INTO `country` VALUES (194, 'Sierra Leone', 'SL');
INSERT INTO `country` VALUES (195, 'Singapore', 'SG');
INSERT INTO `country` VALUES (196, 'Slovakia', 'SK');
INSERT INTO `country` VALUES (197, 'Slovenia', 'SI');
INSERT INTO `country` VALUES (198, 'Solomon Islands', 'SB');
INSERT INTO `country` VALUES (199, 'Somalia', 'SO');
INSERT INTO `country` VALUES (200, 'South Africa', 'ZA');
INSERT INTO `country` VALUES (201, 'South Georgia South Sandwich Islands', 'GS');
INSERT INTO `country` VALUES (202, 'Spain', 'ES');
INSERT INTO `country` VALUES (203, 'Sri Lanka', 'LK');
INSERT INTO `country` VALUES (204, 'St. Helena', 'SH');
INSERT INTO `country` VALUES (205, 'St. Pierre and Miquelon', 'PM');
INSERT INTO `country` VALUES (206, 'Sudan', 'SD');
INSERT INTO `country` VALUES (207, 'Suriname', 'SR');
INSERT INTO `country` VALUES (208, 'Svalbard and Jan Mayen Islands', 'SJ');
INSERT INTO `country` VALUES (209, 'Swaziland', 'SZ');
INSERT INTO `country` VALUES (210, 'Sweden', 'SE');
INSERT INTO `country` VALUES (211, 'Switzerland', 'CH');
INSERT INTO `country` VALUES (212, 'Syrian Arab Republic', 'SY');
INSERT INTO `country` VALUES (213, 'Taiwan', 'TW');
INSERT INTO `country` VALUES (214, 'Tajikistan', 'TJ');
INSERT INTO `country` VALUES (215, 'Tanzania, United Republic of', 'TZ');
INSERT INTO `country` VALUES (216, 'Thailand', 'TH');
INSERT INTO `country` VALUES (217, 'Togo', 'TG');
INSERT INTO `country` VALUES (218, 'Tokelau', 'TK');
INSERT INTO `country` VALUES (219, 'Tonga', 'TO');
INSERT INTO `country` VALUES (220, 'Trinidad and Tobago', 'TT');
INSERT INTO `country` VALUES (221, 'Tunisia', 'TN');
INSERT INTO `country` VALUES (222, 'Turkey', 'TR');
INSERT INTO `country` VALUES (223, 'Turkmenistan', 'TM');
INSERT INTO `country` VALUES (224, 'Turks and Caicos Islands', 'TC');
INSERT INTO `country` VALUES (225, 'Tuvalu', 'TV');
INSERT INTO `country` VALUES (226, 'Uganda', 'UG');
INSERT INTO `country` VALUES (227, 'Ukraine', 'UA');
INSERT INTO `country` VALUES (228, 'United Arab Emirates', 'AE');
INSERT INTO `country` VALUES (229, 'United Kingdom', 'GB');
INSERT INTO `country` VALUES (230, 'United States', 'US');
INSERT INTO `country` VALUES (231, 'United States minor outlying islands', 'UM');
INSERT INTO `country` VALUES (232, 'Uruguay', 'UY');
INSERT INTO `country` VALUES (233, 'Uzbekistan', 'UZ');
INSERT INTO `country` VALUES (234, 'Vanuatu', 'VU');
INSERT INTO `country` VALUES (235, 'Vatican City State', 'VA');
INSERT INTO `country` VALUES (236, 'Venezuela', 'VE');
INSERT INTO `country` VALUES (237, 'Vietnam', 'VN');
INSERT INTO `country` VALUES (238, 'Virgin Islands (British)', 'VG');
INSERT INTO `country` VALUES (239, 'Virgin Islands (U.S.)', 'VI');
INSERT INTO `country` VALUES (240, 'Wallis and Futuna Islands', 'WF');
INSERT INTO `country` VALUES (241, 'Western Sahara', 'EH');
INSERT INTO `country` VALUES (242, 'Yemen', 'YE');
INSERT INTO `country` VALUES (243, 'Zaire', 'ZR');
INSERT INTO `country` VALUES (244, 'Zambia', 'ZM');
INSERT INTO `country` VALUES (245, 'Zimbabwe', 'ZW');

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
INSERT INTO `events` VALUES (12, 'ส่งเสริมทักษะความรู้ในห้องเรียนและนอกห้องเรียน และงานบริการเพื่อสังคม', NULL, '<p>นิสิตที่มีความสนใจด้านเทคโนโลยีและการจัดการระบบเกษตร<br />ได้เข้าร่วมโครงการศึกษาดูงานเทคโนโลยีระบบเกษตร<br />ในเขตพื้นที่ภาคตะวันออก (จังหวัดชลบุรี จังหวัดจันทบุรี และจังหวัดระยอง)</p>', 'sng-serim-thaksa-khwam-ru-ni-hxngreiyn-laea-nxk-hxngreiyn-laea-ngan-brikar-pheux-sangkhm', 2, 0, 'http://faculty-ku.local/storage/source', '\\1\\n_yTDFnf885BILG9H_73DMNPp5OGwNaL.jpg', 1, 1, '2020-06-17', 1592379701, 1620098932, '');
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
) ENGINE = MyISAM AUTO_INCREMENT = 226 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `file_storage_item` VALUES (198, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\lJjLp1OK9l__hrBR8hvxTP9GjDwUTjHX.png', 'image/png', 935516, 'lJjLp1OK9l__hrBR8hvxTP9GjDwUTjHX', '127.0.0.1', NULL, 1606125723, NULL);
INSERT INTO `file_storage_item` VALUES (193, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\_smRUcrjsmJYAm-Ry-BkRGt-gMWcsj07.png', 'image/png', 21496, '_smRUcrjsmJYAm-Ry-BkRGt-gMWcsj07', '127.0.0.1', NULL, 1605089164, NULL);
INSERT INTO `file_storage_item` VALUES (195, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\0xFUZAZkaObPeBCWwkOORhy-rwPectXZ.png', 'image/png', 21496, '0xFUZAZkaObPeBCWwkOORhy-rwPectXZ', '127.0.0.1', NULL, 1605089192, NULL);
INSERT INTO `file_storage_item` VALUES (178, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\_V9DMuirE2GY9a0H0ttASUcpFR_zZ3jd.png', 'image/png', 35451, '_V9DMuirE2GY9a0H0ttASUcpFR_zZ3jd', '127.0.0.1', NULL, 1598848338, NULL);
INSERT INTO `file_storage_item` VALUES (179, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\FHsTi7XP9wupBRKL_h7eMPKM7jsaM-On.jpg', 'image/jpeg', 24808, 'FHsTi7XP9wupBRKL_h7eMPKM7jsaM-On', '127.0.0.1', NULL, 1598863548, NULL);
INSERT INTO `file_storage_item` VALUES (199, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\xdI3r-xO1Ov-2hHMVFn5IFDhBho2j0Y8.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 29614, 'xdI3r-xO1Ov-2hHMVFn5IFDhBho2j0Y8', '127.0.0.1', NULL, 1606126381, NULL);
INSERT INTO `file_storage_item` VALUES (182, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\bjltVFNRHUApEU23qiTPAND-hSYwk5lT.jpg', 'image/jpeg', 283558, 'bjltVFNRHUApEU23qiTPAND-hSYwk5lT', '127.0.0.1', NULL, 1605084633, NULL);
INSERT INTO `file_storage_item` VALUES (183, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\d6Cw5gs6Q_luPNVxE7dWT33abaU4g6aN.jpg', 'image/jpeg', 263418, 'd6Cw5gs6Q_luPNVxE7dWT33abaU4g6aN', '127.0.0.1', NULL, 1605085521, NULL);
INSERT INTO `file_storage_item` VALUES (184, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\do3nhb4ywbUsb8LR29TZsdDnKySSJDOc.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15888, 'do3nhb4ywbUsb8LR29TZsdDnKySSJDOc', '127.0.0.1', NULL, 1605085811, NULL);
INSERT INTO `file_storage_item` VALUES (185, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\JuEkqFxFCW6GdLt812Dtyut8BSThNoq_.pdf', 'application/pdf', 369444, 'JuEkqFxFCW6GdLt812Dtyut8BSThNoq_', '127.0.0.1', NULL, 1605085843, NULL);
INSERT INTO `file_storage_item` VALUES (159, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\Ua0hP92z4Xt82DLC54-UN3iJp6gLx5j-.jpg', 'image/jpeg', 384138, 'Ua0hP92z4Xt82DLC54-UN3iJp6gLx5j-', '127.0.0.1', NULL, 1592895726, NULL);
INSERT INTO `file_storage_item` VALUES (160, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\N-9tlR6rDjfM963zwzMbAOC2hywQvvQG.jpg', 'image/jpeg', 87659, 'N-9tlR6rDjfM963zwzMbAOC2hywQvvQG', '127.0.0.1', NULL, 1592896622, NULL);
INSERT INTO `file_storage_item` VALUES (152, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\n_yTDFnf885BILG9H_73DMNPp5OGwNaL.jpg', 'image/jpeg', 288522, 'n_yTDFnf885BILG9H_73DMNPp5OGwNaL', '127.0.0.1', NULL, 1592379616, NULL);
INSERT INTO `file_storage_item` VALUES (129, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\iQnIPwPsK3Kh1EuEaPvTOl3PhakVPYSB.jpg', 'image/jpeg', 315262, 'iQnIPwPsK3Kh1EuEaPvTOl3PhakVPYSB', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (130, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\WQqU4xzcu8qvCYMd7h0fOQ2qyikiJPCc.jpg', 'image/jpeg', 249124, 'WQqU4xzcu8qvCYMd7h0fOQ2qyikiJPCc', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (131, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\we7BFKpCzE8SMuceXoW5Fr_5DOXcySbV.jpg', 'image/jpeg', 16246, 'we7BFKpCzE8SMuceXoW5Fr_5DOXcySbV', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (132, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\A2DE-4r_apgXrexQ-ODmSXtIIgnPotha.jpg', 'image/jpeg', 202932, 'A2DE-4r_apgXrexQ-ODmSXtIIgnPotha', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (133, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\hMpOIjkPvkWtQOBLVef_KyQ9wkXxpZFb.jpg', 'image/jpeg', 291334, 'hMpOIjkPvkWtQOBLVef_KyQ9wkXxpZFb', '127.0.0.1', NULL, 1592200089, NULL);
INSERT INTO `file_storage_item` VALUES (134, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\NS38UTgur8NA7mNUYp7fimV-ORcM6_a3.jpg', 'image/jpeg', 69316, 'NS38UTgur8NA7mNUYp7fimV-ORcM6_a3', '127.0.0.1', NULL, 1592200201, NULL);
INSERT INTO `file_storage_item` VALUES (186, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\l-6zBg609W4EUwS8HU2oaczSNL8gz5Po.pdf', 'application/pdf', 272358, 'l-6zBg609W4EUwS8HU2oaczSNL8gz5Po', '127.0.0.1', NULL, 1605085881, NULL);
INSERT INTO `file_storage_item` VALUES (163, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\oQTQDglkrIpzU_3VudhqOMs0Nz_I9q3k.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 20813, 'oQTQDglkrIpzU_3VudhqOMs0Nz_I9q3k', '127.0.0.1', NULL, 1598776690, NULL);
INSERT INTO `file_storage_item` VALUES (162, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\9VR6WHF3oWl_FubT_RqhPwS11UcA_ZjZ.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 20813, '9VR6WHF3oWl_FubT_RqhPwS11UcA_ZjZ', '127.0.0.1', NULL, 1598770502, NULL);
INSERT INTO `file_storage_item` VALUES (153, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\SFy7OZBf1L5BVLehc5VXch2RzCBYy9gB.jpg', 'image/jpeg', 339136, 'SFy7OZBf1L5BVLehc5VXch2RzCBYy9gB', '127.0.0.1', NULL, 1592379682, NULL);
INSERT INTO `file_storage_item` VALUES (154, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\4SmNXHYI6ZFzuHKcRVm5I_vaftpkypsJ.jpg', 'image/jpeg', 364851, '4SmNXHYI6ZFzuHKcRVm5I_vaftpkypsJ', '127.0.0.1', NULL, 1592379687, NULL);
INSERT INTO `file_storage_item` VALUES (155, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\9ytgSlAwVDcj7q0X-9KTqtxREiy5rc0q.jpg', 'image/jpeg', 306746, '9ytgSlAwVDcj7q0X-9KTqtxREiy5rc0q', '127.0.0.1', NULL, 1592379691, NULL);
INSERT INTO `file_storage_item` VALUES (156, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\YpZb62agiOAZPSP1Qa-Ew8jV6USVbXXU.jpg', 'image/jpeg', 339136, 'YpZb62agiOAZPSP1Qa-Ew8jV6USVbXXU', '127.0.0.1', NULL, 1592385262, NULL);
INSERT INTO `file_storage_item` VALUES (157, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\ZLdJfFSwj7DTHAewNF7g3enhEZaN6AVI.jpg', 'image/jpeg', 364851, 'ZLdJfFSwj7DTHAewNF7g3enhEZaN6AVI', '127.0.0.1', NULL, 1592385366, NULL);
INSERT INTO `file_storage_item` VALUES (187, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\hKkuy4RClugk4hJL1WWNWCPZr3f2qr_U.jpg', 'image/jpeg', 302289, 'hKkuy4RClugk4hJL1WWNWCPZr3f2qr_U', '127.0.0.1', NULL, 1605088237, NULL);
INSERT INTO `file_storage_item` VALUES (149, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\5SAgQvSU9LL7zKXfjMgp_rMYQQdlWFlK.jpg', 'image/jpeg', 87659, '5SAgQvSU9LL7zKXfjMgp_rMYQQdlWFlK', '127.0.0.1', NULL, 1592379041, NULL);
INSERT INTO `file_storage_item` VALUES (188, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\J5Zc8KZMyKZSxnTqmoS8TfuA4dNJLnWZ.jpg', 'image/jpeg', 377947, 'J5Zc8KZMyKZSxnTqmoS8TfuA4dNJLnWZ', '127.0.0.1', NULL, 1605088237, NULL);
INSERT INTO `file_storage_item` VALUES (189, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\xkrbuIrIRUf4oIS65uj2NixmaGyt7QGs.jpg', 'image/jpeg', 370760, 'xkrbuIrIRUf4oIS65uj2NixmaGyt7QGs', '127.0.0.1', NULL, 1605088237, NULL);
INSERT INTO `file_storage_item` VALUES (190, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\rq0CeMc6Iy4qgxB-8s3HXqJxIz4KU73T.jpg', 'image/jpeg', 287765, 'rq0CeMc6Iy4qgxB-8s3HXqJxIz4KU73T', '127.0.0.1', NULL, 1605088237, NULL);
INSERT INTO `file_storage_item` VALUES (191, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\tLbvGyGE733ynnFTKc95QL_LAJAKwV7O.jpg', 'image/jpeg', 308334, 'tLbvGyGE733ynnFTKc95QL_LAJAKwV7O', '127.0.0.1', NULL, 1605088237, NULL);
INSERT INTO `file_storage_item` VALUES (194, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\vt97Pj2k4mdLaDfTkji6sExWTT36Xgy1.png', 'image/png', 21496, 'vt97Pj2k4mdLaDfTkji6sExWTT36Xgy1', '127.0.0.1', NULL, 1605089181, NULL);
INSERT INTO `file_storage_item` VALUES (200, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\R_uNOjSMJnl0D2bSxRdkwe5Pz2UAGVxa.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 1592989, 'R_uNOjSMJnl0D2bSxRdkwe5Pz2UAGVxa', '127.0.0.1', NULL, 1606126388, NULL);
INSERT INTO `file_storage_item` VALUES (201, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\TG7e0PEdbtNsSWnHphCOiAJMxIcN3ZQX.jpg', 'image/jpeg', 341647, 'TG7e0PEdbtNsSWnHphCOiAJMxIcN3ZQX', '127.0.0.1', NULL, 1606205955, NULL);
INSERT INTO `file_storage_item` VALUES (202, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\hhM28SWrTGve6g2fypUMI0OBBUSNTwFO.png', 'image/png', 936116, 'hhM28SWrTGve6g2fypUMI0OBBUSNTwFO', '127.0.0.1', NULL, 1606205961, NULL);
INSERT INTO `file_storage_item` VALUES (205, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\fLfuVt6R-IZxW2eihbFMU1kf2Y-UFDA7.png', 'image/png', 1229840, 'fLfuVt6R-IZxW2eihbFMU1kf2Y-UFDA7', '127.0.0.1', NULL, 1619663886, NULL);
INSERT INTO `file_storage_item` VALUES (220, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\HWT-G2uf0UpoV_IebHS3-cHZeGVY5ML4.png', 'image/png', 622806, 'HWT-G2uf0UpoV_IebHS3-cHZeGVY5ML4', '127.0.0.1', NULL, 1620275361, NULL);
INSERT INTO `file_storage_item` VALUES (208, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\0D5U4R_PwXjxiWN_10UIU1hcDCeaiMyX.jpg', 'image/jpeg', 58042, '0D5U4R_PwXjxiWN_10UIU1hcDCeaiMyX', '127.0.0.1', NULL, 1620098369, NULL);
INSERT INTO `file_storage_item` VALUES (209, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\TFQ_tPOJgIiYqoKS7rDSlnu5oX69n1H3.jpg', 'image/jpeg', 58042, 'TFQ_tPOJgIiYqoKS7rDSlnu5oX69n1H3', '127.0.0.1', NULL, 1620098530, NULL);
INSERT INTO `file_storage_item` VALUES (210, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\yvjxVPpMRxLCJNVxjhnaCbXFwGGwQrcP.jpg', 'image/jpeg', 58827, 'yvjxVPpMRxLCJNVxjhnaCbXFwGGwQrcP', '127.0.0.1', NULL, 1620098530, NULL);
INSERT INTO `file_storage_item` VALUES (211, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\12j26Xd8OUeSH7F_C84NZlNmvpA1afUm.jpg', 'image/jpeg', 55237, '12j26Xd8OUeSH7F_C84NZlNmvpA1afUm', '127.0.0.1', NULL, 1620098530, NULL);
INSERT INTO `file_storage_item` VALUES (212, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\UfGfHr0nYSsZeBMuzGRhuCYHKZozSZce.jpg', 'image/jpeg', 59296, 'UfGfHr0nYSsZeBMuzGRhuCYHKZozSZce', '127.0.0.1', NULL, 1620098530, NULL);
INSERT INTO `file_storage_item` VALUES (219, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\3uQ2JlMDwZcm1CuzNOzdY_XLzzQPkHbR.png', 'image/png', 622806, '3uQ2JlMDwZcm1CuzNOzdY_XLzzQPkHbR', '127.0.0.1', NULL, 1620275330, NULL);
INSERT INTO `file_storage_item` VALUES (216, 'fileStorage', 'http://faculty-ku.local/storage/source', '1\\veiYAWMvrNzs4TP1GRGK15l6GSCOyvHQ.png', 'image/png', 718465, 'veiYAWMvrNzs4TP1GRGK15l6GSCOyvHQ', '127.0.0.1', NULL, 1620266704, NULL);
INSERT INTO `file_storage_item` VALUES (221, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\NZOMf4hLwKv3baDcs6D843mn8c-K1pej.png', 'image/png', 692481, 'NZOMf4hLwKv3baDcs6D843mn8c-K1pej', '127.0.0.1', NULL, 1620276072, NULL);
INSERT INTO `file_storage_item` VALUES (222, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\c3acXuAxU0EnzDrRxdPFKKufeLn0vgZt.png', 'image/png', 622806, 'c3acXuAxU0EnzDrRxdPFKKufeLn0vgZt', '127.0.0.1', NULL, 1620276072, NULL);
INSERT INTO `file_storage_item` VALUES (223, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\Mt_MET0kJI8Emxv1ys-5wMlr1MeOM8Gf.png', 'image/png', 675384, 'Mt_MET0kJI8Emxv1ys-5wMlr1MeOM8Gf', '127.0.0.1', NULL, 1620276072, NULL);
INSERT INTO `file_storage_item` VALUES (224, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\krk0VreLd3HYQFfqfw-CMAVYZe1bPI6o.png', 'image/png', 659495, 'krk0VreLd3HYQFfqfw-CMAVYZe1bPI6o', '127.0.0.1', NULL, 1620276072, NULL);
INSERT INTO `file_storage_item` VALUES (225, 'fileStorage', 'http://faculty-ku.local/storage/source', '\\1\\INRANdIY2BRmRWHvfNaS9Bg2iMmhnuTd.png', 'image/png', 5169, 'INRANdIY2BRmRWHvfNaS9Bg2iMmhnuTd', '127.0.0.1', NULL, 1620276087, NULL);

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
-- Table structure for nationalrity
-- ----------------------------
DROP TABLE IF EXISTS `nationalrity`;
CREATE TABLE `nationalrity`  (
  `nationality_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสัญชาติ',
  `nationality_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อสัญชาติ',
  PRIMARY KEY (`nationality_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 270 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nationalrity
-- ----------------------------
INSERT INTO `nationalrity` VALUES (1, 'โปรตุเกส');
INSERT INTO `nationalrity` VALUES (2, 'ดัตช์');
INSERT INTO `nationalrity` VALUES (3, 'เยอรมัน');
INSERT INTO `nationalrity` VALUES (4, 'ฝรั่งเศส');
INSERT INTO `nationalrity` VALUES (5, 'เดนมาร์ก');
INSERT INTO `nationalrity` VALUES (6, 'สวีเดน');
INSERT INTO `nationalrity` VALUES (7, 'สวิส');
INSERT INTO `nationalrity` VALUES (8, 'อิตาลี');
INSERT INTO `nationalrity` VALUES (9, 'นอร์เวย์');
INSERT INTO `nationalrity` VALUES (10, 'ออสเตรีย');
INSERT INTO `nationalrity` VALUES (11, 'ไอริช');
INSERT INTO `nationalrity` VALUES (12, 'ฟินแลนด์');
INSERT INTO `nationalrity` VALUES (13, 'เบลเยียม');
INSERT INTO `nationalrity` VALUES (14, 'สเปน');
INSERT INTO `nationalrity` VALUES (15, 'รัสเซีย');
INSERT INTO `nationalrity` VALUES (16, 'โปแลนด์');
INSERT INTO `nationalrity` VALUES (17, 'เช็ก');
INSERT INTO `nationalrity` VALUES (18, 'ฮังการี');
INSERT INTO `nationalrity` VALUES (19, 'กรีก');
INSERT INTO `nationalrity` VALUES (20, 'ยูโกสลาฟ');
INSERT INTO `nationalrity` VALUES (21, 'ลักเซมเบิร์ก');
INSERT INTO `nationalrity` VALUES (22, 'วาติกัน');
INSERT INTO `nationalrity` VALUES (23, 'มอลตา');
INSERT INTO `nationalrity` VALUES (24, 'ลีซู');
INSERT INTO `nationalrity` VALUES (25, 'บัลแกเรีย');
INSERT INTO `nationalrity` VALUES (26, 'โรมาเนีย');
INSERT INTO `nationalrity` VALUES (27, 'ไซปรัส');
INSERT INTO `nationalrity` VALUES (28, 'อเมริกัน');
INSERT INTO `nationalrity` VALUES (29, 'แคนาดา');
INSERT INTO `nationalrity` VALUES (30, 'เม็กซิโก');
INSERT INTO `nationalrity` VALUES (31, 'คิวบา');
INSERT INTO `nationalrity` VALUES (32, 'อาร์เจนตินา');
INSERT INTO `nationalrity` VALUES (33, 'บราซิล');
INSERT INTO `nationalrity` VALUES (34, 'ชิลี');
INSERT INTO `nationalrity` VALUES (35, 'อาข่า');
INSERT INTO `nationalrity` VALUES (36, 'โคลัมเบีย');
INSERT INTO `nationalrity` VALUES (37, 'ลั๊ว');
INSERT INTO `nationalrity` VALUES (38, 'เปรู');
INSERT INTO `nationalrity` VALUES (39, 'ปานามา');
INSERT INTO `nationalrity` VALUES (40, 'อุรุกวัย');
INSERT INTO `nationalrity` VALUES (41, 'เวเนซุเอลา');
INSERT INTO `nationalrity` VALUES (42, 'เปอร์โตริโก้');
INSERT INTO `nationalrity` VALUES (43, 'จีน');
INSERT INTO `nationalrity` VALUES (44, 'อินเดีย');
INSERT INTO `nationalrity` VALUES (45, 'เวียดนาม');
INSERT INTO `nationalrity` VALUES (46, 'ญี่ปุ่น');
INSERT INTO `nationalrity` VALUES (47, 'พม่า');
INSERT INTO `nationalrity` VALUES (48, 'ฟิลิปปิน');
INSERT INTO `nationalrity` VALUES (49, 'มาเลเซีย');
INSERT INTO `nationalrity` VALUES (50, 'อินโดนีเซีย');
INSERT INTO `nationalrity` VALUES (51, 'ปากีสถาน');
INSERT INTO `nationalrity` VALUES (52, 'เกาหลีใต้');
INSERT INTO `nationalrity` VALUES (53, 'สิงคโปร์');
INSERT INTO `nationalrity` VALUES (54, 'เนปาล');
INSERT INTO `nationalrity` VALUES (55, 'ลาว');
INSERT INTO `nationalrity` VALUES (56, 'กัมพูชา');
INSERT INTO `nationalrity` VALUES (57, 'ศรีลังกา');
INSERT INTO `nationalrity` VALUES (58, 'ซาอุดีอาระเบีย');
INSERT INTO `nationalrity` VALUES (59, 'อิสราเอล');
INSERT INTO `nationalrity` VALUES (60, 'เลบานอน');
INSERT INTO `nationalrity` VALUES (61, 'อิหร่าน');
INSERT INTO `nationalrity` VALUES (62, 'ตุรกี');
INSERT INTO `nationalrity` VALUES (63, 'บังกลาเทศ');
INSERT INTO `nationalrity` VALUES (64, 'ถูกถอนสัญชาติ');
INSERT INTO `nationalrity` VALUES (65, 'ซีเรีย');
INSERT INTO `nationalrity` VALUES (66, 'อิรัก');
INSERT INTO `nationalrity` VALUES (67, 'คูเวต');
INSERT INTO `nationalrity` VALUES (68, 'บรูไน');
INSERT INTO `nationalrity` VALUES (69, 'แอฟริกาใต้');
INSERT INTO `nationalrity` VALUES (70, 'กะเหรี่ยง');
INSERT INTO `nationalrity` VALUES (71, 'ลาหู่');
INSERT INTO `nationalrity` VALUES (72, 'เคนยา');
INSERT INTO `nationalrity` VALUES (73, 'อียิปต์');
INSERT INTO `nationalrity` VALUES (74, 'เอธิโอเปีย');
INSERT INTO `nationalrity` VALUES (75, 'ไนจีเรีย');
INSERT INTO `nationalrity` VALUES (76, 'สหรัฐอาหรับเอมิเรตส์');
INSERT INTO `nationalrity` VALUES (77, 'กินี');
INSERT INTO `nationalrity` VALUES (78, 'ออสเตรเลีย');
INSERT INTO `nationalrity` VALUES (79, 'นิวซีแลนด์');
INSERT INTO `nationalrity` VALUES (80, 'ปาปัวนิวกินี');
INSERT INTO `nationalrity` VALUES (81, 'ม้ง');
INSERT INTO `nationalrity` VALUES (82, 'เมี่ยน');
INSERT INTO `nationalrity` VALUES (85, 'จีนฮ่อ');
INSERT INTO `nationalrity` VALUES (86, 'จีน (อดีตทหารจีนคณะชาติ ,อดีตทหารจีนชาติ)');
INSERT INTO `nationalrity` VALUES (87, 'ผู้พลัดถิ่นสัญชาติพม่า');
INSERT INTO `nationalrity` VALUES (88, 'ผู้อพยพเชื้อสายจากกัมพูชา');
INSERT INTO `nationalrity` VALUES (89, 'ลาว (ลาวอพยพ)');
INSERT INTO `nationalrity` VALUES (90, 'เขมรอพยพ');
INSERT INTO `nationalrity` VALUES (91, 'ผู้อพยพอินโดจีนสัญชาติเวียดนาม');
INSERT INTO `nationalrity` VALUES (96, 'อื่นๆ');
INSERT INTO `nationalrity` VALUES (97, 'ไม่ได้สัญชาติไทย');
INSERT INTO `nationalrity` VALUES (98, 'ไทย');
INSERT INTO `nationalrity` VALUES (99, 'อัฟกัน');
INSERT INTO `nationalrity` VALUES (100, 'บาห์เรน');
INSERT INTO `nationalrity` VALUES (101, 'ภูฏาน');
INSERT INTO `nationalrity` VALUES (102, 'จอร์แดน');
INSERT INTO `nationalrity` VALUES (103, 'เกาหลีเหนือ');
INSERT INTO `nationalrity` VALUES (104, 'มัลดีฟ');
INSERT INTO `nationalrity` VALUES (105, 'มองโกเลีย');
INSERT INTO `nationalrity` VALUES (106, 'โอมาน');
INSERT INTO `nationalrity` VALUES (107, 'กาตาร์');
INSERT INTO `nationalrity` VALUES (108, 'เยเมน');
INSERT INTO `nationalrity` VALUES (110, 'หมู่เกาะฟิจิ');
INSERT INTO `nationalrity` VALUES (111, 'คิริบาส');
INSERT INTO `nationalrity` VALUES (112, 'นาอูรู');
INSERT INTO `nationalrity` VALUES (113, 'หมู่เกาะโซโลมอน');
INSERT INTO `nationalrity` VALUES (114, 'ตองก้า');
INSERT INTO `nationalrity` VALUES (115, 'ตูวาลู');
INSERT INTO `nationalrity` VALUES (116, 'วานูอาตู');
INSERT INTO `nationalrity` VALUES (117, 'ซามัว');
INSERT INTO `nationalrity` VALUES (118, 'แอลเบเนีย');
INSERT INTO `nationalrity` VALUES (119, 'อันดอร์รา');
INSERT INTO `nationalrity` VALUES (121, 'ไอซ์แลนด์');
INSERT INTO `nationalrity` VALUES (122, 'ลิกเตนสไตน์');
INSERT INTO `nationalrity` VALUES (123, 'โมนาโก');
INSERT INTO `nationalrity` VALUES (124, 'ซานมารีโน');
INSERT INTO `nationalrity` VALUES (125, 'บริติช  (อังกฤษ, สก็อตแลนด์)');
INSERT INTO `nationalrity` VALUES (126, 'แอลจีเรีย');
INSERT INTO `nationalrity` VALUES (127, 'แองโกลา');
INSERT INTO `nationalrity` VALUES (128, 'เบนิน');
INSERT INTO `nationalrity` VALUES (129, 'บอตสวานา');
INSERT INTO `nationalrity` VALUES (130, 'บูร์กินาฟาโซ');
INSERT INTO `nationalrity` VALUES (131, 'บุรุนดี');
INSERT INTO `nationalrity` VALUES (132, 'แคเมอรูน');
INSERT INTO `nationalrity` VALUES (133, 'เคปเวิร์ด');
INSERT INTO `nationalrity` VALUES (134, 'แอฟริกากลาง');
INSERT INTO `nationalrity` VALUES (135, 'ชาด');
INSERT INTO `nationalrity` VALUES (136, 'คอสตาริกา');
INSERT INTO `nationalrity` VALUES (137, 'คองโก');
INSERT INTO `nationalrity` VALUES (138, 'ไอโวเรี่ยน');
INSERT INTO `nationalrity` VALUES (139, 'จิบูตี');
INSERT INTO `nationalrity` VALUES (140, 'อิเควทอเรียลกินี');
INSERT INTO `nationalrity` VALUES (141, 'กาบอง');
INSERT INTO `nationalrity` VALUES (142, 'แกมเบีย');
INSERT INTO `nationalrity` VALUES (143, 'กานา');
INSERT INTO `nationalrity` VALUES (144, 'กินีบีสเซา');
INSERT INTO `nationalrity` VALUES (145, 'เลโซโท');
INSERT INTO `nationalrity` VALUES (146, 'ไลบีเรีย');
INSERT INTO `nationalrity` VALUES (147, 'ลิเบีย');
INSERT INTO `nationalrity` VALUES (148, 'มาลากาซี');
INSERT INTO `nationalrity` VALUES (149, 'มาลาวี');
INSERT INTO `nationalrity` VALUES (150, 'มาลี');
INSERT INTO `nationalrity` VALUES (151, 'มอริเตเนีย');
INSERT INTO `nationalrity` VALUES (152, 'มอริเชียส');
INSERT INTO `nationalrity` VALUES (153, 'โมร็อกโก');
INSERT INTO `nationalrity` VALUES (154, 'โมซัมบิก');
INSERT INTO `nationalrity` VALUES (155, 'ไนเจอร์');
INSERT INTO `nationalrity` VALUES (156, 'รวันดา');
INSERT INTO `nationalrity` VALUES (157, 'เซาโตเมและปรินซิเป');
INSERT INTO `nationalrity` VALUES (158, 'เซเนกัล');
INSERT INTO `nationalrity` VALUES (159, 'เซเชลส์');
INSERT INTO `nationalrity` VALUES (160, 'เซียร์ราลีโอน');
INSERT INTO `nationalrity` VALUES (161, 'โซมาลี');
INSERT INTO `nationalrity` VALUES (162, 'ซูดาน');
INSERT INTO `nationalrity` VALUES (163, 'สวาซี');
INSERT INTO `nationalrity` VALUES (164, 'แทนซาเนีย');
INSERT INTO `nationalrity` VALUES (165, 'โตโก');
INSERT INTO `nationalrity` VALUES (166, 'ตูนิเซีย');
INSERT INTO `nationalrity` VALUES (167, 'ยูกันดา');
INSERT INTO `nationalrity` VALUES (168, 'ซาอีร์');
INSERT INTO `nationalrity` VALUES (169, 'แซมเบีย');
INSERT INTO `nationalrity` VALUES (170, 'ซิมบับเว');
INSERT INTO `nationalrity` VALUES (171, 'แอนติกาและบาร์บูดา');
INSERT INTO `nationalrity` VALUES (172, 'บาฮามาส');
INSERT INTO `nationalrity` VALUES (173, 'บาร์เบโดส');
INSERT INTO `nationalrity` VALUES (174, 'เบลิซ');
INSERT INTO `nationalrity` VALUES (175, 'คอสตาริกา');
INSERT INTO `nationalrity` VALUES (176, 'โดมินิกา');
INSERT INTO `nationalrity` VALUES (177, 'โดมินิกัน');
INSERT INTO `nationalrity` VALUES (178, 'เอลซัลวาดอร์');
INSERT INTO `nationalrity` VALUES (179, 'เกรเนดา');
INSERT INTO `nationalrity` VALUES (180, 'กัวเตมาลา');
INSERT INTO `nationalrity` VALUES (181, 'เฮติ');
INSERT INTO `nationalrity` VALUES (182, 'ฮอนดูรัส');
INSERT INTO `nationalrity` VALUES (183, 'จาเมกา');
INSERT INTO `nationalrity` VALUES (184, 'นิการากัว');
INSERT INTO `nationalrity` VALUES (185, 'เซนต์คิตส์และเนวิส');
INSERT INTO `nationalrity` VALUES (186, 'เซนต์ลูเซีย');
INSERT INTO `nationalrity` VALUES (187, 'เซนต์วินเซนต์และเกรนาดีนส์');
INSERT INTO `nationalrity` VALUES (188, 'ตรินิแดดและโตเบโก');
INSERT INTO `nationalrity` VALUES (189, 'โบลีเวีย');
INSERT INTO `nationalrity` VALUES (190, 'เอกวาดอร์');
INSERT INTO `nationalrity` VALUES (191, 'กายอานา');
INSERT INTO `nationalrity` VALUES (192, 'ปารากวัย');
INSERT INTO `nationalrity` VALUES (193, 'ซูรินาเม');
INSERT INTO `nationalrity` VALUES (194, 'อาหรับ');
INSERT INTO `nationalrity` VALUES (195, 'คะฉิ่น');
INSERT INTO `nationalrity` VALUES (196, 'ว้า');
INSERT INTO `nationalrity` VALUES (197, 'ไทยใหญ่');
INSERT INTO `nationalrity` VALUES (198, 'ไทยลื้อ');
INSERT INTO `nationalrity` VALUES (199, 'ขมุ');
INSERT INTO `nationalrity` VALUES (200, 'ตองสู');
INSERT INTO `nationalrity` VALUES (202, 'ละว้า');
INSERT INTO `nationalrity` VALUES (204, 'ปะหร่อง');
INSERT INTO `nationalrity` VALUES (205, 'ถิ่น');
INSERT INTO `nationalrity` VALUES (206, 'ปะโอ');
INSERT INTO `nationalrity` VALUES (207, 'มอญ');
INSERT INTO `nationalrity` VALUES (208, 'มลาบรี');
INSERT INTO `nationalrity` VALUES (211, 'จีน (จีนฮ่ออิสระ)');
INSERT INTO `nationalrity` VALUES (213, 'จีน (จีนฮ่ออพยพ)');
INSERT INTO `nationalrity` VALUES (215, 'ยูเครน');
INSERT INTO `nationalrity` VALUES (218, 'จีน(ฮ่องกง)');
INSERT INTO `nationalrity` VALUES (219, 'จีน(ไต้หวัน)');
INSERT INTO `nationalrity` VALUES (220, 'โครเอเชีย');
INSERT INTO `nationalrity` VALUES (221, 'คาซัค');
INSERT INTO `nationalrity` VALUES (223, 'อาร์เมเนีย');
INSERT INTO `nationalrity` VALUES (224, 'อาเซอร์ไบจาน');
INSERT INTO `nationalrity` VALUES (225, 'จอร์เจีย');
INSERT INTO `nationalrity` VALUES (226, 'คีร์กีซ');
INSERT INTO `nationalrity` VALUES (227, 'ทาจิก');
INSERT INTO `nationalrity` VALUES (228, 'อุซเบก');
INSERT INTO `nationalrity` VALUES (229, 'หมู่เกาะมาร์แชลล์');
INSERT INTO `nationalrity` VALUES (230, 'ไมโครนีเซีย');
INSERT INTO `nationalrity` VALUES (231, 'ปาเลา');
INSERT INTO `nationalrity` VALUES (232, 'เบลารุส');
INSERT INTO `nationalrity` VALUES (233, 'บอสเนียและเฮอร์เซโกวีนา');
INSERT INTO `nationalrity` VALUES (234, 'เติร์กเมน');
INSERT INTO `nationalrity` VALUES (235, 'เอสโตเนีย');
INSERT INTO `nationalrity` VALUES (236, 'ลัตเวีย');
INSERT INTO `nationalrity` VALUES (237, 'ลิทัวเนีย');
INSERT INTO `nationalrity` VALUES (238, 'มาซิโดเนีย');
INSERT INTO `nationalrity` VALUES (239, 'มอลโดวา');
INSERT INTO `nationalrity` VALUES (240, 'สโลวัก');
INSERT INTO `nationalrity` VALUES (241, 'สโลวีน');
INSERT INTO `nationalrity` VALUES (242, 'เอริเทรีย');
INSERT INTO `nationalrity` VALUES (243, 'นามิเบีย');
INSERT INTO `nationalrity` VALUES (244, 'โบลิเวีย');
INSERT INTO `nationalrity` VALUES (245, 'หมู่เกาะคุก');
INSERT INTO `nationalrity` VALUES (246, 'เนปาล (เนปาลอพยพ)');
INSERT INTO `nationalrity` VALUES (247, 'มอญ  (ผู้พลัดถิ่นสัญชาติพม่า)');
INSERT INTO `nationalrity` VALUES (248, 'ไทยใหญ่  (ผู้พลัดถิ่นสัญชาติพม่า)');
INSERT INTO `nationalrity` VALUES (249, 'เวียดนาม  (ญวนอพยพ)');
INSERT INTO `nationalrity` VALUES (250, 'มาเลเชีย  (อดีต จีนคอมมิวนิสต์)');
INSERT INTO `nationalrity` VALUES (251, 'จีน  (อดีต จีนคอมมิวนิสต์)');
INSERT INTO `nationalrity` VALUES (252, 'สิงคโปร์  (อดีต จีนคอมมิวนิสต์)');
INSERT INTO `nationalrity` VALUES (253, 'กะเหรี่ยง  (ผู้หลบหนีเข้าเมือง)');
INSERT INTO `nationalrity` VALUES (254, 'มอญ  (ผู้หลบหนีเข้าเมือง)');
INSERT INTO `nationalrity` VALUES (255, 'ไทยใหญ่  (ผู้หลบหนีเข้าเมือง)');
INSERT INTO `nationalrity` VALUES (256, 'กัมพูชา  (ผู้หลบหนีเข้าเมือง)');
INSERT INTO `nationalrity` VALUES (257, 'มอญ  (ชุมชนบนพื้นที่สูง)');
INSERT INTO `nationalrity` VALUES (258, 'กะเหรี่ยง  (ชุมชนบนพื้นที่สูง)');
INSERT INTO `nationalrity` VALUES (259, 'ปาเลสไตน์');
INSERT INTO `nationalrity` VALUES (260, 'ติมอร์ตะวันออก');
INSERT INTO `nationalrity` VALUES (261, 'สละสัญชาติไทย');
INSERT INTO `nationalrity` VALUES (262, 'เซอร์เบีย แอนด์ มอนเตเนโกร');
INSERT INTO `nationalrity` VALUES (263, 'กัมพูชา(แรงงาน)');
INSERT INTO `nationalrity` VALUES (264, 'พม่า(แรงงาน)');
INSERT INTO `nationalrity` VALUES (265, 'ลาว(แรงงาน)');
INSERT INTO `nationalrity` VALUES (266, 'เซอร์เบียน');
INSERT INTO `nationalrity` VALUES (267, 'มอนเตเนกริน');
INSERT INTO `nationalrity` VALUES (268, 'บุคคลที่ไม่มีสถานะทางทะเบียน');
INSERT INTO `nationalrity` VALUES (269, 'ไม่ระบุ');

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (9, 3, '4 กูรูด้านสิ่งแวดล้อมร่วมรณรงค์ให้คนไทย เริ่มต้นใหม่ในการดูแลสิ่งแวดล้อมอย่างจริงจัง หลังโควิด-19', '         รักษ์โลกให้เรียนรู้ กฟผ. เชิญกูรูดังด้านสิ่งแวดล้อมแนะแนวทางรักษ์โลกหลังวิกฤตโควิด-19 ชวนทุกภาคส่วนหันมาเรียนรู้เรื่องสิ่งแวดล้อม ย้ำธุรกิจหรือองค์กรที่ยั่งยืนต้องมีความสมดุลของเป้าหมายการดำเนินธุรกิจควบคู่ไปกับแนวทางการพัฒนาอย่างยั่งยืนที่คำนึงถึงสิ่งแวดล้อม พร้อมเปิดตัวนิทรรศการออนไลน์ แหล่งเรียนรู้การอนุรักษ์สิ่งแวดล้อมมิติใหม่ในแบบ New Normal ภายใต้โครงการณรงค์ Stop COVID Fast Restart Faster หยุดได้ไวเริ่มใหม่ได้เร็ว', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;รักษ์โลกให้เรียนรู้ กฟผ. เชิญกูรูดังด้านสิ่งแวดล้อมแนะแนวทางรักษ์โลกหลังวิกฤตโควิด-19 ชวนทุกภาคส่วนหันมาเรียนรู้เรื่องสิ่งแวดล้อม ย้ำธุรกิจหรือองค์กรที่ยั่งยืนต้องมีความสมดุลของเป้าหมายการดำเนินธุรกิจควบคู่ไปกับแนวทางการพัฒนาอย่างยั่งยืนที่คำนึงถึงสิ่งแวดล้อม พร้อมเปิดตัวนิทรรศการออนไลน์ แหล่งเรียนรู้การอนุรักษ์สิ่งแวดล้อมมิติใหม่ในแบบ New Normal ภายใต้โครงการณรงค์ Stop COVID Fast Restart Faster หยุดได้ไวเริ่มใหม่ได้เร็ว</p>\r\n<p>&nbsp;การไฟฟ้าฝ่ายผลิตแห่งประเทศไทย (กฟผ.) จัดงานวันสิ่งแวดล้อม กฟผ. ในวันสิ่งแวดล้อมโลก 5 มิถุนายน2563 ด้วยการจัดเสวนา EGAT GURU Talk ครั้งที่ 2 แบบ Live สด รับ New Normal ในหัวข้อ &ldquo;Action for Green รักษ์โลกให้เรียนรู้&rdquo; เพื่อร่วมหาแนวทางดูแลสิ่งแวดล้อมหลังวิกฤตโควิด-19 กับกูรูดังด้านสิ่งแวดล้อม ได้แก่ศาสตราจารย์ ดร.พิสุทธิ์ เพียรมนกุล รองคณบดีด้านยุทธศาสตร์และนวัตกรรม คณะวิศวกรรมศาสตร์ จุฬาลงกรณมหาวิทยาลัย ในฐานะกรรมการ กฟผ. คุณติ๊ก เจษฎาภรณ์ ผลดี ดารานักแสดง ผู้ดำเนินรายการเนวิเกเตอร์และรายการ The Brothers Thailand คุณพิมพรรณ ดิศกุล ณ อยุธยา ผู้อำนวยการเครือข่ายเพื่อความยั่งยืนแห่งประเทศไทย และคุณปิยะชาติ อิศรภักดี ประธานเจ้าหน้าที่บริหารบริษัท แบรนดิ คอร์ปอเรชัน จำกัด จากห้องออดิทอเรียม กฟผ.สำนักงานกลาง อำเภอบางกรวย จังหวัดนนทบุรี</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ศาสตราจารย์ ดร.พิสุทธิ์ เพียรมนกุล ให้ทัศนะว่า วันสิ่งแวดล้อมโลกปีนี้ ให้ความสำคัญกับเรื่องความหลากหลายทางชีวภาพ (Bio Diversity) ซึ่งมีผลมาจากปัญหาไฟป่าที่เกิดขึ้นในพื้นที่ที่มีความหลากหลายทางชีวภาพสูงระดับโลกอย่างประเทศออสเตรเลีย และป่าอเมซอน สาเหตุสำคัญของปัญหาฝุ่นละอองขนาดเล็ก PM2.5 ความแปรปรวนของสภาพอากาศทั่วโลก และคุณภาพชีวิตที่แย่ลงของสิ่งมีชีวิต ไม่ว่าจะคน สัตว์ หรือพืช ซึ่งการดำเนินการของทุกองค์กรหลังจากจบวิกฤตโควิด-19 นี้จะต้องปรับตัวเพื่อรองรับความเปลี่ยนแปลงและการดำเนินชีวิตปกติในรูปแบบใหม่ (New Normal) โดยต้องนำแผนธุรกิจ แผนความยั่งยืน และแผนการดำเนินชีวิตแบบ New Normal มาปรับใช้ควบคู่กันอย่างสมดุล เพื่อนำไปสู่การเป็นองค์การแห่งความยั่งยืนอย่างแท้จริง</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;ด้านคุณติ๊ก เจษฎาภรณ์ ผลดี ให้แนวคิดว่า ปัจจุบันทั่วโลกให้ความสำคัญกับการรณรงค์ด้านการอนุรักษ์ธรรมชาติมากขึ้น แต่เราก็ยังคงพบกับเหตุการณ์ไฟป่า การทิ้งขยะ หรือการทำลายสิ่งแวดล้อมอยู่การใช้เทคโนโลยีเข้ามาช่วยเหลือในการป้องกันปัญหาสิ่งแวดล้อมถือเป็นเรื่องที่ดี แต่ควรดำเนินการควบคู่ไปกับการจัดการด้านสิ่งแวดล้อมที่ดีของมนุษย์และการบังคับใช้กฎหมายร่วมกัน ทั้งนี้ควรเปิดโอกาสให้ประชาชนได้เข้าไปเที่ยวตามแหล่งท่องเที่ยวธรรมชาติ เพื่อเรียนรู้เสริมสร้างประสบการณ์ในการดูแลรักษาธรรมชาติ สามารถใช้ชีวิตอยู่ร่วมกับธรรมชาติอย่างกลมกลืน</p>\r\n<p>&nbsp;&nbsp;คุณพิมพรรณ ดิศกุล ณ อยุธยา ได้ถ่ายทอดประสบการณ์จากการร่วมพัฒนาดอยตุง จังหวัดเชียงรายว่า ปัจจัยที่ทำให้คนอยู่ร่วมกับป่าได้อย่างยั่งยืนคือ ต้องขจัดความยากจน เข้าใจวิถีชีวิต ลักษณะพื้นที่ และระบบสาธารณูปโภค ซึ่งต้องอาศัยการมีส่วนร่วมจากทั้งชุมชน ภาครัฐ และภาคเอกชนในการแก้ปัญหา สำหรับในช่วงวิกฤตโควิด-19 ที่ผ่านมา นโยบายอยู่บ้านของประชาชน ทำให้มีขยะพลาสติกจากการสั่งซื้ออาหารออนไลน์จำนวนมาก ทางเครือข่ายจึงจัดทำโครงการพลาสติกกลับบ้านเพื่อนำพลาสติกมารีไซเคิลวนใช้ใหม่ โดยสามารถนำไปส่งได้ที่จุดรับฝากของภาคเอกชนที่มาร่วมเป็นจิตอาสา</p>\r\n<p>&nbsp;&nbsp; &nbsp;ด้านคุณปิยะชาติ อิศรภักดี กล่าวว่า กลยุทธ์ที่จะช่วยให้ภาคธุรกิจก้าวข้ามวิกฤตครั้งนี้ คือ การหาความสมดุลระหว่างธุรกิจ สิ่งแวดล้อม และผู้มีส่วนได้ส่วนเสียเพื่อให้เกิดความร่วมมือ เพราะในอนาคตคนจะสนใจความสำเร็จทางธุรกิจที่ให้ความสำคัญกับการดำเนินธุรกิจที่ส่งผลดีต่อคนในสังคมและสิ่งแวดล้อมซึ่งจะนำมาสู่ความเชื่อมั่นต่อองค์กรและเอื้อให้ธุรกิจเติบโต</p>\r\n<p>&nbsp;&nbsp;งานสิ่งแวดล้อม กฟผ. ปีนี้ ยังถือเป็นครั้งแรกที่ กฟผ. จัดสวนนิทรรศการออนไลน์ (E-Exhibition) เพื่อส่งเสริมการเรียนรู้สิ่งแวดล้อมด้านพลังงานแบบ New Normal ที่จะให้ความรู้สึกเสมือนได้เดินเยี่ยมชมนิทรรศการในสวนด้วยตัวเอง ภายใต้แนวคิด &ldquo;Action for Green รักษ์โลกให้เรียนรู้&rdquo; โดยรวบรวมความรู้และความสนุกมาไว้ถึง 16 จุด เช่น ยานยนต์ไฟฟ้า (EV Car) ซึ่งผู้เข้าชมจะได้พบกับชุดประกอบรถไฟฟ้าดัดแปลงที่จะเปลี่ยนรถยนต์เก่าให้เป็นรถไฟฟ้าในต้นทุนไม่เกิน 2 แสนบาท เยี่ยมชม EGAT Green Building ภายในอาคาร ท.103 ซึ่งเป็นอาคารอนุรักษ์พลังงานที่ออกแบบตามมาตรฐาน LEED ของประเทศสหรัฐอเมริกา ให้ประหยัดพลังงาน ช่วยลดความร้อนเข้าสู่ตัวอาคาร นอกจากนี้ภายในนิทรรศการได้ยกความสวยงามจากกังหันลมลำตะคองที่ใช้ผลิตไฟฟ้าจากบนยอดเขายายเที่ยง จ.นครราชสีมา มาไว้บนหน้าจอเสมือนไปเยือนด้วยตาตนเอง รวมถึงโครงการพลังงานแสงอาทิตย์ทุ่นลอยน้ำแบบไฮบริดที่ใหญ่ที่สุดในโลกจากเขื่อนสิรินธร จ.อุบลราชธานี ซึ่งผสมผสานการผลิตไฟฟ้าจากโซลาร์เซลล์ลอยน้ำและพลังน้ำจากเขื่อน ช่วยเสริมความมั่นคงกับการผลิตไฟฟ้าจากพลังงานหมุนเวียน ทั้งนี้ หากเยี่ยมชมนิทรรศการครบทุกจุดระหว่างวันที่ 5-12 มิถุนายน 2563 ยังสามารถลุ้นรับของรางวัลได้อีกด้วย โดยผู้ที่สนใจสามารถเข้าชมนิทรรศการได้ทาง https://e-exhibition.egat.co.th/</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&ldquo;กฟผ. เชื่อมั่นว่า การอนุรักษ์พลังงานเป็นการเรียนรู้ที่ไม่สิ้นสุด ทุกคนสามารถเริ่มได้ที่ตนเองโดยปรับตัวตามวิถีแนวทางใหม่ ซึ่งตลอดระยะเวลา 51 ปี กฟผ. ดำเนินกิจการโดยคำนึงถึงสิ่งแวดล้อมและคุณภาพชีวิตของชุมชนเป็นหลัก และในวิกฤตโควิด-19 นี้ กฟผ. ขอเป็นส่วนหนึ่งในการขับเคลื่อนสังคมด้วยกิจกรรมต่าง ๆที่สร้างสรรค์ขึ้นมาภายใต้แคมเปญ &ldquo;Stop COVID Fast Restart Faster หยุดได้ไว เริ่มใหม่ได้เร็ว&rdquo;</p>', 'stop-covid', 1, 0, 'http://faculty-ku.local/storage/source', '\\1\\Ua0hP92z4Xt82DLC54-UN3iJp6gLx5j-.jpg', 1, 1, NULL, 1592895803, 1620099271, '');
INSERT INTO `news` VALUES (12, 3, 'Self-Service Kiosk Touch Screen 17\" 21\" 32\" (ขนาดตามต้องการ) ทนทานจากการใช้งานจริง ราคาพิเศษทุกรุ่น (จำนวนจำกัด) ', 'จำหน่ายและรับพัฒนาระบบ Self-Service Application \r\nตามความต้องการและระบบงานมาตรฐาน \r\nลูกค้าให้การยอมรับ ประสบการณ์กว่า 10 ปี\r\nเครื่องให้บริการอัตโนมัติ Touch Screen และ เครื่องพิมพ์บัตรคิว/สลิป\r\n', '<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\">จำหน่ายและรับพัฒนาระบบ Self-Service Application</div>\r\n<div dir=\"auto\">ตามความต้องการและระบบงานมาตรฐาน</div>\r\n<div dir=\"auto\">ลูกค้าให้การยอมรับ ประสบการณ์กว่า 10 ปี</div>\r\n</div>\r\n<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">เครื่องให้บริการอัตโนมัติ Touch Screen และ เครื่องพิมพ์บัตรคิว/สลิป</div>\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\">Specification</div>\r\n<div dir=\"auto\">&nbsp; -Touch Screen 17\" 21\" 32\" นิ้ว</div>\r\n<div dir=\"auto\">&nbsp; -เครื่องอ่านบัตรประชาชน (Option)</div>\r\n<div dir=\"auto\">&nbsp; -เครื่องอ่าน QR Code</div>\r\n<div dir=\"auto\">&nbsp; -Windows OS</div>\r\n<div dir=\"auto\">อีกบริการงานสั่งผลิตพิเศษ เพื่อการใช้งานเฉพาะทาง</div>\r\n<div dir=\"auto\">อำนวยความสะดวกผู้ให้บริการ</div>\r\n</div>', 'hardware', 8, 1, 'http://faculty-ku.local/storage/source', '\\1\\INRANdIY2BRmRWHvfNaS9Bg2iMmhnuTd.png', 1, 1, NULL, 1620098567, 1620276092, '');

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
  `ref_attribute` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_attachment_article`(`news_id`) USING BTREE,
  INDEX `order`(`order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_attachment
-- ----------------------------
INSERT INTO `news_attachment` VALUES (1, 1, '\\1\\4hEabon70KqzOP7bE8tZBmPJn7n0Ia5E.pdf', 'http://storage.yii2-starter-kit.localhost/source', 'application/pdf', 143329, 'ใบเสนอราคา QO-2019092100013.pdf', 1572518992, NULL, NULL);
INSERT INTO `news_attachment` VALUES (2, 2, '\\1\\sByxviz0RXHEb2TxogTHDXVAL4wrpyzC.pdf', 'http://storage.yii2-starter-kit.localhost/source', 'application/pdf', 90911, '8D22851E12DC4EF7BCB6EA360BF12B8A.pdf', 1592055221, NULL, NULL);
INSERT INTO `news_attachment` VALUES (4, 2, '\\1\\t-CvlOvVoUVXHaOssTRhhDOhTvD6vutC.pdf', 'http://storage.yii2-starter-kit.localhost/source', 'application/pdf', 4916323, '20190211MOPH Connect &amp; Smart Q Concept.pdf', 1592055288, NULL, NULL);
INSERT INTO `news_attachment` VALUES (5, 5, '\\1\\7hIM8aoBJl0JIEHkXr3QHy31tBxWCTjb.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 275900, '4.1 webservice_0.pdf', 1592061156, NULL, NULL);
INSERT INTO `news_attachment` VALUES (6, 5, '\\1\\d_5N-RCuec_ZPE4egbSI9D5bFq49U1Ta.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 341790, '4.2  MOPH Connect api.pdf', 1592061156, NULL, NULL);
INSERT INTO `news_attachment` VALUES (7, 5, '\\1\\ocReeYvtI1ZD23p9XPzGK8jETYqvEoq2.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 1576623, '5. Decha WEB VIEW_edit.pdf', 1592061156, NULL, NULL);
INSERT INTO `news_attachment` VALUES (8, 5, '\\1\\Bkqv_yVRJlIyBEKEDH8SXJ2BPcsQWs01.xlsx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 9892, 'user-import.xlsx', 1592130685, NULL, NULL);
INSERT INTO `news_attachment` VALUES (9, 5, '\\1\\ZKKoZ8W8P8vRAcNN-Hj-LyiA2ltgc73j.docx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 16506, '19 - งานบิล.docx', 1592130685, NULL, NULL);
INSERT INTO `news_attachment` VALUES (10, 5, '\\1\\DWMzrPLB83zFFuSPBZEC9XvO9WjtZgGI.pptx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 743515, 'หัวข้อการทดสอบระบบ_mobile_app_01.pptx', 1592130685, NULL, NULL);
INSERT INTO `news_attachment` VALUES (13, 8, '\\1\\PGSjO5ggdNWxLeoLxMiwF2W1Eo47mBkk.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 105265, 'anyConnect-manual.pdf', 1598844476, NULL, NULL);
INSERT INTO `news_attachment` VALUES (14, 11, '\\1\\MB7OkVhwfCcQtehH5a_zf_TldPlfPbq3.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 105265, 'anyConnect-manual.pdf', 1598844636, NULL, NULL);
INSERT INTO `news_attachment` VALUES (15, 10, '\\1\\do3nhb4ywbUsb8LR29TZsdDnKySSJDOc.docx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15888, 'สร้างรายการ.docx', 1605085889, NULL, NULL);
INSERT INTO `news_attachment` VALUES (16, 10, '\\1\\JuEkqFxFCW6GdLt812Dtyut8BSThNoq_.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 369444, 'connect web เกษตร.pdf', 1605085889, NULL, NULL);
INSERT INTO `news_attachment` VALUES (17, 10, '\\1\\l-6zBg609W4EUwS8HU2oaczSNL8gz5Po.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 272358, 'API ฝ่ายแพทย์และอนามัย_v2_27Feb2020.pdf', 1605085889, NULL, NULL);
INSERT INTO `news_attachment` VALUES (18, 10, '\\1\\hKkuy4RClugk4hJL1WWNWCPZr3f2qr_U.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 302289, 'glide (4).jpg', 1605088244, NULL, 'photo');
INSERT INTO `news_attachment` VALUES (19, 10, '\\1\\J5Zc8KZMyKZSxnTqmoS8TfuA4dNJLnWZ.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 377947, 'glide (3).jpg', 1605088244, NULL, 'photo');
INSERT INTO `news_attachment` VALUES (20, 10, '\\1\\xkrbuIrIRUf4oIS65uj2NixmaGyt7QGs.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 370760, 'glide (2).jpg', 1605088244, NULL, 'photo');
INSERT INTO `news_attachment` VALUES (21, 10, '\\1\\rq0CeMc6Iy4qgxB-8s3HXqJxIz4KU73T.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 287765, 'glide (1).jpg', 1605088244, NULL, 'photo');
INSERT INTO `news_attachment` VALUES (22, 10, '\\1\\tLbvGyGE733ynnFTKc95QL_LAJAKwV7O.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 308334, 'glide.jpg', 1605088244, NULL, 'photo');
INSERT INTO `news_attachment` VALUES (27, 12, '\\1\\NZOMf4hLwKv3baDcs6D843mn8c-K1pej.png', 'http://faculty-ku.local/storage/source', 'image/png', 692481, 'test2.png', 1620276092, NULL, 'photo');
INSERT INTO `news_attachment` VALUES (28, 12, '\\1\\c3acXuAxU0EnzDrRxdPFKKufeLn0vgZt.png', 'http://faculty-ku.local/storage/source', 'image/png', 622806, 'test3.png', 1620276092, NULL, 'photo');
INSERT INTO `news_attachment` VALUES (29, 12, '\\1\\Mt_MET0kJI8Emxv1ys-5wMlr1MeOM8Gf.png', 'http://faculty-ku.local/storage/source', 'image/png', 675384, 'test4.png', 1620276092, NULL, 'photo');
INSERT INTO `news_attachment` VALUES (30, 12, '\\1\\krk0VreLd3HYQFfqfw-CMAVYZe1bPI6o.png', 'http://faculty-ku.local/storage/source', 'image/png', 659495, 'test5.png', 1620276092, NULL, 'photo');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_categories
-- ----------------------------
INSERT INTO `news_categories` VALUES (1, 'queuesystem', 'ระบบจัดการคิว', 'far fa-newspaper', NULL, 1, 1572518477, 1620103515, 1);
INSERT INTO `news_categories` VALUES (3, 'hardware', 'อุปกรณ์ระบบคิว', 'fab fa-airbnb', NULL, 1, 1592055764, 1620098156, 2);
INSERT INTO `news_categories` VALUES (5, 'news', 'ทดสอบ', 'fab fa-adversal', NULL, 0, 1620098198, 1620098198, 3);

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
INSERT INTO `pages` VALUES (3, 'page-events', 'กิจกรรม', '<p>กิจกรรม</p>', '', 1, NULL, 1619666790);
INSERT INTO `pages` VALUES (4, 'activity', 'ตารางกิจกรรม', '<p style=\"text-align: center;\">กิจกรรมของคณะ</p>', 'calendar', 1, NULL, 1619666791);
INSERT INTO `pages` VALUES (5, 'coming-soon', 'Coming soon', '<h2 style=\"text-align: center;\"><strong>...</strong></h2>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 272px; top: 63.6px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', '', 1, NULL, 1592050337);
INSERT INTO `pages` VALUES (6, 'page-news', 'Product and Service', '<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\"><span class=\"h5\">จำหน่ายและรับพัฒนาระบบ Self-Service Application</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">ตามความต้องการและระบบงานมาตรฐาน</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">ลูกค้าให้การยอมรับ ประสบการณ์กว่า 10 ปี</span></div>\r\n</div>\r\n<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\"><span class=\"h5\">เครื่องให้บริการอัตโนมัติ Touch Screen และ เครื่องพิมพ์บัตรคิว/สลิป</span></div>\r\n<div dir=\"auto\">&nbsp;</div>\r\n<div dir=\"auto\"><span class=\"h5\">Specification</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">&nbsp; -Touch Screen 17\" 21\" 32\" นิ้ว</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">&nbsp; -เครื่องอ่านบัตรประชาชน (Option)</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">&nbsp; -เครื่องอ่าน QR Code</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">&nbsp; -Windows OS</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">อีกบริการงานสั่งผลิตพิเศษ เพื่อการใช้งานเฉพาะทาง</span></div>\r\n<div dir=\"auto\"><span class=\"h5\">อำนวยความสะดวกผู้ให้บริการ</span></div>\r\n</div>', '', 1, NULL, 1620275967);
INSERT INTO `pages` VALUES (7, 'technology', 'โปรเจคและงาน', '<section class=\"about-lists\">\r\n<div class=\"container aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n<div class=\"section-title\">\r\n<h2>Technology</h2>\r\n</div>\r\n<div class=\"row no-gutters\">\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init aos-animate\" data-aos=\"fade-up\">01\r\n<h4 style=\"color: gray;\">ให้คำปรึกษาเรื่องระบบ Queue System&nbsp;</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"100\">02\r\n<h4 style=\"color: gray;\">ออกแบบ Web&amp;Application</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"200\">03\r\n<h4 style=\"color: gray;\">จัดหาติดตั้งระบบ และอุปกรณ์</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"300\">04\r\n<h4 style=\"color: gray;\">บริการ Service หลังการขาย</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"400\">05\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"500\">06\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"600\">07\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"700\">08\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n<div class=\"col-lg-4 col-md-6 content-item aos-init\" data-aos=\"fade-up\" data-aos-delay=\"800\">09\r\n<h4 style=\"color: gray;\">a</h4>\r\n</div>\r\n</div>\r\n</div>\r\n</section>', '', 1, NULL, 1620276015);
INSERT INTO `pages` VALUES (8, 'department', 'งานบริการวิชาการ', '<section id=\"about\" class=\"about\">\r\n<div class=\"container\">\r\n<div class=\"row no-gutters\">\r\n<div class=\"col-lg-6 video-box\" style=\"text-align: center;\">Andaman Pattana</div>\r\n<div class=\"col-lg-6 video-box\" style=\"text-align: center;\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</section>', '', 1, NULL, 1620110219);
INSERT INTO `pages` VALUES (9, 'contact', 'ติดต่อเรา', '<p style=\"text-align: center;\">ติดต่อเรา</p>', 'contact', 1, NULL, 1592047012);
INSERT INTO `pages` VALUES (10, 'masterscience', 'หลักสูตร วท.ม-เทคโนโลยีระบบเกษตร', '<p class=\"text-left\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong>หลักสูตรวิทยาศาสตรมหาบัณฑิต</strong>&nbsp;สาขาวิชาเทคโนโลยีระบบเกษตร มุ่งให้การศึกษา และส่งเสริมความรู้ด้านเทคโนโลยีระบบเกษตร เพื่อนำไปสู่การบูรณาการเทคโนโลยีที่ทันสมัยในระบบเกษตรจากการผลิตสู่การแปรรูป ประยุกต์ใช้เทคโนโลยีเครื่องจักรกลที่เหมาะสมเพื่อขยายการผลิต เสริมสร้างคุณภาพผลผลิตเกษตรด้วยเทคโนโลยีและการจัดการ มุ่งผลิตมหาบัณฑิตที่มีความรู้ และสามารถทำการวิจัยขั้นสูงทางเทคโนโลยีเครื่องจักรกล และเทคโนโลยีอื่นที่เกี่ยวข้องในระบบเกษตร ได้แก่ เทคโนโลยีที่ทันสมัยในระบบเกษตร การจัดการทรัพยากรดินและน้ำเพื่อการเกษตร การจัดการโรงเรือนทางการเกษตร เทคโนโลยีหลังการเก็บเกี่ยวและการแปรสภาพ การจัดการโลจิสติกส์และวิศวกรรมระบบเกษตร เทคโนโลยีสารสนเทศและการตัดสินใจ และการจัดการพลังงานในระบบเกษตร ซึ่งสามารถนำองค์ความรู้ที่ได้ไปใช้ในการแก้ไขปัญหาในระบบการผลิตทางการเกษตรได้อย่างมีกระบวนการและเป็นระบบ</p>\r\n<div>\r\n<h5 class=\"text-left\">ข้อมูลเพิ่มเติม</h5>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3%20%E0%B8%A7%E0%B8%97%E0%B8%A1%20%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%95%E0%B8%A3.pdf\" target=\"_blank\" rel=\"noopener\"><u>หลักสูตร วท.ม เทคโนโลยีระบบเกษตร !&nbsp;<em class=\"tiny material-icons dp48\">file_download</em></u></a></p>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B9%81%E0%B8%9C%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2%20%E0%B8%9B%20%E0%B9%82%E0%B8%97.pdf\" target=\"_blank\" rel=\"noopener\"><u>แผนการศึกษา !&nbsp;<em class=\"tiny material-icons dp48\">file_download</em></u></a></p>\r\n</div>', '', 0, NULL, 1620097104);
INSERT INTO `pages` VALUES (11, 'curriculum', 'หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร', '<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; หลักสูตรวิทยาศาสตรบัณฑิต</strong>&nbsp;สาขาวิชาเทคโนโลยีระบบเกษตร มุ่งผลิตบัณฑิตที่มีความรู้ทางด้านเทคโนโลยีเครื่องจักรกลเกษตร และเทคโนโลยีที่เกี่ยวข้อง ได้แก่ เทคโนโลยีการให้น้ำเพื่อการเกษตร เทคโนโลยีหลังการเก็บเกี่ยวและการแปรสภาพ ระบบควบคุมอัจฉริยะทางการเกษตร เทคโนโลยีสารสนเทศและการตัดสินใจ อากาศยานไร้คนขับเพื่อการเกษตร การจัดการโลจิสติกส์ ห่วงโซ่อุปทาน และห่วงโซ่คุณค่า เกษตรอินทรีย์ และพลังงานในระบบเกษตร เป็นต้น เพื่อเป็นนักเทคโนโลยีระบบเกษตร ที่สามารถนำองค์ความรู้ที่ได้ไปประยุกต์ใช้เพื่อการจัดการและแก้ไขปัญหาทางด้านการผลิตทางการเกษตรได้อย่างเป็นระบบ</p>\r\n<p><a href=\"https://agr-ku.netlify.app/assets/img/curriculum1.jpg\" data-fancybox=\"gallery\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://agr-ku.netlify.app/assets/img/curriculum1.jpg\" alt=\"\" width=\"1070\" height=\"763\" /></a></p>\r\n<p style=\"text-align: center;\"><a href=\"https://agr-ku.netlify.app/assets/img/curriculum2.jpg\" data-fancybox=\"gallery\"><img src=\"https://agr-ku.netlify.app/assets/img/curriculum2.jpg\" alt=\"\" width=\"1070\" height=\"767\" /></a></p>\r\n<h5 class=\"text-left\">ข้อมูลเพิ่มเติม</h5>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3-%E0%B8%A7%E0%B8%97%E0%B8%9A-%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%9A%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%95%E0%B8%A3.pdf\" target=\"_blank\" rel=\"noopener\">รายละเอียดหลักสูตร วท.บ-เทคโนโลยีระบบเกษตร !</a></p>\r\n<p class=\"text-left\"><a href=\"https://agr-ku.netlify.app/assets/files/%E0%B9%81%E0%B8%9C%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2%E0%B8%95%E0%B8%A5%E0%B8%AD%E0%B8%94%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B0%E0%B9%80%E0%B8%A7%E0%B8%A5%E0%B8%B2%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B9%E0%B8%95%E0%B8%A3-4%E0%B8%9B%E0%B8%B5.pdf\" target=\"_blank\" rel=\"noopener\">แผนการศึกษา !</a></p>', '', 0, NULL, 1619663026);
INSERT INTO `pages` VALUES (12, 'about', 'เกี่ยวกับเรา', '<p>ห้างหุ้นส่วนจำกัด เป็นบริษัทที่รับทำระบบ Queue System ,Web Service,ระบบ LED ฯลฯxxxxxxxxxxxxxxx</p>', '', 1, 1592032697, 1620097701);

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
  `usertype_id` int(11) NULL DEFAULT NULL COMMENT 'ประเภทผู้ใช้งาน',
  `user_profile_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'หมายเลขประจำตัว',
  `user_course` int(11) NULL DEFAULT NULL COMMENT 'หลักสูตร',
  `user_department` int(11) NULL DEFAULT NULL COMMENT 'ภาควิชา',
  `user_faculty` int(11) NULL DEFAULT NULL COMMENT 'คณะ',
  `user_sex_id` int(11) NULL DEFAULT NULL COMMENT 'เพศ',
  `user_title_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'User Title Name',
  `user_academicprostion_id` int(11) NULL DEFAULT NULL COMMENT 'User Academicprostion Id',
  `user_fname_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'User Fname Th',
  `user_lname_th` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'User Lname Th',
  `user_fname_eng` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'User Fname Eng',
  `user_lname_eng` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'User Lname Eng',
  `user_birthdate` date NULL DEFAULT NULL COMMENT 'ว/ด/ปี เกิด',
  `user_province_id` int(11) NULL DEFAULT NULL COMMENT 'จังหวัด',
  `user_country_id` int(11) NULL DEFAULT NULL COMMENT 'ประเทศ',
  `user_nationality_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'สัญชาติ',
  `user_race_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'เชื้อชาติ',
  `user_religion_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ศาสนา',
  `user_position_id` int(4) NULL DEFAULT NULL COMMENT 'รหัสตำแหน่ง',
  `user_specialist` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ความเชี่ยวชาญ',
  `user_parentid` int(11) NULL DEFAULT NULL COMMENT 'อยู่ภายใต้',
  `user_order` int(11) NULL DEFAULT NULL COMMENT 'ลำดับ',
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, 'Tanakorn Phompak', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', 'Asia/Bangkok', '\\1\\2HG5vyQUvejtNsNNe6tdLzxJYhOpLtE8.png', 'http://faculty-ku.local/storage/source', 7, '543120100207', 1, 1, 1, NULL, '4', NULL, 'รัชฎา', 'นาไชยธง', 'ratchada', 'nachaitong', '2020-09-06', NULL, 80, '3', '3', '3', 1, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (2, 'ประชาสัมพันธ์', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', NULL, NULL, NULL, 2, '123456', 2, 1, 1, NULL, '4', NULL, 'ทดสอบระบบ', 'ทดสอบ', 'test', 'test2', '2020-09-14', NULL, 5, '1', '1', '3', 5, NULL, NULL, 2);
INSERT INTO `profile` VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `PROVINCE_ID` int(5) NOT NULL AUTO_INCREMENT,
  `PROVINCE_CODE` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PROVINCE_NAME` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GEO_ID` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`PROVINCE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1, '10', 'กรุงเทพมหานคร   ', 2);
INSERT INTO `province` VALUES (2, '11', 'สมุทรปราการ   ', 2);
INSERT INTO `province` VALUES (3, '12', 'นนทบุรี   ', 2);
INSERT INTO `province` VALUES (4, '13', 'ปทุมธานี   ', 2);
INSERT INTO `province` VALUES (5, '14', 'พระนครศรีอยุธยา   ', 2);
INSERT INTO `province` VALUES (6, '15', 'อ่างทอง   ', 2);
INSERT INTO `province` VALUES (7, '16', 'ลพบุรี   ', 2);
INSERT INTO `province` VALUES (8, '17', 'สิงห์บุรี   ', 2);
INSERT INTO `province` VALUES (9, '18', 'ชัยนาท   ', 2);
INSERT INTO `province` VALUES (10, '19', 'สระบุรี', 2);
INSERT INTO `province` VALUES (11, '20', 'ชลบุรี   ', 5);
INSERT INTO `province` VALUES (12, '21', 'ระยอง   ', 5);
INSERT INTO `province` VALUES (13, '22', 'จันทบุรี   ', 5);
INSERT INTO `province` VALUES (14, '23', 'ตราด   ', 5);
INSERT INTO `province` VALUES (15, '24', 'ฉะเชิงเทรา   ', 5);
INSERT INTO `province` VALUES (16, '25', 'ปราจีนบุรี   ', 5);
INSERT INTO `province` VALUES (17, '26', 'นครนายก   ', 2);
INSERT INTO `province` VALUES (18, '27', 'สระแก้ว   ', 5);
INSERT INTO `province` VALUES (19, '30', 'นครราชสีมา   ', 3);
INSERT INTO `province` VALUES (20, '31', 'บุรีรัมย์   ', 3);
INSERT INTO `province` VALUES (21, '32', 'สุรินทร์   ', 3);
INSERT INTO `province` VALUES (22, '33', 'ศรีสะเกษ   ', 3);
INSERT INTO `province` VALUES (23, '34', 'อุบลราชธานี   ', 3);
INSERT INTO `province` VALUES (24, '35', 'ยโสธร   ', 3);
INSERT INTO `province` VALUES (25, '36', 'ชัยภูมิ   ', 3);
INSERT INTO `province` VALUES (26, '37', 'อำนาจเจริญ   ', 3);
INSERT INTO `province` VALUES (27, '39', 'หนองบัวลำภู   ', 3);
INSERT INTO `province` VALUES (28, '40', 'ขอนแก่น   ', 3);
INSERT INTO `province` VALUES (29, '41', 'อุดรธานี   ', 3);
INSERT INTO `province` VALUES (30, '42', 'เลย   ', 3);
INSERT INTO `province` VALUES (31, '43', 'หนองคาย   ', 3);
INSERT INTO `province` VALUES (32, '44', 'มหาสารคาม   ', 3);
INSERT INTO `province` VALUES (33, '45', 'ร้อยเอ็ด   ', 3);
INSERT INTO `province` VALUES (34, '46', 'กาฬสินธุ์   ', 3);
INSERT INTO `province` VALUES (35, '47', 'สกลนคร   ', 3);
INSERT INTO `province` VALUES (36, '48', 'นครพนม   ', 3);
INSERT INTO `province` VALUES (37, '49', 'มุกดาหาร   ', 3);
INSERT INTO `province` VALUES (38, '50', 'เชียงใหม่   ', 1);
INSERT INTO `province` VALUES (39, '51', 'ลำพูน   ', 1);
INSERT INTO `province` VALUES (40, '52', 'ลำปาง   ', 1);
INSERT INTO `province` VALUES (41, '53', 'อุตรดิตถ์   ', 1);
INSERT INTO `province` VALUES (42, '54', 'แพร่   ', 1);
INSERT INTO `province` VALUES (43, '55', 'น่าน   ', 1);
INSERT INTO `province` VALUES (44, '56', 'พะเยา   ', 1);
INSERT INTO `province` VALUES (45, '57', 'เชียงราย   ', 1);
INSERT INTO `province` VALUES (46, '58', 'แม่ฮ่องสอน   ', 1);
INSERT INTO `province` VALUES (47, '60', 'นครสวรรค์   ', 2);
INSERT INTO `province` VALUES (48, '61', 'อุทัยธานี   ', 2);
INSERT INTO `province` VALUES (49, '62', 'กำแพงเพชร   ', 2);
INSERT INTO `province` VALUES (50, '63', 'ตาก   ', 4);
INSERT INTO `province` VALUES (51, '64', 'สุโขทัย   ', 2);
INSERT INTO `province` VALUES (52, '65', 'พิษณุโลก   ', 2);
INSERT INTO `province` VALUES (53, '66', 'พิจิตร   ', 2);
INSERT INTO `province` VALUES (54, '67', 'เพชรบูรณ์   ', 2);
INSERT INTO `province` VALUES (55, '70', 'ราชบุรี   ', 4);
INSERT INTO `province` VALUES (56, '71', 'กาญจนบุรี   ', 4);
INSERT INTO `province` VALUES (57, '72', 'สุพรรณบุรี   ', 2);
INSERT INTO `province` VALUES (58, '73', 'นครปฐม   ', 2);
INSERT INTO `province` VALUES (59, '74', 'สมุทรสาคร   ', 2);
INSERT INTO `province` VALUES (60, '75', 'สมุทรสงคราม   ', 2);
INSERT INTO `province` VALUES (61, '76', 'เพชรบุรี   ', 4);
INSERT INTO `province` VALUES (62, '77', 'ประจวบคีรีขันธ์   ', 4);
INSERT INTO `province` VALUES (63, '80', 'นครศรีธรรมราช   ', 6);
INSERT INTO `province` VALUES (64, '81', 'กระบี่   ', 6);
INSERT INTO `province` VALUES (65, '82', 'พังงา   ', 6);
INSERT INTO `province` VALUES (66, '83', 'ภูเก็ต   ', 6);
INSERT INTO `province` VALUES (67, '84', 'สุราษฎร์ธานี   ', 6);
INSERT INTO `province` VALUES (68, '85', 'ระนอง   ', 6);
INSERT INTO `province` VALUES (69, '86', 'ชุมพร   ', 6);
INSERT INTO `province` VALUES (70, '90', 'สงขลา   ', 6);
INSERT INTO `province` VALUES (71, '91', 'สตูล   ', 6);
INSERT INTO `province` VALUES (72, '92', 'ตรัง   ', 6);
INSERT INTO `province` VALUES (73, '93', 'พัทลุง   ', 6);
INSERT INTO `province` VALUES (74, '94', 'ปัตตานี   ', 6);
INSERT INTO `province` VALUES (75, '95', 'ยะลา   ', 6);
INSERT INTO `province` VALUES (76, '96', 'นราธิวาส   ', 6);
INSERT INTO `province` VALUES (77, '97', 'บึงกาฬ', 3);

-- ----------------------------
-- Table structure for race
-- ----------------------------
DROP TABLE IF EXISTS `race`;
CREATE TABLE `race`  (
  `race_id` int(5) NOT NULL AUTO_INCREMENT,
  `race_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'เชื้อชาติ',
  PRIMARY KEY (`race_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of race
-- ----------------------------
INSERT INTO `race` VALUES (1, 'โปรตุเกส');
INSERT INTO `race` VALUES (2, 'ดัตช์');
INSERT INTO `race` VALUES (3, 'เยอรมัน');
INSERT INTO `race` VALUES (4, 'ฝรั่งเศส');
INSERT INTO `race` VALUES (5, 'เดนมาร์ก');
INSERT INTO `race` VALUES (6, 'สวีเดน');
INSERT INTO `race` VALUES (7, 'สวิส');
INSERT INTO `race` VALUES (8, 'อิตาลี');
INSERT INTO `race` VALUES (9, 'นอร์เวย์');
INSERT INTO `race` VALUES (10, 'ออสเตรีย');
INSERT INTO `race` VALUES (11, 'ไอริช');
INSERT INTO `race` VALUES (12, 'ฟินแลนด์');
INSERT INTO `race` VALUES (13, 'เบลเยียม');
INSERT INTO `race` VALUES (14, 'สเปน');
INSERT INTO `race` VALUES (15, 'รัสเซีย');
INSERT INTO `race` VALUES (16, 'โปแลนด์');
INSERT INTO `race` VALUES (17, 'เช็ก');
INSERT INTO `race` VALUES (18, 'ฮังการี');
INSERT INTO `race` VALUES (19, 'กรีก');
INSERT INTO `race` VALUES (20, 'ยูโกสลาฟ');
INSERT INTO `race` VALUES (21, 'ลักเซมเบิร์ก');
INSERT INTO `race` VALUES (22, 'วาติกัน');
INSERT INTO `race` VALUES (23, 'มอลตา');
INSERT INTO `race` VALUES (24, 'ลีซู');
INSERT INTO `race` VALUES (25, 'บัลแกเรีย');
INSERT INTO `race` VALUES (26, 'โรมาเนีย');
INSERT INTO `race` VALUES (27, 'ไซปรัส');
INSERT INTO `race` VALUES (28, 'อเมริกัน');
INSERT INTO `race` VALUES (29, 'แคนาดา');
INSERT INTO `race` VALUES (30, 'เม็กซิโก');
INSERT INTO `race` VALUES (31, 'คิวบา');
INSERT INTO `race` VALUES (32, 'อาร์เจนตินา');
INSERT INTO `race` VALUES (33, 'บราซิล');
INSERT INTO `race` VALUES (34, 'ชิลี');
INSERT INTO `race` VALUES (35, 'อาข่า');
INSERT INTO `race` VALUES (36, 'โคลัมเบีย');
INSERT INTO `race` VALUES (37, 'ลั๊ว');
INSERT INTO `race` VALUES (38, 'เปรู');
INSERT INTO `race` VALUES (39, 'ปานามา');
INSERT INTO `race` VALUES (40, 'อุรุกวัย');
INSERT INTO `race` VALUES (41, 'เวเนซุเอลา');
INSERT INTO `race` VALUES (42, 'เปอร์โตริโก้');
INSERT INTO `race` VALUES (43, 'จีน');
INSERT INTO `race` VALUES (44, 'อินเดีย');
INSERT INTO `race` VALUES (45, 'เวียดนาม');
INSERT INTO `race` VALUES (46, 'ญี่ปุ่น');
INSERT INTO `race` VALUES (47, 'พม่า');
INSERT INTO `race` VALUES (48, 'ฟิลิปปิน');
INSERT INTO `race` VALUES (49, 'มาเลเซีย');
INSERT INTO `race` VALUES (50, 'อินโดนีเซีย');
INSERT INTO `race` VALUES (51, 'ปากีสถาน');
INSERT INTO `race` VALUES (52, 'เกาหลีใต้');
INSERT INTO `race` VALUES (53, 'สิงคโปร์');
INSERT INTO `race` VALUES (54, 'เนปาล');
INSERT INTO `race` VALUES (55, 'ลาว');
INSERT INTO `race` VALUES (56, 'กัมพูชา');
INSERT INTO `race` VALUES (57, 'ศรีลังกา');
INSERT INTO `race` VALUES (58, 'ซาอุดีอาระเบีย');
INSERT INTO `race` VALUES (59, 'อิสราเอล');
INSERT INTO `race` VALUES (60, 'เลบานอน');
INSERT INTO `race` VALUES (61, 'อิหร่าน');
INSERT INTO `race` VALUES (62, 'ตุรกี');
INSERT INTO `race` VALUES (63, 'บังกลาเทศ');
INSERT INTO `race` VALUES (64, 'ถูกถอนสัญชาติ');
INSERT INTO `race` VALUES (65, 'ซีเรีย');
INSERT INTO `race` VALUES (66, 'อิรัก');
INSERT INTO `race` VALUES (67, 'คูเวต');
INSERT INTO `race` VALUES (68, 'บรูไน');
INSERT INTO `race` VALUES (69, 'แอฟริกาใต้');
INSERT INTO `race` VALUES (70, 'กะเหรี่ยง');
INSERT INTO `race` VALUES (71, 'ลาหู่');
INSERT INTO `race` VALUES (72, 'เคนยา');
INSERT INTO `race` VALUES (73, 'อียิปต์');
INSERT INTO `race` VALUES (74, 'เอธิโอเปีย');
INSERT INTO `race` VALUES (75, 'ไนจีเรีย');
INSERT INTO `race` VALUES (76, 'สหรัฐอาหรับเอมิเรตส์');
INSERT INTO `race` VALUES (77, 'กินี');
INSERT INTO `race` VALUES (78, 'ออสเตรเลีย');
INSERT INTO `race` VALUES (79, 'นิวซีแลนด์');
INSERT INTO `race` VALUES (80, 'ปาปัวนิวกินี');
INSERT INTO `race` VALUES (81, 'ม้ง');
INSERT INTO `race` VALUES (82, 'เมี่ยน');
INSERT INTO `race` VALUES (83, 'จีนฮ่อ');
INSERT INTO `race` VALUES (84, 'จีน (อดีตทหารจีนคณะชาติ ,อดีตทหารจีนชาติ)');
INSERT INTO `race` VALUES (85, 'ผู้พลัดถิ่นสัญชาติพม่า');
INSERT INTO `race` VALUES (86, 'ผู้อพยพเชื้อสายจากกัมพูชา');
INSERT INTO `race` VALUES (87, 'ลาว (ลาวอพยพ)');
INSERT INTO `race` VALUES (88, 'เขมรอพยพ');
INSERT INTO `race` VALUES (89, 'ผู้อพยพอินโดจีนสัญชาติเวียดนาม');
INSERT INTO `race` VALUES (90, 'อื่นๆ');
INSERT INTO `race` VALUES (91, 'ไม่ได้สัญชาติไทย');
INSERT INTO `race` VALUES (92, 'ไทย');
INSERT INTO `race` VALUES (93, 'อัฟกัน');
INSERT INTO `race` VALUES (94, 'บาห์เรน');
INSERT INTO `race` VALUES (95, 'ภูฏาน');
INSERT INTO `race` VALUES (96, 'จอร์แดน');
INSERT INTO `race` VALUES (97, 'เกาหลีเหนือ');
INSERT INTO `race` VALUES (98, 'มัลดีฟ');
INSERT INTO `race` VALUES (99, 'มองโกเลีย');
INSERT INTO `race` VALUES (100, 'โอมาน');
INSERT INTO `race` VALUES (101, 'กาตาร์');
INSERT INTO `race` VALUES (102, 'เยเมน');
INSERT INTO `race` VALUES (103, 'หมู่เกาะฟิจิ');
INSERT INTO `race` VALUES (104, 'คิริบาส');
INSERT INTO `race` VALUES (105, 'นาอูรู');
INSERT INTO `race` VALUES (106, 'หมู่เกาะโซโลมอน');
INSERT INTO `race` VALUES (107, 'ตองก้า');
INSERT INTO `race` VALUES (108, 'ตูวาลู');
INSERT INTO `race` VALUES (109, 'วานูอาตู');
INSERT INTO `race` VALUES (110, 'ซามัว');
INSERT INTO `race` VALUES (111, 'แอลเบเนีย');
INSERT INTO `race` VALUES (112, 'อันดอร์รา');
INSERT INTO `race` VALUES (113, 'ไอซ์แลนด์');
INSERT INTO `race` VALUES (114, 'ลิกเตนสไตน์');
INSERT INTO `race` VALUES (115, 'โมนาโก');
INSERT INTO `race` VALUES (116, 'ซานมารีโน');
INSERT INTO `race` VALUES (117, 'บริติช  (อังกฤษ, สก็อตแลนด์)');
INSERT INTO `race` VALUES (118, 'แอลจีเรีย');
INSERT INTO `race` VALUES (119, 'แองโกลา');
INSERT INTO `race` VALUES (120, 'เบนิน');
INSERT INTO `race` VALUES (121, 'บอตสวานา');
INSERT INTO `race` VALUES (122, 'บูร์กินาฟาโซ');
INSERT INTO `race` VALUES (123, 'บุรุนดี');
INSERT INTO `race` VALUES (124, 'แคเมอรูน');
INSERT INTO `race` VALUES (125, 'เคปเวิร์ด');
INSERT INTO `race` VALUES (126, 'แอฟริกากลาง');
INSERT INTO `race` VALUES (127, 'ชาด');
INSERT INTO `race` VALUES (128, 'คอสตาริกา');
INSERT INTO `race` VALUES (129, 'คองโก');
INSERT INTO `race` VALUES (130, 'ไอโวเรี่ยน');
INSERT INTO `race` VALUES (131, 'จิบูตี');
INSERT INTO `race` VALUES (132, 'อิเควทอเรียลกินี');
INSERT INTO `race` VALUES (133, 'กาบอง');
INSERT INTO `race` VALUES (134, 'แกมเบีย');
INSERT INTO `race` VALUES (135, 'กานา');
INSERT INTO `race` VALUES (136, 'กินีบีสเซา');
INSERT INTO `race` VALUES (137, 'เลโซโท');
INSERT INTO `race` VALUES (138, 'ไลบีเรีย');
INSERT INTO `race` VALUES (139, 'ลิเบีย');
INSERT INTO `race` VALUES (140, 'มาลากาซี');
INSERT INTO `race` VALUES (141, 'มาลาวี');
INSERT INTO `race` VALUES (142, 'มาลี');
INSERT INTO `race` VALUES (143, 'มอริเตเนีย');
INSERT INTO `race` VALUES (144, 'มอริเชียส');
INSERT INTO `race` VALUES (145, 'โมร็อกโก');
INSERT INTO `race` VALUES (146, 'โมซัมบิก');
INSERT INTO `race` VALUES (147, 'ไนเจอร์');
INSERT INTO `race` VALUES (148, 'รวันดา');
INSERT INTO `race` VALUES (149, 'เซาโตเมและปรินซิเป');
INSERT INTO `race` VALUES (150, 'เซเนกัล');
INSERT INTO `race` VALUES (151, 'เซเชลส์');
INSERT INTO `race` VALUES (152, 'เซียร์ราลีโอน');
INSERT INTO `race` VALUES (153, 'โซมาลี');
INSERT INTO `race` VALUES (154, 'ซูดาน');
INSERT INTO `race` VALUES (155, 'สวาซี');
INSERT INTO `race` VALUES (156, 'แทนซาเนีย');
INSERT INTO `race` VALUES (157, 'โตโก');
INSERT INTO `race` VALUES (158, 'ตูนิเซีย');
INSERT INTO `race` VALUES (159, 'ยูกันดา');
INSERT INTO `race` VALUES (160, 'ซาอีร์');
INSERT INTO `race` VALUES (161, 'แซมเบีย');
INSERT INTO `race` VALUES (162, 'ซิมบับเว');
INSERT INTO `race` VALUES (163, 'แอนติกาและบาร์บูดา');
INSERT INTO `race` VALUES (164, 'บาฮามาส');
INSERT INTO `race` VALUES (165, 'บาร์เบโดส');
INSERT INTO `race` VALUES (166, 'เบลิซ');
INSERT INTO `race` VALUES (167, 'คอสตาริกา');
INSERT INTO `race` VALUES (168, 'โดมินิกา');
INSERT INTO `race` VALUES (169, 'โดมินิกัน');
INSERT INTO `race` VALUES (170, 'เอลซัลวาดอร์');
INSERT INTO `race` VALUES (171, 'เกรเนดา');
INSERT INTO `race` VALUES (172, 'กัวเตมาลา');
INSERT INTO `race` VALUES (173, 'เฮติ');
INSERT INTO `race` VALUES (174, 'ฮอนดูรัส');
INSERT INTO `race` VALUES (175, 'จาเมกา');
INSERT INTO `race` VALUES (176, 'นิการากัว');
INSERT INTO `race` VALUES (177, 'เซนต์คิตส์และเนวิส');
INSERT INTO `race` VALUES (178, 'เซนต์ลูเซีย');
INSERT INTO `race` VALUES (179, 'เซนต์วินเซนต์และเกรนาดีนส์');
INSERT INTO `race` VALUES (180, 'ตรินิแดดและโตเบโก');
INSERT INTO `race` VALUES (181, 'โบลีเวีย');
INSERT INTO `race` VALUES (182, 'เอกวาดอร์');
INSERT INTO `race` VALUES (183, 'กายอานา');
INSERT INTO `race` VALUES (184, 'ปารากวัย');
INSERT INTO `race` VALUES (185, 'ซูรินาเม');
INSERT INTO `race` VALUES (186, 'อาหรับ');
INSERT INTO `race` VALUES (187, 'คะฉิ่น');
INSERT INTO `race` VALUES (188, 'ว้า');
INSERT INTO `race` VALUES (189, 'ไทยใหญ่');
INSERT INTO `race` VALUES (190, 'ไทยลื้อ');
INSERT INTO `race` VALUES (191, 'ขมุ');
INSERT INTO `race` VALUES (192, 'ตองสู');
INSERT INTO `race` VALUES (193, 'ละว้า');
INSERT INTO `race` VALUES (194, 'ปะหร่อง');
INSERT INTO `race` VALUES (195, 'ถิ่น');
INSERT INTO `race` VALUES (196, 'ปะโอ');
INSERT INTO `race` VALUES (197, 'มอญ');
INSERT INTO `race` VALUES (198, 'มลาบรี');
INSERT INTO `race` VALUES (199, 'จีน (จีนฮ่ออิสระ)');
INSERT INTO `race` VALUES (200, 'จีน (จีนฮ่ออพยพ)');
INSERT INTO `race` VALUES (201, 'ยูเครน');
INSERT INTO `race` VALUES (202, 'จีน(ฮ่องกง)');
INSERT INTO `race` VALUES (203, 'จีน(ไต้หวัน)');
INSERT INTO `race` VALUES (204, 'โครเอเชีย');
INSERT INTO `race` VALUES (205, 'คาซัค');
INSERT INTO `race` VALUES (206, 'อาร์เมเนีย');
INSERT INTO `race` VALUES (207, 'อาเซอร์ไบจาน');
INSERT INTO `race` VALUES (208, 'จอร์เจีย');
INSERT INTO `race` VALUES (209, 'คีร์กีซ');
INSERT INTO `race` VALUES (210, 'ทาจิก');
INSERT INTO `race` VALUES (211, 'อุซเบก');
INSERT INTO `race` VALUES (212, 'หมู่เกาะมาร์แชลล์');
INSERT INTO `race` VALUES (213, 'ไมโครนีเซีย');
INSERT INTO `race` VALUES (214, 'ปาเลา');
INSERT INTO `race` VALUES (215, 'เบลารุส');
INSERT INTO `race` VALUES (216, 'บอสเนียและเฮอร์เซโกวีนา');
INSERT INTO `race` VALUES (217, 'เติร์กเมน');
INSERT INTO `race` VALUES (218, 'เอสโตเนีย');
INSERT INTO `race` VALUES (219, 'ลัตเวีย');
INSERT INTO `race` VALUES (220, 'ลิทัวเนีย');
INSERT INTO `race` VALUES (221, 'มาซิโดเนีย');
INSERT INTO `race` VALUES (222, 'มอลโดวา');
INSERT INTO `race` VALUES (223, 'สโลวัก');
INSERT INTO `race` VALUES (224, 'สโลวีน');
INSERT INTO `race` VALUES (225, 'เอริเทรีย');
INSERT INTO `race` VALUES (226, 'นามิเบีย');
INSERT INTO `race` VALUES (227, 'โบลิเวีย');
INSERT INTO `race` VALUES (228, 'หมู่เกาะคุก');
INSERT INTO `race` VALUES (229, 'เนปาล (เนปาลอพยพ)');
INSERT INTO `race` VALUES (230, 'มอญ  (ผู้พลัดถิ่นสัญชาติพม่า)');
INSERT INTO `race` VALUES (231, 'ไทยใหญ่  (ผู้พลัดถิ่นสัญชาติพม่า)');
INSERT INTO `race` VALUES (232, 'เวียดนาม  (ญวนอพยพ)');
INSERT INTO `race` VALUES (233, 'มาเลเชีย  (อดีต จีนคอมมิวนิสต์)');
INSERT INTO `race` VALUES (234, 'จีน  (อดีต จีนคอมมิวนิสต์)');
INSERT INTO `race` VALUES (235, 'สิงคโปร์  (อดีต จีนคอมมิวนิสต์)');
INSERT INTO `race` VALUES (236, 'กะเหรี่ยง  (ผู้หลบหนีเข้าเมือง)');
INSERT INTO `race` VALUES (237, 'มอญ  (ผู้หลบหนีเข้าเมือง)');
INSERT INTO `race` VALUES (238, 'ไทยใหญ่  (ผู้หลบหนีเข้าเมือง)');
INSERT INTO `race` VALUES (239, 'กัมพูชา  (ผู้หลบหนีเข้าเมือง)');
INSERT INTO `race` VALUES (240, 'มอญ  (ชุมชนบนพื้นที่สูง)');
INSERT INTO `race` VALUES (241, 'กะเหรี่ยง  (ชุมชนบนพื้นที่สูง)');
INSERT INTO `race` VALUES (242, 'ปาเลสไตน์');
INSERT INTO `race` VALUES (243, 'ติมอร์ตะวันออก');
INSERT INTO `race` VALUES (244, 'สละสัญชาติไทย');
INSERT INTO `race` VALUES (245, 'เซอร์เบีย แอนด์ มอนเตเนโกร');
INSERT INTO `race` VALUES (246, 'กัมพูชา(แรงงาน)');
INSERT INTO `race` VALUES (247, 'พม่า(แรงงาน)');
INSERT INTO `race` VALUES (248, 'ลาว(แรงงาน)');
INSERT INTO `race` VALUES (249, 'เซอร์เบียน');
INSERT INTO `race` VALUES (250, 'มอนเตเนกริน');
INSERT INTO `race` VALUES (251, 'บุคคลที่ไม่มีสถานะทางทะเบียน');
INSERT INTO `race` VALUES (252, 'ไม่ระบุ');

-- ----------------------------
-- Table structure for religion
-- ----------------------------
DROP TABLE IF EXISTS `religion`;
CREATE TABLE `religion`  (
  `religion_id` int(5) NOT NULL AUTO_INCREMENT,
  `religion_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ศาสนา',
  PRIMARY KEY (`religion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of religion
-- ----------------------------
INSERT INTO `religion` VALUES (1, 'พุทธศาสนา');
INSERT INTO `religion` VALUES (2, 'ศาสนาอิสลาม');
INSERT INTO `religion` VALUES (3, 'ศาสนาคริสต์');
INSERT INTO `religion` VALUES (4, 'ศาสนาพราหมณ์-ฮินดู');
INSERT INTO `religion` VALUES (5, 'ศาสนาซิกข์');

-- ----------------------------
-- Table structure for research_attachment
-- ----------------------------
DROP TABLE IF EXISTS `research_attachment`;
CREATE TABLE `research_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of research_attachment
-- ----------------------------

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
INSERT INTO `seotext` VALUES (28, 'common\\models\\Page', 12, 'เกี่ยวกับเรา', 'เกี่ยวกับเรา', '', '');
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
-- Table structure for tb_academicposition
-- ----------------------------
DROP TABLE IF EXISTS `tb_academicposition`;
CREATE TABLE `tb_academicposition`  (
  `user_academicpositionid` int(4) NOT NULL AUTO_INCREMENT,
  `user_academicposition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ตัวย่อตำแหน่งทางวิชาการ',
  `user_cademicposition_shortname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ตำแหน่งทางวิชาการ',
  PRIMARY KEY (`user_academicpositionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_academicposition
-- ----------------------------
INSERT INTO `tb_academicposition` VALUES (1, 'อาจารย์', 'อ.');
INSERT INTO `tb_academicposition` VALUES (2, 'ผู้ช่วยศาสตราจารย์ ย่อว่า ผศ.', 'ผศ.');
INSERT INTO `tb_academicposition` VALUES (3, 'รองศาสตราจารย์ ย่อว่า รศ.', 'รศ.');
INSERT INTO `tb_academicposition` VALUES (4, 'ศาสตราจารย์', 'ศ.');

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course`  (
  `course_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสหลักสูตร',
  `course_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อหลักสูตร',
  `department_id` int(11) NOT NULL COMMENT 'ภาควิชา',
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES (1, 'วท.บ-เทคโนโลยีระบบเกษตร', 1);
INSERT INTO `tb_course` VALUES (2, 'วท.ม-เทคโนโลยีระบบเกษตร', 2);

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department`  (
  `department_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสภาควิชา',
  `department_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อภาควิชา',
  `faculty_id` int(11) NOT NULL COMMENT 'คณะ',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES (1, 'Andaman DEV', 1);

-- ----------------------------
-- Table structure for tb_faculty
-- ----------------------------
DROP TABLE IF EXISTS `tb_faculty`;
CREATE TABLE `tb_faculty`  (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสคณะ',
  `faculty_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อคณะ',
  `u_id` int(11) NOT NULL COMMENT 'รหัสมหาวิทยาลัย',
  PRIMARY KEY (`faculty_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_faculty
-- ----------------------------
INSERT INTO `tb_faculty` VALUES (1, 'Andaman Pattana', 0);

-- ----------------------------
-- Table structure for tb_greduated_level
-- ----------------------------
DROP TABLE IF EXISTS `tb_greduated_level`;
CREATE TABLE `tb_greduated_level`  (
  `greduated_level_ids` int(11) NOT NULL AUTO_INCREMENT,
  `greduated_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ระดับการศึกษา',
  PRIMARY KEY (`greduated_level_ids`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_greduated_level
-- ----------------------------
INSERT INTO `tb_greduated_level` VALUES (1, 'มัธยมศึกษาตอนต้น');
INSERT INTO `tb_greduated_level` VALUES (2, 'มัธยมศึกษาตอนปลาย');
INSERT INTO `tb_greduated_level` VALUES (3, 'ประกาศนียบัตรวิชาชีพ (ปวช.)');
INSERT INTO `tb_greduated_level` VALUES (4, 'ประกาศนียบัตรวิชาชีพชั้นสูง (ปวส.)');
INSERT INTO `tb_greduated_level` VALUES (5, 'ปริญญาตรี');
INSERT INTO `tb_greduated_level` VALUES (6, 'ปริญญาโท');
INSERT INTO `tb_greduated_level` VALUES (7, 'ปริญญาเอก');

-- ----------------------------
-- Table structure for tb_research
-- ----------------------------
DROP TABLE IF EXISTS `tb_research`;
CREATE TABLE `tb_research`  (
  `research_id` int(11) NOT NULL AUTO_INCREMENT,
  `research_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ชื่องานวิจัย',
  `research_type_id` int(11) NOT NULL COMMENT 'ลักษณะงานวิจัย',
  `research_type_work_id` int(11) NOT NULL COMMENT 'ประเภทงานวิจัย',
  `research_year` int(11) NOT NULL COMMENT 'ปีที่พิมพ์',
  `research_date_begin` date NOT NULL COMMENT 'วันที่เริ่มทำ',
  `research_date_end` date NOT NULL COMMENT 'วันที่สื้นสุด',
  `research_status` int(11) NOT NULL COMMENT 'สถานะงานวิจัย',
  `research_detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'รายละเอียด',
  `research_type_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'สาขาวิจัยอื่นๆ',
  `research_type_work_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ประเภทงานวิจัยอื่นๆ',
  `created_by` int(11) NULL DEFAULT NULL COMMENT 'ผู้บันทึก',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT 'เวลาที่บันทึก',
  `updated_by` int(11) NULL DEFAULT NULL COMMENT 'ผู้แก้ไข',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT 'เวลาที่แก้ไข',
  PRIMARY KEY (`research_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_research
-- ----------------------------
INSERT INTO `tb_research` VALUES (1, 'ทดสอบระบบ', 10, 7, 2563, '2020-11-11', '2020-11-11', 1, 'บทคัดย่อ', 'test', NULL, 1, '2020-11-11 15:28:32', 1, '2020-11-23 17:13:11');
INSERT INTO `tb_research` VALUES (2, 'ทดสอบระบบ', 2, 1, 2560, '2020-11-24', '2020-11-24', 1, 'บทคัดย่อ', '', NULL, 1, '2020-11-24 15:19:42', 1, '2020-11-24 15:20:10');
INSERT INTO `tb_research` VALUES (3, 'ทดสอบ', 1, 1, 2560, '2020-12-07', '2020-12-07', 0, 'บทคัดย่อ\r\n', '', NULL, 1, '2020-12-07 10:28:22', 1, '2020-12-07 10:28:22');

-- ----------------------------
-- Table structure for tb_research_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tb_research_attachment`;
CREATE TABLE `tb_research_attachment`  (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) NOT NULL COMMENT 'รหัสงานวิจัย',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `ref_attribute` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`attachment_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_research_attachment
-- ----------------------------
INSERT INTO `tb_research_attachment` VALUES (4, 7, '\\1\\Lojc4_pDgdQjw0NwVjUuP3JcdqV2bMw-.pdf', 'http://faculty-ku.local/storage/source', 'application/pdf', 105265, 'anyConnect-manual.pdf', 1598786795, NULL, NULL);
INSERT INTO `tb_research_attachment` VALUES (5, 7, '\\1\\rfUJxu_Tr2bTnR365FSyhy13W-PBSFbG.xls', 'http://faculty-ku.local/storage/source', 'application/vnd.ms-excel', 10378, 'ตารางแพทย์ประจำสัปดาห์ (1).xls', 1598786795, NULL, NULL);
INSERT INTO `tb_research_attachment` VALUES (6, 8, '\\1\\c7CINEZWI4CUWrfZvAMtMCTfqbHNaM3B.xls', 'http://faculty-ku.local/storage/source', 'application/vnd.ms-excel', 10378, 'ตารางแพทย์ประจำสัปดาห์ (1).xls', 1598787779, NULL, NULL);
INSERT INTO `tb_research_attachment` VALUES (7, 8, '\\1\\nge-QwoXOygQ56ihOKJ5kggAQi0vjcHY.docx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 20813, 'ระบบจองคิวหรือนัดหมาย.docx', 1598787779, NULL, NULL);
INSERT INTO `tb_research_attachment` VALUES (17, 1, '\\1\\xdI3r-xO1Ov-2hHMVFn5IFDhBho2j0Y8.docx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 29614, 'AP_UAT_kubota_การเชื่อมต่อbooking.docx', 1606126391, NULL, 'attachments');
INSERT INTO `tb_research_attachment` VALUES (16, 1, '\\1\\lJjLp1OK9l__hrBR8hvxTP9GjDwUTjHX.png', 'http://faculty-ku.local/storage/source', 'image/png', 935516, 'Screenshot (3).png', 1606125726, NULL, 'photo');
INSERT INTO `tb_research_attachment` VALUES (18, 1, '\\1\\R_uNOjSMJnl0D2bSxRdkwe5Pz2UAGVxa.pptx', 'http://faculty-ku.local/storage/source', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 1592989, 'sdu_การเรียนการสอน.pptx', 1606126391, NULL, 'attachments');
INSERT INTO `tb_research_attachment` VALUES (19, 2, '\\1\\TG7e0PEdbtNsSWnHphCOiAJMxIcN3ZQX.jpg', 'http://faculty-ku.local/storage/source', 'image/jpeg', 341647, 'GLx5pTeR6VAURQArKI3dAOSOrzHkkpdk.jpg', 1606205982, NULL, 'photo');
INSERT INTO `tb_research_attachment` VALUES (20, 2, '\\1\\hhM28SWrTGve6g2fypUMI0OBBUSNTwFO.png', 'http://faculty-ku.local/storage/source', 'image/png', 936116, 'Screenshot (2).png', 1606205982, NULL, 'photo');

-- ----------------------------
-- Table structure for tb_research_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_research_type`;
CREATE TABLE `tb_research_type`  (
  `research_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `research_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ลักษณะงานวิจัย',
  PRIMARY KEY (`research_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_research_type
-- ----------------------------
INSERT INTO `tb_research_type` VALUES (1, 'รายกรณีการศึกษาเฉพาะกรณี');
INSERT INTO `tb_research_type` VALUES (2, 'วิจัยเชิงพรรณา');
INSERT INTO `tb_research_type` VALUES (3, 'วิจัยเชิงสำรวจ');
INSERT INTO `tb_research_type` VALUES (4, 'เชิงสหสัมพันธ์');
INSERT INTO `tb_research_type` VALUES (5, 'เชิงทำนาย');
INSERT INTO `tb_research_type` VALUES (6, 'เชิงเปรียบเทียบ');
INSERT INTO `tb_research_type` VALUES (7, 'รายกรณีการศึกษาเฉพาะกรณี');
INSERT INTO `tb_research_type` VALUES (8, 'เชิงพัฒนา');
INSERT INTO `tb_research_type` VALUES (9, 'เชิงทดลอง');
INSERT INTO `tb_research_type` VALUES (10, 'อื่นๆ ระบุ');

-- ----------------------------
-- Table structure for tb_research_type_copy1
-- ----------------------------
DROP TABLE IF EXISTS `tb_research_type_copy1`;
CREATE TABLE `tb_research_type_copy1`  (
  `research_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `research_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ลักษณะงานวิจัย',
  PRIMARY KEY (`research_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_research_type_copy1
-- ----------------------------
INSERT INTO `tb_research_type_copy1` VALUES (1, 'รายกรณีการศึกษาเฉพาะกรณี');
INSERT INTO `tb_research_type_copy1` VALUES (2, 'วิจัยเชิงพรรณา');
INSERT INTO `tb_research_type_copy1` VALUES (3, 'วิจัยเชิงสำรวจ');
INSERT INTO `tb_research_type_copy1` VALUES (4, 'เชิงสหสัมพันธ์');
INSERT INTO `tb_research_type_copy1` VALUES (5, 'เชิงทำนาย');
INSERT INTO `tb_research_type_copy1` VALUES (6, 'เชิงเปรียบเทียบ');
INSERT INTO `tb_research_type_copy1` VALUES (7, 'รายกรณีการศึกษาเฉพาะกรณี');
INSERT INTO `tb_research_type_copy1` VALUES (8, 'เชิงพัฒนา');
INSERT INTO `tb_research_type_copy1` VALUES (9, 'เชิงทดลอง');
INSERT INTO `tb_research_type_copy1` VALUES (10, 'อื่นๆ ระบุ');

-- ----------------------------
-- Table structure for tb_research_type_work
-- ----------------------------
DROP TABLE IF EXISTS `tb_research_type_work`;
CREATE TABLE `tb_research_type_work`  (
  `research_type_work_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภทผลงาน',
  `research_type_work_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ชื่อประเภทผลงาน',
  PRIMARY KEY (`research_type_work_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_research_type_work
-- ----------------------------
INSERT INTO `tb_research_type_work` VALUES (1, 'บทความวิชาการ');
INSERT INTO `tb_research_type_work` VALUES (2, 'บทความวิจัย');
INSERT INTO `tb_research_type_work` VALUES (3, 'หนังสือ ตำรา');
INSERT INTO `tb_research_type_work` VALUES (4, 'โครงการวิจัยประเมินภายนอก');
INSERT INTO `tb_research_type_work` VALUES (5, 'โครงร่างวิจัย');
INSERT INTO `tb_research_type_work` VALUES (6, 'งานวิจัยเสร็จเล่ม');
INSERT INTO `tb_research_type_work` VALUES (7, 'อื่นๆ');

-- ----------------------------
-- Table structure for tb_research_user_onus
-- ----------------------------
DROP TABLE IF EXISTS `tb_research_user_onus`;
CREATE TABLE `tb_research_user_onus`  (
  `researcher_name_ids` int(11) NOT NULL AUTO_INCREMENT,
  `research_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสงานวิจัย',
  `researcher_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ผู้ทำวิจัย',
  `researcher_onus_id` int(11) NOT NULL COMMENT 'ความรับผิดชอบ',
  PRIMARY KEY (`researcher_name_ids`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_research_user_onus
-- ----------------------------
INSERT INTO `tb_research_user_onus` VALUES (9, 10, '2', 1);
INSERT INTO `tb_research_user_onus` VALUES (8, 9, '3', 2);
INSERT INTO `tb_research_user_onus` VALUES (7, 9, '2', 1);
INSERT INTO `tb_research_user_onus` VALUES (11, 12, '2', 2);
INSERT INTO `tb_research_user_onus` VALUES (5, 10, '3', 1);
INSERT INTO `tb_research_user_onus` VALUES (6, 11, '3', 1);
INSERT INTO `tb_research_user_onus` VALUES (12, 1, '2', 1);
INSERT INTO `tb_research_user_onus` VALUES (13, 2, '2', 1);
INSERT INTO `tb_research_user_onus` VALUES (14, 3, '2', 1);

-- ----------------------------
-- Table structure for tb_researcher_onus
-- ----------------------------
DROP TABLE IF EXISTS `tb_researcher_onus`;
CREATE TABLE `tb_researcher_onus`  (
  `researcher_onus_id` int(11) NOT NULL AUTO_INCREMENT,
  `researcher_onus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`researcher_onus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_researcher_onus
-- ----------------------------
INSERT INTO `tb_researcher_onus` VALUES (1, 'รับผิดชอบหลัก');
INSERT INTO `tb_researcher_onus` VALUES (2, 'ร่วมวิจัย');
INSERT INTO `tb_researcher_onus` VALUES (3, 'ผู้ร่วมโครงการ');

-- ----------------------------
-- Table structure for tb_user_expertise
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_expertise`;
CREATE TABLE `tb_user_expertise`  (
  `user_expertise_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_expertise` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ความเชี่ยวชาญ',
  PRIMARY KEY (`user_expertise_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_expertise
-- ----------------------------
INSERT INTO `tb_user_expertise` VALUES (7, 1, 'การวิเคราะห์และออกแบบระบบ');
INSERT INTO `tb_user_expertise` VALUES (6, 1, 'ระบบสนับสนุนการตัดสินใจ');
INSERT INTO `tb_user_expertise` VALUES (5, 1, 'ระบบสารสนเทศเพื่อการจัดการ');
INSERT INTO `tb_user_expertise` VALUES (9, 4, '');

-- ----------------------------
-- Table structure for tb_user_greduated
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_greduated`;
CREATE TABLE `tb_user_greduated`  (
  `user_greduated_ids` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'เลขประจำตัวผู้ใช้งาน',
  `user_greduated_yr` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ปีจบการศึกษา(พ.ศ.)',
  `user_greduated_level` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ระดับการศึกษา',
  `user_greduated_degree` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'หลักสูตร',
  `user_greduated_major` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'สาขาวิชา',
  `user_greduated_educational` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'สถาบันการศึกษา',
  `user_greduated_country` int(5) NULL DEFAULT NULL COMMENT 'ประเทศ',
  `create_at` datetime(0) NULL DEFAULT NULL COMMENT 'วันที่บันทึก',
  `update_at` datetime(0) NULL DEFAULT NULL COMMENT 'วันที่แก้ไข',
  `user_gpa` decimal(4, 0) NULL DEFAULT NULL COMMENT 'เกรดเฉลี่ยสะสม',
  PRIMARY KEY (`user_greduated_ids`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_greduated
-- ----------------------------
INSERT INTO `tb_user_greduated` VALUES (1, 1, '2560', '1', 'วทบ', 'วิทยาการคอม', 'เกษตรศาสตร์', 5, NULL, '2020-09-07 16:49:49', 3);
INSERT INTO `tb_user_greduated` VALUES (2, 4, '', '', 'ทดสอบ', '', '', NULL, '2020-11-23 15:17:58', '2020-11-23 15:17:58', NULL);

-- ----------------------------
-- Table structure for tb_user_position
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_position`;
CREATE TABLE `tb_user_position`  (
  `user_position_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_position_parentid` int(11) NULL DEFAULT NULL,
  `user_position_order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_position
-- ----------------------------
INSERT INTO `tb_user_position` VALUES (1, 'คณบดี', NULL, NULL);
INSERT INTO `tb_user_position` VALUES (2, 'รองคณบดี', NULL, NULL);
INSERT INTO `tb_user_position` VALUES (3, 'ประธานหลักสูตร', NULL, NULL);
INSERT INTO `tb_user_position` VALUES (4, 'หัวหน้าสาขา', NULL, NULL);
INSERT INTO `tb_user_position` VALUES (5, 'ผู้ช่วยศาสตราจารย์', NULL, NULL);
INSERT INTO `tb_user_position` VALUES (6, 'อาจารย์ประจำภาควิชา', NULL, NULL);
INSERT INTO `tb_user_position` VALUES (7, 'หัวหน้าสำนักงาน', NULL, NULL);
INSERT INTO `tb_user_position` VALUES (8, 'เจ้าหน้าที่สำนักงาน', NULL, NULL);

-- ----------------------------
-- Table structure for tb_user_title_name
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_title_name`;
CREATE TABLE `tb_user_title_name`  (
  `user_title_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_title_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_sex_id` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`user_title_name_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_title_name
-- ----------------------------
INSERT INTO `tb_user_title_name` VALUES (1, 'ไม่ระบุ', NULL);
INSERT INTO `tb_user_title_name` VALUES (2, 'นาย', 1);
INSERT INTO `tb_user_title_name` VALUES (3, 'นาง', 2);
INSERT INTO `tb_user_title_name` VALUES (4, 'น.ส.', 2);
INSERT INTO `tb_user_title_name` VALUES (5, 'ด.ช.', 1);
INSERT INTO `tb_user_title_name` VALUES (6, 'ด.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (7, 'พญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (8, 'ท.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (9, 'ท.พ. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (10, 'ม.ญ.', 1);
INSERT INTO `tb_user_title_name` VALUES (11, 'ม.จ.', NULL);
INSERT INTO `tb_user_title_name` VALUES (12, 'คุณหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (13, 'พลทหาร', 1);
INSERT INTO `tb_user_title_name` VALUES (14, 'พลทหารหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (15, 'พลตำรวจ', 1);
INSERT INTO `tb_user_title_name` VALUES (16, 'พลตำรวจหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (17, 'ส.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (18, 'ส.ต. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (19, 'จ.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (20, 'จ.ต. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (21, 'ส.ต.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (22, 'ส.ต.ต. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (23, 'ส.ห.', 1);
INSERT INTO `tb_user_title_name` VALUES (24, 'ส.ท. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (25, 'จ.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (26, 'จ.ท. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (27, 'ส.ต.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (28, 'ส.ต.ท.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (29, 'ส.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (30, 'ส.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (31, 'จ.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (32, 'จ.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (33, 'ส.ต.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (34, 'ส.ต.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (35, 'จ.ส.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (36, 'จ.ส.ต.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (37, 'พ.จ.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (38, 'พ.จ.ต.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (39, 'พ.อ.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (40, 'พ.อ.ต.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (41, 'จ.ส.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (42, 'จ.ส.ท.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (43, 'พ.จ.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (44, 'พ.จ.ท.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (45, 'พ.อ.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (46, 'พ.อ.ท.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (47, 'ด.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (48, 'ด.ต.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (49, 'จ.ส.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (50, 'จ.ส.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (51, 'พ.จ.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (52, 'พ.จ.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (53, 'พ.อ.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (54, 'พ.อ.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (55, 'ร.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (56, 'ร.ต. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (57, 'นพ.', 1);
INSERT INTO `tb_user_title_name` VALUES (58, 'ร.ต.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (59, 'ร.ต.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (60, 'ร.ต.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (61, 'ร.ต.ต. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (62, 'ร.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (63, 'ร.ท.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (64, 'ร.ท.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (65, 'ร.ท.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (66, 'ร.ต.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (67, 'ร.ต.ท. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (68, 'ร.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (69, 'ร.อ. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (70, 'ร.อ.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (71, 'ร.อ.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (72, 'ร.ต.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (73, 'ร.ต.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (74, 'พ.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (75, 'พ.ต. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (76, 'น.ต.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (77, 'น.ต.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (78, 'น.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (79, 'น.ต. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (80, 'พ.ต.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (81, 'พ.ต.ต. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (82, 'พ.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (83, 'พ.ท. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (84, 'น.ท.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (85, 'น.ท.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (86, 'น.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (87, 'น.ท.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (88, 'พ.ต.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (89, 'พ.ต.ท. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (90, 'พ.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (91, 'พ.อ. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (92, 'น.อ.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (93, 'น.อ.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (94, 'น.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (95, 'น.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (96, 'พ.ต.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (97, 'พ.ต.อ. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (98, 'อื่นๆ', NULL);
INSERT INTO `tb_user_title_name` VALUES (99, 'พ.อ.(พิเศษ)', 1);
INSERT INTO `tb_user_title_name` VALUES (100, 'พ.อ.(พิเศษ)หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (101, 'น.อ.(พิเศษ)-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (102, 'น.อ.(พิเศษ)-หญิง-ร.น', 2);
INSERT INTO `tb_user_title_name` VALUES (103, 'น.อ.(พิเศษ)', 1);
INSERT INTO `tb_user_title_name` VALUES (104, 'น.อ.(พิเศษ)หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (105, 'พ.ต.อ.(พิเศษ)', 1);
INSERT INTO `tb_user_title_name` VALUES (106, 'พ.ต.อ.(พิเศษ)หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (107, 'พลจัตวา', 1);
INSERT INTO `tb_user_title_name` VALUES (108, 'พลจัตวาหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (109, 'พลเรือจัตวา', 1);
INSERT INTO `tb_user_title_name` VALUES (110, 'พลเรือจัตวาหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (111, 'พลอากาศจัตวา', 1);
INSERT INTO `tb_user_title_name` VALUES (112, 'พลอากาศจัตวาหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (113, 'พลตำรวจจัตวา', 1);
INSERT INTO `tb_user_title_name` VALUES (114, 'พลตำรวจจัตวาหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (115, 'พล.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (116, 'พล.ต.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (117, 'พล.ร.ต.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (118, 'พล.ร.ต.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (119, 'พล.อ.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (120, 'พล.อ.ต.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (121, 'พล.ต.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (122, 'พล.ต.ต.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (123, 'พล.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (124, 'พล.ท.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (125, 'พล.ร.ท.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (126, 'พล.ร.ท.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (127, 'พล.อ.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (128, 'พล.ต.ท.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (129, 'พล.ต.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (130, 'พล.ต.ท.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (131, 'พล.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (132, 'พล.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (133, 'พล.ร.อ.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (134, 'พล.ร.อ.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (135, 'พล.อ.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (136, 'พล.อ.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (137, 'พล.ต.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (138, 'พล.ต.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (139, 'จอมพล', 1);
INSERT INTO `tb_user_title_name` VALUES (140, 'จอมพลหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (141, 'จอมพลเรือ', 1);
INSERT INTO `tb_user_title_name` VALUES (142, 'จอมพลเรือหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (143, 'จอมพลอากาศ', 1);
INSERT INTO `tb_user_title_name` VALUES (144, 'จอมพลอากาศหญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (145, 'อ.ส.', 1);
INSERT INTO `tb_user_title_name` VALUES (146, 'อ.ส.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (147, 'ม.ล.', NULL);
INSERT INTO `tb_user_title_name` VALUES (148, 'ม.ร.ว.', 1);
INSERT INTO `tb_user_title_name` VALUES (149, 'ม.ร.ว. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (150, 'ศ.', NULL);
INSERT INTO `tb_user_title_name` VALUES (151, 'ร.ศ.', NULL);
INSERT INTO `tb_user_title_name` VALUES (152, 'ผ.ศ.', NULL);
INSERT INTO `tb_user_title_name` VALUES (153, 'ดร.', NULL);
INSERT INTO `tb_user_title_name` VALUES (154, 'รศ.ดร.', NULL);
INSERT INTO `tb_user_title_name` VALUES (155, 'พระสังฆาธิการ', 1);
INSERT INTO `tb_user_title_name` VALUES (156, 'พระราชมุณี', 1);
INSERT INTO `tb_user_title_name` VALUES (157, 'พระครูปลัด', 1);
INSERT INTO `tb_user_title_name` VALUES (158, 'พระมหา', 1);
INSERT INTO `tb_user_title_name` VALUES (159, 'พระครู', 1);
INSERT INTO `tb_user_title_name` VALUES (160, 'พระ*ไม่ใช้ ให้ใช้ G9', NULL);
INSERT INTO `tb_user_title_name` VALUES (161, 'พระภิกษุ', 1);
INSERT INTO `tb_user_title_name` VALUES (162, 'พระปลัด', 1);
INSERT INTO `tb_user_title_name` VALUES (163, 'พระครูใบฏิกา', 1);
INSERT INTO `tb_user_title_name` VALUES (164, 'พระสมุห์', 1);
INSERT INTO `tb_user_title_name` VALUES (165, 'พระอาจารย์', 1);
INSERT INTO `tb_user_title_name` VALUES (166, 'พระใบฏิกา', 1);
INSERT INTO `tb_user_title_name` VALUES (167, 'แม่ชี', 2);
INSERT INTO `tb_user_title_name` VALUES (168, 'สามเณร', 1);
INSERT INTO `tb_user_title_name` VALUES (169, 'เจ้าอธิการ', NULL);
INSERT INTO `tb_user_title_name` VALUES (170, 'พระอธิการ', NULL);
INSERT INTO `tb_user_title_name` VALUES (171, 'ภารดา', 1);
INSERT INTO `tb_user_title_name` VALUES (172, 'บาทหลวง', 1);
INSERT INTO `tb_user_title_name` VALUES (173, 'ครู', NULL);
INSERT INTO `tb_user_title_name` VALUES (174, 'อาจารย์', NULL);
INSERT INTO `tb_user_title_name` VALUES (175, 'Mr.', 1);
INSERT INTO `tb_user_title_name` VALUES (176, 'Mrs.', 2);
INSERT INTO `tb_user_title_name` VALUES (177, 'Miss.', 2);
INSERT INTO `tb_user_title_name` VALUES (178, 'น.ต.น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (179, 'น.ต.หญิง น.พ.', 2);
INSERT INTO `tb_user_title_name` VALUES (180, 'น.ท.น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (181, 'น.ท.พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (182, 'น.พ.ม.ร.ว.', NULL);
INSERT INTO `tb_user_title_name` VALUES (183, 'น.อ.น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (184, 'น.อ.พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (185, 'น.อ.น.พ.-ร.น.', 1);
INSERT INTO `tb_user_title_name` VALUES (186, 'น.อ.พ.ญ.-ร.น.', 2);
INSERT INTO `tb_user_title_name` VALUES (187, 'นตท.', 1);
INSERT INTO `tb_user_title_name` VALUES (188, 'นนอ.', 1);
INSERT INTO `tb_user_title_name` VALUES (189, 'นรจ.', 1);
INSERT INTO `tb_user_title_name` VALUES (190, 'นรต.', 1);
INSERT INTO `tb_user_title_name` VALUES (191, 'นรพ.', NULL);
INSERT INTO `tb_user_title_name` VALUES (192, 'ผศ.ท.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (193, 'ผศ.น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (194, 'ผศ.พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (195, 'ผศ. ม.ล.', NULL);
INSERT INTO `tb_user_title_name` VALUES (196, 'ผศ. ร.อ.', NULL);
INSERT INTO `tb_user_title_name` VALUES (197, 'พ.ญ. ม.ร.ว.', 2);
INSERT INTO `tb_user_title_name` VALUES (198, 'พ.ต.น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (199, 'พ.ต.หญิง น.พ.', 2);
INSERT INTO `tb_user_title_name` VALUES (200, 'พ.ต.ต. น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (201, 'พ.ต.อ.พิเศษ น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (202, 'พ.ต.อ.พิเศษ พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (203, 'พ.ต.อ.หญิง น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (204, 'พ.ท. น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (205, 'พ.ท. พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (206, 'พ.ห. ม.ล.', NULL);
INSERT INTO `tb_user_title_name` VALUES (207, 'พ.อ. ม.ล.ว.', NULL);
INSERT INTO `tb_user_title_name` VALUES (208, 'พ.อ. น.พ.', NULL);
INSERT INTO `tb_user_title_name` VALUES (209, 'พ.อ.น.พ. หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (210, 'พ.อ.หญิง ม.ร.ว.', 2);
INSERT INTO `tb_user_title_name` VALUES (211, 'พระภิกษุ ร.ต.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (212, 'พล.อ. ม.ล.ว.', NULL);
INSERT INTO `tb_user_title_name` VALUES (213, 'พล.ต.ต. น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (214, 'พล.ต.ต. พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (215, 'พลสำรองพิเศษ', NULL);
INSERT INTO `tb_user_title_name` VALUES (216, 'ร.ต. น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (217, 'ร.ต. พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (218, 'ร.ท. น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (219, 'ร.ท. พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (220, 'ร.อ. น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (221, 'ร.อ. พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (222, 'ร.ต. ดร.', NULL);
INSERT INTO `tb_user_title_name` VALUES (223, 'ร.ท.ท.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (224, 'ร.ท.ท.พ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (225, 'ร.อ.ท.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (226, 'ร.อ.ท.พ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (227, 'รศ.น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (228, 'รศ.พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (229, 'ว่าที่ ร.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (230, 'ว่าที่ ร.ท.', 1);
INSERT INTO `tb_user_title_name` VALUES (231, 'ว่าที่ ร.ท.(หญิง)', 2);
INSERT INTO `tb_user_title_name` VALUES (232, 'ว่าที่ ร.อ.', 1);
INSERT INTO `tb_user_title_name` VALUES (233, 'ศจ.น.พ.', 1);
INSERT INTO `tb_user_title_name` VALUES (234, 'ศจ.พ.ญ.', 2);
INSERT INTO `tb_user_title_name` VALUES (235, 'ส.ต.ต.ม.ล.', NULL);
INSERT INTO `tb_user_title_name` VALUES (236, 'พลฯอส.', NULL);
INSERT INTO `tb_user_title_name` VALUES (237, 'ว่าที่ ด.ต.', 1);
INSERT INTO `tb_user_title_name` VALUES (238, 'ว่าที่ ด.ต.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (239, 'ว่าที่ ร.ต.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (240, 'ว่าที่ ร.อ.หญิง', 2);
INSERT INTO `tb_user_title_name` VALUES (241, 'ส.ท.', NULL);
INSERT INTO `tb_user_title_name` VALUES (242, 'ผศ.ดร.', NULL);
INSERT INTO `tb_user_title_name` VALUES (243, 'รอ.ญ.พญ.', NULL);
INSERT INTO `tb_user_title_name` VALUES (244, 'คุณ', NULL);
INSERT INTO `tb_user_title_name` VALUES (245, 'ว่าที่ พ.ต.', NULL);

-- ----------------------------
-- Table structure for tb_user_title_name1
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_title_name1`;
CREATE TABLE `tb_user_title_name1`  (
  `user_title_name_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_title_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_sex_id` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`user_title_name_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_title_name1
-- ----------------------------
INSERT INTO `tb_user_title_name1` VALUES ('0', 'ไม่ระบุ', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('01', 'นาย', 1);
INSERT INTO `tb_user_title_name1` VALUES ('02', 'นาง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('03', 'น.ส.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('04', 'ด.ช.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('05', 'ด.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('07', 'พญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('08', 'ท.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('09', 'ท.พ. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('100', 'ม.ญ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('14', 'ม.จ.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('15', 'คุณหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('16', 'พลทหาร', 1);
INSERT INTO `tb_user_title_name1` VALUES ('17', 'พลทหารหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('18', 'พลตำรวจ', 1);
INSERT INTO `tb_user_title_name1` VALUES ('19', 'พลตำรวจหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('20', 'ส.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('21', 'ส.ต. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('22', 'จ.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('23', 'จ.ต. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('24', 'ส.ต.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('25', 'ส.ต.ต. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('26', 'ส.ห.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('27', 'ส.ท. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('28', 'จ.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('29', 'จ.ท. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('30', 'ส.ต.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('31', 'ส.ต.ท.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('32', 'ส.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('33', 'ส.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('34', 'จ.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('35', 'จ.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('36', 'ส.ต.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('37', 'ส.ต.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('38', 'จ.ส.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('39', 'จ.ส.ต.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('40', 'พ.จ.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('41', 'พ.จ.ต.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('42', 'พ.อ.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('43', 'พ.อ.ต.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('44', 'จ.ส.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('45', 'จ.ส.ท.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('46', 'พ.จ.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('47', 'พ.จ.ท.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('48', 'พ.อ.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('49', 'พ.อ.ท.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('50', 'ด.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('51', 'ด.ต.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('52', 'จ.ส.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('53', 'จ.ส.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('54', 'พ.จ.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('55', 'พ.จ.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('56', 'พ.อ.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('57', 'พ.อ.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('58', 'ร.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('59', 'ร.ต. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('6', 'นพ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('60', 'ร.ต.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('61', 'ร.ต.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('62', 'ร.ต.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('63', 'ร.ต.ต. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('64', 'ร.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('65', 'ร.ท.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('66', 'ร.ท.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('67', 'ร.ท.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('68', 'ร.ต.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('69', 'ร.ต.ท. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('70', 'ร.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('71', 'ร.อ. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('72', 'ร.อ.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('73', 'ร.อ.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('74', 'ร.ต.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('75', 'ร.ต.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('76', 'พ.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('77', 'พ.ต. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('78', 'น.ต.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('79', 'น.ต.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('80', 'น.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('81', 'น.ต. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('82', 'พ.ต.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('83', 'พ.ต.ต. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('84', 'พ.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('85', 'พ.ท. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('86', 'น.ท.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('87', 'น.ท.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('88', 'น.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('89', 'น.ท.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('90', 'พ.ต.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('91', 'พ.ต.ท. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('92', 'พ.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('93', 'พ.อ. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('94', 'น.อ.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('95', 'น.อ.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('96', 'น.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('97', 'น.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('98', 'พ.ต.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('99', 'พ.ต.อ. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('999', 'อื่นๆ', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('A1', 'พ.อ.(พิเศษ)', 1);
INSERT INTO `tb_user_title_name1` VALUES ('A2', 'พ.อ.(พิเศษ)หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('A3', 'น.อ.(พิเศษ)-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('A4', 'น.อ.(พิเศษ)-หญิง-ร.น', 2);
INSERT INTO `tb_user_title_name1` VALUES ('A5', 'น.อ.(พิเศษ)', 1);
INSERT INTO `tb_user_title_name1` VALUES ('A6', 'น.อ.(พิเศษ)หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('A7', 'พ.ต.อ.(พิเศษ)', 1);
INSERT INTO `tb_user_title_name1` VALUES ('A8', 'พ.ต.อ.(พิเศษ)หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('A9', 'พลจัตวา', 1);
INSERT INTO `tb_user_title_name1` VALUES ('B1', 'พลจัตวาหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('B2', 'พลเรือจัตวา', 1);
INSERT INTO `tb_user_title_name1` VALUES ('B3', 'พลเรือจัตวาหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('B4', 'พลอากาศจัตวา', 1);
INSERT INTO `tb_user_title_name1` VALUES ('B5', 'พลอากาศจัตวาหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('B6', 'พลตำรวจจัตวา', 1);
INSERT INTO `tb_user_title_name1` VALUES ('B7', 'พลตำรวจจัตวาหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('B8', 'พล.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('B9', 'พล.ต.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('C1', 'พล.ร.ต.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('C2', 'พล.ร.ต.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('C3', 'พล.อ.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('C4', 'พล.อ.ต.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('C5', 'พล.ต.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('C6', 'พล.ต.ต.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('C7', 'พล.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('C8', 'พล.ท.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('C9', 'พล.ร.ท.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('D1', 'พล.ร.ท.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('D2', 'พล.อ.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('D3', 'พล.ต.ท.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('D4', 'พล.ต.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('D5', 'พล.ต.ท.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('D6', 'พล.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('D7', 'พล.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('D8', 'พล.ร.อ.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('D9', 'พล.ร.อ.-ร.น.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('E1', 'พล.อ.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('E2', 'พล.อ.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('E3', 'พล.ต.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('E4', 'พล.ต.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('E5', 'จอมพล', 1);
INSERT INTO `tb_user_title_name1` VALUES ('E6', 'จอมพลหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('E7', 'จอมพลเรือ', 1);
INSERT INTO `tb_user_title_name1` VALUES ('E8', 'จอมพลเรือหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('E9', 'จอมพลอากาศ', 1);
INSERT INTO `tb_user_title_name1` VALUES ('F1', 'จอมพลอากาศหญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('F2', 'อ.ส.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('F3', 'อ.ส.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('F4', 'ม.ล.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('F5', 'ม.ร.ว.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('F6', 'ม.ร.ว. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('F7', 'ศ.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('F8', 'ร.ศ.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('F9', 'ผ.ศ.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('G1', 'ดร.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('G2', 'รศ.ดร.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('G3', 'พระสังฆาธิการ', 1);
INSERT INTO `tb_user_title_name1` VALUES ('G4', 'พระราชมุณี', 1);
INSERT INTO `tb_user_title_name1` VALUES ('G5', 'พระครูปลัด', 1);
INSERT INTO `tb_user_title_name1` VALUES ('G6', 'พระมหา', 1);
INSERT INTO `tb_user_title_name1` VALUES ('G7', 'พระครู', 1);
INSERT INTO `tb_user_title_name1` VALUES ('G8', 'พระ*ไม่ใช้ ให้ใช้ G9', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('G9', 'พระภิกษุ', 1);
INSERT INTO `tb_user_title_name1` VALUES ('H1', 'พระปลัด', 1);
INSERT INTO `tb_user_title_name1` VALUES ('H2', 'พระครูใบฏิกา', 1);
INSERT INTO `tb_user_title_name1` VALUES ('H3', 'พระสมุห์', 1);
INSERT INTO `tb_user_title_name1` VALUES ('H4', 'พระอาจารย์', 1);
INSERT INTO `tb_user_title_name1` VALUES ('H5', 'พระใบฏิกา', 1);
INSERT INTO `tb_user_title_name1` VALUES ('H6', 'แม่ชี', 2);
INSERT INTO `tb_user_title_name1` VALUES ('H7', 'สามเณร', 1);
INSERT INTO `tb_user_title_name1` VALUES ('H8', 'เจ้าอธิการ', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('H9', 'พระอธิการ', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('I1', 'ภารดา', 1);
INSERT INTO `tb_user_title_name1` VALUES ('I2', 'บาทหลวง', 1);
INSERT INTO `tb_user_title_name1` VALUES ('I3', 'ครู', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('I4', 'อาจารย์', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('I5', 'Mr.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('I6', 'Mrs.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('I7', 'Miss.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('I8', 'น.ต.น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('I9', 'น.ต.หญิง น.พ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('J1', 'น.ท.น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('J2', 'น.ท.พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('J3', 'น.พ.ม.ร.ว.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('J4', 'น.อ.น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('J5', 'น.อ.พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('J6', 'น.อ.น.พ.-ร.น.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('J7', 'น.อ.พ.ญ.-ร.น.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('J8', 'นตท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('J9', 'นนอ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('K1', 'นรจ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('K2', 'นรต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('K3', 'นรพ.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('K4', 'ผศ.ท.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('K5', 'ผศ.น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('K6', 'ผศ.พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('K7', 'ผศ. ม.ล.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('K8', 'ผศ. ร.อ.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('K9', 'พ.ญ. ม.ร.ว.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('L1', 'พ.ต.น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('L2', 'พ.ต.หญิง น.พ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('L3', 'พ.ต.ต. น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('L4', 'พ.ต.อ.พิเศษ น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('L5', 'พ.ต.อ.พิเศษ พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('L6', 'พ.ต.อ.หญิง น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('L7', 'พ.ท. น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('L8', 'พ.ท. พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('L9', 'พ.ห. ม.ล.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('M1', 'พ.อ. ม.ล.ว.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('M2', 'พ.อ. น.พ.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('M3', 'พ.อ.น.พ. หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('M4', 'พ.อ.หญิง ม.ร.ว.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('M5', 'พระภิกษุ ร.ต.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('M6', 'พล.อ. ม.ล.ว.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('M7', 'พล.ต.ต. น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('M8', 'พล.ต.ต. พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('M9', 'พลสำรองพิเศษ', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('N1', 'ร.ต. น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('N2', 'ร.ต. พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('N3', 'ร.ท. น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('N4', 'ร.ท. พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('N5', 'ร.อ. น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('N6', 'ร.อ. พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('N7', 'ร.ต. ดร.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('N8', 'ร.ท.ท.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('N9', 'ร.ท.ท.พ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('O1', 'ร.อ.ท.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('O2', 'ร.อ.ท.พ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('O3', 'รศ.น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('O4', 'รศ.พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('O5', 'ว่าที่ ร.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('O6', 'ว่าที่ ร.ท.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('O7', 'ว่าที่ ร.ท.(หญิง)', 2);
INSERT INTO `tb_user_title_name1` VALUES ('O8', 'ว่าที่ ร.อ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('O9', 'ศจ.น.พ.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('P1', 'ศจ.พ.ญ.', 2);
INSERT INTO `tb_user_title_name1` VALUES ('P2', 'ส.ต.ต.ม.ล.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('P3', 'พลฯอส.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('Q1', 'ว่าที่ ด.ต.', 1);
INSERT INTO `tb_user_title_name1` VALUES ('Q2', 'ว่าที่ ด.ต.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('Q3', 'ว่าที่ ร.ต.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('Q4', 'ว่าที่ ร.อ.หญิง', 2);
INSERT INTO `tb_user_title_name1` VALUES ('Q5', 'ส.ท.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('Q6', 'ผศ.ดร.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('Q7', 'รอ.ญ.พญ.', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('Q8', 'คุณ', NULL);
INSERT INTO `tb_user_title_name1` VALUES ('Q9', 'ว่าที่ พ.ต.', NULL);

-- ----------------------------
-- Table structure for tb_usertype
-- ----------------------------
DROP TABLE IF EXISTS `tb_usertype`;
CREATE TABLE `tb_usertype`  (
  `usertype_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภทผู้ใช้งาน',
  `usertype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ประเภทผู้ใช้งาน',
  PRIMARY KEY (`usertype_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_usertype
-- ----------------------------
INSERT INTO `tb_usertype` VALUES (2, 'อาจารย์');
INSERT INTO `tb_usertype` VALUES (3, 'เจ้าหน้าที่');
INSERT INTO `tb_usertype` VALUES (7, 'Admin');

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
INSERT INTO `texts` VALUES (1, 'footer-title', 'Footer', 'Andaman Pattana', 1, NULL, 1619667816);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin-ku@gmail.com', '$2y$12$P/nrEYjCwBNEyQHt//O2VOJw/WjSjCoV32HuOXxthIDKmpP9LCalK', '7sCGkzBxTGIyoig1cxWzjlziAhH5nnDj', 1591830631, NULL, NULL, NULL, 1591830630, 1591830630, 0, 1620275312);
INSERT INTO `user` VALUES (2, 'demo', 'demo@demo.com', '$2y$12$gPty5oS/tETH3SdAdurlAOU3awRfck47ehd/j.ffnaSBWIAGcfOgS', 'znXxtr7d8nLWDyAJfO6ip1Q5M7DQ5ABf', 1592109874, NULL, NULL, '127.0.0.1', 1592109874, 1592109874, 0, 1606202720);
INSERT INTO `user` VALUES (5, 'kubota', 'agrspks@ku.ac.th', '$2y$12$DcIcbF7.voXZaZHyZbT2IOZJC1xdmnonn1BJGYXSz2m4qLUU11Kx6', 'aE3jnysb0bh-RxUePC5-9UhTbYN4NaUD', 1606115928, NULL, NULL, '127.0.0.1', 1606115928, 1606115928, 0, NULL);
INSERT INTO `user` VALUES (16, 'test', 'test_system@gmail.com', '$2y$12$9ISOpKP/2hD5IlQNQ2GKGuXbH7NbZecpvoi/NtxpzlX0T/gyU8nxW', 'VDDMcvQthfD8WxkboJazvkUseSx3I0wc', 1607071059, NULL, NULL, '127.0.0.1', 1607071059, 1607071059, 0, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of widget_carousel_item
-- ----------------------------
INSERT INTO `widget_carousel_item` VALUES (4, 1, 'http://159.65.131.194/storage/source', '1\\veiYAWMvrNzs4TP1GRGK15l6GSCOyvHQ.png', 'http://159.65.131.194/storage/source/1\\veiYAWMvrNzs4TP1GRGK15l6GSCOyvHQ.png', 'image/png', '', '<h2>LED System</h2>', 1, 5, 1592020216, 1620266712);
INSERT INTO `widget_carousel_item` VALUES (5, 1, 'http://faculty-ku.local/storage/source', '\\1\\HWT-G2uf0UpoV_IebHS3-cHZeGVY5ML4.png', 'http://faculty-ku.local/storage/source/\\1\\HWT-G2uf0UpoV_IebHS3-cHZeGVY5ML4.png', 'image/png', '', '<h2>Queue System & Service</h2>', 1, 3, 1592020242, 1620275363);
INSERT INTO `widget_carousel_item` VALUES (6, 1, 'http://faculty-ku.local/storage/source', '\\1\\3uQ2JlMDwZcm1CuzNOzdY_XLzzQPkHbR.png', 'http://faculty-ku.local/storage/source/\\1\\3uQ2JlMDwZcm1CuzNOzdY_XLzzQPkHbR.png', 'image/png', '', '<h2>System & Software Service </h2>', 1, 2, 1592020264, 1620275334);
INSERT INTO `widget_carousel_item` VALUES (7, 2, 'http://faculty-ku.local/storage/source', '\\1\\YpZb62agiOAZPSP1Qa-Ew8jV6USVbXXU.jpg', NULL, 'image/jpeg', '', '<p>ทดสอบ</p>', 1, 4, 1592385278, 1592385278);
INSERT INTO `widget_carousel_item` VALUES (8, 2, 'http://faculty-ku.local/storage/source', '\\1\\ZLdJfFSwj7DTHAewNF7g3enhEZaN6AVI.jpg', NULL, 'image/jpeg', '', '<p>ทดสอบ</p>', 1, 5, 1592385379, 1592385379);

SET FOREIGN_KEY_CHECKS = 1;
