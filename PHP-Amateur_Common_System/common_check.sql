-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-04-30 06:26:32
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
  `group_id` int(11) NOT NULL,
  `group_name` varchar(32) DEFAULT NULL,
  `group_notes` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ess_group_rule`
--

CREATE TABLE IF NOT EXISTS `ess_group_rule` (
  `rule_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`rule_id`,`group_id`),
  KEY `FK_group_rule3` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- 表的结构 `ess_rule`
--

CREATE TABLE IF NOT EXISTS `ess_rule` (
  `rule_id` int(11) NOT NULL,
  `rule_name` varchar(32) DEFAULT NULL,
  `rule_notes` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `user_id` bigint(20) NOT NULL,
  `notice_subject` varchar(64) DEFAULT NULL,
  `notice_content` text,
  `notice_user_id` bigint(20) DEFAULT NULL,
  `notice_update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `FK_user_notice` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_notice`
--

INSERT INTO `ess_ugp_notice` (`notice_id`, `user_id`, `notice_subject`, `notice_content`, `notice_user_id`, `notice_update_time`) VALUES
(1, 0, '2015届毕业设计中期检查', '信息与软件工程学院2015届毕业设计中期检查将于4.22-4.26日进行，请各位同学及时提交中期报告，逾期后果自负！', 2, '2016-04-22 03:22:20');

-- --------------------------------------------------------

--
-- 表的结构 `ess_ugp_score_component_code`
--

CREATE TABLE IF NOT EXISTS `ess_ugp_score_component_code` (
  `usc_id` int(11) NOT NULL,
  `ufc_id` int(11) DEFAULT NULL,
  `usc_name` varchar(64) DEFAULT NULL,
  `usc_max_score` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`usc_id`),
  KEY `FK_usc_uuc` (`ufc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_score_component_code`
--

INSERT INTO `ess_ugp_score_component_code` (`usc_id`, `ufc_id`, `usc_name`, `usc_max_score`) VALUES
(1, 1, '代码书写', 10),
(2, 1, '总结', 15);

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
  `uuf_path` varchar(64) DEFAULT NULL,
  `uuf_is_paper_doc_submited` tinyint(1) DEFAULT NULL,
  `uuf_last_update_record_id` timestamp NULL DEFAULT NULL,
  `uuf_last_review_record_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uuf_id`),
  KEY `FK_uur_uuf` (`uur_id`),
  KEY `FK_urr_uuf` (`urr_id`),
  KEY `FK_uuf_ufc` (`ufc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_ugp_uploaded_file`
--

INSERT INTO `ess_ugp_uploaded_file` (`uuf_id`, `ufc_id`, `urr_id`, `uur_id`, `uuf_user_id`, `uuf_true_name`, `uuf_name`, `uuf_path`, `uuf_is_paper_doc_submited`, `uuf_last_update_record_id`, `uuf_last_review_record_id`) VALUES
(2014220301006, 2, NULL, NULL, 2014220301006, '阅读需求与信息素养教育模式研究——以电子科技大学图书馆为例.', '572218f925bdf.pdf', './Uploads/', 1, '2016-04-28 14:06:49', 0),
(2014220301019, 2, 1, 1, 2014220301019, '电子科技大学计算电磁学实验室对计算电磁学的研究进展.pdf', '5720a855ca941.pdf', './Uploads/', 1, '2016-04-27 11:53:57', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ess_user`
--

CREATE TABLE IF NOT EXISTS `ess_user` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `user_pwd` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ess_user`
--

INSERT INTO `ess_user` (`user_id`, `user_name`, `user_pwd`) VALUES
(0, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(100, '11111111', '1bbd886460827015e5d605ed44252251'),
(5001, '2014220301019', '3d39668cb4d4c2cb78198f903e3366cb'),
(5002, '2014220301006', '3d39668cb4d4c2cb78198f903e3366cb');

-- --------------------------------------------------------

--
-- 表的结构 `ess_user_group`
--

CREATE TABLE IF NOT EXISTS `ess_user_group` (
  `group_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `FK_user_group3` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ess_user_rule`
--

CREATE TABLE IF NOT EXISTS `ess_user_rule` (
  `rule_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`rule_id`,`user_id`),
  KEY `FK_user_rule3` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- 限制表 `ess_group_rule`
--
ALTER TABLE `ess_group_rule`
  ADD CONSTRAINT `FK_group_rule2` FOREIGN KEY (`rule_id`) REFERENCES `ess_rule` (`rule_id`),
  ADD CONSTRAINT `FK_group_rule3` FOREIGN KEY (`group_id`) REFERENCES `ess_group` (`group_id`);

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
  ADD CONSTRAINT `FK_ucs_usc` FOREIGN KEY (`usc_id`) REFERENCES `ess_ugp_score_component_code` (`usc_id`),
  ADD CONSTRAINT `FK_ucs_uuc` FOREIGN KEY (`ufc_id`) REFERENCES `ess_ugp_uf_categary` (`ufc_id`);

--
-- 限制表 `ess_ugp_notice`
--
ALTER TABLE `ess_ugp_notice`
  ADD CONSTRAINT `FK_user_notice` FOREIGN KEY (`user_id`) REFERENCES `ess_user` (`user_id`);

--
-- 限制表 `ess_ugp_score_component_code`
--
ALTER TABLE `ess_ugp_score_component_code`
  ADD CONSTRAINT `FK_usc_uuc` FOREIGN KEY (`ufc_id`) REFERENCES `ess_ugp_uf_categary` (`ufc_id`);

--
-- 限制表 `ess_ugp_uf_categary`
--
ALTER TABLE `ess_ugp_uf_categary`
  ADD CONSTRAINT `FK_ufc_uem` FOREIGN KEY (`uem_id`) REFERENCES `ess_ugp_excecution_mode_code` (`uem_id`),
  ADD CONSTRAINT `FK_ufc_uep` FOREIGN KEY (`uep_id`) REFERENCES `ess_ugp_excecution_phase_code` (`uep_id`);

--
-- 限制表 `ess_ugp_uploaded_file`
--
ALTER TABLE `ess_ugp_uploaded_file`
  ADD CONSTRAINT `FK_urr_uuf` FOREIGN KEY (`urr_id`) REFERENCES `ess_uf_review_record` (`urr_id`),
  ADD CONSTRAINT `FK_uuf_ufc` FOREIGN KEY (`ufc_id`) REFERENCES `ess_ugp_uf_categary` (`ufc_id`),
  ADD CONSTRAINT `FK_uur_uuf` FOREIGN KEY (`uur_id`) REFERENCES `ess_uf_update_record` (`uur_id`);

--
-- 限制表 `ess_user_group`
--
ALTER TABLE `ess_user_group`
  ADD CONSTRAINT `FK_user_group2` FOREIGN KEY (`group_id`) REFERENCES `ess_group` (`group_id`),
  ADD CONSTRAINT `FK_user_group3` FOREIGN KEY (`user_id`) REFERENCES `ess_user` (`user_id`);

--
-- 限制表 `ess_user_rule`
--
ALTER TABLE `ess_user_rule`
  ADD CONSTRAINT `FK_user_rule2` FOREIGN KEY (`rule_id`) REFERENCES `ess_rule` (`rule_id`),
  ADD CONSTRAINT `FK_user_rule3` FOREIGN KEY (`user_id`) REFERENCES `ess_user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
