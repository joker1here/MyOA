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

 Date: 24/05/2022 20:50:50
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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '张三', '123', '肇庆学院', '1999-01-01', '123@123.com', '123456789', 'https://img14.360buyimg.com/n0/jfs/t1/215044/11/18323/233222/626eaff4E4b9168d1/774482c7013e027d.jpg', 1, 1);
INSERT INTO `employee` VALUES (2, 'LiangHengBing', 'lianghengbing123', '肇庆学院', '2022-05-18', '123@123.com', '123456', 'https://img11.360buyimg.com/n1/s350x467_jfs/t1/187493/8/24391/229012/626eafb0E6fd96a8f/d605fd53c8ca3e04.jpg!cc_350x467', 0, 2);
INSERT INTO `employee` VALUES (9, 'zhangsan', 'zhangsan', NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `employee` VALUES (10, 'Joker', 'yecanshuo159', '肇庆学院', '2022-05-24', '123123123', '123123123', NULL, 0, 0);
INSERT INTO `employee` VALUES (13, 'ChenXiaoHong', 'chenxiaohong123', '肇庆学院', '2022-05-10', '123@123.123', '123456789', NULL, 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, '测试1', '文件', 'txt', '2022-05-03 11:36:09', '文件内容123', 9, 2, 0);
INSERT INTO `file` VALUES (2, '测试2', '文件2', 'txt', '2022-05-02 11:37:12', '文件321', 2, 10, 1);
INSERT INTO `file` VALUES (3, '测试3', '测试文件', 'txt', '2022-05-08 02:26:23', '文件4444', 10, 10, 1);
INSERT INTO `file` VALUES (4, '测试4', '测试部门', 'txt', '2022-05-08 02:26:48', '文件333', 10, 10, 1);
INSERT INTO `file` VALUES (6, '测试5', '测试文件', 'txt', '2022-05-20 00:21:33', '文件222', 10, 10, 1);
INSERT INTO `file` VALUES (7, '测试6', '测试文件', 'txt', '2022-05-20 00:22:59', '文件111', 10, 1, 1);
INSERT INTO `file` VALUES (8, '2', 'uBooksOnline项目开发讲义V09', 'pdf', '2022-05-24 02:23:29', '这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话', 9, 10, 0);
INSERT INTO `file` VALUES (9, '2', '单元1-ASP.NET开发技术基础', 'pdf', '2022-05-24 02:41:25', '这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话这是一段没有意义的话', 10, 10, 1);
INSERT INTO `file` VALUES (10, '1', '讲义-单元7-数据绑定及数据控件.', 'pdf', '2022-05-24 02:47:07', '软件测试度量是一种通过检测软件测试过程的质量和有效性来评估软件开发的量化方法。开发团队使用测试指标来跟踪开发过程各个阶段的软件质量。测试指标对于管理层也很有用，它可以让公司股东评估软件开发团队的效率。\n\n测试指标应该始终是有意义和可执行的。问题是有些测试指标无法达到这一目标。许多指标都是误导，有些只是无价值的指标，而有些则毫无意义。\r\n————————————————\r\n版权声明：本文为CSDN博主「钱曙光」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。\r\n软件测试度量是一种通过检测软件测试过程的质量和有效性来评估软件开发的量化方法。开发团队使用测试指标来跟踪开发过程各个阶段的软件质量。测试指标对于管理层也很有用，它可以让公司股东评估软件开发团队的效率。\n\n测试指标应该始终是有意义和可执行的。问题是有些测试指标无法达到这一目标。许多指标都是误导，有些只是无价值的指标，而有些则毫无意义。\r\n————————————————\r\n版权声明：本文为CSDN博主「钱曙光」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/qiansg123/article/details/80131874', 10, 10, 1);
INSERT INTO `file` VALUES (11, '测试', '屏幕截图 2022-03-10 174631', 'png', '2022-05-24 03:33:38', '这是一个糟糕的度量标准，原因很简单，它没有告诉你测试用例测试的是什么。\n\n这个度量标准的最初想法是，我们开发的测试用例越多，我们的测试就越全面。实际上，许多测试用例根本没有对测试覆盖率做出贡献。许多测试套包含已弃用的测试，这些测试不再与软件的新版本相关。测试用例的设计效率不高，因此它们会重叠，并且本质上是测试相同的功能。\n在这些和许多其他的情况下，拥有更多的测试用例并不是一件好事，这可能只是代表一个臃肿且过于复杂的测试套。\r\n', 10, 10, 1);
INSERT INTO `file` VALUES (12, '测试1', '实验4', 'pdf', '2022-05-24 03:35:16', '111111', 10, 10, 1);
INSERT INTO `file` VALUES (13, '发给张三', NULL, NULL, '2022-05-24 04:08:28', '发给张三', 9, 10, 0);
INSERT INTO `file` VALUES (14, '1', '实验2', 'docx', '2022-05-24 08:06:44', '1', 10, 10, 1);
INSERT INTO `file` VALUES (15, '1', '屏幕截图 2022-03-10 181252', 'png', '2022-05-24 08:58:34', '1', 10, 10, 1);

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
  `EmployeeId` int(0) NOT NULL,
  `DeptId` int(0) NOT NULL,
  `JobId` int(0) NOT NULL,
  PRIMARY KEY (`EmployeeId`) USING BTREE,
  INDEX `d`(`DeptId`) USING BTREE,
  INDEX `j`(`JobId`) USING BTREE,
  CONSTRAINT `d` FOREIGN KEY (`DeptId`) REFERENCES `dept` (`DeptID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `e` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `j` FOREIGN KEY (`JobId`) REFERENCES `job` (`JobID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES (1, 1, 1);
INSERT INTO `relation` VALUES (2, 2, 2);
INSERT INTO `relation` VALUES (9, 2, 2);
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
  `WorkFinish` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`WorkID`) USING BTREE,
  INDEX `e1`(`EmployeeID`) USING BTREE,
  INDEX `e2`(`WorkTO`) USING BTREE,
  CONSTRAINT `e2` FOREIGN KEY (`WorkTO`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (1, '2022-05-13 09:58:20', 1, 10, '完成任务', 0);
INSERT INTO `work` VALUES (2, '2022-05-13 09:58:23', 3, 10, '完成任务1', 0);
INSERT INTO `work` VALUES (3, '2022-05-13 02:05:39', 5, 10, '222', 1);
INSERT INTO `work` VALUES (5, '2022-05-20 00:23:03', 5, 2, '111', 0);

SET FOREIGN_KEY_CHECKS = 1;
