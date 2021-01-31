/*
Navicat MySQL Data Transfer

Source Server         : LibrarySystem
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2021-01-28 17:32:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'Tom', 'tom', '123');
INSERT INTO `admins` VALUES ('2', 'Jack', 'jack', '123');

-- ----------------------------
-- Table structure for backs
-- ----------------------------
DROP TABLE IF EXISTS `backs`;
CREATE TABLE `backs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrows_id` (`brid`),
  CONSTRAINT `borrows_id` FOREIGN KEY (`brid`) REFERENCES `borrows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backs
-- ----------------------------
INSERT INTO `backs` VALUES ('12', '14', '2');
INSERT INTO `backs` VALUES ('13', '15', '1');
INSERT INTO `backs` VALUES ('14', '16', '0');
INSERT INTO `backs` VALUES ('15', '18', '0');
INSERT INTO `backs` VALUES ('16', '17', '0');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(20) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `birth` varchar(20) DEFAULT NULL,
  `edition` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_id` (`sid`),
  CONSTRAINT `sort_id` FOREIGN KEY (`sid`) REFERENCES `sorts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', 'Book1', '1', '3', 'Author1', 'Publisher1', 'First');
INSERT INTO `books` VALUES ('2', 'Book2', '1', '10', 'Author2', 'Publisher2', 'First');
INSERT INTO `books` VALUES ('3', 'Book3', '2', '9', 'Author3', 'Publisher3', 'First');
INSERT INTO `books` VALUES ('4', 'Book4', '1', '5', 'Author4', 'Publisher4', 'First');
INSERT INTO `books` VALUES ('5', 'Book5', '4', '3', 'Author5', 'Publisher5', 'First');
INSERT INTO `books` VALUES ('6', 'Book6', '4', '5', 'Author6', 'Publisher6', 'First');
INSERT INTO `books` VALUES ('7', 'Book7', '4', '5', 'Author7', 'Publisher7', 'First');
INSERT INTO `books` VALUES ('8', 'Book8', '2', '4', 'Author8', 'Publisher8', 'First');
INSERT INTO `books` VALUES ('9', 'Book9', '4', '5', 'Author9', 'Publisher9', 'First');
INSERT INTO `books` VALUES ('10', 'Book10', '5', '5', 'Author10', 'Publisher10', 'First');
INSERT INTO `books` VALUES ('12', 'Book12', '1', '3', 'Author12', 'Publisher12', 'First');
INSERT INTO `books` VALUES ('13', 'Book13', '3', '5', 'Author13', 'Publisher13', 'First');
INSERT INTO `books` VALUES ('14', 'Book14', '4', '5', 'Author14', 'Publisher14', 'First');
INSERT INTO `books` VALUES ('15', 'Book15', '1', '19', 'Author15', 'Publisher15', 'First');
INSERT INTO `books` VALUES ('16', 'Book16', '1', '9', 'Author16', 'Publisher16', 'First');
INSERT INTO `books` VALUES ('17', 'Book17', '1', '0', 'Author17', 'Publisher17', 'First');
INSERT INTO `books` VALUES ('18', 'Book18', '1', '19', 'Author18', 'Publisher18', 'First');

-- ----------------------------
-- Table structure for borrows
-- ----------------------------
DROP TABLE IF EXISTS `borrows`;
CREATE TABLE `borrows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`uid`),
  KEY `book_id` (`bid`),
  CONSTRAINT `book_id` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrows
-- ----------------------------
INSERT INTO `borrows` VALUES ('14', '2', '2', '2020-01-11 14:45:28', '2020-01-11 14:48:10', '1');
INSERT INTO `borrows` VALUES ('15', '2', '12', '2020-01-11 14:46:01', null, '1');
INSERT INTO `borrows` VALUES ('16', '3', '1', '2020-01-11 14:46:38', null, '1');
INSERT INTO `borrows` VALUES ('17', '3', '16', '2020-01-11 14:46:42', null, '1');
INSERT INTO `borrows` VALUES ('18', '2', '5', '2020-01-11 14:49:22', null, '1');
INSERT INTO `borrows` VALUES ('19', '2', '3', '2020-01-11 14:49:38', null, '0');
INSERT INTO `borrows` VALUES ('20', '2', '3', '2021-01-28 17:23:08', null, '0');

-- ----------------------------
-- Table structure for reserves
-- ----------------------------
DROP TABLE IF EXISTS `reserves`;
CREATE TABLE `reserves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `bkid` int(11) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `books_id2` (`bkid`),
  KEY `user_id2` (`uid`),
  CONSTRAINT `books_id2` FOREIGN KEY (`bkid`) REFERENCES `books` (`id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reserves
-- ----------------------------

-- ----------------------------
-- Table structure for sorts
-- ----------------------------
DROP TABLE IF EXISTS `sorts`;
CREATE TABLE `sorts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sorts
-- ----------------------------
INSERT INTO `sorts` VALUES ('1', 'CS');
INSERT INTO `sorts` VALUES ('2', 'Mathematics');
INSERT INTO `sorts` VALUES ('3', 'French');
INSERT INTO `sorts` VALUES ('4', 'English');
INSERT INTO `sorts` VALUES ('5', 'Life Style');

-- ----------------------------
-- Table structure for sysadmin
-- ----------------------------
DROP TABLE IF EXISTS `sysadmin`;
CREATE TABLE `sysadmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysadmin
-- ----------------------------
INSERT INTO `sysadmin` VALUES ('1', 'System Admin', 'admin', '123');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', 'Jiayu', 'jiayu', '123');
INSERT INTO `users` VALUES ('3', 'Finn', 'finn', '123');
INSERT INTO `users` VALUES ('4', 'Zo', 'zo', '111111');
INSERT INTO `users` VALUES ('5', 'Mary', 'mary', 'hello');
