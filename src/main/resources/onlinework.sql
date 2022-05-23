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

 Date: 23/05/2022 19:15:12
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `DeptID` int(0) NOT NULL AUTO_INCREMENT,
  `DeptName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeptIntroduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DeptID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '开发部门', '这是一个开发部门');
INSERT INTO `dept` VALUES (2, '销售部', '这是一个负责销售的部门');
INSERT INTO `dept` VALUES (3, '外交部', '外交部');
INSERT INTO `dept` VALUES (6, '这是测试用的部门', '测试部门');
INSERT INTO `dept` VALUES (7, '这是测试用的部门', '测试部门');
INSERT INTO `dept` VALUES (8, '这是测试用的部门', '测试部门');
INSERT INTO `dept` VALUES (9, '这是测试用的部门', '测试部门');
INSERT INTO `dept` VALUES (10, '这是测试用的部门', '测试部门');

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
  `Photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sex` int(0) NULL DEFAULT NULL,
  `UserLevel` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`) USING BTREE,
  INDEX `EmployeeID`(`EmployeeID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '张三', '123', '肇庆学院', '1999-01-01', '123@123.com', '123456789', 'https://img14.360buyimg.com/n0/jfs/t1/215044/11/18323/233222/626eaff4E4b9168d1/774482c7013e027d.jpg', 1, 1);
INSERT INTO `employee` VALUES (2, '李四', '123', '肇庆学院', '2022-05-18', '123@123.com', '123456', 'https://img11.360buyimg.com/n1/s350x467_jfs/t1/187493/8/24391/229012/626eafb0E6fd96a8f/d605fd53c8ca3e04.jpg!cc_350x467', 0, 2);
INSERT INTO `employee` VALUES (3, '王五', '123', '肇庆学院', '2022-05-03', '123@123.com', '123456789', 'null', 1, 0);
INSERT INTO `employee` VALUES (5, '李六', '123', '测试', '2022-05-05', '123', '123', '123', 1, 1);
INSERT INTO `employee` VALUES (6, '王五', '123', '肇庆学院', '2022-05-08', '123@123.com', '123456789', 'null', 1, 0);
INSERT INTO `employee` VALUES (7, '王五', '123', '肇庆学院', '2022-05-08', '123@123.com', '123456789', 'null', 1, 0);
INSERT INTO `employee` VALUES (9, 'zhangsan', 'zhangsan', NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `employee` VALUES (10, 'Joker', 'yecanshuo159', NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `employee` VALUES (11, '王五', '123', '肇庆学院', '2022-05-20', '123@123.com', '123456789', 'null', 1, 0);
INSERT INTO `employee` VALUES (12, '王五', '123', '肇庆学院', '2022-05-20', '123@123.com', '123456789', 'null', 1, 0);

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
  `FileText` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FileTO` int(0) NULL DEFAULT NULL,
  `EmployeeID` int(0) NOT NULL,
  `FileRead` int(0) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`FileID`) USING BTREE,
  INDEX `EmployeeID1`(`EmployeeID`) USING BTREE,
  CONSTRAINT `EmployeeID1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, NULL, '文件', 'txt', '2022-05-03 11:36:09', '文件内容123', 1, 2, 0);
INSERT INTO `file` VALUES (2, NULL, '文件2', 'txt', '2022-05-02 11:37:12', '文件321', 2, 10, 0);
INSERT INTO `file` VALUES (3, NULL, '测试文件', 'txt', '2022-05-08 02:26:23', '文件4444', 10, 10, 1);
INSERT INTO `file` VALUES (4, NULL, '测试文件', 'txt', '2022-05-08 02:26:48', '文件333', 10, 10, 0);
INSERT INTO `file` VALUES (6, NULL, '测试文件', 'txt', '2022-05-20 00:21:33', '文件222', 10, 10, 0);
INSERT INTO `file` VALUES (7, NULL, '测试文件', 'txt', '2022-05-20 00:22:59', '文件111', 10, 1, 0);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `JobID` int(0) NOT NULL AUTO_INCREMENT,
  `JobIntroduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JobName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`JobID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (1, '负责经验管理', '经理');
INSERT INTO `job` VALUES (2, '主要管理者', '主管');
INSERT INTO `job` VALUES (3, '工作者', '员工');
INSERT INTO `job` VALUES (4, '实习期的员工', '实习生');
INSERT INTO `job` VALUES (6, '这是测试用的工作职位', '测试职位');
INSERT INTO `job` VALUES (7, '这是测试用的工作职位', '测试职位');
INSERT INTO `job` VALUES (8, '这是测试用的工作职位', '测试职位');
INSERT INTO `job` VALUES (9, '这是测试用的工作职位', '测试职位');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '通知一', '这是通知一', '2022-05-05 22:42:10', 1);
INSERT INTO `notice` VALUES (2, '通知二', '这是通知二', '2022-05-05 22:42:23', 2);
INSERT INTO `notice` VALUES (3, '通知三', '这是通知三', '2022-05-05 22:42:39', 1);
INSERT INTO `notice` VALUES (5, '测试通知', '这是测试用的通知', '2022-05-08 02:26:24', 2);
INSERT INTO `notice` VALUES (6, '测试通知', '这是测试用的通知', '2022-05-08 02:26:49', 2);
INSERT INTO `notice` VALUES (7, '测试通知', '这是测试用的通知', '2022-05-20 00:21:34', 2);
INSERT INTO `notice` VALUES (8, '测试通知', '这是测试用的通知', '2022-05-20 00:23:00', 2);

-- ----------------------------
-- Table structure for relation
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation`  (
  `employeeId` int(0) NOT NULL,
  `deptId` int(0) NOT NULL,
  `jobId` int(0) NOT NULL,
  PRIMARY KEY (`employeeId`) USING BTREE,
  INDEX `d`(`deptId`) USING BTREE,
  INDEX `j`(`jobId`) USING BTREE,
  CONSTRAINT `d` FOREIGN KEY (`deptId`) REFERENCES `dept` (`DeptID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `e` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `j` FOREIGN KEY (`jobId`) REFERENCES `job` (`JobID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES (1, 1, 1);
INSERT INTO `relation` VALUES (2, 2, 2);
INSERT INTO `relation` VALUES (3, 3, 3);
INSERT INTO `relation` VALUES (5, 1, 1);
INSERT INTO `relation` VALUES (10, 1, 1);

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
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `workID` int(0) NOT NULL AUTO_INCREMENT,
  `workTime` datetime(0) NULL DEFAULT NULL,
  `employeeID` int(0) NULL DEFAULT NULL,
  `workTO` int(0) NULL DEFAULT NULL,
  `workText` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workFinish` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`workID`) USING BTREE,
  INDEX `e1`(`employeeID`) USING BTREE,
  INDEX `e2`(`workTO`) USING BTREE,
  CONSTRAINT `e2` FOREIGN KEY (`workTO`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (1, '2022-05-13 09:58:20', 1, 10, '完成任务', 0);
INSERT INTO `work` VALUES (2, '2022-05-13 09:58:23', 3, 10, '完成任务1', 0);
INSERT INTO `work` VALUES (3, '2022-05-13 02:05:39', 5, 10, '222', 1);
INSERT INTO `work` VALUES (5, '2022-05-20 00:23:03', 5, 2, '111', 0);

SET FOREIGN_KEY_CHECKS = 1;
