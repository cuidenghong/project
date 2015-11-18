# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     lcmf
# Server version:               5.5.5-m3
# Server OS:                    Win64
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2015-11-04 23:55:17
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table lcmf.lcmf_admin
DROP TABLE IF EXISTS `lcmf_admin`;
CREATE TABLE IF NOT EXISTS `lcmf_admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(40) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `loginip` varchar(20) DEFAULT NULL COMMENT '登陆IP',
  `logintime` int(11) DEFAULT NULL COMMENT '登陆时间',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_admin: 0 rows
/*!40000 ALTER TABLE `lcmf_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcmf_admin` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_column
DROP TABLE IF EXISTS `lcmf_column`;
CREATE TABLE IF NOT EXISTS `lcmf_column` (
  `columnid` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `tableid` int(11) DEFAULT NULL COMMENT '模型',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  `sequence` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`columnid`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_column: 32 rows
/*!40000 ALTER TABLE `lcmf_column` DISABLE KEYS */;
INSERT INTO `lcmf_column` (`columnid`, `parentid`, `name`, `tableid`, `link`, `sequence`) VALUES (1, 0, '公司简介', 0, NULL, 0), (2, 1, '企业介绍', 1, NULL, 0), (3, 1, '企业文化', 1, NULL, 1), (4, 0, '产品中心', 0, NULL, 1), (5, 1, '企业证书', 0, NULL, 2), (6, 5, '企业专利', 11, NULL, 0), (7, 5, '资质认证', 2, NULL, 1), (8, 4, '竹炭环保装饰板', 3, NULL, 0), (9, 4, '居家净化日用及工艺品', 3, NULL, 1), (10, 4, '车载净化器', 3, NULL, 2), (11, 4, '室内空气净化交换装置', 3, NULL, 3), (12, 4, '炭吸附材料', 3, NULL, 4), (13, 0, '新闻中心', 0, NULL, 2), (14, 13, '最新动态', 4, NULL, 0), (15, 13, '行业动态', 4, NULL, 1), (16, 13, '官方媒体', 4, NULL, 2), (17, 0, '公司视频', 0, NULL, 3), (18, 17, '企业宣传片', 5, NULL, 0), (19, 17, '产品宣传片', 5, NULL, 1), (20, 0, '招商加盟', 0, NULL, 4), (21, 20, '市场分析', 6, NULL, 0), (22, 20, '效益分析', 6, NULL, 1), (23, 20, '招商政策', 6, NULL, 2), (24, 20, '售后保障', 6, NULL, 3), (25, 20, '检测报告', 6, NULL, 4), (26, 0, '竹炭研究', 0, NULL, 5), (27, 26, '竹炭研究', 7, NULL, 0), (28, 0, '人才招聘', 0, NULL, 6), (29, 28, '招聘岗位', 8, NULL, 0), (30, 28, '招聘准则', 9, NULL, 1), (31, 0, '联系我们', 0, NULL, 7), (32, 31, '联系我们', 10, NULL, 0);
/*!40000 ALTER TABLE `lcmf_column` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_contact
DROP TABLE IF EXISTS `lcmf_contact`;
CREATE TABLE IF NOT EXISTS `lcmf_contact` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '描述',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_contact` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_contact: 1 rows
/*!40000 ALTER TABLE `lcmf_contact` DISABLE KEYS */;
INSERT INTO `lcmf_contact` (`dataid`, `title`, `content`) VALUES (26, '联系我们', '&lt;table width=\\&quot;765\\&quot; cellspacing=\\&quot;0\\&quot; cellpadding=\\&quot;0\\&quot;&gt;&lt;tbody&gt;&lt;tr class=\\&quot;firstRow\\&quot;&gt;&lt;td width=\\&quot;29%\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;免费电话&lt;/td&gt;&lt;td colspan=\\&quot;2\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;400 626 0578&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;传真&lt;/td&gt;&lt;td colspan=\\&quot;2\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;0578-8185368&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;产品保修&lt;/td&gt;&lt;td width=\\&quot;20%\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;周先生&lt;/td&gt;&lt;td width=\\&quot;51%\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;0578-8185767&lt;br/&gt;18969571892&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;服务质量&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;翁女士&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;0578-8185668&lt;br/&gt;18969571899&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td rowspan=\\&quot;3\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;招商客服热线&lt;/td&gt;&lt;td colspan=\\&quot;2\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;0578-8185566、8185511、8185557&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;黄女士&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571876&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;雷小姐&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571870&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td rowspan=\\&quot;3\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;车载空气净化器&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;林先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571886&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;刘先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571879&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;杨先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571869&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td rowspan=\\&quot;9\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;竹炭环保装饰板&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;张先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571890&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;梁女士&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571867&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;王先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571090&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;林先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571891&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;郑先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571875&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;黄先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571872&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;郑先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571880&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;王先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18767812235&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;陶先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571868&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;电商事业部&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;袁先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571878&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td rowspan=\\&quot;3\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;海外市场部（OVERSEA MARKET DEPARTMENT）黎先生（Tony.li）&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;0579-87434515&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;0579-87434516&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan=\\&quot;2\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;http://www.runyi.en.alibaba.com&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan=\\&quot;2\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;邮箱：postmaster@greenmagicsquare.com&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td rowspan=\\&quot;3\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;财务中心&lt;/td&gt;&lt;td colspan=\\&quot;2\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;0578-8185368&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;程先生&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571885&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;廖女士&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571881&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td rowspan=\\&quot;2\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;物流中心&lt;/td&gt;&lt;td colspan=\\&quot;2\\&quot; style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;&lt;br/&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;叶小姐&lt;/td&gt;&lt;td style=\\&quot;margin: 0px; padding: 0px 0px 0px 15px;\\&quot; height=\\&quot;30\\&quot;&gt;18969571881&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br style=\\&quot;font-family: arial; font-size: 12px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\\&quot;/&gt;&lt;/p&gt;&lt;h3 style=\\&quot;margin: 0px; padding: 0px; font-weight: 100; font-family: &amp;#39;Microsoft YaHei&amp;#39;; font-size: 18px; line-height: 26px;\\&quot;&gt;上班时间：上午8:30-12:00，下午2:00-5:30。&lt;br/&gt;（下班时间如固定电话无人接听，请拨打手机。）&lt;br/&gt;地址：浙江省遂昌县上江工业园区炭缘路15号&lt;br/&gt;网 址 : www.zjbiyan.com/&lt;br/&gt;邮 箱：&lt;a href=\\&quot;mailto:zjbiyan@163.com\\&quot; style=\\&quot;text-decoration: none; color: rgb(51, 51, 51);\\&quot;&gt;zjbiyan@163.com&lt;/a&gt;&lt;/h3&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;');
/*!40000 ALTER TABLE `lcmf_contact` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_data
DROP TABLE IF EXISTS `lcmf_data`;
CREATE TABLE IF NOT EXISTS `lcmf_data` (
  `dataid` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据ID',
  `columnid` int(11) NOT NULL COMMENT '栏目',
  `enable` enum('1','0') DEFAULT '1' COMMENT '启用',
  `recommend` enum('0','1') DEFAULT '0' COMMENT '推荐',
  `headline` enum('0','1') DEFAULT '0' COMMENT '头条',
  `modifiedtime` int(11) DEFAULT NULL COMMENT '修改时间',
  `createtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`dataid`),
  KEY `columnid` (`columnid`),
  CONSTRAINT `FK_lcmf_data` FOREIGN KEY (`columnid`) REFERENCES `lcmf_column` (`columnid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_data: 27 rows
/*!40000 ALTER TABLE `lcmf_data` DISABLE KEYS */;
INSERT INTO `lcmf_data` (`dataid`, `columnid`, `enable`, `recommend`, `headline`, `modifiedtime`, `createtime`) VALUES (1, 2, '1', '0', '0', 1446387927, 0), (2, 3, '1', '0', '0', 1446387986, 0), (4, 7, '1', '0', '0', 1446475549, 1446388260), (5, 6, '1', '0', '0', 1446476103, 1446476094), (7, 8, '1', '1', '0', 1446649268, 1446479099), (8, 14, '1', '0', '0', 1446560492, 1446559499), (9, 14, '1', '1', '0', 1446560509, 1446560495), (10, 15, '1', '0', '0', 1446560922, 1446560901), (11, 15, '1', '1', '0', 1446560937, 1446560924), (12, 16, '1', '0', '0', 1446560975, 1446560950), (13, 16, '1', '1', '0', 1446560992, 1446560977), (14, 9, '1', '0', '0', 1446561640, 1446561626), (15, 18, '1', '0', '0', 1446561885, 1446561846), (16, 18, '1', '1', '0', 1446561901, 1446561887), (17, 19, '1', '0', '0', 1446561916, 1446561903), (18, 19, '1', '1', '0', 1446561933, 1446561923), (19, 21, '1', '0', '0', 1446562491, 0), (20, 22, '1', '0', '0', 1446562503, 0), (21, 23, '1', '0', '0', 1446562519, 0), (22, 24, '1', '0', '0', 1446562535, 0), (23, 25, '1', '0', '0', 1446562552, 0), (24, 27, '1', '0', '0', 1446562844, 1446562674), (25, 27, '1', '1', '0', 1446562836, 1446562686), (26, 32, '1', '0', '0', 1446563068, 0), (27, 30, '1', '0', '0', 1446563426, 0), (28, 29, '1', '0', '0', 1446563580, 1446563536), (29, 29, '1', '1', '0', 1446563595, 1446563582);
/*!40000 ALTER TABLE `lcmf_data` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_intro
DROP TABLE IF EXISTS `lcmf_intro`;
CREATE TABLE IF NOT EXISTS `lcmf_intro` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '内容',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_Intro` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_intro: 2 rows
/*!40000 ALTER TABLE `lcmf_intro` DISABLE KEYS */;
INSERT INTO `lcmf_intro` (`dataid`, `title`, `content`) VALUES (1, '企业介绍', '&lt;p&gt;企业介绍&lt;/p&gt;'), (2, '企业文化', '&lt;p&gt;企业文化&lt;/p&gt;');
/*!40000 ALTER TABLE `lcmf_intro` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_intropic
DROP TABLE IF EXISTS `lcmf_intropic`;
CREATE TABLE IF NOT EXISTS `lcmf_intropic` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '描述',
  `pic` varchar(1020) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_Intropic` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_intropic: 1 rows
/*!40000 ALTER TABLE `lcmf_intropic` DISABLE KEYS */;
INSERT INTO `lcmf_intropic` (`dataid`, `title`, `content`, `pic`) VALUES (4, '资质认证', '资质认证', '{\\"name\\":\\"h_1.jpg\\",\\"type\\":\\"image/jpeg\\",\\"size\\":26615,\\"key\\":\\"file\\",\\"extension\\":\\"jpg\\",\\"savepath\\":\\"static/attachment/default/201511/5637771a2047d.jpg\\",\\"savename\\":\\"201511/5637771a2047d.jpg\\",\\"hash\\":\\"4fc19bdc53f93f980329762fdc000136\\"}');
/*!40000 ALTER TABLE `lcmf_intropic` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_job
DROP TABLE IF EXISTS `lcmf_job`;
CREATE TABLE IF NOT EXISTS `lcmf_job` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `content` longtext COMMENT '描述',
  `pic` varchar(1020) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_job` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_job: 2 rows
/*!40000 ALTER TABLE `lcmf_job` DISABLE KEYS */;
INSERT INTO `lcmf_job` (`dataid`, `title`, `intro`, `content`, `pic`) VALUES (28, '岗位1', '岗位1', '&lt;p&gt;岗位1&lt;/p&gt;', '{"name":"h_3.jpg","type":"image/jpeg","size":32547,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638cefb2ab6e.jpg","savename":"201511/5638cefb2ab6e.jpg","hash":"f526e09bb84d9a85f5eb1079c3d04e21"}'), (29, '岗位2', '岗位2', '&lt;p&gt;岗位2&lt;/p&gt;', '{"name":"h_3.jpg","type":"image/jpeg","size":32547,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638cf0927c1c.jpg","savename":"201511/5638cf0927c1c.jpg","hash":"f526e09bb84d9a85f5eb1079c3d04e21"}');
/*!40000 ALTER TABLE `lcmf_job` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_join
DROP TABLE IF EXISTS `lcmf_join`;
CREATE TABLE IF NOT EXISTS `lcmf_join` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `content` longtext COMMENT '描述',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_join` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_join: 5 rows
/*!40000 ALTER TABLE `lcmf_join` DISABLE KEYS */;
INSERT INTO `lcmf_join` (`dataid`, `title`, `intro`, `content`) VALUES (19, '市场分析', '市场分析', '&lt;p&gt;市场分析&lt;/p&gt;'), (20, '效益分析', '效益分析', '&lt;p&gt;效益分析&lt;/p&gt;'), (21, '招商政策', '招商政策', '&lt;p&gt;招商政策&lt;/p&gt;'), (22, '售后保障', '售后保障', '&lt;p&gt;售后保障&lt;/p&gt;'), (23, '检测报告', '检测报告', '&lt;p&gt;检测报告&lt;/p&gt;');
/*!40000 ALTER TABLE `lcmf_join` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_message
DROP TABLE IF EXISTS `lcmf_message`;
CREATE TABLE IF NOT EXISTS `lcmf_message` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `sex` enum('男','女') DEFAULT NULL COMMENT '性别',
  `education` varchar(30) DEFAULT NULL COMMENT '学历',
  `idcard` varchar(30) DEFAULT NULL COMMENT '身份证',
  `area` varchar(30) DEFAULT NULL COMMENT '身份证',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `company` varchar(255) DEFAULT NULL COMMENT '工作单位',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `job_type` varchar(50) DEFAULT NULL COMMENT '工作类型',
  `working_life` varchar(50) DEFAULT NULL COMMENT '工作年限',
  `content` text COMMENT '内容',
  `clientip` varchar(50) NOT NULL COMMENT '客户IP地址',
  `createtime` int(11) NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`messageid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_message: 1 rows
/*!40000 ALTER TABLE `lcmf_message` DISABLE KEYS */;
INSERT INTO `lcmf_message` (`messageid`, `name`, `sex`, `education`, `idcard`, `area`, `email`, `address`, `company`, `phone`, `tel`, `job_type`, `working_life`, `content`, `clientip`, `createtime`) VALUES (1, '23432', '男', '1', '发生的', '发生的', '', '', '', '发生', '发生的', '', '', '', '127.0.0.1', 1446650578);
/*!40000 ALTER TABLE `lcmf_message` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_news
DROP TABLE IF EXISTS `lcmf_news`;
CREATE TABLE IF NOT EXISTS `lcmf_news` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `pic` varchar(1020) DEFAULT NULL COMMENT '图片',
  `content` longtext COMMENT '描述',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_news` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_news: 6 rows
/*!40000 ALTER TABLE `lcmf_news` DISABLE KEYS */;
INSERT INTO `lcmf_news` (`dataid`, `title`, `intro`, `pic`, `content`) VALUES (8, '新闻动态1', '新闻动态1', '{"name":"b2.jpg","type":"image/jpeg","size":42389,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c2e878220.jpg","savename":"201511/5638c2e878220.jpg","hash":"c54a0bf42b1bdfc1eac143705d5dff9b"}', '&lt;p&gt;新闻动态1&lt;/p&gt;'), (9, '新闻动态2', '新闻动态2', '{"name":"h_3.jpg","type":"image/jpeg","size":32547,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c2fb8874c.jpg","savename":"201511/5638c2fb8874c.jpg","hash":"f526e09bb84d9a85f5eb1079c3d04e21"}', '&lt;p&gt;新闻动态2&lt;/p&gt;'), (10, '行业动态1', '行业动态1', '{"name":"h_3.jpg","type":"image/jpeg","size":32547,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c49823039.jpg","savename":"201511/5638c49823039.jpg","hash":"f526e09bb84d9a85f5eb1079c3d04e21"}', '&lt;p&gt;行业动态1&lt;/p&gt;'), (11, '行业动态2', '行业动态2', '{"name":"h_3.jpg","type":"image/jpeg","size":32547,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c4a76be16.jpg","savename":"201511/5638c4a76be16.jpg","hash":"f526e09bb84d9a85f5eb1079c3d04e21"}', '&lt;p&gt;行业动态2&lt;/p&gt;'), (12, '官方媒体1', '官方媒体1', '{"name":"h_3.jpg","type":"image/jpeg","size":32547,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c4cdc87c2.jpg","savename":"201511/5638c4cdc87c2.jpg","hash":"f526e09bb84d9a85f5eb1079c3d04e21"}', '&lt;p&gt;官方媒体1&lt;/p&gt;'), (13, '官方媒体2', '官方媒体2', '{"name":"h_3.jpg","type":"image/jpeg","size":32547,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c4dc09c72.jpg","savename":"201511/5638c4dc09c72.jpg","hash":"f526e09bb84d9a85f5eb1079c3d04e21"}', '&lt;p&gt;官方媒体2&lt;/p&gt;');
/*!40000 ALTER TABLE `lcmf_news` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_order
DROP TABLE IF EXISTS `lcmf_order`;
CREATE TABLE IF NOT EXISTS `lcmf_order` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '  产品',
  `model` varchar(100) DEFAULT NULL COMMENT '型号',
  `number` varchar(20) DEFAULT NULL COMMENT '数量',
  `username` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `content` text COMMENT '内容',
  `clientip` varchar(50) NOT NULL COMMENT '客户IP地址',
  `createtime` int(11) NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`messageid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_order: 0 rows
/*!40000 ALTER TABLE `lcmf_order` DISABLE KEYS */;
INSERT INTO `lcmf_order` (`messageid`, `name`, `model`, `number`, `username`, `phone`, `qq`, `email`, `address`, `content`, `clientip`, `createtime`) VALUES (1, '12321', '1321', '', '凡达四方达', '发生的', '', '', '', '发生的', '127.0.0.1', 1446651894);
/*!40000 ALTER TABLE `lcmf_order` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_patent
DROP TABLE IF EXISTS `lcmf_patent`;
CREATE TABLE IF NOT EXISTS `lcmf_patent` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `pic` varchar(1020) DEFAULT NULL COMMENT '图片',
  `content` longtext COMMENT '描述',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_patent` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_patent: 1 rows
/*!40000 ALTER TABLE `lcmf_patent` DISABLE KEYS */;
INSERT INTO `lcmf_patent` (`dataid`, `title`, `pic`, `content`) VALUES (5, '专利', '{\\"name\\":\\"h_2.jpg\\",\\"type\\":\\"image/jpeg\\",\\"size\\":31469,\\"key\\":\\"file\\",\\"extension\\":\\"jpg\\",\\"savepath\\":\\"static/attachment/default/201511/56377945ce5a9.jpg\\",\\"savename\\":\\"201511/56377945ce5a9.jpg\\",\\"hash\\":\\"4d4c280a16251419809e5a064de5fc9e\\"}', '&lt;p&gt;专利&lt;/p&gt;');
/*!40000 ALTER TABLE `lcmf_patent` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_product
DROP TABLE IF EXISTS `lcmf_product`;
CREATE TABLE IF NOT EXISTS `lcmf_product` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `pic` text COMMENT '图片',
  `content` longtext COMMENT '内容',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_product` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_product: 2 rows
/*!40000 ALTER TABLE `lcmf_product` DISABLE KEYS */;
INSERT INTO `lcmf_product` (`dataid`, `title`, `intro`, `pic`, `content`) VALUES (7, '产品', '产品', '[{"name":"download.jpg","type":"image\\/jpeg","size":19945,"key":"file","extension":"jpg","savepath":"static\\/attachment\\/default\\/201511\\/563a1db279f51.jpg","savename":"201511\\/563a1db279f51.jpg","hash":"af659f2e7867bf99a1866606915d0be1"}]', '&lt;p&gt;11&lt;/p&gt;'), (14, '居家', '居家', '[{"name":"cp_2.jpg","type":"image\\/jpeg","size":83861,"key":"file","extension":"jpg","savepath":"static\\/attachment\\/default\\/201511\\/5638c765c223a.jpg","savename":"201511\\/5638c765c223a.jpg","hash":"76ebe4894c67f77aaf1c6f8d5ff95f81"}]', '&lt;p&gt;居家&lt;/p&gt;');
/*!40000 ALTER TABLE `lcmf_product` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_rule
DROP TABLE IF EXISTS `lcmf_rule`;
CREATE TABLE IF NOT EXISTS `lcmf_rule` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '简介',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_rule` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_rule: 1 rows
/*!40000 ALTER TABLE `lcmf_rule` DISABLE KEYS */;
INSERT INTO `lcmf_rule` (`dataid`, `title`, `content`) VALUES (27, '招聘准则', '&lt;p&gt;招聘准则&lt;/p&gt;');
/*!40000 ALTER TABLE `lcmf_rule` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_study
DROP TABLE IF EXISTS `lcmf_study`;
CREATE TABLE IF NOT EXISTS `lcmf_study` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `content` longtext COMMENT '描述',
  `pic` varchar(1020) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_study` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_study: 2 rows
/*!40000 ALTER TABLE `lcmf_study` DISABLE KEYS */;
INSERT INTO `lcmf_study` (`dataid`, `title`, `intro`, `content`, `pic`) VALUES (24, '竹炭研究1', '竹炭研究1', '&lt;p&gt;竹炭研究1&lt;/p&gt;', '{"name":"cp_2.jpg","type":"image/jpeg","size":83861,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638cc1b44f3a.jpg","savename":"201511/5638cc1b44f3a.jpg","hash":"76ebe4894c67f77aaf1c6f8d5ff95f81"}'), (25, '竹炭研究2', '竹炭研究2', '&lt;p&gt;竹炭研究2&lt;/p&gt;', '{"name":"cp_2.jpg","type":"image/jpeg","size":83861,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638cc12a6056.jpg","savename":"201511/5638cc12a6056.jpg","hash":"76ebe4894c67f77aaf1c6f8d5ff95f81"}');
/*!40000 ALTER TABLE `lcmf_study` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_table
DROP TABLE IF EXISTS `lcmf_table`;
CREATE TABLE IF NOT EXISTS `lcmf_table` (
  `tableid` int(11) NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` varchar(50) NOT NULL COMMENT '数据表名',
  `title` varchar(50) NOT NULL COMMENT '模型名称',
  `description` varchar(255) DEFAULT NULL COMMENT '模型描述',
  `type` enum('list','image','content') NOT NULL DEFAULT 'list' COMMENT '数据类型',
  `action` varchar(255) DEFAULT NULL COMMENT '操作方法',
  PRIMARY KEY (`tableid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_table: 11 rows
/*!40000 ALTER TABLE `lcmf_table` DISABLE KEYS */;
INSERT INTO `lcmf_table` (`tableid`, `name`, `title`, `description`, `type`, `action`) VALUES (1, 'Intro', '企业简介', '企业简介', 'content', '["add","edit"]'), (2, 'Intropic', '企业证书', '企业证书', 'list', '["add","delete","edit"]'), (3, 'product', '产品模型', '产品模型', 'list', '["add","delete","edit","enable","recommend","headline"]'), (4, 'news', '新闻中心', '新闻中心', 'list', '["add","delete","edit","recommend","headline"]'), (5, 'video', '公司视频', '公司视频', 'list', '["add","delete","edit","enable","recommend"]'), (6, 'join', '招商加盟', '招商加盟', 'content', '["add","edit"]'), (7, 'study', '竹炭研究', '竹炭研究', 'list', '["add","delete","edit","recommend"]'), (8, 'job', '人才招聘', '人才招聘', 'list', '["add","delete","edit","recommend","headline"]'), (9, 'rule', '招聘准则', '招聘准则', 'content', '["add","edit"]'), (10, 'contact', '联系我们', '联系我们', 'content', '["add","edit"]'), (11, 'patent', '专利认证', '专利认证', 'list', '["add","delete","edit"]');
/*!40000 ALTER TABLE `lcmf_table` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_table_field
DROP TABLE IF EXISTS `lcmf_table_field`;
CREATE TABLE IF NOT EXISTS `lcmf_table_field` (
  `fieldid` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段ID',
  `tableid` int(11) NOT NULL COMMENT '模型ID',
  `name` varchar(20) NOT NULL COMMENT '字段名',
  `title` varchar(50) NOT NULL COMMENT '字段标题',
  `element` varchar(20) NOT NULL COMMENT '表单元素',
  `validate` varchar(20) DEFAULT NULL COMMENT '表单验证',
  `list` enum('0','1') DEFAULT '0' COMMENT '列表展示',
  `sequence` int(11) DEFAULT '0' COMMENT '表单顺序',
  PRIMARY KEY (`fieldid`),
  UNIQUE KEY `table-field-name` (`tableid`,`name`),
  CONSTRAINT `FK_lcmf_table_field` FOREIGN KEY (`tableid`) REFERENCES `lcmf_table` (`tableid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_table_field: 35 rows
/*!40000 ALTER TABLE `lcmf_table_field` DISABLE KEYS */;
INSERT INTO `lcmf_table_field` (`fieldid`, `tableid`, `name`, `title`, `element`, `validate`, `list`, `sequence`) VALUES (1, 1, 'title', '标题', 'text', 'required', '1', 0), (2, 1, 'content', '内容', 'editor', 'required', '0', 1), (3, 2, 'title', '标题', 'text', 'required', '1', 0), (4, 2, 'content', '描述', 'textarea', 'required', '0', 1), (5, 2, 'pic', '图片', 'image', 'required', '0', 2), (6, 3, 'title', '标题', 'text', 'required', '1', 0), (7, 3, 'intro', '简介', 'textarea', 'required', '0', 1), (8, 3, 'pic', '图片', 'imagegroup', 'required', '0', 2), (9, 3, 'content', '内容', 'editor', 'required', '0', 3), (10, 4, 'title', '标题', 'text', 'required', '1', 0), (11, 4, 'intro', '简介', 'textarea', 'required', '0', 1), (12, 4, 'pic', '图片', 'image', 'required', '0', 2), (13, 4, 'content', '描述', 'editor', 'required', '0', 3), (14, 5, 'title', '标题', 'text', 'required', '1', 0), (15, 5, 'intro', '简介', 'textarea', 'required', '0', 1), (16, 5, 'url', '图片', 'image', 'required', '0', 2), (17, 6, 'title', '标题', 'text', 'required', '1', 0), (18, 6, 'intro', '简介', 'textarea', 'required', '0', 1), (19, 6, 'content', '描述', 'editor', 'required', '0', 2), (20, 7, 'title', '标题', 'text', 'required', '1', 0), (21, 7, 'intro', '简介', 'textarea', 'required', '0', 1), (22, 7, 'content', '描述', 'editor', 'required', '0', 3), (23, 8, 'title', '标题', 'text', 'required', '1', 0), (24, 8, 'intro', '简介', 'textarea', 'required', '0', 1), (25, 8, 'content', '描述', 'editor', 'required', '0', 3), (26, 9, 'title', '标题', 'text', 'required', '1', 0), (27, 9, 'content', '简介', 'editor', 'required', '0', 1), (28, 10, 'title', '标题', 'text', 'required', '1', 0), (29, 10, 'content', '描述', 'editor', 'required', '0', 1), (30, 11, 'title', '标题', 'text', 'required', '1', 0), (31, 11, 'pic', '图片', 'image', 'required', '0', 1), (32, 11, 'content', '描述', 'editor', 'required', '0', 2), (33, 5, 'content', '描述', 'editor', 'required', '0', 3), (34, 7, 'pic', '图片', 'image', 'required', '0', 2), (35, 8, 'pic', '图片', 'image', 'required', '0', 2);
/*!40000 ALTER TABLE `lcmf_table_field` ENABLE KEYS */;


# Dumping structure for table lcmf.lcmf_video
DROP TABLE IF EXISTS `lcmf_video`;
CREATE TABLE IF NOT EXISTS `lcmf_video` (
  `dataid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `url` varchar(1020) DEFAULT NULL COMMENT '图片',
  `content` longtext COMMENT '描述',
  PRIMARY KEY (`dataid`),
  CONSTRAINT `FK_video` FOREIGN KEY (`dataid`) REFERENCES `lcmf_data` (`dataid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table lcmf.lcmf_video: 4 rows
/*!40000 ALTER TABLE `lcmf_video` DISABLE KEYS */;
INSERT INTO `lcmf_video` (`dataid`, `title`, `intro`, `url`, `content`) VALUES (15, '企业', '企业', '{"name":"cp_2.jpg","type":"image/jpeg","size":83861,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c85a675c9.jpg","savename":"201511/5638c85a675c9.jpg","hash":"76ebe4894c67f77aaf1c6f8d5ff95f81"}', '&lt;p&gt;企业&lt;/p&gt;'), (16, '企业2', '企业2', '{"name":"b2.jpg","type":"image/jpeg","size":42389,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c86b1246e.jpg","savename":"201511/5638c86b1246e.jpg","hash":"c54a0bf42b1bdfc1eac143705d5dff9b"}', '&lt;p&gt;企业2&lt;/p&gt;'), (17, '宣传', '宣传', '{"name":"cp_2.jpg","type":"image/jpeg","size":83861,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c8794ad44.jpg","savename":"201511/5638c8794ad44.jpg","hash":"76ebe4894c67f77aaf1c6f8d5ff95f81"}', '&lt;p&gt;宣传&lt;/p&gt;'), (18, '宣传1', '宣传1', '{"name":"cp_2.jpg","type":"image/jpeg","size":83861,"key":"file","extension":"jpg","savepath":"static/attachment/default/201511/5638c88b9c7a6.jpg","savename":"201511/5638c88b9c7a6.jpg","hash":"76ebe4894c67f77aaf1c6f8d5ff95f81"}', '&lt;p&gt;宣传1&lt;/p&gt;');
/*!40000 ALTER TABLE `lcmf_video` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
