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

 Date: 26/05/2022 17:46:19
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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (1, 10, '2022-05-25 09:22:42', '2022-05-25 17:22:53');
INSERT INTO `attendance` VALUES (2, 13, '2022-05-25 13:23:08', '2022-05-25 17:23:11');
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
  `DeptId` int(0) NULL DEFAULT 0,
  `JobId` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`EmployeeID`) USING BTREE,
  INDEX `EmployeeID`(`EmployeeID`) USING BTREE,
  INDEX `d1`(`DeptId`) USING BTREE,
  INDEX `j1`(`JobId`) USING BTREE,
  CONSTRAINT `d1` FOREIGN KEY (`DeptId`) REFERENCES `dept` (`DeptID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `j1` FOREIGN KEY (`JobId`) REFERENCES `job` (`JobID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '张三', '123', '肇庆学院', '1999-01-01', '123@123.com', '123456789', 'https://img14.360buyimg.com/n0/jfs/t1/215044/11/18323/233222/626eaff4E4b9168d1/774482c7013e027d.jpg', 1, 1, 1, 1);
INSERT INTO `employee` VALUES (2, 'LiangHengBing', 'lianghengbing123', '肇庆学院', '2022-05-18', '123@123.com', '123456', 'https://img11.360buyimg.com/n1/s350x467_jfs/t1/187493/8/24391/229012/626eafb0E6fd96a8f/d605fd53c8ca3e04.jpg!cc_350x467', 0, 2, 1, 4);
INSERT INTO `employee` VALUES (9, 'zhangsan', 'zhangsan', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 3);
INSERT INTO `employee` VALUES (10, 'Joker', 'yecanshuo159', '肇庆学院', '2022-05-24', '123123123', '123123123', NULL, 0, 0, 1, 2);
INSERT INTO `employee` VALUES (13, 'ChenXiaoHong', 'chenxiaohong123', '肇庆学院', '2022-05-10', '123@123.123', '123456789', NULL, 0, 0, 1, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, '测试1', '文件', 'txt', '2022-05-03 11:36:09', '文件内容123', 9, 2, 0);
INSERT INTO `file` VALUES (2, '测试2', '文件2', 'txt', '2022-05-02 11:37:12', '文件321', 2, 10, 1);
INSERT INTO `file` VALUES (6, '测试5', '测试文件', 'txt', '2022-05-20 00:21:33', '文件222', 10, 10, 1);
INSERT INTO `file` VALUES (8, '2', 'uBooksOnline项目开发讲义V09', 'pdf', '2022-05-24 02:23:29', '这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话', 9, 10, 1);
INSERT INTO `file` VALUES (9, '2', '单元1-ASP.NET开发技术基础', 'pdf', '2022-05-24 02:41:25', '这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话', 10, 10, 1);
INSERT INTO `file` VALUES (10, '1', '讲义-单元7-数据绑定及数据控件.', 'pdf', '2022-05-24 02:47:07', '软件测试度量是一种通过检测软件测试过程的质量和有效性来评估软件开发的量化方法。开发团队使用测试指标来跟踪开发过程各个阶段的软件质量。测试指标对于管理层也很有用，它可以让公司股东评估软件开发团队的效率。\n\n测试指标应该始终是有意义和可执行的。问题是有些测试指标无法达到这一目标。许多指标都是误导，有些只是无价值的指标，而有些则毫无意义。\r\n————————————————\r\n版权声明：本文为CSDN博主「钱曙光」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。\r\n软件测试度量是一种通过检测软件测试过程的质量和有效性来评估软件开发的量化方法。开发团队使用测试指标来跟踪开发过程各个阶段的软件质量。测试指标对于管理层也很有用，它可以让公司股东评估软件开发团队的效率。\n\n测试指标应该始终是有意义和可执行的。问题是有些测试指标无法达到这一目标。许多指标都是误导，有些只是无价值的指标，而有些则毫无意义。\r\n————————————————\r\n版权声明：本文为CSDN博主「钱曙光」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/qiansg123/article/details/80131874', 10, 10, 1);
INSERT INTO `file` VALUES (11, '测试', '屏幕截图 2022-03-10 174631', 'png', '2022-05-24 03:33:38', '这是一个糟糕的度量标准，原因很简单，它没有告诉你测试用例测试的是什么。\n\n这个度量标准的最初想法是，我们开发的测试用例越多，我们的测试就越全面。实际上，许多测试用例根本没有对测试覆盖率做出贡献。许多测试套包含已弃用的测试，这些测试不再与软件的新版本相关。测试用例的设计效率不高，因此它们会重叠，并且本质上是测试相同的功能。\n在这些和许多其他的情况下，拥有更多的测试用例并不是一件好事，这可能只是代表一个臃肿且过于复杂的测试套。\r\n', 10, 10, 1);
INSERT INTO `file` VALUES (12, '测试1', '实验4', 'pdf', '2022-05-24 03:35:16', '111111', 10, 10, 0);
INSERT INTO `file` VALUES (13, '发给张三', NULL, NULL, '2022-05-24 04:08:28', '发给张三', 9, 10, 0);
INSERT INTO `file` VALUES (14, '1', '实验2', 'docx', '2022-05-24 08:06:44', '1', 10, 10, 0);
INSERT INTO `file` VALUES (15, '1', '屏幕截图 2022-03-10 181252', 'png', '2022-05-24 08:58:34', '1', 10, 10, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (1, '2022-05-13 09:58:20', 1, 10, '完成任务', 0);
INSERT INTO `work` VALUES (2, '2022-05-13 09:58:23', 2, 10, '完成任务1', 10);
INSERT INTO `work` VALUES (3, '2022-05-13 02:05:39', 13, 10, '222', 70);
INSERT INTO `work` VALUES (5, '2022-05-20 00:23:03', 10, 10, '111', 30);
INSERT INTO `work` VALUES (6, '2022-05-25 15:32:35', 9, 10, '完成邮箱', 40);
INSERT INTO `work` VALUES (7, '2022-06-30 15:33:07', 10, 10, '123', 50);
INSERT INTO `work` VALUES (8, '2022-05-20 15:35:29', 1, 10, '111', 60);
INSERT INTO `work` VALUES (9, '2022-05-13 15:36:06', 13, 10, '111', 20);
INSERT INTO `work` VALUES (10, '2022-05-13 15:36:06', 13, 10, '111', 80);
INSERT INTO `work` VALUES (11, '2022-05-25 15:37:41', 1, 10, '1112', 90);
INSERT INTO `work` VALUES (12, '2022-05-25 15:37:56', 13, 10, '11', 100);

SET FOREIGN_KEY_CHECKS = 1;
