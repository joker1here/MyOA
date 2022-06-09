/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : onlinework

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 06/06/2022 22:38:11
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `AttendanceId` int(0) NOT NULL AUTO_INCREMENT,
  `AttendanceEmployee` int(0) NULL DEFAULT 0,
  `SignUpTime` datetime(0) NULL DEFAULT NULL,
  `SignBackTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`AttendanceId`) USING BTREE,
  INDEX `e3`(`AttendanceEmployee`) USING BTREE,
  CONSTRAINT `e3` FOREIGN KEY (`AttendanceEmployee`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (1, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (3, 2, '2022-05-17 13:23:21', '2022-05-17 17:23:31');
INSERT INTO `attendance` VALUES (4, 2, '2022-05-25 15:23:43', '2022-05-25 17:02:48');
INSERT INTO `attendance` VALUES (5, 2, '2022-05-25 12:23:55', '2022-05-25 17:23:59');
INSERT INTO `attendance` VALUES (6, 1, '2022-05-25 13:24:06', '2022-05-25 17:24:10');
INSERT INTO `attendance` VALUES (7, 2, '2022-05-25 12:24:26', '2022-05-25 17:24:33');
INSERT INTO `attendance` VALUES (8, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (9, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (10, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (11, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (12, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (13, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (14, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (15, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (16, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (17, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (18, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (19, 10, '2022-05-25 23:28:33', '2022-05-25 15:48:41');
INSERT INTO `attendance` VALUES (20, 10, '2022-05-25 15:48:46', '2022-05-25 15:49:06');
INSERT INTO `attendance` VALUES (21, 10, '2022-05-25 15:52:08', '2022-05-25 15:57:23');
INSERT INTO `attendance` VALUES (22, 10, '2022-05-25 15:57:27', '2022-05-25 16:00:16');
INSERT INTO `attendance` VALUES (23, 10, '2022-05-26 01:36:40', '2022-05-26 02:16:20');
INSERT INTO `attendance` VALUES (24, 10, '2022-05-26 02:18:22', '2022-05-26 02:19:21');
INSERT INTO `attendance` VALUES (25, 10, '2022-05-26 08:56:28', '2022-05-26 08:56:43');
INSERT INTO `attendance` VALUES (26, 10, '2022-05-26 09:01:08', '2022-05-26 09:01:11');
INSERT INTO `attendance` VALUES (27, 10, '2022-05-29 12:04:15', '2022-05-29 12:05:28');
INSERT INTO `attendance` VALUES (28, 10, '2022-05-29 12:05:31', '2022-05-29 12:19:33');
INSERT INTO `attendance` VALUES (29, 10, '2022-05-30 05:18:14', '2022-05-30 07:05:07');
INSERT INTO `attendance` VALUES (31, 10, '2022-05-30 14:51:42', '2022-05-31 08:07:14');
INSERT INTO `attendance` VALUES (32, 10, '2022-05-31 08:19:01', '2022-05-31 08:19:05');
INSERT INTO `attendance` VALUES (33, 10, '2022-06-06 12:28:54', '2022-06-06 12:28:57');
INSERT INTO `attendance` VALUES (34, 10, '2022-06-06 12:30:03', '2022-06-06 12:35:04');
INSERT INTO `attendance` VALUES (35, 10, '2022-06-06 12:49:25', '2022-06-06 12:49:27');
INSERT INTO `attendance` VALUES (36, 10, '2022-06-06 13:06:38', '2022-06-06 13:06:39');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `DeptID` int(0) NOT NULL AUTO_INCREMENT,
  `DeptName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeptIntroduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DeptID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (0, '无部门', '还没加入部门');
INSERT INTO `dept` VALUES (1, '开发部门', '这是一个开发的部门');
INSERT INTO `dept` VALUES (2, '销售部', '这是一个负责销售的部门');
INSERT INTO `dept` VALUES (3, '外交部', '这是一个负责对外联络的部门');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `EmployeeID` int(0) NOT NULL AUTO_INCREMENT,
  `EmployeeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Birthday` date NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Photo` mediumblob NULL,
  `Sex` int(0) NULL DEFAULT 0,
  `UserLevel` int(0) NULL DEFAULT 0,
  `DeptId` int(0) NULL DEFAULT NULL,
  `JobId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`) USING BTREE,
  INDEX `EmployeeID`(`EmployeeID`) USING BTREE,
  INDEX `fk_jobid`(`JobId`) USING BTREE,
  INDEX `fk_deptid`(`DeptId`) USING BTREE,
  CONSTRAINT `fk_deptid` FOREIGN KEY (`DeptId`) REFERENCES `dept` (`DeptID`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_jobid` FOREIGN KEY (`JobId`) REFERENCES `job` (`JobID`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '张三', '123', '肇庆学院', '1999-01-01', '123@123.com', '123456789', '', 1, 6, 1, 1);
INSERT INTO `employee` VALUES (2, 'LiangHengBing', 'lianghengbing123', '肇庆学院', '2022-05-08', '123@123.com', NULL, NULL, 0, 3, 1, 3);
INSERT INTO `employee` VALUES (9, 'zhangsan', 'zhangsan', '', '2022-05-28', '', NULL, NULL, 1, 2, 1, 3);
INSERT INTO `employee` VALUES (10, 'Joker', 'yecanshuo159', '肇庆学院', '2022-04-30', '1231231234', NULL, NULL, 1, 4, 1, 1);
INSERT INTO `employee` VALUES (25, 'wenshaojie', 'wenshaojie', '', '2022-05-25', '', NULL, NULL, 1, 0, 1, 4);

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `FileID` int(0) NOT NULL AUTO_INCREMENT,
  `FileTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FileForm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FileTime` datetime(0) NULL DEFAULT NULL,
  `FileText` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FileTO` int(0) NULL DEFAULT NULL,
  `EmployeeID` int(0) NOT NULL,
  `FileRead` int(0) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`FileID`) USING BTREE,
  INDEX `EmployeeID1`(`EmployeeID`) USING BTREE,
  CONSTRAINT `EmployeeID1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, '测试1', '文件', 'txt', '2022-05-03 11:36:09', '文件内容123', 9, 2, 0);
INSERT INTO `file` VALUES (19, '存储地址测试', 'Logo', 'png', '2022-05-31 13:19:00', '按照时间分文件夹', 10, 10, 1);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `JobID` int(0) NOT NULL AUTO_INCREMENT,
  `JobIntroduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JobName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`JobID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (0, '默认职位', '无职位');
INSERT INTO `job` VALUES (1, '负责经验管理', '经理');
INSERT INTO `job` VALUES (2, '主要管理者', '主管');
INSERT INTO `job` VALUES (3, '工作者', '员工');
INSERT INTO `job` VALUES (4, '实习期的员工', '实习生');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `NoticeID` int(0) NOT NULL AUTO_INCREMENT,
  `NoticeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NoticeInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NoticeTime` datetime(0) NULL DEFAULT NULL,
  `EmployeeID` int(0) NOT NULL,
  PRIMARY KEY (`NoticeID`, `EmployeeID`) USING BTREE,
  INDEX `EmployeeID2`(`EmployeeID`) USING BTREE,
  CONSTRAINT `EmployeeID2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '通知一', '这是通知一', '2022-05-05 22:42:10', 1);
INSERT INTO `notice` VALUES (14, '11', '11', '2022-06-06 13:17:55', 10);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `TaskID` int(0) NOT NULL AUTO_INCREMENT,
  `TaskInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TaskName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EmployeeID` int(0) NOT NULL,
  `FinishTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TaskID`) USING BTREE,
  INDEX `EmployeeID3`(`EmployeeID`) USING BTREE,
  CONSTRAINT `EmployeeID3` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, '这是任务一', '任务一', 10, '2022-05-05 22:39:39');
INSERT INTO `task` VALUES (2, '这是任务二', '任务二', 10, '2022-05-05 22:39:55');
INSERT INTO `task` VALUES (3, '这是任务三', '任务三', 10, '2022-05-05 22:40:11');
INSERT INTO `task` VALUES (6, '这是测试用的任务', '测试任务', 10, '2022-05-08 02:26:25');
INSERT INTO `task` VALUES (7, '这是测试用的任务', '测试任务', 10, '2022-05-08 02:26:50');
INSERT INTO `task` VALUES (8, '这是测试用的任务', '测试任务', 2, '2022-05-20 00:21:35');
INSERT INTO `task` VALUES (9, '这是测试用的任务', '测试任务', 2, '2022-05-20 00:23:02');

-- ----------------------------
-- Table structure for todo
-- ----------------------------
DROP TABLE IF EXISTS `todo`;
CREATE TABLE `todo`  (
  `TodoId` int(0) NOT NULL AUTO_INCREMENT,
  `TodoText` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TodoFinish` int(0) NULL DEFAULT 0,
  `EmployeeID` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TodoId`) USING BTREE,
  INDEX `e4`(`EmployeeID`) USING BTREE,
  CONSTRAINT `e4` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of todo
-- ----------------------------
INSERT INTO `todo` VALUES (1, '回眸一笑百媚生，六宫粉黛无颜色。', 0, 10);
INSERT INTO `todo` VALUES (2, '芙蓉如面柳如眉，对此如何不泪垂。', 0, 10);
INSERT INTO `todo` VALUES (3, '芙蓉如面柳如眉，对此如何不泪垂。', 1, 10);
INSERT INTO `todo` VALUES (17, '125454', 0, 10);
INSERT INTO `todo` VALUES (18, '哈哈哈', 0, 10);

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `WorkID` int(0) NOT NULL AUTO_INCREMENT,
  `WorkTime` datetime(0) NULL DEFAULT NULL,
  `EmployeeID` int(0) NULL DEFAULT NULL,
  `WorkTO` int(0) NULL DEFAULT NULL,
  `WorkText` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `WorkFinish` float NULL DEFAULT 0,
  PRIMARY KEY (`WorkID`) USING BTREE,
  INDEX `e2`(`WorkTO`) USING BTREE,
  INDEX `e1`(`EmployeeID`) USING BTREE,
  CONSTRAINT `e1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `e2` FOREIGN KEY (`WorkTO`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (1, '2022-05-13 09:58:20', 1, 10, '完成任务', 55);
INSERT INTO `work` VALUES (2, '2022-05-13 09:58:23', 2, 10, '完成任务1', 10);
INSERT INTO `work` VALUES (6, '2022-05-25 15:32:35', 9, 10, '完成邮箱', 40);
INSERT INTO `work` VALUES (7, '2022-06-30 15:33:07', 10, 10, '123', 100);
INSERT INTO `work` VALUES (8, '2022-05-20 15:35:29', 1, 10, '111', 60);
INSERT INTO `work` VALUES (11, '2022-05-25 15:37:41', 1, 10, '1112', 90);
INSERT INTO `work` VALUES (13, '2020-06-03 16:00:00', 10, 2, '1', 50);

SET FOREIGN_KEY_CHECKS = 1;
