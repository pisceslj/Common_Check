-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-08-10 09:24:56
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `common_check`
--

-- --------------------------------------------------------

--
-- 表的结构 `ess_access`
--

CREATE TABLE IF NOT EXISTS `ess_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ess_degree_code`
--

CREATE TABLE IF NOT EXISTS `ess_degree_code` (
  `deg_id` int(11) NOT NULL,
  `deg_name` varchar(32) NOT NULL,
  PRIMARY KEY (`deg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_degree_code`
--

INSERT INTO `ess_degree_code` (`deg_id`, `deg_name`) VALUES
(1, '博士'),
(2, '硕士'),
(3, '学士'),
(4, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `ess_department_code`
--

CREATE TABLE IF NOT EXISTS `ess_department_code` (
  `dep_id` int(11) NOT NULL,
  `sch_id` int(11) NOT NULL,
  `dep_name` varchar(32) NOT NULL,
  `dep_notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dep_id`),
  KEY `FK_sch_dep` (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_department_code`
--

INSERT INTO `ess_department_code` (`dep_id`, `sch_id`, `dep_name`, `dep_notes`) VALUES
(1, 22, '嵌入式系统系', NULL),
(2, 22, '软件工程系', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ess_enterprise`
--

CREATE TABLE IF NOT EXISTS `ess_enterprise` (
  `entpr_id` int(11) NOT NULL,
  `entpr_name` varchar(64) DEFAULT NULL,
  `entpr_desp` text,
  `entpr_address` varchar(128) DEFAULT NULL,
  `entpr_tel` bigint(20) DEFAULT NULL,
  `entpr_email` varchar(32) DEFAULT NULL,
  `entpr_contact` varchar(64) DEFAULT NULL,
  `entpr_contact_mobile` bigint(20) DEFAULT NULL,
  `entpr_contact_email` varchar(32) DEFAULT NULL,
  `entpr_notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entpr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ess_enterprise_mentor`
--

CREATE TABLE IF NOT EXISTS `ess_enterprise_mentor` (
  `em_id` bigint(20) NOT NULL,
  `entpr_id` int(11) NOT NULL,
  `pt_id` int(11) NOT NULL,
  `deg_id` int(11) NOT NULL,
  `he_id` int(11) NOT NULL,
  `em_name` varchar(32) DEFAULT NULL,
  `em_gender` tinyint(1) DEFAULT NULL,
  `em_tel` bigint(20) DEFAULT NULL,
  `em_mobile` bigint(20) DEFAULT NULL,
  `em_email` varchar(32) DEFAULT NULL,
  `em_qq` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`em_id`),
  KEY `FK_em_deg` (`deg_id`),
  KEY `FK_em_he` (`he_id`),
  KEY `FK_em_pt` (`pt_id`),
  KEY `FK_entpr_em` (`entpr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ess_enterprise_post`
--

CREATE TABLE IF NOT EXISTS `ess_enterprise_post` (
  `ep_id` int(11) NOT NULL,
  `entpr_id` int(11) NOT NULL,
  `ep_name` varchar(64) DEFAULT NULL,
  `ep_duty` varchar(64) DEFAULT NULL,
  `ep_requirement` varchar(64) DEFAULT NULL,
  `ep_notes` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ep_id`),
  KEY `FK_enptr_post` (`entpr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ess_group`
--

CREATE TABLE IF NOT EXISTS `ess_group` (
  `gid` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) DEFAULT NULL COMMENT 'parentCategory上级分组',
  `name` varchar(20) DEFAULT NULL COMMENT '分组名称',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理分组表' AUTO_INCREMENT=30000002 ;

--
-- 转存表中的数据 `ess_group`
--

INSERT INTO `ess_group` (`gid`, `pid`, `name`) VALUES
(11111111, 0, '王小明'),
(20000001, 0, '张小琴'),
(30000001, 0, '查小华'),
(22000001, 22, '肖小明'),
(22000002, 22, '杨小芳'),
(22000003, 22, '李小华'),
(22000004, 22, '赵小刀'),
(22000005, 22, '钱小东'),
(22000006, 22, '孙小庆');

-- --------------------------------------------------------

--
-- 表的结构 `ess_highest_education_code`
--

CREATE TABLE IF NOT EXISTS `ess_highest_education_code` (
  `he_id` int(11) NOT NULL,
  `he_name` varchar(64) NOT NULL,
  PRIMARY KEY (`he_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_highest_education_code`
--

INSERT INTO `ess_highest_education_code` (`he_id`, `he_name`) VALUES
(1, '研究生'),
(2, '本科'),
(3, '大专'),
(4, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `ess_node`
--

CREATE TABLE IF NOT EXISTS `ess_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ess_prof_title_code`
--

CREATE TABLE IF NOT EXISTS `ess_prof_title_code` (
  `pt_id` int(11) NOT NULL,
  `pt_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_prof_title_code`
--

INSERT INTO `ess_prof_title_code` (`pt_id`, `pt_name`) VALUES
(1, '教授'),
(2, '副教授'),
(3, '讲师'),
(4, '助理教师'),
(5, '教授级高级工程师'),
(6, '高级工程师');

-- --------------------------------------------------------

--
-- 表的结构 `ess_role`
--

CREATE TABLE IF NOT EXISTS `ess_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ess_role`
--

INSERT INTO `ess_role` (`id`, `name`, `pid`, `status`, `remark`) VALUES
(1, '超级管理员', 0, 1, '系统内置超级管理员组，不受权限分配账号限制'),
(2, '管理员', 1, 1, '拥有系统仅此于超级管理员的权限'),
(3, '老师', 1, 1, '拥有所有操作的读权限，增加、修改的权限'),
(4, '学生', 1, 1, '拥有所有操作的读、增加权限，无删除、修改的权限');

-- --------------------------------------------------------

--
-- 表的结构 `ess_role_user`
--

CREATE TABLE IF NOT EXISTS `ess_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  UNIQUE KEY `user_id_2` (`user_id`),
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_role_user`
--

INSERT INTO `ess_role_user` (`role_id`, `user_id`) VALUES
(0, '0'),
(3, '100'),
(3, '101'),
(4, '5002'),
(4, '5001');

-- --------------------------------------------------------

--
-- 表的结构 `ess_school_code`
--

CREATE TABLE IF NOT EXISTS `ess_school_code` (
  `sch_id` int(11) NOT NULL,
  `sch_name` varchar(32) NOT NULL,
  `sch_notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_school_code`
--

INSERT INTO `ess_school_code` (`sch_id`, `sch_name`, `sch_notes`) VALUES
(1, '电子工程学院', '科研楼C区'),
(22, '信息与软件工程学院', '信软楼');

-- --------------------------------------------------------

--
-- 表的结构 `ess_student`
--

CREATE TABLE IF NOT EXISTS `ess_student` (
  `stu_id` bigint(20) NOT NULL,
  `he_id` int(11) NOT NULL,
  `stu_class_id` bigint(20) NOT NULL,
  `stu_name` varchar(64) NOT NULL,
  `stu_eng_name` varchar(32) DEFAULT NULL,
  `stu_gender` tinyint(1) DEFAULT NULL,
  `stu_grade` int(11) DEFAULT NULL,
  `stu_schooloing_length` smallint(6) DEFAULT NULL,
  `stu_major` int(11) DEFAULT NULL,
  `stu_entr_time` date DEFAULT NULL,
  `stu_grad_time` date DEFAULT NULL,
  `stu_is_fulltime` smallint(6) DEFAULT NULL,
  `stu_is_dropping_out` tinyint(1) DEFAULT NULL,
  `stu_is_quitting` tinyint(1) DEFAULT NULL,
  `stu_campus_id` smallint(6) DEFAULT NULL,
  `stu_mobile` bigint(20) DEFAULT NULL,
  `stu_email` varchar(64) DEFAULT NULL,
  `stu_qq` bigint(20) DEFAULT NULL,
  `stu_notes` varchar(255) DEFAULT NULL,
  `uuf_id` bigint(20) NOT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `FK_stu_he` (`he_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_student`
--

INSERT INTO `ess_student` (`stu_id`, `he_id`, `stu_class_id`, `stu_name`, `stu_eng_name`, `stu_gender`, `stu_grade`, `stu_schooloing_length`, `stu_major`, `stu_entr_time`, `stu_grad_time`, `stu_is_fulltime`, `stu_is_dropping_out`, `stu_is_quitting`, `stu_campus_id`, `stu_mobile`, `stu_email`, `stu_qq`, `stu_notes`, `uuf_id`) VALUES
(2014220301006, 2, 2014220301, '肖仕华', 'Tom', 1, 2014, 4, 22, '2014-09-01', '2018-09-01', 1, 0, 0, 1, 13402889081, 'xioashihua@sina.cn', 2518194537, '无', 2014220301006),
(2014220301019, 2, 2014220301, '卢杰', 'Mike', 1, 2014, 4, 22, '2014-09-01', '2018-09-01', 1, 0, 0, 1, 13402889170, 'lujie19960319@sina.cn', 2717561261, '无', 2014220301019);

-- --------------------------------------------------------

--
-- 表的结构 `ess_teacher`
--

CREATE TABLE IF NOT EXISTS `ess_teacher` (
  `tch_id` bigint(20) NOT NULL,
  `he_id` int(11) NOT NULL,
  `deg_id` int(11) NOT NULL,
  `pt_id` int(11) NOT NULL,
  `sch_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `tch_name` varchar(32) NOT NULL,
  `tch_gender` tinyint(1) DEFAULT NULL,
  `tch_position` varchar(32) DEFAULT NULL,
  `tch_office_phone` bigint(20) DEFAULT NULL,
  `tch_mobile` bigint(20) DEFAULT NULL,
  `tch_email` varchar(32) DEFAULT NULL,
  `tch_qq` bigint(20) DEFAULT NULL,
  `tch_notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tch_id`),
  KEY `FK_tch_deg` (`deg_id`),
  KEY `FK_tch_dep` (`dep_id`),
  KEY `FK_tch_he` (`he_id`),
  KEY `FK_tch_pt` (`pt_id`),
  KEY `FK_tch_sch` (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_teacher`
--

INSERT INTO `ess_teacher` (`tch_id`, `he_id`, `deg_id`, `pt_id`, `sch_id`, `dep_id`, `tch_name`, `tch_gender`, `tch_position`, `tch_office_phone`, `tch_mobile`, `tch_email`, `tch_qq`, `tch_notes`) VALUES
(11111112, 1, 1, 1, 22, 1, '王小明', 1, '副教授', 813390862, 13402889000, '123456@uestc.edu.cn', 12345678, '无');

-- --------------------------------------------------------

--
-- 表的结构 `ess_uf_review_record`
--

CREATE TABLE IF NOT EXISTS `ess_uf_review_record` (
  `urr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuf_id` bigint(20) NOT NULL,
  `urr_file_id` bigint(20) NOT NULL,
  `urr_reviewer_id` bigint(20) NOT NULL,
  `urr_update_time` timestamp NULL DEFAULT NULL,
  `urr_status` smallint(6) DEFAULT NULL,
  `urr_comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`urr_id`),
  KEY `FK_urr_uuf3` (`uuf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ess_uf_review_record`
--

INSERT INTO `ess_uf_review_record` (`urr_id`, `uuf_id`, `urr_file_id`, `urr_reviewer_id`, `urr_update_time`, `urr_status`, `urr_comments`) VALUES
(1, 1, 1, 1, '2016-04-26 04:57:53', 1, '合格'),
(3, 2, 2, 1, '2016-04-26 13:07:31', 1, '优秀');

-- --------------------------------------------------------

--
-- 表的结构 `ess_uf_update_record`
--

CREATE TABLE IF NOT EXISTS `ess_uf_update_record` (
  `uur_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuf_id` bigint(20) NOT NULL,
  `uur_file_id` bigint(20) NOT NULL,
  `uur_update_time` datetime NOT NULL,
  `uur_notes` longtext,
  PRIMARY KEY (`uur_id`),
  KEY `FK_uur_uuf3` (`uuf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ess_uf_update_record`
--

INSERT INTO `ess_uf_update_record` (`uur_id`, `uuf_id`, `uur_file_id`, `uur_update_time`, `uur_notes`) VALUES
(1, 1, 1, '2016-04-19 12:58:57', '无');

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp`
--

CREATE TABLE IF NOT EXISTS `ess_ugp` (
  `ugp_stu_id` bigint(20) NOT NULL,
  `tch_id` bigint(20) DEFAULT NULL,
  `em_id` bigint(20) NOT NULL,
  `entpr_id` int(11) NOT NULL,
  `ugp_type` smallint(6) DEFAULT NULL,
  `ugp_thesis_title` varchar(64) DEFAULT NULL,
  `ugp_thesis_abstract` text,
  `ugp_sche_tasks` text,
  `ugp_expe_outcomes` text,
  `ugp_excecution_phase_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ugp_stu_id`),
  KEY `FK_ugp_em` (`em_id`),
  KEY `FK_ugp_entpr` (`entpr_id`),
  KEY `FK_ugp_tch` (`tch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_component_score`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_component_score` (
  `ucs_stu_id` bigint(20) NOT NULL,
  `usc_id` int(11) NOT NULL,
  `ufc_id` int(11) DEFAULT NULL,
  `ucs_component_score` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ucs_stu_id`),
  KEY `FK_ucs_uuc` (`ufc_id`),
  KEY `FK_ucs_usc` (`usc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_component_score`
--

INSERT INTO `ess_ugp_component_score` (`ucs_stu_id`, `usc_id`, `ufc_id`, `ucs_component_score`) VALUES
(2014220301019, 1, 1, 95);

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_excecution_mode_code`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_excecution_mode_code` (
  `uem_id` int(11) NOT NULL,
  `uem_name` varchar(64) NOT NULL,
  `uem_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_excecution_mode_code`
--

INSERT INTO `ess_ugp_excecution_mode_code` (`uem_id`, `uem_name`, `uem_description`) VALUES
(1, '在线批改', '老师在线进行审核'),
(2, '线下审核', '学生答辩进行审核');

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_excecution_phase_code`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_excecution_phase_code` (
  `uep_id` int(11) NOT NULL,
  `uep_name` varchar(64) DEFAULT NULL,
  `uep_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_excecution_phase_code`
--

INSERT INTO `ess_ugp_excecution_phase_code` (`uep_id`, `uep_name`, `uep_description`) VALUES
(1, '等待审核', '等待老师审核'),
(2, '初次审核', '老师初次审核'),
(3, '复审', '老师进行复审'),
(4, '抽查', '老师进行抽查'),
(5, '审核完成', '老师审核完成');

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_notice`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_notice` (
  `notice_id` bigint(20) NOT NULL,
  `notice_subject` varchar(64) DEFAULT NULL,
  `notice_content` text,
  `notice_user_id` bigint(20) DEFAULT NULL,
  `notice_update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_notice`
--

INSERT INTO `ess_ugp_notice` (`notice_id`, `notice_subject`, `notice_content`, `notice_user_id`, `notice_update_time`) VALUES
(1, '2015届毕业设计中期检查', '信息与软件工程学院2015届毕业设计中期检查将于4.22-4.26日进行，请各位同学及时提交中期报告，逾期后果自负！', 2, '2016-04-22 03:22:20');

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_score`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_score` (
  `uuf_user_id` bigint(15) NOT NULL,
  `knowledge` int(11) NOT NULL,
  `format` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `complete` int(11) NOT NULL,
  `summary` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`uuf_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_score`
--

INSERT INTO `ess_ugp_score` (`uuf_user_id`, `knowledge`, `format`, `content`, `quality`, `complete`, `summary`, `score`) VALUES
(2014220301019, 13, 24, 12, 13, 15, 10, 84);

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_score_component_code`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_score_component_code` (
  `usc_id` int(11) NOT NULL,
  `ufc_id` int(11) DEFAULT NULL,
  `format` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `complete` int(11) NOT NULL,
  `summary` int(11) NOT NULL,
  PRIMARY KEY (`usc_id`),
  KEY `FK_usc_uuc` (`ufc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_score_component_code`
--

INSERT INTO `ess_ugp_score_component_code` (`usc_id`, `ufc_id`, `format`, `content`, `quality`, `complete`, `summary`) VALUES
(1, 1, 10, 40, 20, 20, 15);

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_uf_categary`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_uf_categary` (
  `ufc_id` int(11) NOT NULL,
  `uem_id` int(11) DEFAULT NULL,
  `uep_id` int(11) DEFAULT NULL,
  `ufc_name` varchar(64) DEFAULT NULL,
  `ufc_suffix` varchar(32) DEFAULT NULL,
  `ufc_max_size` bigint(20) DEFAULT NULL,
  `ufc_require_score` tinyint(1) DEFAULT NULL,
  `ufc_require_paper_doc` tinyint(1) DEFAULT NULL,
  `ufc_notes` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ufc_id`),
  KEY `FK_ufc_uep` (`uep_id`),
  KEY `FK_ufc_uem` (`uem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_uf_categary`
--

INSERT INTO `ess_ugp_uf_categary` (`ufc_id`, `uem_id`, `uep_id`, `ufc_name`, `ufc_suffix`, `ufc_max_size`, `ufc_require_score`, `ufc_require_paper_doc`, `ufc_notes`) VALUES
(1, 1, 1, 'Word文档', 'doc', 30, 1, 1, NULL),
(2, 2, 3, 'PDF', 'pdf', 20, 1, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_uploaded_file`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_uploaded_file` (
  `uuf_id` bigint(20) NOT NULL,
  `ufc_id` int(11) NOT NULL,
  `urr_id` bigint(20) DEFAULT NULL,
  `uur_id` int(11) DEFAULT NULL,
  `uuf_user_id` bigint(20) DEFAULT NULL,
  `uuf_true_name` varchar(30) NOT NULL,
  `uuf_name` text,
  `uuf_path` varchar(256) DEFAULT NULL,
  `uuf_is_paper_doc_submited` tinyint(1) DEFAULT NULL,
  `uuf_last_update_record_id` timestamp NULL DEFAULT NULL,
  `uuf_last_review_record_id` bigint(20) DEFAULT NULL,
  `uuf_teacher_id` bigint(15) NOT NULL,
  `uuf_school_id` int(11) DEFAULT NULL,
  `uuf_sort` int(11) DEFAULT '0',
  PRIMARY KEY (`uuf_id`),
  KEY `FK_uur_uuf` (`uur_id`),
  KEY `FK_urr_uuf` (`urr_id`),
  KEY `FK_uuf_ufc` (`ufc_id`),
  KEY `uuf_user_id` (`uuf_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_uploaded_file`
--

INSERT INTO `ess_ugp_uploaded_file` (`uuf_id`, `ufc_id`, `urr_id`, `uur_id`, `uuf_user_id`, `uuf_true_name`, `uuf_name`, `uuf_path`, `uuf_is_paper_doc_submited`, `uuf_last_update_record_id`, `uuf_last_review_record_id`, `uuf_teacher_id`, `uuf_school_id`, `uuf_sort`) VALUES
(2014220301006, 2, NULL, NULL, 2014220301006, '基于Incites学科映射的一级学科文献计量分析——以电子科', '57a98cf53ec9f.pdf', './Uploads/', 1, '2016-08-09 07:57:51', 2, 11111112, 22, 3),
(2014220301019, 2, NULL, NULL, 2014220301019, '阅读需求与信息素养教育模式研究——以电子科技大学图书馆为例.', '5752edc586945.pdf', './Uploads/', 1, '2016-06-04 15:03:41', 3, 0, 22, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_uploaded_png`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_uploaded_png` (
  `png_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` char(15) NOT NULL,
  `png_name` varchar(50) NOT NULL,
  PRIMARY KEY (`png_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- 转存表中的数据 `ess_ugp_uploaded_png`
--

INSERT INTO `ess_ugp_uploaded_png` (`png_id`, `stu_id`, `png_name`) VALUES
(49, '2014220301019', 'b8087e85a4f4204e548da67405fdc879.png'),
(50, '2014220301019', 'c876cbf50532deb5b0b956d452678339.png'),
(51, '2014220301019', '8165dc815016f7cf2f7f4108df74d8d8.png'),
(52, '2014220301006', '4a43e825a06b986585715751b48b47c8.png'),
(53, '2014220301006', 'aaf11d413f59c7e0d9be3e377fd76175.png'),
(54, '2014220301006', '4851c0593130f61da16b67aab8a84a76.png');

-- --------------------------------------------------------

--
-- 表的结构 `ess_user`
--

CREATE TABLE IF NOT EXISTS `ess_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) NOT NULL,
  `user_pwd` varchar(40) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `time` int(10) NOT NULL,
  `remark` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5003 ;

--
-- 转存表中的数据 `ess_user`
--

INSERT INTO `ess_user` (`user_id`, `user_name`, `user_pwd`, `status`, `time`, `remark`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1448536863, ''),
(100, '11111111', '1bbd886460827015e5d605ed44252251', 1, 1470389343, ''),
(101, '11111112', '059fc16810ff3db79cac7a5a0527f490', 1, 1470711585, ''),
(5001, '2014220301019', '3d39668cb4d4c2cb78198f903e3366cb', 1, 1462435740, ''),
(5002, '2014220301006', '3d39668cb4d4c2cb78198f903e3366cb', 1, 1421866863, '');

--
-- 限制导出的表
--

--
-- 限制表 `ess_department_code`
--
ALTER TABLE `ess_department_code`
  ADD CONSTRAINT `FK_sch_dep` FOREIGN KEY (`sch_id`) REFERENCES `ess_school_code` (`sch_id`);

--
-- 限制表 `ess_enterprise_mentor`
--
ALTER TABLE `ess_enterprise_mentor`
  ADD CONSTRAINT `FK_em_deg` FOREIGN KEY (`deg_id`) REFERENCES `ess_degree_code` (`deg_id`),
  ADD CONSTRAINT `FK_em_he` FOREIGN KEY (`he_id`) REFERENCES `ess_highest_education_code` (`he_id`),
  ADD CONSTRAINT `FK_em_pt` FOREIGN KEY (`pt_id`) REFERENCES `ess_prof_title_code` (`pt_id`),
  ADD CONSTRAINT `FK_entpr_em` FOREIGN KEY (`entpr_id`) REFERENCES `ess_enterprise` (`entpr_id`);

--
-- 限制表 `ess_enterprise_post`
--
ALTER TABLE `ess_enterprise_post`
  ADD CONSTRAINT `FK_enptr_post` FOREIGN KEY (`entpr_id`) REFERENCES `ess_enterprise` (`entpr_id`);

--
-- 限制表 `ess_student`
--
ALTER TABLE `ess_student`
  ADD CONSTRAINT `FK_stu_he` FOREIGN KEY (`he_id`) REFERENCES `ess_highest_education_code` (`he_id`);

--
-- 限制表 `ess_teacher`
--
ALTER TABLE `ess_teacher`
  ADD CONSTRAINT `FK_tch_deg` FOREIGN KEY (`deg_id`) REFERENCES `ess_degree_code` (`deg_id`),
  ADD CONSTRAINT `FK_tch_dep` FOREIGN KEY (`dep_id`) REFERENCES `ess_department_code` (`dep_id`),
  ADD CONSTRAINT `FK_tch_he` FOREIGN KEY (`he_id`) REFERENCES `ess_highest_education_code` (`he_id`),
  ADD CONSTRAINT `FK_tch_pt` FOREIGN KEY (`pt_id`) REFERENCES `ess_prof_title_code` (`pt_id`),
  ADD CONSTRAINT `FK_tch_sch` FOREIGN KEY (`sch_id`) REFERENCES `ess_school_code` (`sch_id`);

--
-- 限制表 `ess_ugp`
--
ALTER TABLE `ess_ugp`
  ADD CONSTRAINT `FK_ugp_em` FOREIGN KEY (`em_id`) REFERENCES `ess_enterprise_mentor` (`em_id`),
  ADD CONSTRAINT `FK_ugp_entpr` FOREIGN KEY (`entpr_id`) REFERENCES `ess_enterprise` (`entpr_id`),
  ADD CONSTRAINT `FK_ugp_tch` FOREIGN KEY (`tch_id`) REFERENCES `ess_teacher` (`tch_id`);

--
-- 限制表 `ess_ugp_component_score`
--
ALTER TABLE `ess_ugp_component_score`
  ADD CONSTRAINT `FK_ufc_ufc` FOREIGN KEY (`ufc_id`) REFERENCES `ess_ugp_score_component_code` (`ufc_id`);

--
-- 限制表 `ess_ugp_uf_categary`
--
ALTER TABLE `ess_ugp_uf_categary`
  ADD CONSTRAINT `FK_ufc_uem` FOREIGN KEY (`uem_id`) REFERENCES `ess_ugp_excecution_mode_code` (`uem_id`),
  ADD CONSTRAINT `FK_ufc_uep` FOREIGN KEY (`uep_id`) REFERENCES `ess_ugp_excecution_phase_code` (`uep_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
