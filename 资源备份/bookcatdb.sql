/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : bookcatdb

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-06-03 18:14:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bk_odr
-- ----------------------------
DROP TABLE IF EXISTS `bk_odr`;
CREATE TABLE `bk_odr` (
  `orderid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `num` smallint(6) NOT NULL,
  PRIMARY KEY (`orderid`,`bookid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `bk_odr_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bk_odr_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_odr
-- ----------------------------
INSERT INTO `bk_odr` VALUES ('1', '4', '2');
INSERT INTO `bk_odr` VALUES ('1', '5', '1');
INSERT INTO `bk_odr` VALUES ('2', '4', '3');
INSERT INTO `bk_odr` VALUES ('3', '5', '1');
INSERT INTO `bk_odr` VALUES ('9', '1', '99');
INSERT INTO `bk_odr` VALUES ('9', '8', '66');
INSERT INTO `bk_odr` VALUES ('10', '8', '1');
INSERT INTO `bk_odr` VALUES ('10', '12', '2');
INSERT INTO `bk_odr` VALUES ('11', '3', '1');
INSERT INTO `bk_odr` VALUES ('11', '13', '1');
INSERT INTO `bk_odr` VALUES ('11', '14', '1');
INSERT INTO `bk_odr` VALUES ('12', '8', '1');
INSERT INTO `bk_odr` VALUES ('12', '10', '1');
INSERT INTO `bk_odr` VALUES ('12', '12', '2');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(26) DEFAULT NULL,
  `msg` char(200) DEFAULT NULL,
  `price` smallint(6) DEFAULT NULL,
  `category` smallint(6) DEFAULT NULL,
  `num` smallint(6) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `hotnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'Redis开发与运维', '本书全面讲解Redis基本功能及其应用，并结合线上开发与运维监控中的实际使用案例，深入分析并总结了实际开发运维中遇到的“陷阱”，以及背后的原因， 包含大规模集群开发与管理的场景、应用案例与开发技巧，为高效开发运维提供了大量实际经验和建议。', '89', '1', '2', '2018-05-16 19:45:24', '90');
INSERT INTO `book` VALUES ('2', 'RabbitMQ实战指南', '从消息中间件的概念和RabbitMQ的历史切入，主要阐述RabbitMQ的安装、使用、配置、管理、运维、原理、扩展等方面的细节。《RabbitMQ实战指南》大致可以分为基础篇、进阶篇和高阶篇三个部分。基础篇首先介绍RabbitMQ的基本安装及使用方式，方便零基础的读者以最舒适的方式融入到RabbitMQ之中。', '78', '1', '20', '2018-05-16 19:46:41', '66');
INSERT INTO `book` VALUES ('3', 'MongoDB权威指南', '《mongodb权威指南》的两位作者来自开发并支持开源数据库mongodb的公司10gen。数据库开发人员可将此书作为参考指南，系统管理员可以从本书中找到高级配置技巧，其他用户可以了解一些基本概念和用例。你会发现，将数据组织成自包含的json风格的文档比组织成关系型数据库中的记录要容易得多。', '39', '1', '50', '2018-05-17 19:47:47', '7');
INSERT INTO `book` VALUES ('4', 'Kafka入门与实践', '以Kafka 0.10.1.1版本以基础，对Kafka的基本组件的实现细节及其基本应用进行了详细介绍，同时，通过对Kafka与当前大数据主流框架整合应用案例的讲解，进一步展现了Kafka在实际业务中的作用和地位。本书共10章，按照从抽象到具体、从点到线再到面的学习思维模式，由浅入深，理论与实践相结合，对Kafka进行了分析讲解。', '69', '1', '40', '2018-05-17 19:49:00', '30');
INSERT INTO `book` VALUES ('5', 'Tomcat权威指南', '本书是一本任何开发、管理或使用Tomcat的人士必备的工具书。本书从Tomcat的基本安装开始解说，然后很快地进入更高级的领域。你将学会如何设定Tomcat来与系统交互：包括自动启动及终止，以及在Tomcat提供的各种配置选项中接受详细的指令。', '38', '1', '30', '2018-05-03 19:50:29', '20');
INSERT INTO `book` VALUES ('6', '算法竞赛入门经典', '一本算法竞赛的入门教材，把C/C++语言、算法和解题有机地结合在了一起，淡化理论，注重学习方法和实践技巧。全书内容分为11章，包括程序设计入门、循环结构程序设计、数组和字符串、函数和递归、基础题目选解、数据结构基础、暴力求解法、高效算法设计、动态规划初步、数学概念与方法、图论模型与算法，覆盖了算法竞赛入门所需的主要知识点，并附有大量习题。', '24', '1', '66', '2009-07-15 19:52:08', '30');
INSERT INTO `book` VALUES ('7', 'c++ primer plus', '全书分为18章和10个附录，分别介绍了C++程序的运行方式、基本数据类型、复合数据类型、循环和关系表达式、分支语句和逻辑操作符、函数重载和函数模板、内存模型和名称空间、类的设计和使用、多态、虚函数、动态内存分配、继承、代码重用、友元、异常处理技术、string类和标准模板库、输入/输出等内容。', '99', '1', '40', '2012-06-19 19:53:42', '6');
INSERT INTO `book` VALUES ('8', 'c++ primer', '本书是久负盛名的C++经典教程，其内容是C++大师Stanley B. Lippman丰富的实践经验和C++标准委员会原负责人Josée Lajoie对C++标准深入理解的完美结合，已经帮助全球无数程序员学会了C++。 对C++基本概念和技术全面而且权威的阐述，对现代C++编程风格的强调，使本书成为C++初学者的最佳指南；对于中高级程序员，本书也是不可或缺的参考书。', '99', '1', '70', '2006-06-01 19:55:26', '88');
INSERT INTO `book` VALUES ('9', 'hadoop mapreduce v2 参考手册', '开篇介绍了Hadoop YARN、MapReduce、HDFs以及其他Hadoop生态系统组件的安装。在《Hadoop MapReduce V2参考手册（第2版 影印版 英文版）》的指引下，你很快就会学习到很多激动人心的主题，例如MapReduce模式，使用Hadoop处理分析、归类、在线销售、推荐、数据索引及搜索。', '52', '1', '4', '2018-04-05 19:57:12', '30');
INSERT INTO `book` VALUES ('10', '道德情操论', '在该书中，斯密用同情的基本原理来阐释正义、仁慈、克己等一切道德情操产生的根源，说明道德评价的性质、原则以及各种美德的特征，并对各种道德哲学学说进行了介绍和评价，进而揭示出人类社会赖以维系、和谐发展的基础以及人的行为应遵循的一般道德准则。', '30', '24', '45', '2011-08-15 19:59:07', '44');
INSERT INTO `book` VALUES ('11', 'JavaEE基础实用教程', '主要包含实用教程、实验指导和综合应用实习三部分，涵盖了理论和实践教学的全过程。实用教程部分系统介绍Java EE开发环境配置、JSP应用、Struts 2应用、Hibernate应用、Spring应用、Ajax应用及它们之间的整合，其中的习题主要用于强化基本概念。', '49', '1', '0', '2009-03-19 20:00:56', '0');
INSERT INTO `book` VALUES ('12', 'Go Web编程', '在《Go Web编程》中，读者可以更加方便地找到各种编程问题的解决方案，内容涵盖文本处理、表单处理、Session管理、数据库交互、加/解密、国际化和标准化，以及程序的部署维护等运维方面的知识，最后还介绍了一个快速开发的框架帮助您迅速进入Go语言的Web开发。', '65', '1', '10', '2018-03-02 20:02:17', '19');
INSERT INTO `book` VALUES ('13', 'DB2从入门到精通', '《DB2从入门到精通》共分3篇19章，包括初识DB2，DB2的体系结构与DB2工具，实例和服务器管理，DB2数据库基础，管理表空间和表，表数据的基本操作，数据库对象，DB2数据查询技术，视图的使用，约束、索引和别名，SQL过程语言，DB2中的函数，存储过程和触发器，DB2数据库安全处理，数据库的备份与恢复，PureXML技术应用，XQuery技术的使用，数据移动，事务与锁等内容。', '53', '1', '39', '2018-02-19 20:04:24', '70');
INSERT INTO `book` VALUES ('14', 'Spring Boot实战', '本书以Spring应用程序开发为中心，全面讲解如何运用Spring Boot提高效率，使应用程序的开发和管理更加轻松有趣。作者行文亲切流畅，以大量示例讲解了Spring Boot在各类情境中的应用，内容涵盖起步依赖、Spring Boot CLI、Groovy、Grails、Actuator。对于Spring Boot开发应用中较为繁琐的内容，附录奉上整理完毕的表格，一目了然，方便读者查阅。', '59', '1', '66', '2017-12-19 20:05:47', '60');
INSERT INTO `book` VALUES ('15', '大学物理', '本书是张三慧主编《大学物理学（第三版）》（清华大学出版社2008年出版）的学习辅导用书。内容包括该教材各章的概念原理复习、解题要点、思考题选答和习题解答。本书习题内容广泛，事例新颖、典型、有趣，富有启发性，难度有低有高；复习内容重点突出，解题要点明确清楚，习题解答简明扼要。', '39', '2', '20', '2018-05-27 13:26:54', '10');
INSERT INTO `book` VALUES ('16', '相对论', '阿尔伯特·爱因斯坦著的《相对论》是一部彻底颠覆**物理学观念的创世之书。它否定了牛顿的**时空观，认为空间不是平直的欧几里得空间，而是在引力场中弯曲的黎曼空间；时间也不是独立于空间的单独一维，它无时无刻不在空间之中，与空间构成一个统一的四维时空整体。 《相对论》是一部并非凭借双眼，而是用智慧发现并创建了宇宙新秩序的书。', '48', '2', '15', '2018-05-27 13:51:48', '10');
INSERT INTO `book` VALUES ('17', '全栈开发之道', '选用MEAN全栈技术，可以快速地实现敏捷开发，尤其是到了产品的运营阶段，其优势表现得非常明显。本书主要介绍MEAN全栈技术，分为入门篇、基础篇和实战篇，入门篇对全栈进行了概述，基础篇重点介绍了全栈的四个主要技术，即MongoDB、Express、AngularJS、Node.js，实战篇则通过四个常用的实例来引导读者循序渐进地掌握全栈开发的思路。', '53', '1', '14', '2018-05-27 14:01:49', '10');
INSERT INTO `book` VALUES ('18', 'Node应用程序构建', '本书概述了Node.js、MongoDB和Backbone.js的核心技术。第二部分包括第5章到第10章，介绍如何使用这些工具去构建一个具有社交网络风格的网站。如果是刚开始学习，建议先从部分获取一些背景知识，然后在第二部分深入学习。如果你已经熟悉JavaScript，可以直接跳过部分，会发现第二部分中的例子也是可以理解的。', '23', '1', '30', '2018-05-27 14:15:46', '10');
INSERT INTO `book` VALUES ('20', 'MongoDB大数据处理', 'MongoDB是很流行的“大数据”NoSQL数据库技术，目前仍在蓬勃发展。来自10gen的David Hows以及经验丰富的Peter Membrey和Eelco Plugge等MongoDB专家联袂撰写本书，在书中分享他们的宝贵专业知识和经验，向读者呈现成长为一名MongoDB专家需要了解的所有知识。', '42', '1', '20', '2018-05-27 14:29:56', '10');
INSERT INTO `book` VALUES ('21', '物理是什么', '本书为日本著名物理学家、诺贝尔物理学奖得主朝永振一郎先生的物理启蒙科普作品，书中以思索“物理是什么”为线索，以宏阔视野、精深笔触，通俗讲述了从早期哲学思辨到炼金术、占星术，再到近代科学的物理体系的发展，并重点讲解了物理发展过程中的核心原理。', '34', '2', '30', '2018-05-27 14:39:54', '10');
INSERT INTO `book` VALUES ('22', '固体物理学', '本书是在黄昆教授原著本书的基础上改编而成的.原书概念准确、讲解透彻，在改写过程中力图保持原书的特点.对固体物理学中的一些基础部分：如晶体结构、晶格振动、固体能带论.半导体电子论和固体磁性等部分在内容上都做了必要的补充，内容更加丰富。', '32', '2', '7', '2018-05-27 14:56:59', '10');
INSERT INTO `book` VALUES ('24', 'Redis设计与实现', '黄健宏著的《Redis设计与实现》全面而完整地讲解了Redis的内部机制与实现方式，对Redis的大多数单机功能以及所有多机功能的实现原理进行了介绍，展示了这些功能的核心数据结构以及关键的算法思想,图示丰富，描述清晰，并给出大量参考信息。', '59', '1', '40', '2018-05-27 15:15:03', '10');
INSERT INTO `book` VALUES ('27', '物理', '买了很多次书了，质量好发货快，也推荐给其他家长了。买了很多次书了，质量好发货快，也推荐给其他家长了。买了很多次书了，质量好发货快，也推荐给其他家长了。', '18', '2', '20', '2018-05-28 02:06:59', '10');
INSERT INTO `book` VALUES ('28', 'kafka技术内幕', '测试入库，测试入库，测试入库！', '83', '1', '30', '2018-06-03 17:15:28', '10');

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `userid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `comments` char(200) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`userid`,`bookid`,`time`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `leave_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `leave_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave
-- ----------------------------
INSERT INTO `leave` VALUES ('1', '1', '板凳', '2018-05-28 16:36:32');
INSERT INTO `leave` VALUES ('1', '1', '这本书挺好', '2018-05-29 02:58:17');
INSERT INTO `leave` VALUES ('1', '8', '十五字十五字十五字十五字十五字', '2018-05-31 00:48:20');
INSERT INTO `leave` VALUES ('1', '9', '是不可或缺的参考书', '2018-05-29 02:58:29');
INSERT INTO `leave` VALUES ('1', '14', '学习一下Spring boot', '2018-05-29 14:01:18');
INSERT INTO `leave` VALUES ('1', '14', '留言留言留言', '2018-05-29 14:01:40');
INSERT INTO `leave` VALUES ('1', '14', '额鹅鹅鹅呃呃呃', '2018-05-29 14:02:04');
INSERT INTO `leave` VALUES ('4', '1', '呃呃呃沙发沙发', '2018-05-15 02:53:41');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `name` char(16) NOT NULL,
  `password` char(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', '刘知昊小猫咪', '123456');
INSERT INTO `login` VALUES ('4', '吴瑟晞', '123wsx');
INSERT INTO `login` VALUES ('6', '马家俊', '123mjj');
INSERT INTO `login` VALUES ('7', '辛翌菲', '123xyf');
INSERT INTO `login` VALUES ('8', '蔡坤', '1234ck');
INSERT INTO `login` VALUES ('9', '李喆雯', '123lzw');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `sum` smallint(6) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '200', '2018-05-15 09:25:55');
INSERT INTO `orders` VALUES ('2', '1', '130', '2018-05-16 09:26:07');
INSERT INTO `orders` VALUES ('3', '4', '140', '2018-05-14 09:27:03');
INSERT INTO `orders` VALUES ('9', '1', '99', '2018-05-30 03:32:00');
INSERT INTO `orders` VALUES ('10', '1', '160', '2018-05-30 11:29:19');
INSERT INTO `orders` VALUES ('11', '1', '149', '2018-05-30 11:39:23');
INSERT INTO `orders` VALUES ('12', '1', '256', '2018-06-03 17:07:52');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(16) NOT NULL,
  `sex` bit(1) NOT NULL,
  `tel` char(11) DEFAULT NULL,
  `address` char(40) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `motto` char(80) DEFAULT NULL,
  `sale1` smallint(6) DEFAULT NULL,
  `sale2` smallint(6) DEFAULT NULL,
  `sale3` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '刘知昊小猫咪', '', '18800201312', '上海 上海市 宝山区 上海大学 刘知昊收', '3400', '小猫咪啊啊啊啊啊啊啊', '2', '0', '4');
INSERT INTO `user` VALUES ('4', '吴瑟晞', '\0', null, '上海大学', '5432', '小猫咪4', '300', '200', '70');
INSERT INTO `user` VALUES ('6', '马家俊', '', null, '上海大学', '700', '小猫咪6', '140', '40', '0');
INSERT INTO `user` VALUES ('7', '辛翌菲', '\0', null, '上海大学', '400', '小猫咪7', '60', '8', '0');
INSERT INTO `user` VALUES ('8', '蔡坤', '', null, '上海大学', '1234', '小猫咪8', '0', '90', '0');
INSERT INTO `user` VALUES ('9', '李喆雯', '\0', null, '上海大学', '678', '小猫咪9', '76', '33', '0');
