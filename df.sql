/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : a

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-10-24 19:15:27
*/

drop database if exists df;
create database df;
use df;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `comment_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `rid` (`rid`),
  KEY `uid` (`uid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `reply` (`rid`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `info`
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `request_url` varchar(300) DEFAULT NULL,
  `context_path` varchar(30) DEFAULT NULL,
  `remote_addr` varchar(30) DEFAULT NULL,
  `access_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `other_id` int(11) NOT NULL,
  `other_username` varchar(20) NOT NULL,
  `post_id` int(11) NOT NULL,
  `operation` varchar(20) NOT NULL,
  `displayed_content` varchar(100) NOT NULL,
  `msg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mid`),
  KEY `uid` (`uid`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` text,
  `publish_time` varchar(30) NOT NULL,
  `reply_time` varchar(30) NOT NULL,
  `reply_count` int(11) DEFAULT '0',
  `like_count` int(11) DEFAULT '0',
  `scan_count` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `topic` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', 'test1', 'test content1', '2016-10-24 07:10:11', '2016-10-24 07:10:11', '0', '0', '0', '8', '10');
INSERT INTO `post` VALUES ('2', 'test2', 'test content2', '2016-10-24 07:10:13', '2016-10-24 07:10:13', '0', '0', '0', '4', '12');
INSERT INTO `post` VALUES ('3', 'test3', 'test content3', '2016-10-24 07:10:14', '2016-10-24 07:10:14', '0', '0', '0', '3', '4');
INSERT INTO `post` VALUES ('4', 'test4', 'test content4', '2016-10-24 07:10:15', '2016-10-24 07:10:15', '0', '0', '0', '4', '7');
INSERT INTO `post` VALUES ('5', 'test5', 'test content5', '2016-10-24 07:10:16', '2016-10-24 07:10:16', '0', '0', '0', '1', '10');
INSERT INTO `post` VALUES ('6', 'test6', 'test content6', '2016-10-24 07:10:17', '2016-10-24 07:10:17', '0', '0', '0', '9', '6');
INSERT INTO `post` VALUES ('7', 'test7', 'test content7', '2016-10-24 07:10:18', '2016-10-24 07:10:18', '0', '0', '0', '1', '6');
INSERT INTO `post` VALUES ('8', 'test8', 'test content8', '2016-10-24 07:10:19', '2016-10-24 07:10:19', '0', '0', '0', '9', '9');
INSERT INTO `post` VALUES ('9', 'test9', 'test content9', '2016-10-24 07:10:20', '2016-10-24 07:10:20', '0', '0', '0', '3', '10');
INSERT INTO `post` VALUES ('10', 'test10', 'test content10', '2016-10-24 07:10:21', '2016-10-24 07:10:21', '0', '0', '0', '1', '8');
INSERT INTO `post` VALUES ('11', 'test11', 'test content11', '2016-10-24 07:10:22', '2016-10-24 07:10:22', '0', '0', '0', '8', '7');
INSERT INTO `post` VALUES ('12', 'test12', 'test content12', '2016-10-24 07:10:23', '2016-10-24 07:10:23', '0', '0', '0', '9', '8');
INSERT INTO `post` VALUES ('13', 'test13', 'test content13', '2016-10-24 07:10:24', '2016-10-24 07:10:24', '0', '0', '0', '4', '4');
INSERT INTO `post` VALUES ('14', 'test14', 'test content14', '2016-10-24 07:10:25', '2016-10-24 07:10:25', '0', '0', '0', '8', '5');
INSERT INTO `post` VALUES ('15', 'test15', 'test content15', '2016-10-24 07:10:26', '2016-10-24 07:10:26', '0', '0', '0', '4', '3');
INSERT INTO `post` VALUES ('16', 'test16', 'test content16', '2016-10-24 07:10:28', '2016-10-24 07:10:28', '0', '0', '0', '4', '12');
INSERT INTO `post` VALUES ('17', 'test17', 'test content17', '2016-10-24 07:10:29', '2016-10-24 07:10:29', '0', '0', '0', '3', '8');
INSERT INTO `post` VALUES ('18', 'test18', 'test content18', '2016-10-24 07:10:30', '2016-10-24 07:10:30', '0', '0', '0', '7', '11');
INSERT INTO `post` VALUES ('19', 'test19', 'test content19', '2016-10-24 07:10:31', '2016-10-24 07:10:31', '0', '0', '0', '5', '6');
INSERT INTO `post` VALUES ('20', 'test20', 'test content20', '2016-10-24 07:10:32', '2016-10-24 07:10:32', '0', '0', '0', '2', '6');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `reply_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `content` varchar(50) DEFAULT '',
  `image` varchar(100) DEFAULT '',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', 'Java', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('2', 'Python', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('3', '数据结构', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('4', '算法', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('5', '操作系统', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('6', '计算机网络', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('7', '数据库', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('8', '编译原理', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('9', '软件工程', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('10', 'JavaWeb', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('11', 'C', '暂无描述', 'http://localhost:8080/df/image/b.jpg');
INSERT INTO `topic` VALUES ('12', 'C++', '暂无描述', 'http://localhost:8080/df/image/b.jpg');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `actived` int(11) NOT NULL,
  `activate_code` varchar(60) NOT NULL,
  `join_time` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `description` varchar(30) DEFAULT '',
  `head_url` varchar(100) NOT NULL,
  `position` varchar(20) DEFAULT '',
  `school` varchar(20) DEFAULT '',
  `job` varchar(20) DEFAULT '',
  `like_count` int(11) DEFAULT '0',
  `post_count` int(11) DEFAULT '0',
  `scan_count` int(11) DEFAULT '0',
  `follow_count` int(11) DEFAULT '0',
  `follower_count` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `topic` VALUES ('1', 'Java', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('2', 'Python', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('3', '数据结构', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('4', '算法', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('5', '操作系统', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('6', '计算机网络', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('7', '数据库', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('8', '编译原理', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('9', '软件工程', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('10', 'JavaWeb', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('11', 'C', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
INSERT INTO `topic` VALUES ('12', 'C++', '暂无描述', 'http://www.doublefuck.top/image/b.jpg');
