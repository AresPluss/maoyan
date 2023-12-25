/*
 Navicat Premium Data Transfer

 Source Server         : mysql80
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : maoyan

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 25/12/2023 15:07:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cinemas
-- ----------------------------
DROP TABLE IF EXISTS `cinemas`;
CREATE TABLE `cinemas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `discount` double(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cinemas
-- ----------------------------
INSERT INTO `cinemas` VALUES (1, '1929电影公园（武汉光谷店）', '洪山区珞喻路889号融众国际6层', '退票,改签,折扣卡', 0.80);
INSERT INTO `cinemas` VALUES (2, 'CGV影城（凯德西城IMAX店）', '硚口区解放大道十八号凯德广场05层。古田二路入口（古田二路生活一村公交站，古田小学斜对面）', '改签,折扣卡,IMAX', 1.00);
INSERT INTO `cinemas` VALUES (3, '万象影城（武汉万象城杜比影院店）', '江岸区建设大道668号武汉万象城L601', '改签,折扣卡,IMAX,Dolby Cinema厅', 1.20);

-- ----------------------------
-- Table structure for movies
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `movieName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `movieImg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `foreignName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `leadingRoles` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `releaseTime` datetime NULL DEFAULT NULL,
  `lonTime` int NULL DEFAULT 0,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO `movies` VALUES (1, '第八嫌疑人', 'movie_picture1.jpg', 35.00, 'Di Ba Xian Yi Ren', '张三,李四,王五', '2023-11-06 10:17:40', 80, '悬疑,喜剧');
INSERT INTO `movies` VALUES (2, '敢死队4：最终章', 'movie_picture2.jpg', 27.00, 'Gan Si Dui 4', '张三,李四', '2023-11-06 10:17:40', 80, '爱情,喜剧');
INSERT INTO `movies` VALUES (3, '封神第一部', 'movie_picture3.jpg', 36.00, 'Feng Shen Di Yi Bu', '张三', '2023-11-06 10:17:40', 80, '悬疑');
INSERT INTO `movies` VALUES (4, '奥本海默', 'movie_picture4.jpg', 32.00, 'Ao Ben Ai Mo', '张三,李四,王五', '2023-11-06 10:17:40', 80, '喜剧');
INSERT INTO `movies` VALUES (5, '学爸', 'movie_picture5.jpg', 33.00, 'Xue Ba', '张三,李四', '2023-11-06 10:17:40', 80, '爱情');
INSERT INTO `movies` VALUES (6, '鹦鹉杀', 'movie_picture6.jpg', 28.00, 'Ying Wu Sha', '张三', '2023-11-06 10:17:40', 80, '悬疑,剧情');
INSERT INTO `movies` VALUES (7, '孤注一掷', 'movie_picture7.jpg', 29.00, 'Gu Zhu Yi ZHI', '张三,李四,王五', '2023-11-06 10:17:40', 80, '爱情,剧情');
INSERT INTO `movies` VALUES (8, '威尼斯惊魂夜', 'movie_picture8.jpg', 31.00, 'Wei Ni Si Jing Hun Ye', '张三,李四', '2023-11-06 10:17:40', 80, '剧情');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `roomName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cinemaId` int NULL DEFAULT NULL,
  `row` int NULL DEFAULT NULL,
  `col` int NULL DEFAULT NULL,
  `blankSeat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '一号厅', 1, 8, 14, '0,4,6,5;0,12,6,13');
INSERT INTO `room` VALUES (2, '二号厅', 1, 0, 0, NULL);
INSERT INTO `room` VALUES (3, '三号厅', 1, 0, 0, NULL);
INSERT INTO `room` VALUES (4, '四号厅', 1, 0, 0, NULL);
INSERT INTO `room` VALUES (5, '五号厅', 1, 0, 0, NULL);
INSERT INTO `room` VALUES (6, 'IMAX厅', 2, 0, 0, NULL);
INSERT INTO `room` VALUES (7, '二号厅', 2, 0, 0, NULL);
INSERT INTO `room` VALUES (8, '三号厅', 2, 0, 0, NULL);

-- ----------------------------
-- Table structure for showtime
-- ----------------------------
DROP TABLE IF EXISTS `showtime`;
CREATE TABLE `showtime`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `roomId` int NULL DEFAULT NULL,
  `movieId` int NULL DEFAULT NULL,
  `startTime` datetime NULL DEFAULT NULL,
  `discount` double NULL DEFAULT 1,
  `redSeat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of showtime
-- ----------------------------
INSERT INTO `showtime` VALUES (1, 1, 1, '2023-11-08 09:30:00', 1, '3,6;2,0;1,0;2,9;2,7;1,6;1,10;1,9;1,7;0,7;3,8;1,8;3,11;3,10;0,11;0,8;2,11;1,11;0,9;0,10;3,9;0,0;0,1;0,2;0,3;2,6;2,8;2,10;3,7;0,6;1,3;2,2;3,3;1,1');
INSERT INTO `showtime` VALUES (2, 2, 1, '2023-11-08 10:00:00', 1, NULL);
INSERT INTO `showtime` VALUES (3, 3, 1, '2023-11-08 10:30:00', 1, NULL);
INSERT INTO `showtime` VALUES (4, 4, 1, '2023-11-08 11:00:00', 1.2, NULL);
INSERT INTO `showtime` VALUES (5, 1, 1, '2023-11-08 11:30:00', 1.2, NULL);
INSERT INTO `showtime` VALUES (6, 2, 2, '2023-11-08 09:30:00', 1, NULL);
INSERT INTO `showtime` VALUES (7, 3, 2, '2023-11-08 10:00:00', 1, NULL);
INSERT INTO `showtime` VALUES (8, 4, 2, '2023-11-08 10:30:00', 1.2, NULL);
INSERT INTO `showtime` VALUES (9, 1, 2, '2023-11-08 11:00:00', 1.2, NULL);
INSERT INTO `showtime` VALUES (10, 6, 1, '2023-11-09 19:46:28', 1, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '123456');
INSERT INTO `users` VALUES (35, 'adminnnn', 'fxy50222');

SET FOREIGN_KEY_CHECKS = 1;
